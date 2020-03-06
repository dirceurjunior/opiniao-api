package com.drj.opiniao.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

import com.drj.opiniao.api.config.property.OpiniaoApiProperty;

@SpringBootApplication
@EnableConfigurationProperties(OpiniaoApiProperty.class)
public class OpiniaoApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(OpiniaoApiApplication.class, args);
	}

}
