
FROM node:20


WORKDIR /app
COPY appointment-service.js /app

# Install dependencies
RUN npm init -y 
RUN npm install express


EXPOSE 3001

# Start the application
CMD ["node", "appointment-service.js"]
