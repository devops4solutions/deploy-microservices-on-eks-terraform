# Prerequistie
1. EKS Cluster configured with Prometehus Grafana & alert Manager

# Exposing Spring Boot Microservices to Prometheus

This guide will help you configure your **Spring Boot microservices** to expose **metrics** that can be scraped by **Prometheus**.

## 1️⃣ Add Dependencies
To enable Prometheus metrics, add the following dependencies to your `pom.xml` (for Maven projects):

```xml
<dependency>
    <groupId>io.micrometer</groupId>
    <artifactId>micrometer-registry-prometheus</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```


## 2️⃣ Configure Actuator Endpoints
Enable Prometheus and other required actuator endpoints in `application.properties`:

```properties
management.endpoints.web.exposure.include=*
```


## 3️⃣ Run the Application Locally & Verify Metrics
Start your Spring Boot application and check if Prometheus metrics are exposed at:

```
http://localhost:/actuator/prometheus
```

## 4️⃣ Configure Prometheus to Scrape Metrics
Add the following job configuration in your Prometheus `prometheus.yml` file:

```yaml
podAnnotations:
  prometheus.io/scrape: "true"
  prometheus.io/path: "/actuator/prometheus"
```

