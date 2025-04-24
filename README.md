# Karate Gatling Load Tests

## Overview

This project demonstrates how to use Karate and Gatling to perform load testing on APIs. The load tests are designed to simulate various user behaviors and traffic patterns to evaluate the performance and reliability of the system under test.

### Load Tests Included

1. **Create User Load Test**:
   - Simulates user registration by creating new user accounts.
   - Includes dynamic token extraction and form submission.
   - Traffic pattern:
     - Initial warm-up with a small number of users.
     - Gradual ramp-up to peak load.
     - Sustained peak load for a defined duration.
     - Gradual ramp-down to simulate decreasing traffic.

2. **Get Products Load Test**:
   - Simulates fetching product details by slug.
   - Randomly selects product slugs from a predefined list.
   - Traffic pattern:
     - Initial burst of users.
     - Gradual ramp-up to a higher number of users.
     - Sustained load with constant users per second.
     - Gradual ramp-down to simulate decreasing traffic.

### How to Run the Load Tests

#### Prerequisites

1. **Java**: Ensure you have Java 8 or higher installed.
2. **Maven**: Install Maven for dependency management and build.
3. **Karate**: The project uses Karate for API testing.
4. **Gatling**: Gatling is used for load testing.

#### Running the Tests

1. **Build the Project**:
   Run the following command to build the project and download dependencies:
   ```bash
   mvn clean test-compile gatling:test
