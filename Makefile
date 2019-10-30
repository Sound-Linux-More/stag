# Makefile

# 
# This file is public domain as declared by Sturm Mabie.
# 

CC=gcc
PROG=stag
CURSES=-lncurses -lmenu -lform 
CURSESW=-lncursesw -lmenuw -lformw -D_CURSESW_WIDE
SRCS=src
SOURCES=$(SRCS)/ui.c $(SRCS)/stag.c $(SRCS)/tagger.c $(SRCS)/strlcpy.c $(SRCS)/strlcat.c $(SRCS)/basename.c $(SRCS)/dirname.c $(SRCS)/kb.c
CFLAGS+=-ansi -pedantic -Wall -D_BSD_SOURCE
CPPFLAGS+=-I/usr/local/include `taglib-config --cflags`
LDFLAGS+=-L/usr/local/lib `taglib-config --libs` -ltag_c -lstdc++ 

all: $(PROG)

$(PROG): $(SOURCES)
	$(CC) $(CFLAGS) $(CPPFLAGS) $^ -o $@ $(LDFLAGS) $(CURSES)

clean:
	rm -f $(PROG)
