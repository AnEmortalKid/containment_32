import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.concurrent.ExecutionException;

public class Call {

    public static void main(String[] args) throws IOException, InterruptedException, ExecutionException {
        final String nextWhisperer = "localhost";
        final HttpClient client = HttpClient.newHttpClient();
        final String phrase = "the quick brown fox jumps over the lazy dog";

        client.sendAsync(HttpRequest.newBuilder(URI.create(String.format("http://%s:8080/relay?phrase=%s", nextWhisperer, URLEncoder.encode(phrase))))
                .method("POST", HttpRequest.BodyPublishers.noBody()).build(), HttpResponse.BodyHandlers.discarding()).get();
    }
}
