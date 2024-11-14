# Stage 1: Build Stage
FROM node:alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json if you have them
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of your application code
COPY . .


# Stage 2: Serve Stage
FROM nginx:alpine

# Copy built assets from the builder stage to Nginx's html directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
