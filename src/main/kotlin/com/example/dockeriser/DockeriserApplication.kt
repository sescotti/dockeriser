package com.example.dockeriser

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class DockeriserApplication

fun main(args: Array<String>) {
	runApplication<DockeriserApplication>(*args)
}
