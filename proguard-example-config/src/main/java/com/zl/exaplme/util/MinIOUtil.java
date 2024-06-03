package com.zl.exaplme.util;

import com.zl.exaplme.property.MinIOProperties;
import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import lombok.SneakyThrows;

public class MinIOUtil {

    private MinioClient minIOClient;

    private MinIOProperties minIOProperties;

    public MinIOUtil(MinioClient minIOClient, MinIOProperties minIOProperties) {
        this.minIOClient = minIOClient;
        this.minIOProperties = minIOProperties;
    }

    private static final int DEFAULT_EXPIRY_TIME = 15;

    public String getEndpoint() {
        return this.minIOProperties.getEndpoint();
    }

    /**
     * 检查存储桶是否存在.
     *
     * @param bucketName 存储桶名称
     */
    @SneakyThrows
    public boolean bucketExists(String bucketName) {
        BucketExistsArgs args = BucketExistsArgs.builder().bucket(bucketName).build();
        return minIOClient.bucketExists(args);
    }

    /**
     * 创建存储桶.
     *
     * @param bucketName 存储桶名称
     */
    @SneakyThrows
    public void makeBucket(String bucketName) {
        if (!bucketExists(bucketName)) {
            MakeBucketArgs args = MakeBucketArgs.builder().bucket(bucketName).build();
            minIOClient.makeBucket(args);
        }
    }
}