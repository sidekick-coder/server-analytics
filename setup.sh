#! /bin/bash

BASE_PATH=$PWD

## create .htpasswd if not exist
[ ! -f $BASE_PATH/.htpasswd ] && echo 'foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.' >> $BASE_PATH/.htpasswd

# create symlinks
declare -a symlinks=(
    ## docker
    "$BASE_PATH/templates/docker-compose.yml:$BASE_PATH/docker-compose.yml"

    ## loki
    "$BASE_PATH/.htpasswd:$BASE_PATH/loki/.htpasswd"
    "$BASE_PATH/templates/loki/docker-compose.yml:$BASE_PATH/loki/docker-compose.yml"
    "$BASE_PATH/templates/loki/nginx.conf:$BASE_PATH/loki/nginx.conf"
    "$BASE_PATH/templates/loki/config.yml:$BASE_PATH/loki/config.yml"

    ## node_exporter
    "$BASE_PATH/.htpasswd:$BASE_PATH/node_exporter/.htpasswd"
    "$BASE_PATH/templates/node_exporter/docker-compose.yml:$BASE_PATH/node_exporter/docker-compose.yml"
    "$BASE_PATH/templates/node_exporter/nginx.conf:$BASE_PATH/node_exporter/nginx.conf"

    ## prometheus
    "$BASE_PATH/.htpasswd:$BASE_PATH/prometheus/.htpasswd"
    "$BASE_PATH/templates/prometheus/docker-compose.yml:$BASE_PATH/prometheus/docker-compose.yml"
    "$BASE_PATH/templates/prometheus/nginx.conf:$BASE_PATH/prometheus/nginx.conf"
    "$BASE_PATH/templates/prometheus/config.yml:$BASE_PATH/prometheus/config.yml"
    
    ## prometail
    "$BASE_PATH/.htpasswd:$BASE_PATH/promtail/.htpasswd"
    "$BASE_PATH/templates/promtail/docker-compose.yml:$BASE_PATH/promtail/docker-compose.yml"
    "$BASE_PATH/templates/promtail/nginx.conf:$BASE_PATH/promtail/nginx.conf"
    "$BASE_PATH/templates/promtail/config.yml:$BASE_PATH/promtail/config.yml"

    ## grafana
    "$BASE_PATH/templates/grafana/docker-compose.yml:$BASE_PATH/grafana/docker-compose.yml"
    

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