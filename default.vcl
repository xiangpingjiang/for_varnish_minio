vcl 4.0;

backend default {
  .host = "172.17.0.2:9000";

}


sub vcl_recv {
  if (req.url ~ "/") {
  set req.url = "/newbucket"+req.url;
  }
}

sub vcl_backend_response {
    if (bereq.url ~ "/") {
        set beresp.http.cache-control = "public, max-age=60s";
        set beresp.ttl = 60s;
    }
}


    if (req.url ~ "/login") {
        return (synth(804, "Not Found"));
    }
    if (req.url == "/") {
        return (synth(804, "Not Found"));
    }