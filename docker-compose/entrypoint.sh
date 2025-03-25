#!/bin/sh

# composer clear-cache

# composer install or update for new added package
# composer install -n --prefer-dist
# Run Laravel migrations
php artisan migrate 

# php artisan db:seed 

# Start the main process
exec "$@"