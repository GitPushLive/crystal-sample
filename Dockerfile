FROM crystallang/crystal:latest
WORKDIR /app
COPY ./shard.yml ./shard.lock /app/
RUN shards install -v
COPY . .
CMD ["bin/run-dev.sh"]