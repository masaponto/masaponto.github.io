all: html

MD_FILE := index.md
HTML_FILE := index.html

.PHONY: html clean

html: $(MD_FILE) css/style.css header.html
	docker run --rm -t -i -v `pwd`:/workspace \
	masaponto/pandoc $(MD_FILE) -o $(HTML_FILE)  \
	--standalone --to html5 --smart --css css/style.css \
	-H header.html
clean:
	rm -f $(HTML_FILE)
