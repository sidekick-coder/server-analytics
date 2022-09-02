#! /bin/bash

BASE_PATH=$PWD

## create .htpasswd if not exist
[ ! -f $BASE_PATH/.htpasswd ] && echo 'foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.' >> $BASE_PATH/.htpasswd

# create symlinks
declare -a symlinks=(
    ## node_exporter
    "$BASE_PATH/.htpasswd:$BASE_PATH/node_exporter/.htpasswd"
    "$BASE_PATH/templates/node_exporter/docker-compose.yml:$BASE_PATH/node_exporter/docker-compose.yml"
    "$BASE_PATH/templates/node_exporter/nginx.conf:$BASE_PATH/node_exporter/nginx.conf"
)

length=${#symlinks[@]}

## Loop to create required files if they not exists
for (( i=0; i<${length}; i++ )); do
    symlink=${symlinks[$i]}
    source=${symlink%":"*}
    target=${symlink#*":"}
    
    if [ ! -f "$target" ]; then
        ln -s $source $target    
        echo "(created): ${target/$BASE_PATH\//}"
    else 
        echo "(skipping): ${target/$BASE_PATH\//}"
    fi
done