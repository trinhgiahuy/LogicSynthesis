# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "clk_freq_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_width_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "n_keys_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "sample_rate_g" -parent ${Page_0}


}

proc update_PARAM_VALUE.clk_freq_g { PARAM_VALUE.clk_freq_g } {
	# Procedure called to update clk_freq_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clk_freq_g { PARAM_VALUE.clk_freq_g } {
	# Procedure called to validate clk_freq_g
	return true
}

proc update_PARAM_VALUE.data_width_g { PARAM_VALUE.data_width_g } {
	# Procedure called to update data_width_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width_g { PARAM_VALUE.data_width_g } {
	# Procedure called to validate data_width_g
	return true
}

proc update_PARAM_VALUE.n_keys_g { PARAM_VALUE.n_keys_g } {
	# Procedure called to update n_keys_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.n_keys_g { PARAM_VALUE.n_keys_g } {
	# Procedure called to validate n_keys_g
	return true
}

proc update_PARAM_VALUE.sample_rate_g { PARAM_VALUE.sample_rate_g } {
	# Procedure called to update sample_rate_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.sample_rate_g { PARAM_VALUE.sample_rate_g } {
	# Procedure called to validate sample_rate_g
	return true
}


proc update_MODELPARAM_VALUE.clk_freq_g { MODELPARAM_VALUE.clk_freq_g PARAM_VALUE.clk_freq_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clk_freq_g}] ${MODELPARAM_VALUE.clk_freq_g}
}

proc update_MODELPARAM_VALUE.sample_rate_g { MODELPARAM_VALUE.sample_rate_g PARAM_VALUE.sample_rate_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.sample_rate_g}] ${MODELPARAM_VALUE.sample_rate_g}
}

proc update_MODELPARAM_VALUE.data_width_g { MODELPARAM_VALUE.data_width_g PARAM_VALUE.data_width_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width_g}] ${MODELPARAM_VALUE.data_width_g}
}

proc update_MODELPARAM_VALUE.n_keys_g { MODELPARAM_VALUE.n_keys_g PARAM_VALUE.n_keys_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.n_keys_g}] ${MODELPARAM_VALUE.n_keys_g}
}

