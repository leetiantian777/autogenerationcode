package com.code.autogeneration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;

@SpringBootApplication
public class AutogenerationApplication {

	public static void main(String[] args) throws IOException {
//		SpringApplication.run(AutogenerationApplication.class, args);
		CodeGeneration.AutoCodeGenerate();
	}
}
