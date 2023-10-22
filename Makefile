db_up:
	psql -U postgres -d nats_streaming -a -f ~/projects/nats-server/migrations/up.sql > /dev/null  

db_down:
	psql -U postgres -d nats_streaming -a -f ~/projects/nats-server/migrations/down.sql  

db_clear:
	psql -U postgres -d nats_streaming -a -f ~/projects/nats-server/migrations/down.sql  
	psql -U postgres -d nats_streaming -a -f ~/projects/nats-server/migrations/up.sql > /dev/null
