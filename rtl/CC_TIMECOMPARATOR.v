/*#################################################################################
///-----TIMECOMPARATOR FROOGER 2022 - 2 SISTEMAS ELECTRONICOS DIGITALES -----///
##################################################################################*/

module CC_TIMECOMPARATOR #(parameter TIMECOMPARATOR_DATAWIDTH= 24)(
//////////// OUTPUTS //////////
	CC_TIMECOMPARATOR_T0_OutLow,
//////////// INPUTS //////////
	CC_TIMECOMPARATOR_data_InBUS
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
 
output  reg CC_TIMECOMPARATOR_T0_OutLow;
input 	[TIMECOMPARATOR_DATAWIDTH-1:0] CC_TIMECOMPARATOR_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================


always @(CC_TIMECOMPARATOR_data_InBUS)
begin

	if( CC_TIMECOMPARATOR_data_InBUS == 24'b1111111111110010000000000)
		CC_TIMECOMPARATOR_T0_OutLow = 1'b0;
	else 
		CC_TIMECOMPARATOR_T0_OutLow = 1'b1;
		
end

endmodule

