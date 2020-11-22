package com.example.dockeriser

import org.springframework.stereotype.Service
import javax.annotation.PostConstruct

@Service
class SimpleService(private val properties: EnvironmentProperties) {

    @PostConstruct
    fun onPostConstruct(){

        properties.apply {
            println("[SimpleService] ENVIRONMENT_NAME: $environmentName | DB_USER: $dbUser | DB_PASSWORD: $dbPassword")
        }

    }

}
