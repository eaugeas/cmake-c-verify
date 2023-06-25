all: library simple

library: FORCE
	make -C library
	make -C library check
	make -C library fix

simple: FORCE
	make -C simple
	make -C simple check
	make -C simple fix

FORCE: ;

check:
	make -C library check
	make -C simple check

fix:
	make -C library fix
	make -C simple fix

clean:
	make -C library clean
	make -C simple clean
