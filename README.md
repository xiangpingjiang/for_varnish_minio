# for_varnish_minio

docker run -p 9000:9000 \
-e "MINIO_ACCESS_KEY=ROOT_ACCESS_KEY" \
-e "MINIO_SECRET_KEY=SECRET_ACCESS_KEY_CHANGE_ME" \
-v /mnt/disk1:/disk1 \
-v /mnt/disk2:/disk2 \
-v /mnt/disk3:/disk3 \
-v /mnt/disk4:/disk4 \
minio/minio server /disk{1...4}





docker run --name my-running-varnish -v .../Documents/varnish/default.vcl:/etc/varnish/default.vcl:ro --tmpfs /var/lib/varnish:exec -d -p 8080:80 varnish
