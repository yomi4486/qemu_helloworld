boot.bin: boot.asm
	@nasm -f bin boot.asm -o boot.bin
	@echo "created binary file. "
 
run: boot.bin
	@qemu-system-x86_64 boot.bin
 
clean:
	@rm *.bin

install:
	cat package.txt | xargs brew install
