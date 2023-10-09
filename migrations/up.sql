CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS payment
(
    id            UUID DEFAULT uuid_generate_v4() PRIMARY KEY,

    transaction   varchar(128),
    request_id    varchar(128),
    currency      varchar(8),
    provider      varchar(128),
    amount        int,
    payment_id    varchar(128),
    bank          varchar(128),
    delivery_cost int,
    goods_total   int,
    custom_fee    int
);

CREATE TABLE IF NOT EXISTS items
(
    chrt_id      UUID PRIMARY KEY,
    track_number varchar(128),
    price        int,
    rid          varchar(128),
    name         varchar(128),
    sale         int,
    size         int,
    total_price  int,
    nm_id        int,
    brand        varchar(128),
    status       int
);

CREATE TABLE IF NOT EXISTS delivery
(
    id      UUID DEFAULT uuid_generate_v4() PRIMARY KEY,

    name    varchar(128),
    phone   varchar(128),
    zip     varchar(128),
    city    varchar(128),
    address varchar(128),
    region  varchar(128),
    email   varchar(128)
);

CREATE TABLE IF NOT EXISTS specs
(
    id                 UUID DEFAULT uuid_generate_v4() PRIMARY KEY,

    locale             varchar(8),
    internal_signature varchar(128),
    customer_id        varchar(128),
    delivery_service   varchar(128),
    shardkey           varchar(128),
    sm_id              int,
    date_created       timestamp,
    off_shard          int
);

CREATE TABLE IF NOT EXISTS orders
(
    id                 UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
   
    order_uid    varchar(128) PRIMARY KEY,
    track_number varchar(128),
    entry        varchar(128),

    specs_id     UUID REFERENCES specs (id),
    delivery_id  UUID REFERENCES delivery (id),
    payment_id   UUID REFERENCES payment (id)
);

CREATE TABLE IF NOT EXISTS orders_items
(
    order_id UUID REFERENCES orders (id),
    item_id  UUID REFERENCES items (chrt_id),
    PRIMARY KEY (order_id, item_id)
);
