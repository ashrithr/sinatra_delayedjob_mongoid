##Simple sinatra application to demonstrate use of `delyed_job` backed by `mongoid`.

Start a `mongod` instance:

```
${MONGO_HOME}/bin/mongod --dbpath data
```

Start sinatra application:

```
rackup
```

Index collection used by `delayed_job`:

```
bundle exec rake jobs:create_indexes
```

Start `delayed_job` process:

```
bin/delayed_job start
```

Check the logs for tasks being executed by `delayed_job`:

```
less +F log/delayed_job.log
```
