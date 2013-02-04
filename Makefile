DIRS=. extensions/toc  extensions/bg

#Compile Coffee and scss
build: graphviz
	set -x; for dir in $(DIRS); do\
	  (cd $$dir; coffee --compile *.coffee); \
	done
	sass --force --update .
#	sass --style compressed --update .

#Compile Coffee and scss, continuously
watch: graphviz
	for dir in $(DIRS); do\
	  (cd $$dir; coffee --watch --compile *.coffee &); \
	done
	sass --style compressed  --watch .

graphviz: img/arch-comp.png img/cluster.png img/deploy.png img/riak.png img/ui-remote.png img/ui-local.png img/api-server.png img/modules.png

%.png: %.dot
	dot -Tpng $< -o $@
