[ -d cdiso ] || mkdir cdiso
mkisofs -o cdiso/yjak.iso -b cdiso/yjak.flp -boot-load-size 4 -no-emul-boot .