# TCL File Generated by Component Editor 15.1
# Mon Jul 04 06:55:21 UTC 2016
# DO NOT MODIFY


# 
# Rs232 "Rs232" v1.0
#  2016.07.04.06:55:21
# 
# 

# 
# request TCL package from ACDS 15.1
# 
package require -exact qsys 15.1


# 
# module Rs232
# 
set_module_property DESCRIPTION ""
set_module_property NAME Rs232
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME Rs232
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL Rs232
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file Rs232.sv SYSTEM_VERILOG PATH sv/Rs232.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter S_IDLE INTEGER 0
set_parameter_property S_IDLE DEFAULT_VALUE 0
set_parameter_property S_IDLE DISPLAY_NAME S_IDLE
set_parameter_property S_IDLE TYPE INTEGER
set_parameter_property S_IDLE UNITS None
set_parameter_property S_IDLE HDL_PARAMETER true
add_parameter S_GET_READ_STATUS INTEGER 1
set_parameter_property S_GET_READ_STATUS DEFAULT_VALUE 1
set_parameter_property S_GET_READ_STATUS DISPLAY_NAME S_GET_READ_STATUS
set_parameter_property S_GET_READ_STATUS TYPE INTEGER
set_parameter_property S_GET_READ_STATUS UNITS None
set_parameter_property S_GET_READ_STATUS HDL_PARAMETER true
add_parameter S_GET_WRITE_STATUS INTEGER 2
set_parameter_property S_GET_WRITE_STATUS DEFAULT_VALUE 2
set_parameter_property S_GET_WRITE_STATUS DISPLAY_NAME S_GET_WRITE_STATUS
set_parameter_property S_GET_WRITE_STATUS TYPE INTEGER
set_parameter_property S_GET_WRITE_STATUS UNITS None
set_parameter_property S_GET_WRITE_STATUS HDL_PARAMETER true
add_parameter S_RECV INTEGER 3
set_parameter_property S_RECV DEFAULT_VALUE 3
set_parameter_property S_RECV DISPLAY_NAME S_RECV
set_parameter_property S_RECV TYPE INTEGER
set_parameter_property S_RECV UNITS None
set_parameter_property S_RECV HDL_PARAMETER true
add_parameter S_SEND INTEGER 4
set_parameter_property S_SEND DEFAULT_VALUE 4
set_parameter_property S_SEND DISPLAY_NAME S_SEND
set_parameter_property S_SEND TYPE INTEGER
set_parameter_property S_SEND UNITS None
set_parameter_property S_SEND HDL_PARAMETER true
add_parameter S_END INTEGER 5
set_parameter_property S_END DEFAULT_VALUE 5
set_parameter_property S_END DISPLAY_NAME S_END
set_parameter_property S_END TYPE INTEGER
set_parameter_property S_END UNITS None
set_parameter_property S_END HDL_PARAMETER true


# 
# display items
# 


# 
# connection point avalon_master
# 
add_interface avalon_master avalon start
set_interface_property avalon_master addressUnits SYMBOLS
set_interface_property avalon_master associatedClock clock_sink
set_interface_property avalon_master associatedReset reset_sink
set_interface_property avalon_master bitsPerSymbol 8
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master burstcountUnits WORDS
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master holdTime 0
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master maximumPendingReadTransactions 0
set_interface_property avalon_master maximumPendingWriteTransactions 0
set_interface_property avalon_master readLatency 0
set_interface_property avalon_master readWaitTime 1
set_interface_property avalon_master setupTime 0
set_interface_property avalon_master timingUnits Cycles
set_interface_property avalon_master writeWaitTime 0
set_interface_property avalon_master ENABLED true
set_interface_property avalon_master EXPORT_OF ""
set_interface_property avalon_master PORT_NAME_MAP ""
set_interface_property avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property avalon_master SVD_ADDRESS_GROUP ""

add_interface_port avalon_master avm_address address Output 5
add_interface_port avalon_master avm_read read Output 1
add_interface_port avalon_master avm_readdata readdata Input 32
add_interface_port avalon_master avm_write write Output 1
add_interface_port avalon_master avm_writedata writedata Output 32
add_interface_port avalon_master avm_waitrequest waitrequest Input 1


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""

add_interface_port clock_sink avm_clk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink avm_rst reset Input 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock clock_sink
set_interface_property conduit_end associatedReset reset_sink
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end iData export Input 336


# 
# connection point conduit_end_1
# 
add_interface conduit_end_1 conduit end
set_interface_property conduit_end_1 associatedClock clock_sink
set_interface_property conduit_end_1 associatedReset reset_sink
set_interface_property conduit_end_1 ENABLED true
set_interface_property conduit_end_1 EXPORT_OF ""
set_interface_property conduit_end_1 PORT_NAME_MAP ""
set_interface_property conduit_end_1 CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end_1 SVD_ADDRESS_GROUP ""

add_interface_port conduit_end_1 iStart export Input 1

