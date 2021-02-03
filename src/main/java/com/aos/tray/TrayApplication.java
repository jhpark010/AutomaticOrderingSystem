package com.aos.tray;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class TrayApplication {
	public static void main(String[] args) {
		SpringApplication.run(TrayApplication.class, args);
	}
}
