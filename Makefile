default:
	echo targets: run build publish heroku
run:
	plumb http://localhost:8080/
	docker run -p 8080:8080 -it mehlon/tryinferno
build:
	docker build -t mehlon/tryinferno .
publish:
	docker push mehlon/tryinferno

APPNAME=tryinferno
heroku:
	heroku container:push web -a $(APPNAME)
	heroku container:release web -a $(APPNAME)
