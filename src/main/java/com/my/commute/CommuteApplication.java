package com.my.commute;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.my.commute.dao.map")
public class CommuteApplication {

	public static void main(String[] args) {
		SpringApplication.run(CommuteApplication.class, args);
	}

}
