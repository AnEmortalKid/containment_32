package io.anemortalkid.containment_32.resources;

import javax.ws.rs.*;
import java.net.*;
import java.net.http.*;
import java.util.*;
import java.util.concurrent.ThreadLocalRandom;
import java.util.stream.Collectors;

/**
 * A whisperer is capable of relaying a message to another whisperer, the reliability of it depends on the complexity of the message.
 */
@Path("/relay")
public class RelayResource {

    private String nextWhisperer;
    private HttpClient client = HttpClient.newHttpClient();

    public RelayResource(String nextWhisperer) { this.nextWhisperer = nextWhisperer; }

    @POST
    public String relay(@QueryParam("phrase") String phrase) {
        System.out.println("Says, I heard: \"" + phrase +"\"");
        if("NONE".equals(nextWhisperer)) { return phrase; }

        List<String> relayed = new ArrayList<>();
        for(String word : phrase.split(" ")) {
            switch(ThreadLocalRandom.current().nextInt(0, 4)) {
                case 2: relayed.add(relayed.size() > 1 ? ThreadLocalRandom.current().nextInt(0, relayed.size()):0, word); break;
                case 1: break;
                case 3: Collections.shuffle(relayed);
                default: relayed.add(word);
            }
        }

        // relay the message , this counts as 1 line right?
        client.sendAsync(HttpRequest.newBuilder(URI.create(String.format("http://%s:8080/relay?phrase=%s", nextWhisperer, URLEncoder.encode(relayed.stream().collect(Collectors.joining(" ")))))).method("POST", HttpRequest.BodyPublishers.noBody()).build(), HttpResponse.BodyHandlers.discarding()).thenAccept(i -> {});
        return null;
    }
}
