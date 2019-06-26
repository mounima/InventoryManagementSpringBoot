package trg.talentsprint.starterkit;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
 
/**
 * @author Crunchify.com - Simple Spring Boot Example
 *
 */
 
// @RestController is a convenience annotation that is itself annotated with @Controller and @ResponseBody
@RestController
 
// @EnableAutoConfiguration enables auto-configuration of the Spring Application Context, attempting to guess
// and configure beans that you are likely to need.
@EnableAutoConfiguration
public class StarterSpringController {
 
	// @RequestMapping annotation is used for mapping web requests onto specific handler classes
	@RequestMapping("/spring")
	String basicURL() {
		return "Welcome to Spring Boot Hello World Tutorial";
	}
 
}