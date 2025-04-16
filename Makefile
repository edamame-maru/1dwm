# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dwm.c util.c
OBJ = ${SRC:.c=.o}

all: 1dwm

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

1dwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f 1dwm ${OBJ}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f 1dwm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/1dwm

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/1dwm\

.PHONY: all clean install uninstall
