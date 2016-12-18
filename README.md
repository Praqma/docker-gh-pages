# GitHub Pages

`Short decription:`

An image the follows GitHub's implementation og Jekyll

`Long description:`

## GitHub Pages

GitHub pages is essentially a closed box - GitHub don't tell us what versions of Jekylll, Liquid, KramDown etc. they are running.

An then again, they actually do!

The [pages-gem](https://github.com/github/pages-gem) for Ruby is maintained by GitHub and is at all times in sync with the version running on GitHub pages.

The main purpose of this Docker image here, is to provide a Docker image, that resembles the GitHub pages. By using this immage to test your pages, it should be fair to expect that they will behave the same when published to GitHub pages.

The image is maintained by [Praqma](https://github.com/Praqma/docker-gh-pages)

---

Available at https://hub.docker.com/r/praqma/gh-pages/

---

## Quickstart

Once you've built the image. You'll be able to server pages using the `jekyll` gem. 

Once the image has been pulled or built. You can run it like so:

	docker run --rm -t praqma/gh-pages jekyll --version

With the image, you can mount a website into your container and serve it using `jekyll` like so:

	docker run -i -t -v /home/user/mysite:/home/jenkins -p 4444:4000 praqma/gh-pages jekyll serve --watch --host=0.0.0.0 

If that runs. Congratulations! Your site is now served on locahost:4444

The image also includes a tool that can scan a website for duplicate resources:
	
	ruby /opt/static-analysis/analyzer.rb -c /opt/static-analysis/report_duplication_analysis_template.html -u /opt/static-analysis/report_usage_analysis_template.html

That will produce two analysis files in your current working directory. You can see the list of available options like so: 

	ruby /opt/static-analysis/analyzer.rb --help

That's it for now
	


