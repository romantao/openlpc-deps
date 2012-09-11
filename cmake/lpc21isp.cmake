#LPC21ISP(main /dev/ttyUSB0 115200 12000)
#LPC21ISP(main /dev/ttyUSB0 115200 12000 PROGRAM_TARGET)

INCLUDE(CMakeParseArguments)

macro(LPC21ISP TARGET COM_PORT BAUDRATE OSCILLATOR_KHZ)
	CMAKE_PARSE_ARGUMENTS(LPC21ISP
    		"PROGRAM_TARGET"
    		""
		""
    		${ARGN}
    	)

	add_custom_target(
		"lpc21isp_program_${TARGET}.hex"
		COMMAND lpc21isp -control ${TARGET}.hex ${COM_PORT} ${BAUDRATE} ${OSCILLATOR_KHZ}
		DEPENDS ${TARGET}.hex
		VERBATIM
	)

	get_target_property(target_location "program_target" LOCATION)
	if ("${target_location}" STREQUAL "target_location-NOTFOUND")
		add_custom_target(
			"program_target"
			VERBATIM
		)
	endif ("${target_location}" STREQUAL "target_location-NOTFOUND")

	if ( "LPC21ISP_PROGRAM_TARGET" )
		add_dependencies("program_target" "lpc21isp_program_${TARGET}.hex")
	endif ( "LPC21ISP_PROGRAM_TARGET" )
endmacro(LPC21ISP)

