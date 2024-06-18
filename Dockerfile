# Use the official Node.js 18 image as the base image
FROM node:18

# Create and change to the app directory
WORKDIR /app

# Install build tools to compile native modules
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the app dependencies, including bcrypt
RUN npm install

# Ensure bcrypt is rebuilt specifically for the current environment
RUN npm rebuild bcrypt --build-from-source

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
