FROM ruby:3.2-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
    git \
    npm

# Set working directory
WORKDIR /app

# Copy the application
COPY . ./

# Install ruby dependencies
RUN bundle install

# Run prepare_coffeelint to install actual coffeelinter dependency
RUN rake prepare_coffeelint --trace

# Set the default command
CMD ["rake", "spec"]
