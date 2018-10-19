package wpk.carIO;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import wpk.carIO.CarIoApplication;

public class ServletInitializer extends SpringBootServletInitializer {
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(new Class[]{CarIoApplication.class});
	}
}