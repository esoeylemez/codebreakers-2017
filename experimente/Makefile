.PHONY: all

targets = \
	$(patsubst %.c,%,$(wildcard [a-z]*.c)) \
	$(patsubst %.cc,%,$(wildcard [a-z]*.cc)) \
	$(patsubst %.hs,%,$(patsubst js-%.hs,%.jsexe,$(wildcard [a-z]*.hs))) \
	$(patsubst %.es6.js,%.es5.js,$(wildcard [a-z]*.es6.js)) \
	$(patsubst %.scm,%,$(wildcard [a-z]*.scm))


all: $(targets)


CFLAGS = --std=gnu99 -O2
CSCFLAGS = -O3
CXXFLAGS = -Wall -O2 -std=gnu++17
GHCFLAGS = -O -threaded -rtsopts -fdefer-typed-holes -ferror-spans
GHCJSFLAGS = -O -fdefer-typed-holes
LDFLAGS = -lm


%: %.c Makefile
	gcc $(CFLAGS) $(LDFLAGS) -o $@ $<

%: %.cc Makefile
	g++ $(CXXFLAGS) $(LDFLAGS) -o $@ $<

%.es5.js: %.es6.js Makefile
	closure-compiler --language_in=ECMASCRIPT6_STRICT --language_out=ECMASCRIPT5_STRICT --formatting PRETTY_PRINT --js $< --js_output_file $@

%.jsexe: js-%.hs Makefile
	@mkdir -p tmp/$@
	ghcjs $(GHCJSFLAGS) -outputdir=tmp/$@ -o $@ $<
	@touch $@

%: %.hs
	@mkdir -p tmp/$@
	ghc $(GHCFLAGS) -outputdir=tmp/$@ -o $@ $<
	@touch $@

%: %.scm
	csc $(CSCFLAGS) -o $@ $<
