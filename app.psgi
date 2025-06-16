use Plack::App::CGIBin;
use Plack::App::Directory; # for serving static files from "public"
use Plack::Builder;
my $app = Plack::App::CGIBin->new(root => "./cgi-bin")->to_app;
my $static = Plack::App::Directory->new({ root => "./public" })->to_app;
builder {
  mount "/cgi-bin" => $app;
  mount "/" => $static;
};
