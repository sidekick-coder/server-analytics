#1 /bin/bash

BASE_PATH=$PWD

echo $BASE_PATH

ln -s $BASE_PATH/.templates/loki/config.yml $BASE_PATH/loki/config.yml
ln -s $BASE_PATH/.templates/loki/nginx.conf $BASE_PATH/loki/nginx.conf
echo '' >> $BASE_PATH/loki/.htpasswd

ln -s $BASE_PATH/.templates/prometheus/config.yml $BASE_PATH/prometheus/config.yml
ln -s $BASE_PATH/.templates/prometheus/nginx.conf $BASE_PATH/prometheus/nginx.conf
echo '' >> $BASE_PATH/prometheus/.htpasswd

ln -s $BASE_PATH/.templates/promtail/config.yml $BASE_PATH/promtail/config.yml
ln -s $BASE_PATH/.templates/promtail/nginx.conf $BASE_PATH/promtail/nginx.conf
echo '' >> $BASE_PATH/promtail/.htpasswd