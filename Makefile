.PHONY: build clean

clean:
	rm -rf build

build: build/ie8.js build/squire.js build/document.html

build/ie8.js: source/ie8types.js source/ie8dom.js source/ie8range.js
	mkdir -p $(@D)
	cat $^ | uglifyjs > $@

build/squire.js: source/TreeWalker.js source/Node.js source/Range.js source/Editor.js
	mkdir -p $(@D)
	cat $^ | uglifyjs > $@

build/document.html: source/document.html
	mkdir -p $(@D)
	cp $^ $@