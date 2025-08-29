# Use official Nginx image as base
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx index page
RUN rm -rf ./*

# Copy project files (your HTML, CSS, JS, etc.) into container
COPY . .

# Expose port 80 for web traffic
EXPOSE 80

# Nginx runs automatically as ENTRYPOINT in this image
