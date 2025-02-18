# Use official Erlang image
FROM erlang:26

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install dependencies
RUN apt-get update && apt-get install -y git
RUN rebar3 compile

# Expose port 8080
EXPOSE 8080

# Start the server
CMD ["erl", "-pa", "_build/default/lib/*/ebin", "-s", "chat_server", "start"]
