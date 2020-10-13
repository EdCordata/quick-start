git checkout master

git checkout rails-6
git merge --no-ff master

git checkout rails-6-mysql
git merge --no-ff rails-6

git checkout rails-6-pg
git merge --no-ff rails-6

git checkout rails-6-redis
git merge --no-ff rails-6

git checkout rails-6-redis-resque
git merge --no-ff rails-6-redis

git checkout rails-6-bootstrap
git merge --no-ff rails-6

git checkout rails-6-bootstrap-admin
git merge --no-ff rails-6-bootstrap

git checkout rails-6-bootstrap-users
git merge --no-ff rails-6-bootstrap

git checkout rails-6-bootstrap-admin-users
git merge --no-ff rails-6-bootstrap-users
git merge --no-ff rails-6-bootstrap-admin

git checkout master
