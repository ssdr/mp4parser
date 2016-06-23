CC=gcc
OUTDIR=dist
LIBS= -lm
CFLAGS=-w
CFLAGS_DEBUG=-w -ggdb -g3

PHONY += all

all:
	mkdir -p $(OUTDIR)
	$(CC) $(CFLAGS) -c src/stream.c -o stream.o
	$(CC) $(CFLAGS) -c src/mp4.c -o mp4.o
	$(CC) $(CFLAGS) -c src/mp4parser.c -o mp4parser.o
	$(CC) $(CFLAGS) stream.o mp4.o mp4parser.o -o $(OUTDIR)/mp4parser $(LIBS)
	rm -f *.o

debug:
	mkdir -p $(OUTDIR)
	$(CC) $(CFLAGS_DEBUG) -c src/stream.c -o stream.o
	$(CC) $(CFLAGS_DEBUG) -c src/mp4.c -o mp4.o
	$(CC) $(CFLAGS_DEBUG) -c src/mp4parser.c -o mp4parser.o
	$(CC) $(CFLAGS_DEBUG) stream.o mp4.o mp4parser.o -o $(OUTDIR)/mp4parser $(LIBS)
	rm -f *.o

clean:
	rm -f $(OUTDIR)/mp4parser *.o
