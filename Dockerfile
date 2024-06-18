# Use the official Node.js 18 image as the base image
FROM node:18

# Create and change to the app directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install the app dependencies, including bcrypt
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Ensure bcrypt is rebuilt specifically for the current environment
RUN npm rebuild bcrypt --build-from-source

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
