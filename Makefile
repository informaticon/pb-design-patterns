SHELL=cmd.exe

SRC_FILES := $(wildcard *.pbl/*.*)

.PHONY: run
run: design-patterns.exe
	design-patterns.exe


design-patterns.exe: $(SRC_FILES)
	pbautobuild250 /pbc /d design-patterns.pbproj


.PHONY: puml
puml: $(SRC_FILES)
	plantuml -o diagrams diagrams/genericDiagrams.puml
	plantuml -o diagrams diagrams/powerbuilderDiagrams.puml


.PHONY: clean
clean:
	if exist build rmdir /s /q build
	if exist .pb rmdir /s /q .pb
	del /s *.exe
	del /s *.pbd
	del /s *.usr.opt
	del /s design-patterns.xml