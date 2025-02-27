arm-none-eabi-ld -n -T ./navilos.ld -nostdlib -o navilos.axf boot/Entry.o
arm-none-eabi-objdump -D navilos.axf