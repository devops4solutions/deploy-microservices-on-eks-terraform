package helloservice.controllers;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WorldController {

    @Autowired
    private MeterRegistry meterRegistry;  // Inject the MeterRegistry

    // Custom metric to count the number of requests to /hello
    @GetMapping("/world")
    public String getWorld() {
        // Increment the custom counter metric
        Counter helloCounter = meterRegistry.counter("requests.world");
        helloCounter.increment();  // Increment every time this endpoint is hit

        return "****Hello from World Service ****";
    }
}
