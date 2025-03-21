NOME = calculadora

all: $(NOME).o
	@ ld -s -o $(NOME) $(NOME).o
	@ rm -rf *.o;
	@ ./$(NOME)

%.o: %.asm
	@ nasm -f elf64 $<