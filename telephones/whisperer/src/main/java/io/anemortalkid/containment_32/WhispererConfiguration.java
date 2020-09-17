package io.anemortalkid.containment_32;

import io.dropwizard.Configuration;

public class WhispererConfiguration extends Configuration {
    private String nextWhisperer;
    public String getNextWhisperer() {
        return nextWhisperer;
    }
    public void setNextWhisperer(String nextWhisperer) {
        this.nextWhisperer = nextWhisperer;
    }
}
