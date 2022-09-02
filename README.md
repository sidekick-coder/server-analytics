# Server analytics target

This is project to help setup a server that will send metrics and logs to an external prometheus & loki server 

## Setup

Run setup.sh script to create the required files to the project run.
```
bash setup.sh
```
The command will do the following things:

- Create a root docker-compose.yml file using the template in `templates` folder
- Create a .htpasswd file in root directory
- Create symlinks of root .htpasswd services folders. Ex. .htpasswd > node_exporter/.htpasswd

## Edit & customize

To edit and customize some service or config you have to break the symlink and recreate the same file with the need customization

You can use the samples in templates folder to create your own configuration files.

Ex: Customize root docker-compose.yml

```bash
# remove symlink
rm docker-compose.yml

# create a new file
cp templates/docker-compose.yml docker-compose.yml

# customize the new file
nano docker-compose.yml
```

Ex: Customize promtail config

```bash
# remove symlink
rm promtail/config.yml

# create a new file
cp templates/promtail/config.yml promtail

# customize the new file
nano promtail/config.yml
```

## Notes

- Services rely on `$PWD` variable so always run docker from root directory