# Simple production-ready image for Smart Hostel System
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Install dependencies first (better layer caching)
COPY package.json package-lock.json* ./
RUN npm ci || npm install

# Copy source
COPY . .

# Environment
ENV NODE_ENV=production
ENV PORT=8080
EXPOSE 8080

# Create an empty uploads dir inside container
RUN mkdir -p uploads/images uploads/thumbnails

CMD ["npm", "start"]
