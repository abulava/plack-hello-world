use Plack::Builder;
use Plack::App::CGIBin;
use Plack::App::File;
use Plack::App::Directory; # for serving static files from "public/css" etc.

my $app = Plack::App::CGIBin->new(root => "./cgi-bin")->to_app;
my $root = Plack::App::File->new(file => "./public/index.html")->to_app;

sub mount_static_file {
  my $filepath = shift;
  mount "$filepath" => Plack::App::File->new(file => "./public$filepath")->to_app;
}

builder {
  enable "Plack::Middleware::AccessLog", format => "combined";
  enable "Plack::Middleware::ConditionalGET";

  mount "/cgi-bin" => $app;

  mount "/index.html" => $root;
  mount "/" => $root;

  mount_static_file "/favicon-16x16.png";
  mount_static_file "/favicon-32x32.png";

  mount "/css" => Plack::App::Directory->new({ root => "./public/css" })->to_app;
};
