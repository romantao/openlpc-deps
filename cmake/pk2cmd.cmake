#find_program(PK2CMD_EXECUTABLE pk2cmd)

macro(PK2CMD_PROGRAM EXE_NAME MCPU)
	set(FI ${EXE_NAME})
	set(FO ${CMAKE_CURRENT_BINARY_DIR}/${EXE_NAME}.hex)
	get_filename_component(TGT "${EXE_NAME}" NAME)
	add_custom_target(
		"pk2cmd_program_${TGT}"
		COMMAND /usr/local/bin/pk2cmd -P${MCPU} -JN -F${FO} -M -T -R
		DEPENDS ${FI}
		VERBATIM
	)

	add_custom_target(
		"pk2cmd_reset"
		COMMAND /usr/local/bin/pk2cmd -P${MCPU} -T -R
		VERBATIM
	)

	add_custom_target(
		"pk2cmd_stop"
		COMMAND /usr/local/bin/pk2cmd -P${MCPU} -T
		VERBATIM
	)

endmacro(PK2CMD_PROGRAM)

