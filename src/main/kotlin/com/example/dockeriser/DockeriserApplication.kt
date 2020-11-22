package com.example.dockeriser

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class DockeriserApplication

fun main(args: Array<String>) {

    val environment = System.getenv("ENVIRONMENT_NAME")
    val dbUser = System.getenv("DB_USER")
    val dbPassword = System.getenv("DB_PASSWORD")

    println("[Application starting] ENVIRONMENT_NAME: $environment | DB_USER: $dbUser | DB_PASSWORD: $dbPassword")

    runApplication<DockeriserApplication>(*args)
}
