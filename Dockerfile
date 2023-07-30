# Use the official Node.js LTS (Long Term Support) image as the base image
FROM node:lts-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the container
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the entire Next.js application to the container
COPY . .

# Build the Next.js application for production
RUN npm run build

# Expose the default Next.js development server port
EXPOSE 3000

# Start the Next.js development server
CMD ["npm", "start"]
