package com.wedding.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // This maps /css/** to classpath:/static/css/
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/");

        // This maps /resources/** to /resources/ in the webapp directory
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
    }
}