package io.anemortalkid.containment_32;

import io.anemortalkid.containment_32.resources.RelayResource;
import io.dropwizard.Application;
import io.dropwizard.configuration.EnvironmentVariableSubstitutor;
import io.dropwizard.configuration.SubstitutingSourceProvider;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class WhispererApplication extends Application<WhispererConfiguration> {

    public static void main(final String[] args) throws Exception {
        new WhispererApplication().run(args);
    }

    @Override
    public String getName() {
        return "Whisperer";
    }

    @Override
    public void initialize(final Bootstrap<WhispererConfiguration> bootstrap) {
        // subsitute envvars
        bootstrap.setConfigurationSourceProvider(
                new SubstitutingSourceProvider(bootstrap.getConfigurationSourceProvider(),
                        new EnvironmentVariableSubstitutor(false)
                )
        );
    }

    @Override
    public void run(final WhispererConfiguration configuration,
                    final Environment environment) {
        environment.jersey().register(new RelayResource(configuration.getNextWhisperer()));
    }

}
