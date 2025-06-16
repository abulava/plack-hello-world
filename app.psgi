use Plack::Builder;
use Plack::App::CGIBin;
use Plack::App::File;
use Plack::App::Directory; # for serving static files from "public/css" etc.

my $app = Plack::App::CGIBin->new(root => "./cgi-bin")->to_app;
my $root = Plack::App::File->new(file => './public/index.html')->to_app;

builder {
  enable "Plack::Middleware::ConditionalGET";

  mount "/cgi-bin" => $app;

  mount "/index.html" => $root;
  mount "/" => $root;

  mount "/favicon-16x16.png" => Plack::App::File->new(file => './public/favicon-16x16.png')->to_app;
  mount "/favicon-32x32.png" => Plack::App::File->new(file => './public/favicon-32x32.png')->to_app;

  mount "/css" => Plack::App::Directory->new({ root => "./public/css" })->to_app;
};
