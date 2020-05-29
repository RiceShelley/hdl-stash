# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}


proc update_MODELPARAM_VALUE.clk_acc_limit { MODELPARAM_VALUE.clk_acc_limit } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "clk_acc_limit". Setting updated value from the model parameter.
set_property value "110110001" ${MODELPARAM_VALUE.clk_acc_limit}
}

proc update_MODELPARAM_VALUE.RX_START { MODELPARAM_VALUE.RX_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "RX_START". Setting updated value from the model parameter.
set_property value 0 ${MODELPARAM_VALUE.RX_START}
}

proc update_MODELPARAM_VALUE.RX_RECV { MODELPARAM_VALUE.RX_RECV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "RX_RECV". Setting updated value from the model parameter.
set_property value 1 ${MODELPARAM_VALUE.RX_RECV}
}

proc update_MODELPARAM_VALUE.RX_STOP { MODELPARAM_VALUE.RX_STOP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "RX_STOP". Setting updated value from the model parameter.
set_property value 2 ${MODELPARAM_VALUE.RX_STOP}
}

proc update_MODELPARAM_VALUE.RX_IDLE { MODELPARAM_VALUE.RX_IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "RX_IDLE". Setting updated value from the model parameter.
set_property value 3 ${MODELPARAM_VALUE.RX_IDLE}
}

proc update_MODELPARAM_VALUE.TX_START { MODELPARAM_VALUE.TX_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "TX_START". Setting updated value from the model parameter.
set_property value 0 ${MODELPARAM_VALUE.TX_START}
}

proc update_MODELPARAM_VALUE.TX_TRANS { MODELPARAM_VALUE.TX_TRANS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "TX_TRANS". Setting updated value from the model parameter.
set_property value 1 ${MODELPARAM_VALUE.TX_TRANS}
}

proc update_MODELPARAM_VALUE.TX_STOP { MODELPARAM_VALUE.TX_STOP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "TX_STOP". Setting updated value from the model parameter.
set_property value 2 ${MODELPARAM_VALUE.TX_STOP}
}

proc update_MODELPARAM_VALUE.TX_IDLE { MODELPARAM_VALUE.TX_IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "TX_IDLE". Setting updated value from the model parameter.
set_property value 3 ${MODELPARAM_VALUE.TX_IDLE}
}

