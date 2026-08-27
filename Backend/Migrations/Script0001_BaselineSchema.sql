CREATE TABLE IF NOT EXISTS roles (
    id integer NOT NULL,
    name text NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    id integer NOT NULL,
    username text NOT NULL,
    password_hash text NOT NULL,
    full_name text NOT NULL,
    role_id integer
);

CREATE TABLE IF NOT EXISTS orders (
    id integer NOT NULL,
    product_id text NOT NULL,
    ordered_by integer,
    ordered_at timestamp without time zone DEFAULT now() NOT NULL,
    predicted_stockout_day numeric,
    predicted_lead_time_days numeric
);

CREATE TABLE IF NOT EXISTS deneme (
    id integer NOT NULL,
    mesaj text
);
