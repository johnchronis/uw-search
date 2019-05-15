CHOME=./clang5
CXX=$(CHOME)/bin/clang++
CXXFLAGS=-std=c++17 -stdlib=libc++
LDFLAGS=-fopenmp

HEADERS=benchmark.h bin.h padded_vector.h interpolate.h util.h div.h lin.h bin_eyt.h adaptivesearch.h
SOURCES=search.cc

.PHONY: run gdb clean perf

##### Run Targets ######
run : release
run :
		./release run.tsv

gdb : debug
gdb :
		gdb --args ./debug run.tsv

perf : CXXFLAGS += -O3 -DNDEBUG -DINFINITE_REPEAT
perf :
		$(CXX) $(CXXFLAGS) $(SOURCES) -o$@ $(LDFLAGS)
		perf record -F99 -g ./perf run.tsv

clean:
		rm -f ./release ./debug ./dump

####### Build Targets #########

release : CXXFLAGS += -O3 -DNDEBUG
release: $(SOURCES) $(HEADERS)
		$(CXX) $(CXXFLAGS) $(SOURCES) -o$@ $(LDFLAGS)

debug : CXXFLAGS += -O0
debug: $(SOURCES) $(HEADERS)
		$(CXX) $(CXXFLAGS) $(SOURCES) -o$@ $(LDFLAGS)

dump : dump.cc benchmark.h
		$(CXX) $(CXXFLAGS) dump.cc -o $@ $(LDFLAGS)