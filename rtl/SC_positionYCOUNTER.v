/*#################################################################################
////-----positionYCOUNTER FROOGER 2022 - 2 SISTEMAS ELECTRONICOS DIGITALES -----////
##################################################################################*/

module SC_positionYCOUNTER #(parameter SC_positionYCOUNTER_DATAWIDTH=3)(
	//////////// OUTPUTS //////////
	SC_positionYCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_positionYCOUNTER_CLOCK_50,
	SC_positionYCOUNTER_RESET_InHigh,
	SC_positionYCOUNTER_load0_InLow,
	SC_positionYCOUNTER_load1_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	[SC_positionYCOUNTER_DATAWIDTH-1:0]	SC_positionYCOUNTER_data_OutBUS;
input		SC_positionYCOUNTER_CLOCK_50;
input		SC_positionYCOUNTER_RESET_InHigh;
input		SC_positionYCOUNTER_load0_InLow;
input    SC_positionYCOUNTER_load1_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [SC_positionYCOUNTER_DATAWIDTH-1:0] positionYCOUNTER_Register;
reg [SC_positionYCOUNTER_DATAWIDTH-1:0] positionYCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_positionYCOUNTER_load0_InLow == 1'b0)
		positionYCOUNTER_Signal = positionYCOUNTER_Register + 1'b1;
	else
		positionYCOUNTER_Signal = positionYCOUNTER_Register;
		
	end
	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_positionYCOUNTER_CLOCK_50, posedge SC_positionYCOUNTER_RESET_InHigh)
begin
	if (SC_positionYCOUNTER_RESET_InHigh  == 1'b1)
		positionYCOUNTER_Register <= 0;
	else
		positionYCOUNTER_Register <= positionYCOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_positionYCOUNTER_data_OutBUS = positionYCOUNTER_Register;

endmodule
