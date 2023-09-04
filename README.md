# sarpedon-docker
Containerized version of Sarpedon, a score leaderboard for cybersecurity vulnerability remediation competitions. This project is meant to be used alongside Aeacus.

## Project components
This project has two parts: dockerized sarpedon and a docker-compose file to create the complete sarpedon stack. The docker-compose is an easy, one-command setup for quick deployments, and the dockerized sarpedon image can be combined with other containers for specific setups.

## Usage
### Clone the repository
The Sarpedon source files are provided by git as a submodule, so to clone this repository you can use:
```
git clone --recurse-submodules https://github.com/patimapoochai/sarpedon-docker.git
```

### Deploying Sarpedon
```docker-compose up -d```

### Building only the Sarpedon container
```docker build --tag sarpedon .```

### Sarpedon configuration file
Sarpedon's configuration file (`sarpedon.conf`) can be found in the root folder. It is bind-mounted to the docker compose setup, so changes to the config will appear after you run `docker-compose down && docker-compose up`. The config file will also be copied into the container during the build process.

## Integration with Aeacus
Setup requirements in Aeacus virtual machines to connect to Sarpedon:
- Create `/opt/aeacus/TeamID.txt` file with a team id that exists in `sarpedon.conf`
- Make sure the password in `/opt/aeacus/scoring.conf` matches Sarpedon's settings
- Point Aeacus virtual Machines to the IP of Sarpedon
