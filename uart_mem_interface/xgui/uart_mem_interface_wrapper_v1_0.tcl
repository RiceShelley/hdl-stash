# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "READ_CMD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WRITE_CMD" -parent ${Page_0}


}

proc update_PARAM_VALUE.READ_CMD { PARAM_VALUE.READ_CMD } {
	# Procedure called to update READ_CMD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.READ_CMD { PARAM_VALUE.READ_CMD } {
	# Procedure called to validate READ_CMD
	return true
}

proc update_PARAM_VALUE.WRITE_CMD { PARAM_VALUE.WRITE_CMD } {
	# Procedure called to update WRITE_CMD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WRITE_CMD { PARAM_VALUE.WRITE_CMD } {
	# Procedure called to validate WRITE_CMD
	return true
}


proc update_MODELPARAM_VALUE.READ_CMD { MODELPARAM_VALUE.READ_CMD PARAM_VALUE.READ_CMD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.READ_CMD}] ${MODELPARAM_VALUE.READ_CMD}
}

proc update_MODELPARAM_VALUE.WRITE_CMD { MODELPARAM_VALUE.WRITE_CMD PARAM_VALUE.WRITE_CMD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WRITE_CMD}] ${MODELPARAM_VALUE.WRITE_CMD}
}

