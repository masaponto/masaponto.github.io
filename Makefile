all: html

MD_FILE := index.md
HTML_FILE := index.html

.PHONY: html clean

html: $(MD_FILE) css/style.css after_body.html header.html
	docker run --rm -t -i -v `pwd`:/workspace \
	masaponto/pandoc $(MD_FILE) -o $(HTML_FILE)  \
	--standalone -s -t html5 --smart -c css/style.css \
	-H header.html -A after_body.html

clean:
	rm -f $(HTML_FILE)
