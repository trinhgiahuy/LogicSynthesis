# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "i2c_freq_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "n_leds_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "n_params_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ref_clk_freq_g" -parent ${Page_0}


}

proc update_PARAM_VALUE.i2c_freq_g { PARAM_VALUE.i2c_freq_g } {
	# Procedure called to update i2c_freq_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.i2c_freq_g { PARAM_VALUE.i2c_freq_g } {
	# Procedure called to validate i2c_freq_g
	return true
}

proc update_PARAM_VALUE.n_leds_g { PARAM_VALUE.n_leds_g } {
	# Procedure called to update n_leds_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.n_leds_g { PARAM_VALUE.n_leds_g } {
	# Procedure called to validate n_leds_g
	return true
}

proc update_PARAM_VALUE.n_params_g { PARAM_VALUE.n_params_g } {
	# Procedure called to update n_params_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.n_params_g { PARAM_VALUE.n_params_g } {
	# Procedure called to validate n_params_g
	return true
}

proc update_PARAM_VALUE.ref_clk_freq_g { PARAM_VALUE.ref_clk_freq_g } {
	# Procedure called to update ref_clk_freq_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ref_clk_freq_g { PARAM_VALUE.ref_clk_freq_g } {
	# Procedure called to validate ref_clk_freq_g
	return true
}


proc update_MODELPARAM_VALUE.ref_clk_freq_g { MODELPARAM_VALUE.ref_clk_freq_g PARAM_VALUE.ref_clk_freq_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ref_clk_freq_g}] ${MODELPARAM_VALUE.ref_clk_freq_g}
}

proc update_MODELPARAM_VALUE.i2c_freq_g { MODELPARAM_VALUE.i2c_freq_g PARAM_VALUE.i2c_freq_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.i2c_freq_g}] ${MODELPARAM_VALUE.i2c_freq_g}
}

proc update_MODELPARAM_VALUE.n_params_g { MODELPARAM_VALUE.n_params_g PARAM_VALUE.n_params_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.n_params_g}] ${MODELPARAM_VALUE.n_params_g}
}

proc update_MODELPARAM_VALUE.n_leds_g { MODELPARAM_VALUE.n_leds_g PARAM_VALUE.n_leds_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.n_leds_g}] ${MODELPARAM_VALUE.n_leds_g}
}

