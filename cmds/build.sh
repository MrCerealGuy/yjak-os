[ -d out ] || mkdir out
nasm -f bin -o out/yjak.bin src/yjak.asm
dd status=noxfer conv=notrunc if=out/yjak.bin of=out/yjak.flp