# Use the official Golang image
FROM golang:1.23

# Set the working directory
WORKDIR /app

# Copy the Go module files
COPY go.mod ./

# Copy the rest of the application code
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 8080
EXPOSE 8080

# Run the app
CMD ["./main"]
