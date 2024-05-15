FROM crystallang/crystal:1.12 AS dev

ADD . /app
WORKDIR /app

RUN shards install

RUN crystal build ./src/ygg-blocks.cr

EXPOSE 3000

CMD ["/app/ygg-blocks"]
