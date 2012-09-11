#USB_MSC(main /dev/sdb)

macro(USB_MSC TARGET DEV)
       add_custom_target(
               "usb_msc_program_${TARGET}.bin"
               COMMAND sudo mdel  -i ${DEV} ::/firmware.bin
               COMMAND sudo mcopy -i ${DEV} ${TARGET}.bin ::/firmware.bin
               COMMAND sudo umount ${DEV}
               DEPENDS ${TARGET}.bin
       )

endmacro(USB_MSC)
