

--
-- Table: public.products
-- drop table public.products;

create table products
(
    product_id   serial,
    product_name varchar(45)                      not null,
    price_net    numeric(12, 2)                   not null,
    VAT          decimal(3, 3) check (VAT <= 1.0) null,
    description  text,
    constraint product_pk primary key (product_id)
);


--
-- Table: public.orders; Schema: public; Owner: postgres
-- drop table orders;

create table orders
(
    order_id   serial,
    account_id int       not null,
    order_date timestamp not null default now(),
    constraint order_pk primary key (order_id),
    constraint fk_account foreign key (account_id) references accounts (account_id)
        match simple on update cascade on delete restrict
);


--
-- Name: payments; Type TABLE; Schema: public; Owner: postgres;
-- drop table payments;

create table payments
(
    payment_id     serial,
    full_amount    bool default FALSE not null,
    installments   bool default FALSE not null,
    payment_status varchar(10)        null,
    payment_date   timestamp,
    constraint payment_pk primary key (payment_id),
    constraint chk_payment_status check (payment_status in ('processing', 'completed')),
    constraint order_fk foreign key (payment_id) references orders (order_id)
        match simple on update cascade on delete restrict
);


--
-- Table: public.orders_details
-- drop table public.orders_details;

create table public.orders_details
(
    order_id   int            default 0    not null,
    product_id int            default 0    not null,
    unit_price numeric(15, 2) default 0.00 null,
    quantity   smallint       default 0    null,
    constraint product_order_pk primary key (product_id, order_id),
    constraint orders_details_fk00 foreign key (order_id) references orders (order_id)
        match simple on update cascade on delete restrict,
    constraint orders_details_fk01 foreign key (product_id) references products (product_id)
        match simple on update cascade on delete restrict
);

--
-- Name public.accounts Type: TABLE; Schema: public; Owner: postgres
-- drop table public.accounts;

create table accounts
(
    account_id   serial,
    account_name varchar(45),
    discount     decimal(1, 1) not null default 0.30,
    NIP          varchar(10)   not null unique,
    constraint account_pk primary key (account_id),
    constraint NIP_chk CHECK (char_length(NIP) = 10)
);


--
-- Table: public.agents
-- drop table public.agents;

create table agents
(
    agent_id   serial,
    account_id int         default 0 null,
    agent_name varchar(45),
    last_name  varchar(45)           not null,
    email      varchar(50) unique    not null,
    phone      varchar(35) default 0 null,
    constraint agent_pk primary key (agent_id),
    constraint account_fk foreign key (account_id) references accounts (account_id)
        match simple on update cascade on delete restrict
);

