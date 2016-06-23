CC=gcc
CFLAGS=-I$(IDIR)

OUTDIR=dist
LIBS= -lm -w

PHONY += all

all:
	mkdir -p $(OUTDIR)
	$(CC) -c src/stream.c -o stream.o $(LIBS)
	$(CC) -c src/mp4.c -o mp4.o $(LIBS)
	$(CC) -c src/mp4parser.c -o mp4parser.o $(LIBS)
	$(CC) stream.o mp4.o mp4parser.o -o $(OUTDIR)/mp4parser $(LIBS)
	rm -f *.o

debug:
	mkdir -p $(OUTDIR)
	$(CC) -ggdb -g3 -c src/stream.c -o stream.o $(LIBS)
	$(CC) -ggdb -g3 -c src/mp4.c -o mp4.o $(LIBS)
	$(CC) -ggdb -g3 -c src/mp4parser.c -o mp4parser.o $(LIBS)
	$(CC) stream.o mp4.o mp4parser.o -o $(OUTDIR)/mp4parser $(LIBS)
	rm -f *.o

clean:
	rm -f $(OUTDIR)/mp4parser *.o
