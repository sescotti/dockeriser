package com.example.dockeriser

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.context.annotation.Configuration

@Configuration
@ConfigurationProperties
class EnvironmentProperties {
    lateinit var environmentName: String
    lateinit var dbUser: String
    lateinit var dbPassword: String
}