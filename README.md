## Quickstart

Once you've built the image. You'll be able to server pages using the `jekyll` gem. 

Once the image has been pulled or built. You can run it like so:

	docker run --rm -t praqma/gh-pages jekyll --version

With the image, you can mount a website into your container and serve it using `jekyll` like so:

	docker run -i -t -v /home/user/mysite:/home/jenkins praqma/gh-pages jekyll serve --watch --host=0.0.0.0

If that runs. Congratulations!

The image also includes a tool that can scan a website for duplicate resources:
	
	ruby /opt/static-analysis/analyzer.rb -c /opt/static-analysis/report_duplication_analysis_template.html -u /opt/static-analysis/report_usage_analysis_template.html

That will produce two analysis files in your current working directory. You can see the list of available options like so: 

	ruby /opt/static-analysis/analyzer.rb --help

That's it for now
	


