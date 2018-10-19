package wpk.carIO;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"wpk.carIO"})
public class CarIoApplication {
	public static void main(String[] args) {
		SpringApplication.run(CarIoApplication.class, args);
	}
}