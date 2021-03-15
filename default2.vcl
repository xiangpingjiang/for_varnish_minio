vcl 4.0;

backend default {
  .host = "172.17.0.2:9000";

}


sub vcl_recv {
    if (req.url == "/") {
        return (synth(804, "Not Found"));
    }
    if (req.url ~ "/login") {
        return (synth(804, "Not Found"));
    }
    if (req.url ~ "/") {
    set req.url = "/newbucket"+req.url;
    }
    if (req.method == "XCGFULLBAN") {
        ban("req.http.host ~ .*");
        return (synth(200, "Full cache cleared"));
    }
    if (req.method == "PUT") {
        return (synth(804, "Not Found"));
    }
    if (req.method == "POST") {
        return (synth(804, "Not Found"));
    }
    if (req.method == "DELETE") {
        return (synth(804, "Not Found"));
    }

}

sub vcl_deliver{
    if (resp.status == 404) {
        set resp.status = 404;
        return (synth(404, "Not Found"));
    }
  

}
sub vcl_synth {
    if (resp.status == 804) {
        set resp.status = 404;
        return (deliver);
    }
    if (resp.status == 404) {
        return (deliver);
    }

}

sub vcl_backend_response {
    if (bereq.url ~ "/") {
        unset beresp.http.set-cookie;
        set beresp.http.cache-control = "public, max-age=60s";
        set beresp.ttl = 60s;
        return (deliver);
    }
}
