# README

A "Hello World" example of running legacy Perl CGI scripts in a modern way. Put your scripts into `cgi-bin` and enjoy running them locally. Then deploy them to platforms supporting Heroku Buildpacks (e.g. Dokku) with https://github.com/miyagawa/heroku-buildpack-perl.git.

## Local run

- **install pre-requisites**: `brew install cpanminus` (macOS) or `apt install cpanminus` (Debian/Ubuntu)
- **install dependencies** (first time and on every update of `cpanfile`):
  - `export PERL5LIB="./local/lib/perl5"`
  - `export PERL_CPANM_OPT="--quiet --notest -l ./local"`
  - `cpanm --installdeps .`
- **run**: `perl -Mlib=./local/lib/perl5 ./local/bin/starman`
