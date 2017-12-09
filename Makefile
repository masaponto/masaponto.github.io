all: html

MD_FILE := index.md
HTML_FILE := index.html
TEMPLATE_FILE := mapbox-base.html

.PHONY: html clean

html: $(MD_FILE) css/style.css
	docker run --rm -t -i -v `pwd`:/workspace \
	masaponto/pandoc $(MD_FILE) -o $(HTML_FILE)  \
	--standalone -s -t html5 --smart -c css/style.css

clean:
	rm -f $(HTML_FILE)
