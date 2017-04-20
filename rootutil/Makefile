

ROOTCONFIG = root-config
ROOTCXXFLAGS = $(shell $(ROOTCONFIG) --cflags)
CXXFLAGS = $(ROOTCXXFLAGS)

SOURCES = Particle.cxx TruthParticles.cxx MyDict.cxx
HEADERS = Particle.h TruthParticles.h

all: libRootUtil.so

MyDict.cxx: $(HEADERS) Linkdef.h
	rootcint -f $@ -c $^
#	rootcint -f $@ -c $(CXXFLAGS) -p $^

libRootUtil.so: $(SOURCES)
	clang++ -shared -o$@ `root-config --libs --glibs --ldflags` -I$(ROOTSYS)/include $^

clean:
	rm -f MyDict.cxx MyDict.h libRootUtil.so
