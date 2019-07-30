bundle exec kitchen destroy --concurrency=5
bundle exec kitchen list
bundle exec kitchen converge --concurrency=5
bundle exec kitchen list
bundle exec kitchen verify
bundle exec kitchen list
bundle exec kitchen destroy --concurrency=5
bundle exec kitchen list
