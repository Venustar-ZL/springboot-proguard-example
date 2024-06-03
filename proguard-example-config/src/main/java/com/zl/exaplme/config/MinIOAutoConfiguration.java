package com.zl.exaplme.config;

import com.zl.exaplme.property.MinIOProperties;
import com.zl.exaplme.util.MinIOUtil;
import io.minio.MinioClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;

@EnableConfigurationProperties(MinIOProperties.class)
@AutoConfiguration
public class MinIOAutoConfiguration {

    private static final Logger log = LoggerFactory.getLogger(MinIOAutoConfiguration.class);

    @Bean
    @Order(0)
    public MinioClient minioClient(MinIOProperties minIOProperties) {
        MinioClient minioClient = MinioClient.builder()
                .endpoint(minIOProperties.getEndpoint())
                .credentials(minIOProperties.getAccessKey(), minIOProperties.getSecretKey())
                .build();
        return minioClient;
    }

    @Bean
    public MinIOUtil minIOUtil(MinioClient minioClient, MinIOProperties minIOProperties) {
        return new MinIOUtil(minioClient, minIOProperties);
    }

}
