DIRS=. extensions/toc  extensions/bg

#Compile Coffee and scss
build:
	set -x; for dir in $(DIRS); do\
	  (cd $$dir; coffee --compile *.coffee); \
	done
	sass --force --update .
#	sass --style compressed --update .

#Compile Coffee and scss, continuously
watch:
	for dir in $(DIRS); do\
	  (cd $$dir; coffee --watch --compile *.coffee &); \
	done
	sass --style compressed  --watch .
