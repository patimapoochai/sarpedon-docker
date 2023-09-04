FROM debian:12
# pre-build tools
WORKDIR /opt
RUN apt-get update
RUN apt-get -y install git golang

# sarpedon dependencies
RUN mkdir sarpedon
WORKDIR sarpedon
COPY ./sarpedon/go.* ./
RUN go mod download

# sarpedon project files
ADD ./sarpedon/ ./
RUN bash install.sh

# Sarpedon configs
COPY sarpedon.conf .
CMD ["./sarpedon"]
EXPOSE 4013
