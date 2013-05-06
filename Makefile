DIRS=. extensions/toc  extensions/bg
BUCKET=ei2013-clipper.eamonn.org
REGION=us-west-1

I=img

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

graphviz: $I/arch-comp.png $I/cluster.png $I/deploy.png $I/riak.png $I/ui-remote.png $I/ui-local.png $I/api-server.png $I/modules.png $I/model.png

%.png: %.dot
	cd img; dot -Tpng ../$< -o ../$@

$I/arch-comp.png: $I/cluster.png_icon $I/riak.png_icon
$I/deploy.png:    $I/cluster.png_icon

%.png_icon: %.png
	convert -resize 100 $< $@

s3: build
	git log > HISTORY.txt
	s3cmd --config=s3.config '--add-header=Cache-Control:public, max-age=3600' --acl-public --exclude=\*~ sync . s3://$(BUCKET)
	: view website at http://$(BUCKET).s3-website-$(REGION).amazonaws.com

config:
	:
	: Go key Access Key ID and Secret Access Key go to
	:    https://portal.aws.amazon.com/gp/aws/securityCredentials
	:
	s3cmd --config=s3.config --configure

