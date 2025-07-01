FLOPPY_SIZE := 1474560 # tamanho 

calculadora_16.bin : boot.bin menu.bin
	@ cat boot.bin menu.bin > $@
	@ truncate -s $(FLOPPY_SIZE) $@
	@ rm $^
	@ echo "arquivo binario gerado"
	@ printf "use o comando \"VBoxManage convertfromraw "
	@ printf "calculadora_16.bin calculadora_16.vdi --format=VDI\""
	@ echo " para executar o arquivo no VirtualBox"
boot.bin : boot.asm
	@ nasm -f bin $< -o $@
menu.bin : menu.asm
	@ nasm -f bin $< -o $@
