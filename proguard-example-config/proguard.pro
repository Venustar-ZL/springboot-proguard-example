# JDK目标版本17
-target 17

# 禁用shrink（删除未使用的类和成员）
-dontshrink

# 禁用优化（字节码级别的优化）
-dontoptimize

# 忽略打包时的警告信息
-ignorewarnings

# 不跳过非公共类文件和成员
-dontskipnonpubliclibraryclasses
-dontskipnonpubliclibraryclassmembers

# 类名不使用混合大小写
-dontusemixedcaseclassnames

# 优化时允许访问并修改有修饰符的类和类的成员
-allowaccessmodification

# 混淆类名之后，对使用Class.forName（"className"）之类的地方进行相应替代
-adaptclassstrings

# 保留所有包名
-keeppackagenames

# 使用唯一的类成员名称
-useuniqueclassmembernames

# 保留异常、注解等特殊信息，避免影响 Spring Boot 启动
-keepattributes Exceptions,InnerClasses,Signature?Deprecated,SourceFile,LineNumberTable,LocalVariable*Table,*Annotation*,SyntheticjEnclosingMethod

# 保留所有的set/get方法
-keepclassmembers public class * {
    void set*(***);
    *** get*();
}

## 保留外部调用类
-keep class com.zl.exaplme.util.MinIOUtil { *; }

# 保留带有 Spring 相关注解的类、字段和方法
-keepclassmembers class * {
    @org.springframework.beans.factory.annotation.Autowired *;
    @org.springframework.beans.factory.annotation.Qualifier *;
    @org.springframework.beans.factory.annotation.Value *;
    @org.springframework.beans.factory.annotation.Required *;
    @org.springframework.context.annotation.Bean *;
    @org.springframework.context.annotation.Primary *;
    @org.springframework.boot.context.properties.ConfigurationProperties *;
    @org.springframework.boot.context.properties.EnableConfigurationProperties *;
    @javax.annotation.PostConstruct *;
    @javax.annotation.PreDestroy *;
}

# 保留实现 Serializable 接口的类
-keep class * implements java.io.Serializable { *; }

# 保留实现 CommandLineRunner 接口的类
-keep class * implements org.springframework.boot.CommandLineRunner { *; }

## 保留使用 @Configuration 注解的类
#-keep @org.springframework.context.annotation.Configuration class * { *; }
#
## 保留使用 @Component 注解的类
#-keep @org.springframework.stereotype.Component class * { *; }
#
## 保留使用 @Service 注解的类
#-keep @org.springframework.stereotype.Service class * { *; }

# 保留使用 @ConfigurationProperties 注解的类
-keep @org.springframework.boot.context.properties.ConfigurationProperties class * { *; }

# 保留使用 @Slf4j 注解的类和生成的 log 字段
-keep @lombok.extern.slf4j.Slf4j class * {*;}
-keepclassmembers class * {
    lombok.extern.slf4j.Slf4j log;
}

# 保留枚举类的所有成员
-keepclassmembers enum * { *; }

# 保留主方法
-keepclasseswithmembers public class * { public static void main(java.lang.String[]); }

# 保留源文件和行号信息
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

# 忽略所有的警告信息
-dontwarn *

# 混淆字典
-applymapping mapping.map