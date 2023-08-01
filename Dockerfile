# Use an appropriate base image that includes Apache HTTP server, e.g., the official httpd image
FROM amazonlinux:latest

# Run commands
RUN yum update -y && \
    yum install -y httpd && \
    yum install -y wget && \
    yum install -y unzip

# Set the working directory inside the container
WORKDIR /var/www/html

RUN wget https://github.com/obinnaaliogor/aws_ecs-fargate-jupiter-app-project/archive/refs/heads/main.zip

RUN unzip main.zip && \
    mv aws_ecs-fargate-jupiter-app-project-main/* . && \
    rm -rf  aws_ecs-fargate-jupiter-app-project-main main.zip README.md Dockerfile-multi-stage Dockerfile LICENSE

# Expose the default HTTP port (80)
EXPOSE 80


# Start the httpd process in the foreground when the container starts
CMD ["httpd", "-D", "FOREGROUND"]
