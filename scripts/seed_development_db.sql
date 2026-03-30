SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE DATABASE seed WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';

ALTER DATABASE seed OWNER TO base;

\connect seed

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER SCHEMA public OWNER TO base;

COMMENT ON SCHEMA public IS '';

CREATE VIEW public.analytics_crate_movements AS
SELECT
    NULL::bigint AS storage_crate_id,
    NULL::bigint AS cooling_unit_id,
    NULL::character varying(3) AS currency,
    NULL::double precision AS weight,
    NULL::bigint AS crop_id,
    NULL::bigint AS checkin_id,
    NULL::timestamp with time zone AS checkin_date,
    NULL::bigint AS checkin_operator,
    NULL::bigint AS checkin_user,
    NULL::bigint AS checkin_farmer,
    NULL::bigint AS survey_farmer,
    NULL::bigint AS checkout_id,
    NULL::timestamp with time zone AS checkout_date,
    NULL::double precision AS checkout_price,
    NULL::bigint AS checkout_operator,
    NULL::bigint AS checkout_loss_in_kg,
    NULL::double precision AS checkout_survey_price,
    NULL::double precision AS avg_price_per_crate,
    NULL::text AS crop_name;

ALTER VIEW public.analytics_crate_movements OWNER TO base;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);

ALTER TABLE public.auth_group OWNER TO base;

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.auth_group_id_seq OWNER TO base;

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);

ALTER TABLE public.auth_group_permissions OWNER TO base;

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO base;

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);

ALTER TABLE public.auth_permission OWNER TO base;

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.auth_permission_id_seq OWNER TO base;

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;

CREATE TABLE public.company_metrics (
    report_date date,
    company_id integer NOT NULL,
    comp_name character varying(255),
    comp_logo character varying(512),
    comp_country character(2),
    comp_cap_tons numeric,
    comp_cap_num_crates integer,
    cooling_unit_types jsonb,
    comp_op integer,
    comp_op_fem integer,
    comp_op_ma integer,
    comp_op_ot integer,
    currency character(3),
    comp_reg_users integer,
    comp_reg_users_ma integer,
    comp_reg_users_fem integer,
    comp_reg_users_ot integer,
    comp_beneficiaries numeric(8,2),
    comp_beneficiaries_fem numeric(8,2),
    comp_beneficiaries_ma numeric(8,2),
    comp_cool_users integer,
    comp_cool_users_fem integer,
    comp_cool_users_ma integer,
    comp_cool_users_ot integer,
    comp_farmers integer,
    comp_traders integer,
    comp_unspec_user_type integer,
    comp_crates_in integer,
    comp_ops_in integer,
    comp_kg_in integer,
    comp_crates_out integer,
    comp_ops_out integer,
    comp_kg_out integer,
    comp_average_room_occupancy numeric(8,2),
    comp_revenue numeric(16,2),
    comp_revenue_usd numeric(16,2)
);

ALTER TABLE public.company_metrics OWNER TO base;

CREATE TABLE public.cooling_unit_metrics (
    id integer NOT NULL,
    date date NOT NULL,
    report_date date NOT NULL,
    cooling_unit_id integer NOT NULL,
    unit_name text NOT NULL,
    is_unit_deleted boolean NOT NULL,
    state text,
    cool_unit_type text NOT NULL,
    cap_tons integer NOT NULL,
    cap_num_crates integer NOT NULL,
    company_id integer NOT NULL,
    comp_name text NOT NULL,
    comp_pricing text NOT NULL,
    currency text NOT NULL,
    room_op integer NOT NULL,
    room_op_fem integer NOT NULL,
    room_op_ma integer NOT NULL,
    room_op_ot integer NOT NULL,
    room_beneficiaries numeric NOT NULL,
    room_beneficiaries_fem numeric NOT NULL,
    room_beneficiaries_ma numeric NOT NULL,
    room_active_users integer NOT NULL,
    room_active_user_ids integer[] NOT NULL,
    room_active_fem integer[] NOT NULL,
    room_active_ma integer[] NOT NULL,
    room_active_ot integer[] NOT NULL,
    room_crates_in integer NOT NULL,
    room_ops_in integer NOT NULL,
    room_kg_in integer NOT NULL,
    room_crates_out integer NOT NULL,
    room_ops_out integer NOT NULL,
    room_kg_out integer NOT NULL,
    average_room_occupancy numeric NOT NULL,
    room_revenue numeric NOT NULL,
    room_revenue_usd numeric NOT NULL,
    check_in_crates_crop jsonb,
    check_in_kg_crop jsonb,
    check_out_crates_crop jsonb,
    check_out_kg_crop jsonb,
    tot_co2 double precision,
    co2_crops jsonb
);

ALTER TABLE public.cooling_unit_metrics OWNER TO base;

CREATE SEQUENCE public.cooling_unit_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.cooling_unit_metrics_id_seq OWNER TO base;

ALTER SEQUENCE public.cooling_unit_metrics_id_seq OWNED BY public.cooling_unit_metrics.id;

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);

ALTER TABLE public.django_admin_log OWNER TO base;

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO base;

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);

ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO base;

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNER TO base;

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);

ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO base;

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNER TO base;

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);

ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO base;

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNER TO base;

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);

ALTER TABLE public.django_celery_beat_periodictask OWNER TO base;

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNER TO base;

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);

ALTER TABLE public.django_celery_beat_periodictasks OWNER TO base;

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);

ALTER TABLE public.django_celery_beat_solarschedule OWNER TO base;

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNER TO base;

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);

ALTER TABLE public.django_content_type OWNER TO base;

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_content_type_id_seq OWNER TO base;

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);

ALTER TABLE public.django_migrations OWNER TO base;

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.django_migrations_id_seq OWNER TO base;

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);

ALTER TABLE public.django_session OWNER TO base;

CREATE TABLE public.farmer_metrics (
    id integer NOT NULL,
    date date NOT NULL,
    report_date date NOT NULL,
    farmer_id integer NOT NULL,
    cooling_unit_id integer NOT NULL,
    gender text NOT NULL,
    room_crates_in integer NOT NULL,
    room_ops_in integer NOT NULL,
    room_kg_in integer NOT NULL,
    room_crates_out integer NOT NULL,
    room_ops_out integer NOT NULL,
    room_kg_out integer NOT NULL,
    check_in_crates_crop jsonb,
    check_in_kg_crop jsonb,
    check_out_crates_crop jsonb,
    check_out_kg_crop jsonb
);

ALTER TABLE public.farmer_metrics OWNER TO base;

CREATE SEQUENCE public.farmer_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.farmer_metrics_id_seq OWNER TO base;

ALTER SEQUENCE public.farmer_metrics_id_seq OWNED BY public.farmer_metrics.id;

CREATE TABLE public.impact_metrics (
    report_date date,
    cooling_unit_id bigint,
    unit_name text,
    company_id bigint,
    farmer_id bigint,
    crop_id bigint,
    first_name character varying(255),
    last_name character varying(255),
    crop_name character varying(255),
    currency text,
    baseline_quantity_total_month double precision,
    baseline_kg_selling_price_month numeric,
    baseline_kg_loss_month double precision,
    baseline_perc_loss_month double precision,
    baseline_kg_sold_month double precision,
    baseline_farmer_revenue_month double precision,
    monthly_kg_selling_price double precision,
    monthly_kg_checkin double precision,
    monthly_kg_loss bigint,
    monthly_farmer_revenue double precision,
    monthly_kg_selling_price_evolution double precision,
    monthly_perc_unit_selling_price_evolution double precision,
    monthly_farmer_revenue_evolution double precision,
    monthly_perc_farmer_revenue_evolution double precision,
    monthly_perc_loss double precision,
    monthly_perc_foodloss_diff double precision,
    monthly_perc_foodloss_evolution double precision,
    latest_survey_date timestamp with time zone,
    baseline_completed_surveys_room bigint,
    possible_post_checkout_survey_room bigint,
    total_post_checkout_survey_unit bigint
);

ALTER TABLE public.impact_metrics OWNER TO base;

CREATE TABLE public.marketplace_companydeliverycontact (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    contact_name character varying(255) NOT NULL,
    phone character varying(128) NOT NULL,
    company_id bigint NOT NULL,
    created_by_user_id bigint NOT NULL,
    delivery_company_name character varying(255) DEFAULT '""'::character varying NOT NULL
);

ALTER TABLE public.marketplace_companydeliverycontact OWNER TO base;

CREATE SEQUENCE public.marketplace_companydeliverycontact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_companydeliverycontact_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_companydeliverycontact_id_seq OWNED BY public.marketplace_companydeliverycontact.id;

CREATE TABLE public.marketplace_coupon (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    revoked_at timestamp with time zone,
    code character varying(25) NOT NULL,
    discount_percentage double precision NOT NULL,
    created_by_user_id bigint NOT NULL,
    owned_on_behalf_of_company_id bigint,
    owned_by_user_id bigint,
    CONSTRAINT valid_discount_percentage CHECK (((discount_percentage > (0.0)::double precision) AND (discount_percentage < (1.0)::double precision)))
);

ALTER TABLE public.marketplace_coupon OWNER TO base;

CREATE SEQUENCE public.marketplace_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_coupon_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_coupon_id_seq OWNED BY public.marketplace_coupon.id;

CREATE TABLE public.marketplace_marketlistedcrate (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    delisted_at timestamp with time zone,
    currency character varying(3) NOT NULL,
    cmp_last_updated_at timestamp with time zone,
    cmp_pending_in_cooling_fees double precision NOT NULL,
    cmp_pending_in_cooling_fees_price_per_kg double precision NOT NULL,
    cmp_weight_locked_in_payment_pending_orders_in_kg double precision NOT NULL,
    cmp_available_weight_in_kg double precision NOT NULL,
    crate_id bigint NOT NULL
);

ALTER TABLE public.marketplace_marketlistedcrate OWNER TO base;

CREATE SEQUENCE public.marketplace_marketlistedcrate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_marketlistedcrate_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_marketlistedcrate_id_seq OWNED BY public.marketplace_marketlistedcrate.id;

CREATE TABLE public.marketplace_marketlistedcrateprice (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    produce_price_per_kg double precision NOT NULL,
    market_listed_crate_id bigint NOT NULL,
    created_by_user_id bigint NOT NULL
);

ALTER TABLE public.marketplace_marketlistedcrateprice OWNER TO base;

CREATE SEQUENCE public.marketplace_marketlistedcrateprice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_marketlistedcrateprice_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_marketlistedcrateprice_id_seq OWNED BY public.marketplace_marketlistedcrateprice.id;

CREATE TABLE public.marketplace_order (
    id bigint NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    currency character varying(3) NOT NULL,
    paystack_split_code character varying(16),
    paid_at timestamp with time zone,
    amount_paid double precision NOT NULL,
    cmp_last_updated_at timestamp with time zone,
    cmp_total_produce_amount double precision NOT NULL,
    cmp_total_cooling_fees_amount double precision NOT NULL,
    cmp_total_coldtivate_amount double precision NOT NULL,
    cmp_total_discount_amount double precision NOT NULL,
    cmp_total_payment_fees_amount double precision NOT NULL,
    cmp_total_amount double precision NOT NULL,
    created_by_user_id bigint NOT NULL,
    owned_on_behalf_of_company_id bigint,
    payment_references character varying(12)[] NOT NULL,
    status_changed_at timestamp with time zone NOT NULL
);

ALTER TABLE public.marketplace_order OWNER TO base;

CREATE SEQUENCE public.marketplace_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_order_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_order_id_seq OWNED BY public.marketplace_order.id;

CREATE TABLE public.marketplace_ordercrateitem (
    id bigint NOT NULL,
    ordered_entire_crate boolean NOT NULL,
    ordered_produce_weight double precision NOT NULL,
    frozen_crate_available_weight double precision NOT NULL,
    frozen_produce_price_per_kg double precision NOT NULL,
    cmp_last_updated_at timestamp with time zone,
    cmp_produce_amount double precision NOT NULL,
    cmp_cooling_fees_amount double precision NOT NULL,
    cmp_discount_amount double precision NOT NULL,
    cmp_total_amount double precision NOT NULL,
    coupon_id bigint,
    market_listed_crate_id bigint NOT NULL,
    order_id bigint NOT NULL
);

ALTER TABLE public.marketplace_ordercrateitem OWNER TO base;

CREATE SEQUENCE public.marketplace_ordercrateitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_ordercrateitem_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_ordercrateitem_id_seq OWNED BY public.marketplace_ordercrateitem.id;

CREATE TABLE public.marketplace_ordercrateitem_resulting_crates (
    id bigint NOT NULL,
    ordercrateitem_id bigint NOT NULL,
    crate_id bigint NOT NULL
);

ALTER TABLE public.marketplace_ordercrateitem_resulting_crates OWNER TO base;

CREATE SEQUENCE public.marketplace_ordercrateitem_resulting_crates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_ordercrateitem_resulting_crates_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_ordercrateitem_resulting_crates_id_seq OWNED BY public.marketplace_ordercrateitem_resulting_crates.id;

CREATE TABLE public.marketplace_orderpickupdetails (
    id bigint NOT NULL,
    pickup_method character varying(16) NOT NULL,
    cooling_unit_id bigint NOT NULL,
    order_id bigint NOT NULL
);

ALTER TABLE public.marketplace_orderpickupdetails OWNER TO base;

CREATE SEQUENCE public.marketplace_orderpickupdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_orderpickupdetails_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_orderpickupdetails_id_seq OWNED BY public.marketplace_orderpickupdetails.id;

CREATE TABLE public.marketplace_paystackaccount (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_default_account boolean NOT NULL,
    account_type smallint NOT NULL,
    bank_code character varying(9) NOT NULL,
    country_code character varying(2) NOT NULL,
    account_number character varying(30) NOT NULL,
    account_name character varying(100) NOT NULL,
    paystack_subaccount_code character varying(20) NOT NULL,
    owned_on_behalf_of_company_id bigint,
    created_by_user_id bigint NOT NULL,
    owned_by_user_id bigint NOT NULL
);

ALTER TABLE public.marketplace_paystackaccount OWNER TO base;

CREATE SEQUENCE public.marketplace_paystackaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.marketplace_paystackaccount_id_seq OWNER TO base;

ALTER SEQUENCE public.marketplace_paystackaccount_id_seq OWNED BY public.marketplace_paystackaccount.id;

CREATE TABLE public.operation_checkin (
    id bigint NOT NULL,
    movement_id bigint NOT NULL,
    owned_by_user_id bigint NOT NULL,
    owned_on_behalf_of_company_id bigint
);

ALTER TABLE public.operation_checkin OWNER TO base;

CREATE SEQUENCE public.operation_checkin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.operation_checkin_id_seq OWNER TO base;

ALTER SEQUENCE public.operation_checkin_id_seq OWNED BY public.operation_checkin.id;

CREATE TABLE public.operation_checkout (
    id bigint NOT NULL,
    cmp_total_cooling_fees_amount double precision NOT NULL,
    paid boolean NOT NULL,
    movement_id bigint NOT NULL,
    cmp_total_amount double precision NOT NULL,
    discount_amount double precision NOT NULL,
    currency character varying(3),
    cmp_last_updated_at timestamp with time zone,
    payment_gateway character varying(20),
    payment_method character varying(20),
    payment_through character varying(20)
);

ALTER TABLE public.operation_checkout OWNER TO base;

CREATE SEQUENCE public.operation_checkout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.operation_checkout_id_seq OWNER TO base;

ALTER SEQUENCE public.operation_checkout_id_seq OWNED BY public.operation_checkout.id;

CREATE TABLE public.operation_marketsurvey (
    id bigint NOT NULL,
    selling_place character varying(255) NOT NULL,
    price double precision NOT NULL,
    currency character varying(3),
    selling_unit character varying(32),
    checkout_id bigint NOT NULL,
    crop_id bigint,
    loss integer,
    selling_date timestamp with time zone,
    date_filled_in timestamp with time zone,
    market_id bigint,
    kg_in_unit integer,
    reason_for_loss character varying(255),
    CONSTRAINT operation_marketsurvey_kg_in_unit_check CHECK ((kg_in_unit >= 0)),
    CONSTRAINT operation_marketsurvey_loss_b13623be_check CHECK ((loss >= 0))
);

ALTER TABLE public.operation_marketsurvey OWNER TO base;

CREATE TABLE public.operation_marketsurvey_checkout (
    id bigint NOT NULL,
    checkout_id bigint NOT NULL,
    marketsurvey_id bigint NOT NULL
);

ALTER TABLE public.operation_marketsurvey_checkout OWNER TO base;

CREATE SEQUENCE public.operation_marketsurvey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.operation_marketsurvey_id_seq OWNER TO base;

ALTER SEQUENCE public.operation_marketsurvey_id_seq OWNED BY public.operation_marketsurvey.id;

CREATE SEQUENCE public.operation_marketsurveycheckout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.operation_marketsurveycheckout_id_seq OWNER TO base;

ALTER SEQUENCE public.operation_marketsurveycheckout_id_seq OWNED BY public.operation_marketsurvey_checkout.id;

CREATE TABLE public.operation_marketsurveypreprocessing (
    id bigint NOT NULL,
    checkout_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    checkout_id bigint,
    crop_id bigint,
    farmer_id bigint,
    operator_id bigint,
    is_active boolean NOT NULL
);

ALTER TABLE public.operation_marketsurveypreprocessing OWNER TO base;

CREATE SEQUENCE public.operation_marketsurveypreprocessing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.operation_marketsurveypreprocessing_id_seq OWNER TO base;

ALTER SEQUENCE public.operation_marketsurveypreprocessing_id_seq OWNED BY public.operation_marketsurveypreprocessing.id;

CREATE TABLE public.operation_movement (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    code character varying(255) NOT NULL,
    operator_id bigint,
    used_for_checkin boolean NOT NULL,
    initiated_for character varying(2) NOT NULL,
    order_id bigint
);

ALTER TABLE public.operation_movement OWNER TO base;

CREATE SEQUENCE public.operation_movement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.operation_movement_id_seq OWNER TO base;

ALTER SEQUENCE public.operation_movement_id_seq OWNED BY public.operation_movement.id;

CREATE TABLE public.prediction_market (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    district character varying(255) NOT NULL,
    used_for_predictions boolean NOT NULL,
    added_by_user boolean NOT NULL,
    state_id bigint NOT NULL
);

ALTER TABLE public.prediction_market OWNER TO base;

CREATE SEQUENCE public.prediction_market_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.prediction_market_id_seq OWNER TO base;

ALTER SEQUENCE public.prediction_market_id_seq OWNED BY public.prediction_market.id;

CREATE TABLE public.prediction_mlmarketdataindia (
    id bigint NOT NULL,
    date date NOT NULL,
    state_label integer NOT NULL,
    district_label integer NOT NULL,
    market_label integer NOT NULL,
    commodity_label integer NOT NULL,
    arrivals_metric_tons double precision NOT NULL,
    modal_price_rs_per_quintal double precision NOT NULL,
    last_price_1d double precision NOT NULL,
    last_price_2d double precision NOT NULL,
    last_price_3d double precision NOT NULL,
    last_price_4d double precision NOT NULL,
    last_price_5d double precision NOT NULL,
    last_price_6d double precision NOT NULL,
    last_price_7d double precision NOT NULL,
    week integer NOT NULL,
    day integer NOT NULL,
    month integer NOT NULL,
    usd_to_inr double precision NOT NULL,
    brent_oil_price double precision NOT NULL,
    state_rollup double precision NOT NULL,
    district_rollup double precision NOT NULL,
    availability double precision NOT NULL,
    price_available boolean NOT NULL,
    price_available_1d boolean NOT NULL,
    price_available_2d boolean NOT NULL,
    price_available_3d boolean NOT NULL,
    price_available_4d boolean NOT NULL,
    price_available_5d boolean NOT NULL,
    price_available_6d boolean NOT NULL,
    price_available_7d boolean NOT NULL,
    usd_to_inr_1d double precision NOT NULL,
    usd_to_inr_2d double precision NOT NULL,
    usd_to_inr_3d double precision NOT NULL,
    usd_to_inr_4d double precision NOT NULL,
    usd_to_inr_5d double precision NOT NULL,
    usd_to_inr_6d double precision NOT NULL,
    usd_to_inr_7d double precision NOT NULL,
    usd_to_inr_8d double precision NOT NULL,
    usd_to_inr_9d double precision NOT NULL,
    usd_to_inr_10d double precision NOT NULL,
    usd_to_inr_11d double precision NOT NULL,
    usd_to_inr_12d double precision NOT NULL,
    usd_to_inr_13d double precision NOT NULL,
    usd_to_inr_14d double precision NOT NULL,
    usd_to_inr_lag double precision NOT NULL,
    brent_oil_price_1d double precision NOT NULL,
    brent_oil_price_2d double precision NOT NULL,
    brent_oil_price_3d double precision NOT NULL,
    brent_oil_price_4d double precision NOT NULL,
    brent_oil_price_5d double precision NOT NULL,
    brent_oil_price_6d double precision NOT NULL,
    brent_oil_price_7d double precision NOT NULL,
    brent_oil_price_8d double precision NOT NULL,
    brent_oil_price_9d double precision NOT NULL,
    brent_oil_price_10d double precision NOT NULL,
    brent_oil_price_11d double precision NOT NULL,
    brent_oil_price_12d double precision NOT NULL,
    brent_oil_price_13d double precision NOT NULL,
    brent_oil_price_14d double precision NOT NULL,
    brent_oil_price_lag double precision NOT NULL,
    availability_bit double precision NOT NULL,
    crop_id bigint NOT NULL,
    market_id bigint NOT NULL
);

ALTER TABLE public.prediction_mlmarketdataindia OWNER TO base;

CREATE SEQUENCE public.prediction_mlmarketdataindia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.prediction_mlmarketdataindia_id_seq OWNER TO base;

ALTER SEQUENCE public.prediction_mlmarketdataindia_id_seq OWNED BY public.prediction_mlmarketdataindia.id;

CREATE TABLE public.prediction_mlmarketdatanigeria (
    id bigint NOT NULL,
    date date NOT NULL,
    state_label integer NOT NULL,
    commodity_label integer NOT NULL,
    price double precision NOT NULL,
    last_price_1m double precision NOT NULL,
    last_price_2m double precision NOT NULL,
    last_price_3m double precision NOT NULL,
    last_price_4m double precision NOT NULL,
    last_price_5m double precision NOT NULL,
    usd_to_ngn double precision NOT NULL,
    state_rollup double precision NOT NULL,
    cpi double precision NOT NULL,
    crop_id bigint NOT NULL,
    state_id bigint NOT NULL
);

ALTER TABLE public.prediction_mlmarketdatanigeria OWNER TO base;

CREATE SEQUENCE public.prediction_mlmarketdatanigeria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.prediction_mlmarketdatanigeria_id_seq OWNER TO base;

ALTER SEQUENCE public.prediction_mlmarketdatanigeria_id_seq OWNED BY public.prediction_mlmarketdatanigeria.id;

CREATE TABLE public.prediction_mlpredictiondata (
    id bigint NOT NULL,
    fetched_at timestamp with time zone NOT NULL,
    reference_date date NOT NULL,
    price_forecast_1 double precision,
    price_forecast_2 double precision,
    price_forecast_3 double precision,
    price_forecast_4 double precision,
    price_forecast_5 double precision,
    price_forecast_6 double precision,
    price_forecast_7 double precision,
    price_forecast_8 double precision,
    price_forecast_9 double precision,
    price_forecast_10 double precision,
    price_forecast_11 double precision,
    price_forecast_12 double precision,
    price_forecast_13 double precision,
    price_forecast_14 double precision,
    only_interpolated_data character varying(255) NOT NULL,
    crop_id bigint NOT NULL,
    market_id bigint NOT NULL
);

ALTER TABLE public.prediction_mlpredictiondata OWNER TO base;

CREATE SEQUENCE public.prediction_mlpredictiondata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.prediction_mlpredictiondata_id_seq OWNER TO base;

ALTER SEQUENCE public.prediction_mlpredictiondata_id_seq OWNED BY public.prediction_mlpredictiondata.id;

CREATE TABLE public.prediction_mlpredictiondatang (
    id bigint NOT NULL,
    fetched_at timestamp with time zone NOT NULL,
    reference_date date NOT NULL,
    price_forecast_1 double precision,
    price_forecast_2 double precision,
    price_forecast_3 double precision,
    price_forecast_4 double precision,
    price_forecast_5 double precision,
    price_forecast_6 double precision,
    price_forecast_7 double precision,
    price_forecast_8 double precision,
    only_interpolated_data character varying(255) NOT NULL,
    crop_id bigint NOT NULL,
    state_id bigint NOT NULL
);

ALTER TABLE public.prediction_mlpredictiondatang OWNER TO base;

CREATE SEQUENCE public.prediction_mlpredictiondatang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.prediction_mlpredictiondatang_id_seq OWNER TO base;

ALTER SEQUENCE public.prediction_mlpredictiondatang_id_seq OWNED BY public.prediction_mlpredictiondatang.id;

CREATE TABLE public.prediction_state (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    added_by_user boolean NOT NULL,
    country_id bigint NOT NULL
);

ALTER TABLE public.prediction_state OWNER TO base;

CREATE SEQUENCE public.prediction_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.prediction_state_id_seq OWNER TO base;

ALTER SEQUENCE public.prediction_state_id_seq OWNED BY public.prediction_state.id;

CREATE TABLE public.prediction_stateng (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    added_by_user boolean NOT NULL,
    country_id bigint NOT NULL
);

ALTER TABLE public.prediction_stateng OWNER TO base;

CREATE SEQUENCE public.prediction_stateng_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.prediction_stateng_id_seq OWNER TO base;

ALTER SEQUENCE public.prediction_stateng_id_seq OWNED BY public.prediction_stateng.id;

CREATE TABLE public.storage_coolingunit (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    capacity_in_metric_tons double precision,
    capacity_in_number_crates integer,
    metric character varying(32) NOT NULL,
    sensor boolean NOT NULL,
    cooling_unit_type character varying(32),
    time_pickup_to_customer double precision NOT NULL,
    crate_length double precision NOT NULL,
    crate_width double precision NOT NULL,
    crate_height double precision NOT NULL,
    crate_weight double precision NOT NULL,
    location_id bigint NOT NULL,
    deleted boolean NOT NULL,
    food_capacity_in_metric_tons double precision,
    date_creation timestamp with time zone,
    date_last_modified timestamp with time zone,
    occupancy double precision,
    occupancy_modified_date timestamp with time zone,
    public boolean NOT NULL,
    room_height double precision,
    room_length double precision,
    room_weight double precision,
    room_width double precision,
    editable_checkins boolean NOT NULL,
    CONSTRAINT storage_coolingunit_capacity_in_number_crates_28ac8a59_check CHECK ((capacity_in_number_crates >= 0))
);

ALTER TABLE public.storage_coolingunit OWNER TO base;

CREATE TABLE public.storage_coolingunit_date_operator_assigned (
    id bigint NOT NULL,
    coolingunit_id bigint NOT NULL,
    operatorassignedcoolingunit_id bigint NOT NULL
);

ALTER TABLE public.storage_coolingunit_date_operator_assigned OWNER TO base;

CREATE SEQUENCE public.storage_coolingunit_date_operator_assigned_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_coolingunit_date_operator_assigned_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_coolingunit_date_operator_assigned_id_seq OWNED BY public.storage_coolingunit_date_operator_assigned.id;

CREATE SEQUENCE public.storage_coolingunit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_coolingunit_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_coolingunit_id_seq OWNED BY public.storage_coolingunit.id;

CREATE TABLE public.storage_coolingunit_operators (
    id bigint NOT NULL,
    coolingunit_id bigint NOT NULL,
    user_id bigint NOT NULL
);

ALTER TABLE public.storage_coolingunit_operators OWNER TO base;

CREATE SEQUENCE public.storage_coolingunit_operators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_coolingunit_operators_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_coolingunit_operators_id_seq OWNED BY public.storage_coolingunit_operators.id;

CREATE TABLE public.storage_pricing (
    id bigint NOT NULL,
    pricing_type character varying(32) NOT NULL,
    fixed_rate double precision NOT NULL,
    daily_rate double precision NOT NULL
);

ALTER TABLE public.storage_pricing OWNER TO base;

CREATE SEQUENCE public.storage_pricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_pricing_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_pricing_id_seq OWNED BY public.storage_pricing.id;

CREATE TABLE public.storage_coolingunitcrop (
    id bigint NOT NULL,
    active boolean NOT NULL,
    cooling_unit_id bigint,
    crop_id bigint,
    pricing_id bigint DEFAULT nextval('public.storage_pricing_id_seq'::regclass)
);

ALTER TABLE public.storage_coolingunitcrop OWNER TO base;

CREATE SEQUENCE public.storage_coolingunitcrop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_coolingunitcrop_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_coolingunitcrop_id_seq OWNED BY public.storage_coolingunitcrop.id;

CREATE TABLE public.storage_coolingunitpower (
    id bigint NOT NULL,
    power_consumption_in_mt double precision,
    daily_room_wattage double precision,
    power_source_diesel_percent double precision,
    power_source_grid_percent double precision,
    power_source_pv_percent double precision,
    power_source_biomass_percent double precision,
    power_source_diesel_consumption_kwh integer,
    pv_panel_count integer,
    pv_panel_size integer,
    pv_panel_weight double precision,
    pv_panel_max_power double precision,
    battery_count integer,
    battery_capacity double precision,
    battery_max_current double precision,
    battery_peak_energy_storage double precision,
    refrigerant_type character varying(32) NOT NULL,
    power_source character varying(32) NOT NULL,
    electricity_storage_system character varying(32) NOT NULL,
    thermal_storage_method character varying(32) NOT NULL,
    cooling_unit_id bigint,
    amount_refrigerant double precision,
    battery_weight integer,
    room_insulator double precision,
    battery_type character varying(255),
    pv_panel_type character varying(255)
);

ALTER TABLE public.storage_coolingunitpower OWNER TO base;

CREATE SEQUENCE public.storage_coolingunitpower_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_coolingunitpower_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_coolingunitpower_id_seq OWNED BY public.storage_coolingunitpower.id;

CREATE TABLE public.storage_coolingunitspecifications (
    id bigint NOT NULL,
    value character varying(32) NOT NULL,
    specification_type character varying(32) NOT NULL,
    datetime_stamp timestamp with time zone NOT NULL,
    cooling_unit_id bigint,
    set_point_value character varying(32)
);

ALTER TABLE public.storage_coolingunitspecifications OWNER TO base;

CREATE SEQUENCE public.storage_coolingunitspecifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_coolingunitspecifications_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_coolingunitspecifications_id_seq OWNED BY public.storage_coolingunitspecifications.id;

CREATE TABLE public.storage_crate (
    id bigint NOT NULL,
    weight double precision NOT NULL,
    remaining_shelf_life integer,
    quality_dt double precision NOT NULL,
    temperature_dt double precision NOT NULL,
    modified_dt timestamp with time zone,
    planned_days integer,
    price_per_crate_per_pricing_type double precision NOT NULL,
    cooling_unit_id bigint,
    produce_id bigint,
    run_dt boolean,
    currency character varying(3),
    tag character varying(255),
    cmp_fully_checked_out boolean NOT NULL,
    initial_weight double precision NOT NULL,
    cmp_last_updated_at timestamp with time zone,
    cmp_total_due_in_cooling_fees double precision NOT NULL,
    cmp_total_in_cooling_fees double precision NOT NULL,
    cmp_total_paid_in_cooling_fees double precision NOT NULL,
    CONSTRAINT storage_crate_planned_days_check CHECK ((planned_days >= 0))
);

ALTER TABLE public.storage_crate OWNER TO base;

CREATE SEQUENCE public.storage_crate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_crate_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_crate_id_seq OWNED BY public.storage_crate.id;

CREATE TABLE public.storage_cratepartialcheckout (
    id bigint NOT NULL,
    percentage double precision NOT NULL,
    weight_in_kg integer NOT NULL,
    cooling_fees double precision NOT NULL,
    checkout_id bigint NOT NULL,
    crate_id bigint NOT NULL,
    CONSTRAINT checkout_crate_percentage_check CHECK (((percentage >= (0.0)::double precision) AND (percentage <= (1.0)::double precision))),
    CONSTRAINT storage_cratepartialcheckout_weight_in_kg_check CHECK ((weight_in_kg >= 0))
);

ALTER TABLE public.storage_cratepartialcheckout OWNER TO base;

CREATE SEQUENCE public.storage_cratepartialcheckout_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_cratepartialcheckout_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_cratepartialcheckout_id_seq OWNED BY public.storage_cratepartialcheckout.id;

CREATE TABLE public.storage_crop (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(100),
    optimal_storage_temperature character varying(255),
    approximate_shelf_life character varying(255),
    harvested_today smallint,
    harvested_yesterday smallint,
    harvested_day_before_yesterday smallint,
    harvested_before smallint,
    size_selection_1 character varying(255),
    size_selection_2 character varying(255),
    size_selection_3 character varying(255),
    digital_twin_identifier character varying(255),
    crop_type_id bigint NOT NULL,
    activation_energy_constant double precision,
    dependent_constant double precision,
    CONSTRAINT storage_crop_harvested_before_check CHECK ((harvested_before >= 0)),
    CONSTRAINT storage_crop_harvested_day_before_yesterday_check CHECK ((harvested_day_before_yesterday >= 0)),
    CONSTRAINT storage_crop_harvested_today_check CHECK ((harvested_today >= 0)),
    CONSTRAINT storage_crop_harvested_yesterday_check CHECK ((harvested_yesterday >= 0))
);

ALTER TABLE public.storage_crop OWNER TO base;

CREATE SEQUENCE public.storage_crop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_crop_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_crop_id_seq OWNED BY public.storage_crop.id;

CREATE TABLE public.storage_croptype (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);

ALTER TABLE public.storage_croptype OWNER TO base;

CREATE SEQUENCE public.storage_croptype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_croptype_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_croptype_id_seq OWNED BY public.storage_croptype.id;

CREATE TABLE public.storage_location (
    id bigint NOT NULL,
    name character varying(255),
    state character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    street character varying(255) NOT NULL,
    street_number integer,
    zip_code character varying(255) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    company_id bigint,
    deleted boolean NOT NULL,
    date_creation timestamp with time zone,
    date_last_modified timestamp with time zone
);

ALTER TABLE public.storage_location OWNER TO base;

CREATE SEQUENCE public.storage_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_location_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_location_id_seq OWNED BY public.storage_location.id;

CREATE TABLE public.storage_operatorassignedcoolingunit (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    operator_id bigint NOT NULL
);

ALTER TABLE public.storage_operatorassignedcoolingunit OWNER TO base;

CREATE SEQUENCE public.storage_operatorassignedcoolingunit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_operatorassignedcoolingunit_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_operatorassignedcoolingunit_id_seq OWNED BY public.storage_operatorassignedcoolingunit.id;

CREATE TABLE public.storage_produce (
    id bigint NOT NULL,
    harvest_date integer,
    initial_grade integer,
    size integer,
    cmp_checkout_completed boolean NOT NULL,
    checkin_id bigint,
    crop_id bigint,
    picture character varying(100),
    additional_info character varying(255),
    cmp_last_updated_at timestamp with time zone
);

ALTER TABLE public.storage_produce OWNER TO base;

CREATE SEQUENCE public.storage_produce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_produce_id_seq OWNER TO base;

ALTER SEQUENCE public.storage_produce_id_seq OWNED BY public.storage_produce.id;

CREATE SEQUENCE public.storage_sensorusermodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.storage_sensorusermodel_id_seq OWNER TO base;

CREATE TABLE public.storage_sensorusermodel (
    id bigint DEFAULT nextval('public.storage_sensorusermodel_id_seq'::regclass) NOT NULL,
    machine_id character varying(32),
    username character varying(150),
    access_token character varying(800),
    cooling_unit_id bigint,
    date_sensor_first_linked timestamp with time zone,
    date_sensor_modified timestamp with time zone,
    password bytea NOT NULL,
    type character varying(32),
    account_key character varying(150),
    channel_id character varying(150),
    field character varying(150)
);

ALTER TABLE public.storage_sensorusermodel OWNER TO base;

CREATE TABLE public.user_bankaccount (
    id bigint NOT NULL,
    account_name character varying(64) NOT NULL,
    account_number character varying(64) NOT NULL,
    bank_name character varying(64) NOT NULL
);

ALTER TABLE public.user_bankaccount OWNER TO base;

CREATE SEQUENCE public.user_bankaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_bankaccount_id_seq OWNER TO base;

ALTER SEQUENCE public.user_bankaccount_id_seq OWNED BY public.user_bankaccount.id;

CREATE TABLE public.user_company (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    country character varying(2),
    logo character varying(100),
    currency character varying(3),
    digital_twin boolean NOT NULL,
    "ML4_market" boolean NOT NULL,
    "ML4_quality" boolean NOT NULL,
    "ML4_farmers" boolean NOT NULL,
    date_joined timestamp with time zone,
    bank_account_id bigint,
    flag_opt_out_from_marketplace_filter boolean NOT NULL
);

ALTER TABLE public.user_company OWNER TO base;

CREATE TABLE public.user_company_crop (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    crop_id bigint NOT NULL
);

ALTER TABLE public.user_company_crop OWNER TO base;

CREATE SEQUENCE public.user_company_crop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_company_crop_id_seq OWNER TO base;

ALTER SEQUENCE public.user_company_crop_id_seq OWNED BY public.user_company_crop.id;

CREATE SEQUENCE public.user_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_company_id_seq OWNER TO base;

ALTER SEQUENCE public.user_company_id_seq OWNED BY public.user_company.id;

CREATE TABLE public.user_country (
    id bigint NOT NULL,
    country character varying(2)
);

ALTER TABLE public.user_country OWNER TO base;

CREATE TABLE public.user_country_crop (
    id bigint NOT NULL,
    country_id bigint NOT NULL,
    crop_id bigint NOT NULL
);

ALTER TABLE public.user_country_crop OWNER TO base;

CREATE SEQUENCE public.user_country_crop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_country_crop_id_seq OWNER TO base;

ALTER SEQUENCE public.user_country_crop_id_seq OWNED BY public.user_country_crop.id;

CREATE SEQUENCE public.user_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_country_id_seq OWNER TO base;

ALTER SEQUENCE public.user_country_id_seq OWNED BY public.user_country.id;

CREATE TABLE public.user_farmer (
    id bigint NOT NULL,
    birthday timestamp with time zone,
    parent_name character varying(255) NOT NULL,
    is_unknown boolean NOT NULL,
    created_by_id bigint,
    user_id bigint NOT NULL,
    smartphone boolean NOT NULL,
    country character varying(150),
    user_code character varying(8)
);

ALTER TABLE public.user_farmer OWNER TO base;

CREATE TABLE public.user_farmer_companies (
    id bigint NOT NULL,
    farmer_id bigint NOT NULL,
    company_id bigint NOT NULL
);

ALTER TABLE public.user_farmer_companies OWNER TO base;

CREATE SEQUENCE public.user_farmer_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_farmer_companies_id_seq OWNER TO base;

ALTER SEQUENCE public.user_farmer_companies_id_seq OWNED BY public.user_farmer_companies.id;

CREATE TABLE public.user_farmer_cooling_units (
    id bigint NOT NULL,
    farmer_id bigint NOT NULL,
    coolingunit_id bigint NOT NULL
);

ALTER TABLE public.user_farmer_cooling_units OWNER TO base;

CREATE SEQUENCE public.user_farmer_cooling_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_farmer_cooling_units_id_seq OWNER TO base;

ALTER SEQUENCE public.user_farmer_cooling_units_id_seq OWNED BY public.user_farmer_cooling_units.id;

CREATE SEQUENCE public.user_farmer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_farmer_id_seq OWNER TO base;

ALTER SEQUENCE public.user_farmer_id_seq OWNED BY public.user_farmer.id;

CREATE TABLE public.user_farmersurvey (
    id bigint NOT NULL,
    user_type character varying(32),
    experience boolean,
    experience_duration smallint,
    farmer_id bigint,
    date_filled_in timestamp with time zone,
    date_last_modified timestamp with time zone,
    CONSTRAINT user_farmersurvey_experience_duration_check CHECK ((experience_duration >= 0))
);

ALTER TABLE public.user_farmersurvey OWNER TO base;

CREATE SEQUENCE public.user_farmersurvey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_farmersurvey_id_seq OWNER TO base;

ALTER SEQUENCE public.user_farmersurvey_id_seq OWNED BY public.user_farmersurvey.id;

CREATE TABLE public.user_farmersurveycommodity (
    id bigint NOT NULL,
    average_price smallint,
    crop_id bigint,
    farmer_survey_id bigint,
    unit character varying(32),
    average_season_in_months integer,
    quantity_below_market_price double precision,
    quantity_self_consumed double precision,
    quantity_sold double precision,
    quantity_total double precision,
    currency character varying(3),
    date_filled_in timestamp with time zone,
    date_last_modified timestamp with time zone,
    kg_in_unit integer,
    reason_for_loss character varying(255),
    CONSTRAINT user_farmersurveycommodity_average_price_check CHECK ((average_price >= 0)),
    CONSTRAINT user_farmersurveycommodity_average_season_in_months_check CHECK ((average_season_in_months >= 0)),
    CONSTRAINT user_farmersurveycommodity_kg_in_unit_check CHECK ((kg_in_unit >= 0))
);

ALTER TABLE public.user_farmersurveycommodity OWNER TO base;

CREATE SEQUENCE public.user_farmersurveycommodity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_farmersurveycommodity_id_seq OWNER TO base;

ALTER SEQUENCE public.user_farmersurveycommodity_id_seq OWNED BY public.user_farmersurveycommodity.id;

CREATE TABLE public.user_genericusercode (
    id bigint NOT NULL,
    type character varying(32),
    code character varying(64) NOT NULL,
    expiration_date timestamp with time zone,
    user_id bigint NOT NULL
);

ALTER TABLE public.user_genericusercode OWNER TO base;

CREATE SEQUENCE public.user_genericusercode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_genericusercode_id_seq OWNER TO base;

ALTER SEQUENCE public.user_genericusercode_id_seq OWNED BY public.user_genericusercode.id;

CREATE TABLE public.user_invitationuser (
    id bigint NOT NULL,
    user_type smallint NOT NULL,
    phone character varying(128) NOT NULL,
    expiration_date timestamp with time zone NOT NULL,
    code character varying(64) NOT NULL,
    sender_id bigint,
    date_invitation_sent timestamp with time zone,
    CONSTRAINT user_invitationuser_user_type_check CHECK ((user_type >= 0))
);

ALTER TABLE public.user_invitationuser OWNER TO base;

CREATE TABLE public.user_invitationuser_cooling_units (
    id bigint NOT NULL,
    invitationuser_id bigint NOT NULL,
    coolingunit_id bigint NOT NULL
);

ALTER TABLE public.user_invitationuser_cooling_units OWNER TO base;

CREATE SEQUENCE public.user_invitationuser_cooling_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_invitationuser_cooling_units_id_seq OWNER TO base;

ALTER SEQUENCE public.user_invitationuser_cooling_units_id_seq OWNED BY public.user_invitationuser_cooling_units.id;

CREATE SEQUENCE public.user_invitationuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_invitationuser_id_seq OWNER TO base;

ALTER SEQUENCE public.user_invitationuser_id_seq OWNED BY public.user_invitationuser.id;

CREATE TABLE public.user_notification (
    id bigint NOT NULL,
    seen boolean NOT NULL,
    date timestamp with time zone NOT NULL,
    specific_id integer,
    event_type character varying(32) NOT NULL,
    user_id bigint NOT NULL
);

ALTER TABLE public.user_notification OWNER TO base;

CREATE SEQUENCE public.user_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_notification_id_seq OWNER TO base;

ALTER SEQUENCE public.user_notification_id_seq OWNED BY public.user_notification.id;

CREATE TABLE public.user_operator (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    user_id bigint NOT NULL
);

ALTER TABLE public.user_operator OWNER TO base;

CREATE SEQUENCE public.user_operator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_operator_id_seq OWNER TO base;

ALTER SEQUENCE public.user_operator_id_seq OWNED BY public.user_operator.id;

CREATE TABLE public.user_serviceprovider (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    user_id bigint NOT NULL
);

ALTER TABLE public.user_serviceprovider OWNER TO base;

CREATE SEQUENCE public.user_serviceprovider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_serviceprovider_id_seq OWNER TO base;

ALTER SEQUENCE public.user_serviceprovider_id_seq OWNED BY public.user_serviceprovider.id;

CREATE TABLE public.user_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(254),
    phone character varying(128),
    gender character varying(2),
    last_login timestamp with time zone,
    language character varying(2),
    is_email_public boolean NOT NULL,
    is_phone_public boolean NOT NULL
);

ALTER TABLE public.user_user OWNER TO base;

CREATE TABLE public.user_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);

ALTER TABLE public.user_user_groups OWNER TO base;

CREATE SEQUENCE public.user_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_user_groups_id_seq OWNER TO base;

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_user_id_seq OWNER TO base;

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;

CREATE TABLE public.user_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);

ALTER TABLE public.user_user_user_permissions OWNER TO base;

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNER TO base;

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);

ALTER TABLE ONLY public.cooling_unit_metrics ALTER COLUMN id SET DEFAULT nextval('public.cooling_unit_metrics_id_seq'::regclass);

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);

ALTER TABLE ONLY public.farmer_metrics ALTER COLUMN id SET DEFAULT nextval('public.farmer_metrics_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_companydeliverycontact ALTER COLUMN id SET DEFAULT nextval('public.marketplace_companydeliverycontact_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_coupon ALTER COLUMN id SET DEFAULT nextval('public.marketplace_coupon_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_marketlistedcrate ALTER COLUMN id SET DEFAULT nextval('public.marketplace_marketlistedcrate_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_marketlistedcrateprice ALTER COLUMN id SET DEFAULT nextval('public.marketplace_marketlistedcrateprice_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_order ALTER COLUMN id SET DEFAULT nextval('public.marketplace_order_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_ordercrateitem ALTER COLUMN id SET DEFAULT nextval('public.marketplace_ordercrateitem_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_ordercrateitem_resulting_crates ALTER COLUMN id SET DEFAULT nextval('public.marketplace_ordercrateitem_resulting_crates_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_orderpickupdetails ALTER COLUMN id SET DEFAULT nextval('public.marketplace_orderpickupdetails_id_seq'::regclass);

ALTER TABLE ONLY public.marketplace_paystackaccount ALTER COLUMN id SET DEFAULT nextval('public.marketplace_paystackaccount_id_seq'::regclass);

ALTER TABLE ONLY public.operation_checkin ALTER COLUMN id SET DEFAULT nextval('public.operation_checkin_id_seq'::regclass);

ALTER TABLE ONLY public.operation_checkout ALTER COLUMN id SET DEFAULT nextval('public.operation_checkout_id_seq'::regclass);

ALTER TABLE ONLY public.operation_marketsurvey ALTER COLUMN id SET DEFAULT nextval('public.operation_marketsurvey_id_seq'::regclass);

ALTER TABLE ONLY public.operation_marketsurvey_checkout ALTER COLUMN id SET DEFAULT nextval('public.operation_marketsurveycheckout_id_seq'::regclass);

ALTER TABLE ONLY public.operation_marketsurveypreprocessing ALTER COLUMN id SET DEFAULT nextval('public.operation_marketsurveypreprocessing_id_seq'::regclass);

ALTER TABLE ONLY public.operation_movement ALTER COLUMN id SET DEFAULT nextval('public.operation_movement_id_seq'::regclass);

ALTER TABLE ONLY public.prediction_market ALTER COLUMN id SET DEFAULT nextval('public.prediction_market_id_seq'::regclass);

ALTER TABLE ONLY public.prediction_mlmarketdataindia ALTER COLUMN id SET DEFAULT nextval('public.prediction_mlmarketdataindia_id_seq'::regclass);

ALTER TABLE ONLY public.prediction_mlmarketdatanigeria ALTER COLUMN id SET DEFAULT nextval('public.prediction_mlmarketdatanigeria_id_seq'::regclass);

ALTER TABLE ONLY public.prediction_mlpredictiondata ALTER COLUMN id SET DEFAULT nextval('public.prediction_mlpredictiondata_id_seq'::regclass);

ALTER TABLE ONLY public.prediction_mlpredictiondatang ALTER COLUMN id SET DEFAULT nextval('public.prediction_mlpredictiondatang_id_seq'::regclass);

ALTER TABLE ONLY public.prediction_state ALTER COLUMN id SET DEFAULT nextval('public.prediction_state_id_seq'::regclass);

ALTER TABLE ONLY public.prediction_stateng ALTER COLUMN id SET DEFAULT nextval('public.prediction_stateng_id_seq'::regclass);

ALTER TABLE ONLY public.storage_coolingunit ALTER COLUMN id SET DEFAULT nextval('public.storage_coolingunit_id_seq'::regclass);

ALTER TABLE ONLY public.storage_coolingunit_date_operator_assigned ALTER COLUMN id SET DEFAULT nextval('public.storage_coolingunit_date_operator_assigned_id_seq'::regclass);

ALTER TABLE ONLY public.storage_coolingunit_operators ALTER COLUMN id SET DEFAULT nextval('public.storage_coolingunit_operators_id_seq'::regclass);

ALTER TABLE ONLY public.storage_coolingunitcrop ALTER COLUMN id SET DEFAULT nextval('public.storage_coolingunitcrop_id_seq'::regclass);

ALTER TABLE ONLY public.storage_coolingunitpower ALTER COLUMN id SET DEFAULT nextval('public.storage_coolingunitpower_id_seq'::regclass);

ALTER TABLE ONLY public.storage_coolingunitspecifications ALTER COLUMN id SET DEFAULT nextval('public.storage_coolingunitspecifications_id_seq'::regclass);

ALTER TABLE ONLY public.storage_crate ALTER COLUMN id SET DEFAULT nextval('public.storage_crate_id_seq'::regclass);

ALTER TABLE ONLY public.storage_cratepartialcheckout ALTER COLUMN id SET DEFAULT nextval('public.storage_cratepartialcheckout_id_seq'::regclass);

ALTER TABLE ONLY public.storage_crop ALTER COLUMN id SET DEFAULT nextval('public.storage_crop_id_seq'::regclass);

ALTER TABLE ONLY public.storage_croptype ALTER COLUMN id SET DEFAULT nextval('public.storage_croptype_id_seq'::regclass);

ALTER TABLE ONLY public.storage_location ALTER COLUMN id SET DEFAULT nextval('public.storage_location_id_seq'::regclass);

ALTER TABLE ONLY public.storage_operatorassignedcoolingunit ALTER COLUMN id SET DEFAULT nextval('public.storage_operatorassignedcoolingunit_id_seq'::regclass);

ALTER TABLE ONLY public.storage_pricing ALTER COLUMN id SET DEFAULT nextval('public.storage_pricing_id_seq'::regclass);

ALTER TABLE ONLY public.storage_produce ALTER COLUMN id SET DEFAULT nextval('public.storage_produce_id_seq'::regclass);

ALTER TABLE ONLY public.user_bankaccount ALTER COLUMN id SET DEFAULT nextval('public.user_bankaccount_id_seq'::regclass);

ALTER TABLE ONLY public.user_company ALTER COLUMN id SET DEFAULT nextval('public.user_company_id_seq'::regclass);

ALTER TABLE ONLY public.user_company_crop ALTER COLUMN id SET DEFAULT nextval('public.user_company_crop_id_seq'::regclass);

ALTER TABLE ONLY public.user_country ALTER COLUMN id SET DEFAULT nextval('public.user_country_id_seq'::regclass);

ALTER TABLE ONLY public.user_country_crop ALTER COLUMN id SET DEFAULT nextval('public.user_country_crop_id_seq'::regclass);

ALTER TABLE ONLY public.user_farmer ALTER COLUMN id SET DEFAULT nextval('public.user_farmer_id_seq'::regclass);

ALTER TABLE ONLY public.user_farmer_companies ALTER COLUMN id SET DEFAULT nextval('public.user_farmer_companies_id_seq'::regclass);

ALTER TABLE ONLY public.user_farmer_cooling_units ALTER COLUMN id SET DEFAULT nextval('public.user_farmer_cooling_units_id_seq'::regclass);

ALTER TABLE ONLY public.user_farmersurvey ALTER COLUMN id SET DEFAULT nextval('public.user_farmersurvey_id_seq'::regclass);

ALTER TABLE ONLY public.user_farmersurveycommodity ALTER COLUMN id SET DEFAULT nextval('public.user_farmersurveycommodity_id_seq'::regclass);

ALTER TABLE ONLY public.user_genericusercode ALTER COLUMN id SET DEFAULT nextval('public.user_genericusercode_id_seq'::regclass);

ALTER TABLE ONLY public.user_invitationuser ALTER COLUMN id SET DEFAULT nextval('public.user_invitationuser_id_seq'::regclass);

ALTER TABLE ONLY public.user_invitationuser_cooling_units ALTER COLUMN id SET DEFAULT nextval('public.user_invitationuser_cooling_units_id_seq'::regclass);

ALTER TABLE ONLY public.user_notification ALTER COLUMN id SET DEFAULT nextval('public.user_notification_id_seq'::regclass);

ALTER TABLE ONLY public.user_operator ALTER COLUMN id SET DEFAULT nextval('public.user_operator_id_seq'::regclass);

ALTER TABLE ONLY public.user_serviceprovider ALTER COLUMN id SET DEFAULT nextval('public.user_serviceprovider_id_seq'::regclass);

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);

COPY public.auth_group (id, name) FROM stdin;
1	ServiceProvider
2	Operator
3	Farmer
\.

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	49
2	1	83
3	1	84
4	1	85
5	1	86
6	1	87
7	1	59
8	2	49
9	2	59
\.

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add crontab	6	add_crontabschedule
22	Can change crontab	6	change_crontabschedule
23	Can delete crontab	6	delete_crontabschedule
24	Can view crontab	6	view_crontabschedule
25	Can add interval	7	add_intervalschedule
26	Can change interval	7	change_intervalschedule
27	Can delete interval	7	delete_intervalschedule
28	Can view interval	7	view_intervalschedule
29	Can add periodic task	8	add_periodictask
30	Can change periodic task	8	change_periodictask
31	Can delete periodic task	8	delete_periodictask
32	Can view periodic task	8	view_periodictask
33	Can add periodic tasks	9	add_periodictasks
34	Can change periodic tasks	9	change_periodictasks
35	Can delete periodic tasks	9	delete_periodictasks
36	Can view periodic tasks	9	view_periodictasks
37	Can add solar event	10	add_solarschedule
38	Can change solar event	10	change_solarschedule
39	Can delete solar event	10	delete_solarschedule
40	Can view solar event	10	view_solarschedule
41	Can add clocked	11	add_clockedschedule
42	Can change clocked	11	change_clockedschedule
43	Can delete clocked	11	delete_clockedschedule
44	Can view clocked	11	view_clockedschedule
45	Can add user	12	add_user
46	Can change user	12	change_user
47	Can delete user	12	delete_user
48	Can view user	12	view_user
49	Can view all users	12	view_all_users
50	Can create a user	12	create_user
51	Can add company	13	add_company
52	Can change company	13	change_company
53	Can delete company	13	delete_company
54	Can view company	13	view_company
55	Can add country	14	add_country
56	Can change country	14	change_country
57	Can delete country	14	delete_country
58	Can view country	14	view_country
59	Can add farmer	15	add_farmer
60	Can change farmer	15	change_farmer
61	Can delete farmer	15	delete_farmer
62	Can view farmer	15	view_farmer
63	Can add farmer survey	16	add_farmersurvey
64	Can change farmer survey	16	change_farmersurvey
65	Can delete farmer survey	16	delete_farmersurvey
66	Can view farmer survey	16	view_farmersurvey
67	Can add service provider	17	add_serviceprovider
68	Can change service provider	17	change_serviceprovider
69	Can delete service provider	17	delete_serviceprovider
70	Can view service provider	17	view_serviceprovider
71	Can add operator	18	add_operator
72	Can change operator	18	change_operator
73	Can delete operator	18	delete_operator
74	Can view operator	18	view_operator
75	Can add notification	19	add_notification
76	Can change notification	19	change_notification
77	Can delete notification	19	delete_notification
78	Can view notification	19	view_notification
79	Can add invitation user	20	add_invitationuser
80	Can change invitation user	20	change_invitationuser
81	Can delete invitation user	20	delete_invitationuser
82	Can view invitation user	20	view_invitationuser
83	Can view all invitations	20	view_all_invitations
84	Can view service provider invitations	20	view_serviceprovider_invitations
85	Can view operator invitations	20	view_operator_invitations
86	Can invite a service provider	20	add_invitation_serviceprovider
87	Can invite an operator	20	add_invitation_operator
88	Can add generic user code	21	add_genericusercode
89	Can change generic user code	21	change_genericusercode
90	Can delete generic user code	21	delete_genericusercode
91	Can view generic user code	21	view_genericusercode
92	Can add farmer survey commodity	22	add_farmersurveycommodity
93	Can change farmer survey commodity	22	change_farmersurveycommodity
94	Can delete farmer survey commodity	22	delete_farmersurveycommodity
95	Can view farmer survey commodity	22	view_farmersurveycommodity
96	Can add cooling unit	23	add_coolingunit
97	Can change cooling unit	23	change_coolingunit
98	Can delete cooling unit	23	delete_coolingunit
99	Can view cooling unit	23	view_coolingunit
100	Can add cooling unit crop	24	add_coolingunitcrop
101	Can change cooling unit crop	24	change_coolingunitcrop
102	Can delete cooling unit crop	24	delete_coolingunitcrop
103	Can view cooling unit crop	24	view_coolingunitcrop
104	Can add cooling unit specifications	25	add_coolingunitspecifications
105	Can change cooling unit specifications	25	change_coolingunitspecifications
106	Can delete cooling unit specifications	25	delete_coolingunitspecifications
107	Can view cooling unit specifications	25	view_coolingunitspecifications
108	Can add crate	26	add_crate
109	Can change crate	26	change_crate
110	Can delete crate	26	delete_crate
111	Can view crate	26	view_crate
112	Can add crop	27	add_crop
113	Can change crop	27	change_crop
114	Can delete crop	27	delete_crop
115	Can view crop	27	view_crop
116	Can add crop type	28	add_croptype
117	Can change crop type	28	change_croptype
118	Can delete crop type	28	delete_croptype
119	Can view crop type	28	view_croptype
120	Can add location	29	add_location
121	Can change location	29	change_location
122	Can delete location	29	delete_location
123	Can view location	29	view_location
124	Can add pricing	30	add_pricing
125	Can change pricing	30	change_pricing
126	Can delete pricing	30	delete_pricing
127	Can view pricing	30	view_pricing
128	Can add produce	31	add_produce
129	Can change produce	31	change_produce
130	Can delete produce	31	delete_produce
131	Can view produce	31	view_produce
132	Can add operator assigned cooling unit	32	add_operatorassignedcoolingunit
133	Can change operator assigned cooling unit	32	change_operatorassignedcoolingunit
134	Can delete operator assigned cooling unit	32	delete_operatorassignedcoolingunit
135	Can view operator assigned cooling unit	32	view_operatorassignedcoolingunit
136	Can add sensor user model	33	add_sensorusermodel
137	Can change sensor user model	33	change_sensorusermodel
138	Can delete sensor user model	33	delete_sensorusermodel
139	Can view sensor user model	33	view_sensorusermodel
140	Can add checkin	34	add_checkin
141	Can change checkin	34	change_checkin
142	Can delete checkin	34	delete_checkin
143	Can view checkin	34	view_checkin
144	Can add checkout	35	add_checkout
145	Can change checkout	35	change_checkout
146	Can delete checkout	35	delete_checkout
147	Can view checkout	35	view_checkout
148	Can add market survey	36	add_marketsurvey
149	Can change market survey	36	change_marketsurvey
150	Can delete market survey	36	delete_marketsurvey
151	Can view market survey	36	view_marketsurvey
152	Can add movement	37	add_movement
153	Can change movement	37	change_movement
154	Can delete movement	37	delete_movement
155	Can view movement	37	view_movement
156	Can add market	38	add_market
157	Can change market	38	change_market
158	Can delete market	38	delete_market
159	Can view market	38	view_market
160	Can add state	39	add_state
161	Can change state	39	change_state
162	Can delete state	39	delete_state
163	Can view state	39	view_state
164	Can add ml prediction data	40	add_mlpredictiondata
165	Can change ml prediction data	40	change_mlpredictiondata
166	Can delete ml prediction data	40	delete_mlpredictiondata
167	Can view ml prediction data	40	view_mlpredictiondata
168	Can add ml market data india	41	add_mlmarketdataindia
169	Can change ml market data india	41	change_mlmarketdataindia
170	Can delete ml market data india	41	delete_mlmarketdataindia
171	Can view ml market data india	41	view_mlmarketdataindia
172	Can add ml market data nigeria	42	add_mlmarketdatanigeria
173	Can change ml market data nigeria	42	change_mlmarketdatanigeria
174	Can delete ml market data nigeria	42	delete_mlmarketdatanigeria
175	Can view ml market data nigeria	42	view_mlmarketdatanigeria
176	Can add ml prediction data ng	43	add_mlpredictiondatang
177	Can change ml prediction data ng	43	change_mlpredictiondatang
178	Can delete ml prediction data ng	43	delete_mlpredictiondatang
179	Can view ml prediction data ng	43	view_mlpredictiondatang
180	Can add state ng	44	add_stateng
181	Can change state ng	44	change_stateng
182	Can delete state ng	44	delete_stateng
183	Can view state ng	44	view_stateng
184	Can add marketsurvey checkout	45	add_marketsurveycheckout
185	Can change marketsurvey checkout	45	change_marketsurveycheckout
186	Can delete marketsurvey checkout	45	delete_marketsurveycheckout
187	Can view marketsurvey checkout	45	view_marketsurveycheckout
188	Can add marketsurvey preprocessing	46	add_marketsurveypreprocessing
189	Can change marketsurvey preprocessing	46	change_marketsurveypreprocessing
190	Can delete marketsurvey preprocessing	46	delete_marketsurveypreprocessing
191	Can view marketsurvey preprocessing	46	view_marketsurveypreprocessing
192	Can add cooling unit power	47	add_coolingunitpower
193	Can change cooling unit power	47	change_coolingunitpower
194	Can delete cooling unit power	47	delete_coolingunitpower
195	Can view cooling unit power	47	view_coolingunitpower
196	Can add bank account	48	add_bankaccount
197	Can change bank account	48	change_bankaccount
198	Can delete bank account	48	delete_bankaccount
199	Can view bank account	48	view_bankaccount
200	Can add crate partial checkout	49	add_cratepartialcheckout
201	Can change crate partial checkout	49	change_cratepartialcheckout
202	Can delete crate partial checkout	49	delete_cratepartialcheckout
203	Can view crate partial checkout	49	view_cratepartialcheckout
204	Can add coupon	50	add_coupon
205	Can change coupon	50	change_coupon
206	Can delete coupon	50	delete_coupon
207	Can view coupon	50	view_coupon
208	Can add market listed crate	51	add_marketlistedcrate
209	Can change market listed crate	51	change_marketlistedcrate
210	Can delete market listed crate	51	delete_marketlistedcrate
211	Can view market listed crate	51	view_marketlistedcrate
212	Can add order	52	add_order
213	Can change order	52	change_order
214	Can delete order	52	delete_order
215	Can view order	52	view_order
216	Can add paystack account	53	add_paystackaccount
217	Can change paystack account	53	change_paystackaccount
218	Can delete paystack account	53	delete_paystackaccount
219	Can view paystack account	53	view_paystackaccount
220	Can add order crate item	54	add_ordercrateitem
221	Can change order crate item	54	change_ordercrateitem
222	Can delete order crate item	54	delete_ordercrateitem
223	Can view order crate item	54	view_ordercrateitem
224	Can add order pickup details	55	add_orderpickupdetails
225	Can change order pickup details	55	change_orderpickupdetails
226	Can delete order pickup details	55	delete_orderpickupdetails
227	Can view order pickup details	55	view_orderpickupdetails
228	Can add company delivery contact	56	add_companydeliverycontact
229	Can change company delivery contact	56	change_companydeliverycontact
230	Can delete company delivery contact	56	delete_companydeliverycontact
231	Can view company delivery contact	56	view_companydeliverycontact
232	Can add market listed crate price	57	add_marketlistedcrateprice
233	Can change market listed crate price	57	change_marketlistedcrateprice
234	Can delete market listed crate price	57	delete_marketlistedcrateprice
235	Can view market listed crate price	57	view_marketlistedcrateprice
\.

COPY public.company_metrics (report_date, company_id, comp_name, comp_logo, comp_country, comp_cap_tons, comp_cap_num_crates, cooling_unit_types, comp_op, comp_op_fem, comp_op_ma, comp_op_ot, currency, comp_reg_users, comp_reg_users_ma, comp_reg_users_fem, comp_reg_users_ot, comp_beneficiaries, comp_beneficiaries_fem, comp_beneficiaries_ma, comp_cool_users, comp_cool_users_fem, comp_cool_users_ma, comp_cool_users_ot, comp_farmers, comp_traders, comp_unspec_user_type, comp_crates_in, comp_ops_in, comp_kg_in, comp_crates_out, comp_ops_out, comp_kg_out, comp_average_room_occupancy, comp_revenue, comp_revenue_usd) FROM stdin;
\.

COPY public.cooling_unit_metrics (id, date, report_date, cooling_unit_id, unit_name, is_unit_deleted, state, cool_unit_type, cap_tons, cap_num_crates, company_id, comp_name, comp_pricing, currency, room_op, room_op_fem, room_op_ma, room_op_ot, room_beneficiaries, room_beneficiaries_fem, room_beneficiaries_ma, room_active_users, room_active_user_ids, room_active_fem, room_active_ma, room_active_ot, room_crates_in, room_ops_in, room_kg_in, room_crates_out, room_ops_out, room_kg_out, average_room_occupancy, room_revenue, room_revenue_usd, check_in_crates_crop, check_in_kg_crop, check_out_crates_crop, check_out_kg_crop, tot_co2, co2_crops) FROM stdin;
\.

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
2	0	*/1	*	*	*	UTC
5	25	*/1	*	*	*	UTC
6	30	*/1	*	*	*	UTC
7	50	*/1	*	*	*	UTC
28	40	1	1	*	*	UTC
32	47	2	1	*	*	UTC
21	*/2	*	*	*	*	UTC
9	30	*/2	*	*	*	UTC
29	56	0	1	*	*	UTC
20	0	6	1	*	*	UTC
24	30	*/6	5	*	*	UTC
30	7	1	1	*	*	UTC
23	0	2	1	*	*	UTC
35	0	5	*	*	*	UTC
36	45	3	*	*	*	UTC
16	30	8	*	*	*	UTC
25	0	*/7	5	*	*	UTC
17	0	9	*	*	*	UTC
31	35	2	1	*	*	UTC
8	0	*/2	*	*	*	UTC
18	45	8	*	*	*	UTC
19	15	9	*	*	*	UTC
34	30	4	*	*	*	UTC
10	55	*/2	*	*	*	UTC
3	10	*/2	*	*	*	UTC
11	0	*/2	*	*	*	UTC
4	20	*/2	*	*	*	UTC
12	40	*/2	*	*	*	UTC
13	45	*/2	*	*	*	UTC
14	55	*/2	*	*	*	UTC
43	*/10	*	*	*	*	UTC
26	15	*/7	5	*	*	UTC
15	0	*/6	*	*	*	UTC
27	35	19	5	*	*	UTC
44	*/5	*	*	*	*	UTC
45	*/30	*	*	*	*	UTC
1	0	4	*	*	*	UTC
22	*	*	*	*	*	UTC
46	0	1	*	*	*	UTC
42	0	*/4	*	*	*	UTC
37	0	1	1	*	*	UTC
33	0	*/12	*	*	*	UTC
38	30	3	*	*	*	UTC
39	0	3	*	*	*	UTC
40	30	2	*	*	*	UTC
41	0	2	*	*	*	UTC
\.

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
1	6	hours
\.

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
4	market_survey_checks	base.apps.storage.tasks.notifications.market_survey_checks	[]	{}	\N	\N	\N	\N	t	2024-12-23 01:00:00.00162+00	688	2024-12-23 01:00:45.184858+00		37	\N	\N	f	\N	\N	{}	\N	\N
67	nigeria_markets_data_db_insert	base.apps.prediction.tasks.ml4_ng.nigeria_states_data_db_insert	[]	{}	\N	\N	\N	\N	t	2024-12-23 02:00:00.013259+00	504	2024-12-23 02:02:20.060877+00		41	\N	\N	f	\N	\N	{}	\N	\N
5	time_to_pick_up_notifications	base.apps.storage.tasks.notifications.time_to_pick_up_notifications	[]	{}	\N	\N	\N	\N	t	2024-12-23 12:00:00.054571+00	1714	2024-12-23 12:02:35.181833+00		33	\N	\N	f	\N	\N	{}	\N	\N
70	recompute_digital_twin	base.apps.storage.tasks.digital_twins.recompute_digital_twin	[]	{}	\N	\N	\N	\N	t	2024-12-23 12:00:00.03498+00	750	2024-12-23 12:02:35.224426+00		33	\N	\N	f	\N	\N	{}	\N	\N
75	storage_recompute_computed_fields	base.apps.storage.tasks.computed_fields.recompute_computed_fields	[]	{}	\N	\N	\N	\N	t	2024-12-23 01:00:00.060485+00	46	2024-12-23 01:00:45.173377+00		46	\N	\N	f	\N	\N	{}	\N	\N
74	marketplace_recompute_computed_fields	base.apps.marketplace.tasks.computed_fields.recompute_computed_fields	[]	{}	\N	\N	\N	\N	t	2024-12-23 01:00:00.032473+00	46	2024-12-23 01:00:45.195613+00		46	\N	\N	f	\N	\N	{}	\N	\N
66	prediction_calls_ng	base.apps.prediction.tasks.ml4_ng.prediction_calls_ng	[]	{}	\N	\N	\N	\N	t	2024-12-23 02:30:00.021556+00	482	2024-12-23 02:33:05.025591+00		40	\N	\N	f	\N	\N	{}	\N	\N
7	india_markets_data_db_insert	base.apps.prediction.tasks.ml4.india_markets_data_db_insert	[]	{}	\N	\N	\N	\N	t	2024-12-23 03:00:00.013267+00	965	2024-12-23 03:00:45.127047+00		39	\N	\N	f	\N	\N	{}	\N	\N
6	prediction_calls	base.apps.prediction.tasks.ml4.prediction_calls	[]	{}	\N	\N	\N	\N	t	2024-12-23 03:30:00.012532+00	964	2024-12-23 03:31:30.130674+00		38	\N	\N	f	\N	\N	{}	\N	\N
1	celery.backend_cleanup	celery.backend_cleanup	[]	{}	\N	\N	\N	\N	t	2024-12-23 04:00:00.001278+00	517	2024-12-23 04:02:20.068028+00		1	\N	\N	f	\N	\N	{}	\N	43200
2	update_temperature_per_cooling_unit	base.apps.storage.tasks.ecozen_call.update_temperature	[]	{}	\N	\N	\N	\N	t	2024-12-23 16:00:00.001671+00	876	2024-12-23 16:02:30.079328+00		42	\N	\N	f	\N	\N	{}	\N	\N
73	expire_unpaid_orders	base.apps.marketplace.tasks.orders.expire_unpaid_orders	[]	{}	\N	\N	\N	\N	t	2024-12-23 16:05:00.001004+00	22674	2024-12-23 16:05:35.082468+00		22	\N	\N	f	\N	\N	{}	\N	\N
\.

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
1	2024-12-20 21:02:12.399047+00
\.

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	django_celery_beat	crontabschedule
7	django_celery_beat	intervalschedule
8	django_celery_beat	periodictask
9	django_celery_beat	periodictasks
10	django_celery_beat	solarschedule
11	django_celery_beat	clockedschedule
12	user	user
13	user	company
14	user	country
15	user	farmer
16	user	farmersurvey
17	user	serviceprovider
18	user	operator
19	user	notification
20	user	invitationuser
21	user	genericusercode
22	user	farmersurveycommodity
23	storage	coolingunit
24	storage	coolingunitcrop
25	storage	coolingunitspecifications
26	storage	crate
27	storage	crop
28	storage	croptype
29	storage	location
30	storage	pricing
31	storage	produce
32	storage	operatorassignedcoolingunit
33	storage	sensorusermodel
34	operation	checkin
35	operation	checkout
36	operation	marketsurvey
37	operation	movement
38	prediction	market
39	prediction	state
40	prediction	mlpredictiondata
41	prediction	mlmarketdataindia
42	prediction	mlmarketdatanigeria
43	prediction	mlpredictiondatang
44	prediction	stateng
45	operation	marketsurveycheckout
46	operation	marketsurveypreprocessing
47	storage	coolingunitpower
48	user	bankaccount
49	storage	cratepartialcheckout
50	marketplace	coupon
51	marketplace	marketlistedcrate
52	marketplace	order
53	marketplace	paystackaccount
54	marketplace	ordercrateitem
55	marketplace	orderpickupdetails
56	marketplace	companydeliverycontact
57	marketplace	marketlistedcrateprice
\.

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	operation	0001_initial	2023-07-25 03:56:19.482661+00
2	storage	0001_initial	2023-07-25 03:56:19.574244+00
3	contenttypes	0001_initial	2023-07-25 03:56:19.587978+00
4	contenttypes	0002_remove_content_type_name	2023-07-25 03:56:19.600345+00
5	auth	0001_initial	2023-07-25 03:56:19.682977+00
6	auth	0002_alter_permission_name_max_length	2023-07-25 03:56:19.688993+00
7	auth	0003_alter_user_email_max_length	2023-07-25 03:56:19.695744+00
8	auth	0004_alter_user_username_opts	2023-07-25 03:56:19.702294+00
9	auth	0005_alter_user_last_login_null	2023-07-25 03:56:19.708236+00
10	auth	0006_require_contenttypes_0002	2023-07-25 03:56:19.711242+00
11	auth	0007_alter_validators_add_error_messages	2023-07-25 03:56:19.717376+00
12	auth	0008_alter_user_username_max_length	2023-07-25 03:56:19.723339+00
13	auth	0009_alter_user_last_name_max_length	2023-07-25 03:56:19.729259+00
14	auth	0010_alter_group_name_max_length	2023-07-25 03:56:19.735779+00
15	auth	0011_update_proxy_permissions	2023-07-25 03:56:19.746982+00
16	auth	0012_alter_user_first_name_max_length	2023-07-25 03:56:19.753231+00
17	user	0001_initial	2023-07-25 03:56:20.103505+00
18	admin	0001_initial	2023-07-25 03:56:20.146249+00
19	admin	0002_logentry_remove_auto_add	2023-07-25 03:56:20.158985+00
20	admin	0003_logentry_add_action_flag_choices	2023-07-25 03:56:20.169931+00
21	django_celery_beat	0001_initial	2023-07-25 03:56:20.222991+00
22	django_celery_beat	0002_auto_20161118_0346	2023-07-25 03:56:20.245188+00
23	django_celery_beat	0003_auto_20161209_0049	2023-07-25 03:56:20.257586+00
24	django_celery_beat	0004_auto_20170221_0000	2023-07-25 03:56:20.263342+00
25	django_celery_beat	0005_add_solarschedule_events_choices	2023-07-25 03:56:20.268684+00
26	django_celery_beat	0006_auto_20180322_0932	2023-07-25 03:56:20.291581+00
27	django_celery_beat	0007_auto_20180521_0826	2023-07-25 03:56:20.302971+00
28	django_celery_beat	0008_auto_20180914_1922	2023-07-25 03:56:20.31919+00
29	django_celery_beat	0006_auto_20180210_1226	2023-07-25 03:56:20.365743+00
30	django_celery_beat	0006_periodictask_priority	2023-07-25 03:56:20.373739+00
31	django_celery_beat	0009_periodictask_headers	2023-07-25 03:56:20.380771+00
32	django_celery_beat	0010_auto_20190429_0326	2023-07-25 03:56:20.477856+00
33	django_celery_beat	0011_auto_20190508_0153	2023-07-25 03:56:20.497633+00
34	django_celery_beat	0012_periodictask_expire_seconds	2023-07-25 03:56:20.505201+00
35	django_celery_beat	0013_auto_20200609_0727	2023-07-25 03:56:20.511188+00
36	django_celery_beat	0014_remove_clockedschedule_enabled	2023-07-25 03:56:20.516604+00
37	django_celery_beat	0015_edit_solarschedule_events_choices	2023-07-25 03:56:20.522193+00
38	user	0002_farmersurveycommodity_unit	2023-07-25 03:56:20.535098+00
39	operation	0002_initial	2023-07-25 03:56:20.636093+00
40	storage	0002_initial	2023-07-25 03:56:21.096102+00
41	storage	0003_produce_picture	2023-07-25 03:56:21.115832+00
42	storage	0004_remove_crop_country	2023-07-25 03:56:21.146811+00
43	user	0002_country_crop	2023-07-25 03:56:21.197337+00
44	user	0003_merge_20220727_1327	2023-07-25 03:56:21.200282+00
45	user	0004_user_language	2023-07-25 03:56:21.213035+00
46	user	0005_alter_user_gender	2023-07-25 03:56:21.243152+00
47	user	0006_update_farmersurveycommodity	2023-07-25 03:56:21.350282+00
48	user	0007_alter_company_digital_twin	2023-07-25 03:56:21.370331+00
49	user	0008_auto_20221010_1439	2023-07-25 03:56:21.489897+00
50	user	0009_update_dt_values	2023-07-25 03:56:21.523514+00
51	user	0010_alter_notification_specific_id	2023-07-25 03:56:21.540237+00
52	user	0011_auto_20221108_1455	2023-07-25 03:56:21.597477+00
53	user	0012_auto_20221207_1543	2023-07-25 03:56:21.628746+00
54	storage	0005_crate_rundt	2023-07-25 03:56:21.644128+00
55	storage	0006_coolingunitspecifications_set_point_value	2023-07-25 03:56:21.65591+00
56	storage	0007_alter_coolingunitcrop_active	2023-07-25 03:56:21.679277+00
57	storage	0008_location_coolingunit_deleted	2023-07-25 03:56:21.760335+00
58	storage	0009_alter_coolingunit_cooling_unit_type	2023-07-25 03:56:21.791053+00
59	storage	0010_alter_coolingunit_food_capacity_in_metric_tons	2023-07-25 03:56:21.922885+00
60	storage	0011_auto_20220920_1423	2023-07-25 03:56:21.966032+00
61	storage	0012_auto_20221006_1518	2023-07-25 03:56:22.046501+00
62	storage	0013_auto_20221006_1826	2023-07-25 03:56:22.20815+00
63	storage	0014_rename_password_ecozenusermodel_old_password	2023-07-25 03:56:22.220953+00
64	storage	0015_ecozenusermodel_password	2023-07-25 03:56:22.235629+00
65	storage	0016_ecozenusermodel_password_copy	2023-07-25 03:56:22.27105+00
66	storage	0017_remove_ecozenusermodel_old_password	2023-07-25 03:56:22.340274+00
67	storage	0018_crate_currency	2023-07-25 03:56:22.355845+00
68	storage	0019_crate_currency_update	2023-07-25 03:56:22.391332+00
69	storage	0020_remove_crate_status	2023-07-25 03:56:22.406417+00
70	storage	0021_coolingunit_public	2023-07-25 03:56:22.429374+00
71	storage	0021_alter_sensor	2023-07-25 03:56:22.52857+00
72	storage	0022_merge_0021_alter_sensor_0021_coolingunit_public	2023-07-25 03:56:22.531633+00
73	storage	0022_ecozenusermodel_field	2023-07-25 03:56:22.545474+00
74	storage	0023_merge_20221129_1439	2023-07-25 03:56:22.548848+00
75	storage	0024_auto_20221207_1543	2023-07-25 03:56:22.588557+00
76	prediction	0001_initial	2023-07-25 03:56:22.769224+00
77	operation	0003_movement_used_for_checkin	2023-07-25 03:56:22.783458+00
78	operation	0004_market_state	2023-07-25 03:56:22.813691+00
79	operation	0005_update_marketsurvey_checkout	2023-07-25 03:56:22.976799+00
80	operation	0006_checkout_payment_type	2023-07-25 03:56:22.985406+00
81	operation	0007_auto_20221010_0915	2023-07-25 03:56:22.998162+00
82	operation	0008_auto_20221010_1007	2023-07-25 03:56:23.010372+00
83	operation	0007_auto_20221010_1838	2023-07-25 03:56:23.045864+00
84	operation	0009_merge_0007_auto_20221010_1838_0008_auto_20221010_1007	2023-07-25 03:56:23.049088+00
85	operation	0010_updating_selling_place_market_survey_and_currency_checkout	2023-07-25 03:56:23.092177+00
86	operation	0011_remove_checkout_selling_place	2023-07-25 03:56:23.100493+00
87	operation	0012_auto_20221020_1248	2023-07-25 03:56:23.142616+00
88	operation	0013_marketsurvey_market_link	2023-07-25 03:56:23.185133+00
89	operation	0014_moving_markets_to_prediction_app	2023-07-25 03:56:23.22968+00
90	operation	0015_auto_20221209_1438	2023-07-25 03:56:23.274941+00
91	operation	0016_rename_market_link_marketsurvey_market	2023-07-25 03:56:23.302614+00
92	sessions	0001_initial	2023-07-25 03:56:23.331162+00
93	storage	0023_alter_sensorusermodel_cooling_unit	2023-07-25 03:56:23.366539+00
94	storage	0025_merge_20221215_1429	2023-07-25 03:56:23.369517+00
95	storage	0026_produce_additional_info	2023-07-25 03:56:23.392846+00
96	user	0011_farmer_smartphone	2023-07-25 03:56:23.415749+00
97	user	0012_farmer_country_and_user_code	2023-07-25 03:56:23.480026+00
98	user	0013_merge_20221122_0808	2023-07-25 03:56:23.482818+00
99	user	0014_farmer_companies_and_cooling_units	2023-07-25 03:56:23.600672+00
100	user	0015_merge_20221215_1430	2023-07-25 03:56:23.603658+00
101	user	0013_update_ml4market_values	2023-07-25 03:56:23.696455+00
102	user	0016_merge_20230103_1257	2023-07-25 03:56:23.700236+00
103	django_celery_beat	0016_alter_crontabschedule_timezone	2023-08-11 02:26:22.486637+00
104	user	0017_alter_user_language	2023-09-01 06:49:00.545544+00
105	prediction	0002_mlmarketdatanigeria_mlpredictiondatang_stateng	2023-09-01 06:49:00.746387+00
106	operation	0017_auto_20230914_1114	2023-09-18 01:29:18.957101+00
107	operation	0018_auto_20230918_0106	2023-09-18 01:29:19.06785+00
108	prediction	0003_auto_20230826_2309	2023-09-18 01:29:19.200499+00
109	user	0018_auto_20230914_1004	2023-09-18 01:29:19.434832+00
110	user	0019_farmersurveycommodity_reason_for_loss	2023-09-18 01:29:19.670664+00
111	user	0020_alter_farmersurveycommodity_reason_for_loss	2023-10-04 03:01:08.963889+00
112	operation	0019_marketsurveypreprocessing	2023-10-04 03:01:09.075636+00
113	operation	0020_marketsurveypreprocessing_is_active	2023-10-23 01:28:37.484853+00
115	operation	0020_auto_20231129_0448	2024-02-02 05:54:18.146705+00
116	operation	0021_merge_20240202_0516	2024-02-02 05:54:28.812651+00
117	storage	0027_auto_20240125_2310	2024-02-02 05:54:28.922616+00
118	storage	0028_auto_20240202_0308	2024-02-02 05:54:29.013221+00
121	storage	0031_alter_coolingunitpower_pv_panel_type	2024-02-14 00:50:33.009198+00
122	storage	0029_auto_20240213_0204	2024-02-15 16:25:52.348399+00
123	storage	0030_auto_20240213_2357	2024-02-15 16:25:52.352436+00
124	storage	0031_alter_coolingunitpower_electricity_storage_system	2024-02-15 16:25:52.355527+00
125	storage	0032_alter_coolingunitpower_pv_panel_type	2024-02-15 16:25:52.358222+00
126	storage	0033_merge_20240214_0133	2024-02-15 16:25:52.361061+00
127	storage	0033_crate_tag	2024-04-12 12:56:58.206708+00
128	operation	0021_alter_marketsurvey_selling_unit	2024-04-12 12:58:52.379098+00
129	operation	0022_merge_20240411_2234	2024-04-12 12:58:52.382871+00
130	user	0021_alter_user_language	2024-04-12 12:58:52.42212+00
131	user	0022_alter_user_language	2024-05-07 14:33:29.83015+00
132	user	0023_auto_20240516_2232	2024-05-19 21:01:06.002719+00
133	storage	0034_coolingunit_editable_checkins	2024-05-23 08:43:33.501285+00
134	operation	0023_alter_checkout_payment_type	2024-05-23 12:38:16.840774+00
135	operation	0022_alter_checkout_payment_type	2024-05-24 15:25:16.746598+00
136	operation	0024_merge_20240524_1525	2024-05-24 15:25:16.751798+00
137	user	0024_alter_notification_event_type	2024-05-24 15:25:16.766873+00
138	prediction	0004_add_date_indexes	2024-08-01 10:44:43.27984+00
139	user	0025_alter_currency_fields	2024-10-10 23:54:45.99042+00
140	storage	0035_alter_currency_fields	2024-10-10 23:54:46.163429+00
141	operation	0023_alter_checkin_ownership_from_farmer_to_user_and_company	2024-10-10 23:54:47.034736+00
142	operation	0024_alter_currency_fields	2024-10-10 23:54:47.106319+00
143	operation	0025_integration_with_movement	2024-10-10 23:54:47.139622+00
144	storage	0036_partial_checkouts	2024-10-10 23:54:49.094392+00
145	marketplace	0001_initial	2024-10-10 23:54:49.649468+00
146	marketplace	0002_alter_order_status	2024-10-10 23:54:49.675857+00
147	marketplace	0003_order_payment_reference	2024-10-10 23:54:49.702428+00
148	marketplace	0004_order_pickup_details	2024-10-10 23:54:49.819161+00
149	marketplace	0005_companydeliverycontact	2024-10-10 23:54:49.89122+00
150	marketplace	0006_alter_companydeliverycontact_phone	2024-10-10 23:54:49.93551+00
151	operation	0026_auto_20241008_1120	2024-10-10 23:54:49.958498+00
152	prediction	0005_readjust_date_indexes	2024-10-10 23:55:02.734317+00
153	user	0026_auto_20241010_1535	2024-10-10 23:55:02.793452+00
154	marketplace	0007_auto_20241011_1655	2024-10-11 23:53:54.513822+00
155	marketplace	0008_order_status_changed_at	2024-10-15 12:33:42.847903+00
156	user	0027_alter_notification_event_type	2024-11-07 13:50:42.365296+00
157	marketplace	0009_auto_20241030_1649	2024-11-07 13:50:43.198335+00
158	marketplace	0010_auto_20241105_1449	2024-11-07 13:50:43.329441+00
159	marketplace	0011_auto_20241107_0818	2024-11-07 13:50:43.384521+00
160	operation	0027_auto_20241030_1649	2024-11-07 13:50:43.640536+00
161	operation	0028_auto_20241105_1449	2024-11-07 13:50:43.910772+00
162	storage	0037_auto_20241030_1649	2024-11-07 13:50:48.614074+00
163	storage	0038_auto_20241105_1449	2024-11-07 13:50:48.72507+00
164	storage	0039_fix_fully_checked_out	2024-11-07 13:50:48.790494+00
165	storage	0040_crate_computed_fields	2024-11-07 13:50:48.883239+00
166	storage	0041_alter_produce_cmp_last_updated_at	2024-11-07 13:50:48.91106+00
167	user	0028_company_flag_opt_out_from_marketplace_filter	2024-11-26 17:45:19.741617+00
168	marketplace	0012_aggregate_marketplace_post_order_crates	2024-12-20 11:01:04.478389+00
\.

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.

COPY public.farmer_metrics (id, date, report_date, farmer_id, cooling_unit_id, gender, room_crates_in, room_ops_in, room_kg_in, room_crates_out, room_ops_out, room_kg_out, check_in_crates_crop, check_in_kg_crop, check_out_crates_crop, check_out_kg_crop) FROM stdin;
\.

COPY public.impact_metrics (report_date, cooling_unit_id, unit_name, company_id, farmer_id, crop_id, first_name, last_name, crop_name, currency, baseline_quantity_total_month, baseline_kg_selling_price_month, baseline_kg_loss_month, baseline_perc_loss_month, baseline_kg_sold_month, baseline_farmer_revenue_month, monthly_kg_selling_price, monthly_kg_checkin, monthly_kg_loss, monthly_farmer_revenue, monthly_kg_selling_price_evolution, monthly_perc_unit_selling_price_evolution, monthly_farmer_revenue_evolution, monthly_perc_farmer_revenue_evolution, monthly_perc_loss, monthly_perc_foodloss_diff, monthly_perc_foodloss_evolution, latest_survey_date, baseline_completed_surveys_room, possible_post_checkout_survey_room, total_post_checkout_survey_unit) FROM stdin;
\.

COPY public.marketplace_companydeliverycontact (id, created_at, contact_name, phone, company_id, created_by_user_id, delivery_company_name) FROM stdin;
\.

COPY public.marketplace_coupon (id, created_at, revoked_at, code, discount_percentage, created_by_user_id, owned_on_behalf_of_company_id, owned_by_user_id) FROM stdin;
\.

COPY public.marketplace_marketlistedcrate (id, created_at, delisted_at, currency, cmp_last_updated_at, cmp_pending_in_cooling_fees, cmp_pending_in_cooling_fees_price_per_kg, cmp_weight_locked_in_payment_pending_orders_in_kg, cmp_available_weight_in_kg, crate_id) FROM stdin;
\.

COPY public.marketplace_marketlistedcrateprice (id, created_at, produce_price_per_kg, market_listed_crate_id, created_by_user_id) FROM stdin;
\.

COPY public.marketplace_order (id, status, created_at, currency, paystack_split_code, paid_at, amount_paid, cmp_last_updated_at, cmp_total_produce_amount, cmp_total_cooling_fees_amount, cmp_total_coldtivate_amount, cmp_total_discount_amount, cmp_total_payment_fees_amount, cmp_total_amount, created_by_user_id, owned_on_behalf_of_company_id, payment_references, status_changed_at) FROM stdin;
\.

COPY public.marketplace_ordercrateitem (id, ordered_entire_crate, ordered_produce_weight, frozen_crate_available_weight, frozen_produce_price_per_kg, cmp_last_updated_at, cmp_produce_amount, cmp_cooling_fees_amount, cmp_discount_amount, cmp_total_amount, coupon_id, market_listed_crate_id, order_id) FROM stdin;
\.

COPY public.marketplace_ordercrateitem_resulting_crates (id, ordercrateitem_id, crate_id) FROM stdin;
\.

COPY public.marketplace_orderpickupdetails (id, pickup_method, cooling_unit_id, order_id) FROM stdin;
\.

COPY public.marketplace_paystackaccount (id, created_at, is_default_account, account_type, bank_code, country_code, account_number, account_name, paystack_subaccount_code, owned_on_behalf_of_company_id, created_by_user_id, owned_by_user_id) FROM stdin;
\.

COPY public.operation_checkin (id, movement_id, owned_by_user_id, owned_on_behalf_of_company_id) FROM stdin;
\.

COPY public.operation_checkout (id, cmp_total_cooling_fees_amount, paid, movement_id, cmp_total_amount, discount_amount, currency, cmp_last_updated_at, payment_gateway, payment_method, payment_through) FROM stdin;
\.

COPY public.operation_marketsurvey (id, selling_place, price, currency, selling_unit, checkout_id, crop_id, loss, selling_date, date_filled_in, market_id, kg_in_unit, reason_for_loss) FROM stdin;
\.

COPY public.operation_marketsurvey_checkout (id, checkout_id, marketsurvey_id) FROM stdin;
\.

COPY public.operation_marketsurveypreprocessing (id, checkout_at, modified_at, checkout_id, crop_id, farmer_id, operator_id, is_active) FROM stdin;
\.

COPY public.operation_movement (id, date, code, operator_id, used_for_checkin, initiated_for, order_id) FROM stdin;
\.

COPY public.prediction_market (id, name, district, used_for_predictions, added_by_user, state_id) FROM stdin;
1	Bilaspur	Bilaspur	t	f	1
2	Chamba	Chamba	t	f	1
3	Hamirpur	Hamirpur	t	f	1
4	Hamirpur(Nadaun)	Hamirpur	t	f	1
5	Dharamshala	Kangra	t	f	1
6	Jwalaji	Kangra	t	f	1
7	Kangra	Kangra	t	f	1
8	Kangra(Baijnath)	Kangra	t	f	1
9	Kangra(Jaisinghpur)	Kangra	t	f	1
10	Kangra(Jassour)	Kangra	t	f	1
11	Kangra(Nagrota Bagwan)	Kangra	t	f	1
12	Palampur	Kangra	t	f	1
13	Bandrol	Kullu	t	f	1
14	Bhuntar	Kullu	t	f	1
15	Khegsu	Kullu	t	f	1
16	Kullu	Kullu	t	f	1
17	Kullu(Chauri Bihal)	Kullu	t	f	1
18	Kullu(Patli Kuhal)	Kullu	t	f	1
19	Chail Chowk	Mandi	t	f	1
20	Dhanotu (Mandi)	Mandi	t	f	1
21	Mandi(Mandi)	Mandi	t	f	1
22	Mandi(Takoli)	Mandi	t	f	1
23	Rohroo	Shimla	t	f	1
24	Shimla	Shimla	t	f	1
25	Shimla and Kinnaur(Koti)	Shimla	t	f	1
26	Shimla and Kinnaur(Nerwa)	Shimla	t	f	1
27	Shimla and Kinnaur(Rampur)	Shimla	t	f	1
28	Nahan	Sirmore	t	f	1
29	Paonta Sahib	Sirmore	t	f	1
30	Solan	Solan	t	f	1
31	Solan(Nalagarh)	Solan	t	f	1
32	Solan(Parwanoo)	Solan	t	f	1
33	Santoshgarh	Una	t	f	1
34	Una	Una	t	f	1
35	Azadpur	Delhi	t	f	2
36	Mechua	Kolkata	t	f	3
37	Angaura	Angul	t	f	4
38	Pallahara	Angul	t	f	4
39	Talcher	Angul	t	f	4
40	Kasinagar	Gajapati	t	f	4
41	Parlakhemundi	Gajapati	t	f	4
42	Koraput(Semilguda)	Koraput	t	f	4
43	Malkanagiri	Malkangiri	t	f	4
44	Panposh	Sundergarh	t	f	4
45	Siliguri	Darjeeling	t	f	3
46	Namhol(Bilaspur)	Bilaspur	t	f	1
47	Sirmour(Bagthan)	Sirmore	t	f	1
48	Sirmour(sarahan)	Sirmore	t	f	1
49	Dharampur	Solan	t	f	1
50	Solan(Rajgarh)	Solan	t	f	1
51	Keshopur	Delhi	t	f	2
52	Shahdara	Delhi	t	f	2
53	Angul	Angul	t	f	4
54	Angul(Atthamallick)	Angul	t	f	4
55	Angul(Jarapada)	Angul	t	f	4
56	Bampada	Balasore	t	f	4
57	Barikpur	Balasore	t	f	4
58	Jaleswar	Balasore	t	f	4
59	Nilagiri	Balasore	t	f	4
60	Attabira	Bargarh	t	f	4
61	Bargarh	Bargarh	t	f	4
62	Bargarh(Barapalli)	Bargarh	t	f	4
63	Godabhaga	Bargarh	t	f	4
64	Padampur	Bargarh	t	f	4
65	Sohela	Bargarh	t	f	4
66	Bhadrak	Bhadrak	t	f	4
67	Chandabali	Bhadrak	t	f	4
68	Sahidngar	Bhadrak	t	f	4
69	Bolangir	Bolangir	t	f	4
70	Bolangir(Patnagarh)	Bolangir	t	f	4
71	Kantabaji	Bolangir	t	f	4
72	Tusura	Bolangir	t	f	4
73	Boudh	Boudh	t	f	4
74	Khunthabandha	Boudh	t	f	4
75	Athagarh	Cuttack	t	f	4
76	Banki	Cuttack	t	f	4
77	Kendupatna	Cuttack	t	f	4
78	Kendupatna(Niali)	Cuttack	t	f	4
79	Deogarh	Deogarh	t	f	4
80	Tileibani	Deogarh	t	f	4
81	Dhenkanal	Dhenkanal	t	f	4
82	Hindol	Dhenkanal	t	f	4
83	Kamakhyanagar	Dhenkanal	t	f	4
84	Mottagaon	Dhenkanal	t	f	4
85	Bhanjanagar	Ganjam	t	f	4
86	Digapahandi	Ganjam	t	f	4
87	Hinjilicut	Ganjam	t	f	4
88	Jajpur	Jajpur	t	f	4
89	Jhumpura	Jajpur	t	f	4
90	Bhawanipatna	Kalahandi	t	f	4
91	Junagarh	Kalahandi	t	f	4
92	Kalahandi(Dharamagarh)	Kalahandi	t	f	4
93	Kesinga	Kalahandi	t	f	4
94	Mukhiguda	Kalahandi	t	f	4
95	Kandhamal	Kandhamal	t	f	4
96	Chatta Krushak Bazar	Kendrapara	t	f	4
97	Gopa	Kendrapara	t	f	4
98	Kendrapara	Kendrapara	t	f	4
99	Kendrapara(Marshaghai)	Kendrapara	t	f	4
100	Pattamundai	Kendrapara	t	f	4
101	Champua	Keonjhar	t	f	4
102	Keonjhar	Keonjhar	t	f	4
103	Keonjhar(Dhekikote)	Keonjhar	t	f	4
104	Keonjhar(Jhumpura)	Keonjhar	t	f	4
105	Saharpada	Keonjhar	t	f	4
106	Aiginia Mandi	Khurda	t	f	4
107	Balugaon	Khurda	t	f	4
108	Jeypore	Koraput	t	f	4
109	Jeypore(Kotpad)	Koraput	t	f	4
110	Koraput	Koraput	t	f	4
111	Malkangiri(Korakunda)	Malkangiri	t	f	4
112	Baripada	Mayurbhanja	t	f	4
113	Betnoti	Mayurbhanja	t	f	4
114	Chuliaposi	Mayurbhanja	t	f	4
115	Saraskana	Mayurbhanja	t	f	4
116	Udala	Mayurbhanja	t	f	4
117	Bahadajholla	Nayagarh	t	f	4
118	Sarankul	Nayagarh	t	f	4
119	Nawarangpur	Nowarangpur	t	f	4
120	Khariar	Nuapada	t	f	4
121	Khariar Road	Nuapada	t	f	4
122	Gunpur	Rayagada	t	f	4
123	Rayagada(Muniguda)	Rayagada	t	f	4
124	Kuchinda	Sambalpur	t	f	4
125	Rairakhol	Sambalpur	t	f	4
126	Sambalpur	Sambalpur	t	f	4
127	Birmaharajpur	Sonepur	t	f	4
128	Dungurapalli	Sonepur	t	f	4
129	Pandkital	Sonepur	t	f	4
130	Bonai	Sundergarh	t	f	4
131	Sargipali	Sundergarh	t	f	4
132	Khatra	Bankura	t	f	3
133	Birbhum	Birbhum	t	f	3
134	Bolpur	Birbhum	t	f	3
135	Sainthia	Birbhum	t	f	3
136	Asansol	Burdwan	t	f	3
137	Burdwan	Burdwan	t	f	3
138	Durgapur	Burdwan	t	f	3
139	Kalna	Burdwan	t	f	3
140	Memari	Burdwan	t	f	3
141	Baxirhat	Coochbehar	t	f	3
142	Coochbehar	Coochbehar	t	f	3
143	Haldibari	Coochbehar	t	f	3
144	Mekhliganj	Coochbehar	t	f	3
145	Pundibari	Coochbehar	t	f	3
146	Toofanganj	Coochbehar	t	f	3
147	Balurghat	Dakshin Dinajpur	t	f	3
148	Gangarampur(Dakshin Dinajpur)	Dakshin Dinajpur	t	f	3
149	Darjeeling	Darjeeling	t	f	3
150	Karsiyang(Matigara)	Darjeeling	t	f	3
151	Champadanga	Hooghly	t	f	3
152	Kalipur	Hooghly	t	f	3
153	Sheoraphuly	Hooghly	t	f	3
154	Ramkrishanpur(Howrah)	Howrah	t	f	3
155	Uluberia	Howrah	t	f	3
156	Alipurduar	Jalpaiguri	t	f	3
157	Belacoba	Jalpaiguri	t	f	3
158	Dhupguri	Jalpaiguri	t	f	3
159	Falakata	Jalpaiguri	t	f	3
160	Jalpaiguri Sadar	Jalpaiguri	t	f	3
161	Moynaguri	Jalpaiguri	t	f	3
162	Sealdah Koley Market	Kolkata	t	f	3
163	Egra/contai	Medinipur(E)	t	f	3
164	Garbeta(Medinipur)	Medinipur(W)	t	f	3
165	Medinipur(West)	Medinipur(W)	t	f	3
166	Chakdah	Nadia	t	f	3
167	Ranaghat	Nadia	t	f	3
168	Barasat	North 24 Parganas	t	f	3
169	Habra	North 24 Parganas	t	f	3
170	Balarampur	Puruliya	t	f	3
171	Purulia	Puruliya	t	f	3
172	Baruipur(Canning)	Sounth 24 Parganas	t	f	3
173	Diamond Harbour(South 24-pgs)	Sounth 24 Parganas	t	f	3
174	Nimapara	Puri	t	f	4
175	Sahaspur	Sambalpur	t	f	4
176	Car Nicobar		f	f	5
177	Diglipur		f	f	5
178	Mayabandar		f	f	5
179	Port Blair		f	f	5
180	A.A.Nagar,Kurnool,RBZ		f	f	6
181	Achanta		f	f	6
182	Addanki		f	f	6
183	Adoni		f	f	6
184	Adoni,RBZ		f	f	6
185	Akiveedu		f	f	6
186	Akkaiahpalem,RBZ,Visakhapatnam		f	f	6
187	Alamuru		f	f	6
188	Allagadda		f	f	6
189	Allavaram		f	f	6
190	Alluru		f	f	6
191	Alur		f	f	6
192	Amadalavalasa		f	f	6
193	Amalapuram(Mpl. Gate),RBZ		f	f	6
194	Ambajipeta		f	f	6
195	Amudalavalasa ,RBZ		f	f	6
196	Anakapally		f	f	6
197	Anantapur		f	f	6
198	Anaparthy		f	f	6
199	Atmakur		f	f	6
200	Atmakur(SPS)		f	f	6
201	Attili		f	f	6
202	Badvel		f	f	6
203	Banaganapalli		f	f	6
204	Bangarupalem		f	f	6
205	Bapatla		f	f	6
206	Bapulapadu,RBZ		f	f	6
207	Bheemunipatnam		f	f	6
208	Bhimadole		f	f	6
209	Bhimavaram		f	f	6
210	Bhimavaram,RBZ		f	f	6
211	Bhimunipatnam		f	f	6
212	Bobbili		f	f	6
213	C.Camp,RBZ		f	f	6
214	Chilakaluripet		f	f	6
215	Chintalapudi		f	f	6
216	Chintapally		f	f	6
217	Chipurupalli		f	f	6
218	Chirala		f	f	6
219	Chittoor		f	f	6
220	Chittoor (MGH),RBZ		f	f	6
221	Chittor(Rythu Bazar)		f	f	6
222	Chodavaram		f	f	6
223	CSMLS Point, ,RBZ,Guntur		f	f	6
224	Cuddapah		f	f	6
225	Cumbum(AP)		f	f	6
226	Darsi		f	f	6
227	Denduluru		f	f	6
228	Dharmavaram		f	f	6
229	Dhone		f	f	6
230	Dibbala Bazar,RBZ		f	f	6
231	Divi		f	f	6
232	Duggirala		f	f	6
233	Dwarakanagar,RBZ		f	f	6
234	Dwarkanagar(Rythu Bazar)		f	f	6
235	Eluru		f	f	6
236	Eluru(P.Sri.Mkt),RBZ		f	f	6
237	Eluru-II,RBZ		f	f	6
238	Emani		f	f	6
239	Fatehkhanpet,RBZ		f	f	6
240	Gajapathinagaram		f	f	6
241	Gajuwaka,RBZ,Visakhapatnam		f	f	6
242	Gandhi Irvin Park(Tenali),RBZ		f	f	6
243	Gandhinagar RBZ		f	f	6
244	Ganesh Chouk,Rajahmundry,RBZ		f	f	6
245	Gannavaram		f	f	6
246	Giddalur		f	f	6
247	Gooti		f	f	6
248	Gopala Patnam Cent.,RBZ,Visakhapatnam		f	f	6
249	Gopalavaram		f	f	6
250	Gudiwada		f	f	6
251	Gudiwada,RBZ		f	f	6
252	Gudur		f	f	6
253	Gudur (G. Mpl Park),RBZ		f	f	6
254	Guntakal		f	f	6
255	Guntur		f	f	6
256	Hindupur		f	f	6
257	Hindupur,RBZ		f	f	6
258	Hiramandalam		f	f	6
259	Ibrahimpatnam,RBZ		f	f	6
260	Ichapuram		f	f	6
261	Ipur		f	f	6
262	Jaggampet		f	f	6
263	Jaggayyapeta		f	f	6
264	Jaggayyapeta (G.Hospital),RBZ		f	f	6
265	Jammalamadugu		f	f	6
266	Kadiri		f	f	6
267	Kaikaluru		f	f	6
268	Kakinada		f	f	6
269	Kakinada(R.T.C) ,RBZ		f	f	6
270	Kakinda(Rythu Bazar)		f	f	6
271	Kalidindi		f	f	6
272	Kalikiri		f	f	6
273	Kalyandurg		f	f	6
274	Kamalapuram		f	f	6
275	Kancharlapalem,RBZ		f	f	6
276	Kanchekacherla		f	f	6
277	Kanchekacherla,RBZ		f	f	6
278	Kanchili		f	f	6
279	Kandukur		f	f	6
280	Kandukur (MRO Complex),RBZ		f	f	6
281	Kanigiri		f	f	6
282	Kankipadu		f	f	6
283	Karapa		f	f	6
284	Kavali		f	f	6
285	Kavali,RBZ		f	f	6
286	Kedareshwari peta, Vijayawada,RBZ		f	f	6
287	Koduru		f	f	6
288	Koilkunta		f	f	6
289	Kondapi		f	f	6
290	Kothabommali		f	f	6
291	Kothapatnam B.Stand,RBZ		f	f	6
292	Kothapeta		f	f	6
293	Kothavalasa		f	f	6
294	Kothpet,RBZ		f	f	6
295	Kovur		f	f	6
296	Kovvur		f	f	6
297	Kovvur,RBZ		f	f	6
298	Krosuru		f	f	6
299	Kuchinapudi		f	f	6
300	Kuppam		f	f	6
301	Kurnool		f	f	6
302	Kurnool(Rythu Bazar)		f	f	6
303	Kurupam		f	f	6
304	L.R.Palli		f	f	6
305	Lakkireddipally		f	f	6
306	Lawyer pet (Sai tmpl),RBZ		f	f	6
307	M.V.P.Colony,RBZ,Visakhapatnam		f	f	6
308	Machalipatnam (Court),RBZ		f	f	6
309	Macharla		f	f	6
310	Machilipatnam		f	f	6
311	Madakasira		f	f	6
312	Madanapalli		f	f	6
313	Maddipadu		f	f	6
314	Madhurawada,RBZ		f	f	6
315	Malleswaram		f	f	6
316	Mandapeta		f	f	6
317	Mangalagiri		f	f	6
318	Mangalagiri(SLNS Temple),RBZ		f	f	6
319	Markapur		f	f	6
320	Marripalem,RBZ,Visakhapatnam		f	f	6
321	Martur		f	f	6
322	Movva Hqs		f	f	6
323	Mulagada,Visakhapatnam		f	f	6
324	Mulakalacheruvu		f	f	6
325	Mummidivaram		f	f	6
326	Mydukur		f	f	6
327	Mylavaram		f	f	6
328	Mylavaram,RBZ		f	f	6
329	Nagalapuram		f	f	6
330	Nagaram		f	f	6
331	Nagari		f	f	6
332	Naidupet		f	f	6
333	Nandigama		f	f	6
334	Nandigama,RBZ		f	f	6
335	Nandikotkur		f	f	6
336	Nandyal		f	f	6
337	Nandyal(Srinivasnagar),RBZ		f	f	6
338	Narasannapet		f	f	6
339	Narasaraopet		f	f	6
340	Narasaraopet,RBZ		f	f	6
341	Narasaraopeta		f	f	6
342	Narsapuram		f	f	6
343	Narsapuram,RBZ		f	f	6
344	Narsipatnam		f	f	6
345	Nellore		f	f	6
346	Nellore(Play Ground),RBZ		f	f	6
347	Nidadavolu		f	f	6
348	Nr. Co-op Central Bank(Ten),RBZ		f	f	6
349	Nuzvid		f	f	6
350	Nuzvid (Gandhi Park),RBZ		f	f	6
351	Old Bus Stand, Chilakaluripet,RBZ		f	f	6
352	Old Maharaj Hospital,RBZ,Vizianagaram		f	f	6
353	Ongole		f	f	6
354	Ongole(Rythu Bazar)		f	f	6
355	Opp:Swami Theatre, ,RBZ,Guntur		f	f	6
356	P. Ramacharyulu Park,RBZ		f	f	6
357	Paderu		f	f	6
358	Pahikonda		f	f	6
359	Pakala		f	f	6
360	Palakole		f	f	6
361	Palakole ,RBZ		f	f	6
362	Palakonda		f	f	6
363	Palamaner		f	f	6
364	Pamarru		f	f	6
365	Parchur		f	f	6
366	Parvathipuram		f	f	6
367	Parvathipuram ,RBZ		f	f	6
368	Patamata,RBZ		f	f	6
369	Pathapatnam		f	f	6
370	Pathebad(Rythu Bazar)		f	f	6
371	Pattikonda		f	f	6
372	Pedagantiyada,RBZ,Visakhapatnam		f	f	6
373	Peddapuram		f	f	6
374	Peddapuram(Phase7)		f	f	6
375	Peddavaltair,RBZ,Visakhapatnam		f	f	6
376	Penamaluru		f	f	6
377	Pendurthi,RBZ		f	f	6
378	Penugonda		f	f	6
379	Penukonda		f	f	6
380	Pidugurala		f	f	6
381	Pidugurala(Palnadu)		f	f	6
382	Piler		f	f	6
383	Pithapuram		f	f	6
384	Podili		f	f	6
385	Polavaram		f	f	6
386	Ponduru		f	f	6
387	Ponnur		f	f	6
388	Prattipadu		f	f	6
389	Proddatur		f	f	6
390	Proddatur,RBZ		f	f	6
391	Pulivendala		f	f	6
392	Punganur		f	f	6
393	Pusapatirega		f	f	6
394	Puttur		f	f	6
395	R and B Guest House,RBZ,Vizianagaram		f	f	6
396	Rajahmundry		f	f	6
397	Rajahmundry(Nataraj),RBZ		f	f	6
398	Rajam		f	f	6
399	Rajampet		f	f	6
400	Ramachandrapuram		f	f	6
401	Rapur		f	f	6
402	Ravulapalem(MY),RBZ		f	f	6
403	Ravulapelem		f	f	6
404	Rayachoti		f	f	6
405	Rayadurg		f	f	6
406	Razole		f	f	6
407	Repalli		f	f	6
408	Ring Road Jn.,RBZ, Vizianagaram		f	f	6
409	Rompicherla		f	f	6
410	Saluru		f	f	6
411	Samalkot		f	f	6
412	Sampara		f	f	6
413	Santhamaguluru		f	f	6
414	Satellite,RBZ		f	f	6
415	Sattenapalli		f	f	6
416	Satyavedu		f	f	6
417	Seethammadhara(Rythu Bazar)		f	f	6
418	Seethammadhara,RBZ,Visakhapatnam		f	f	6
419	Siddavatam		f	f	6
420	Siddout		f	f	6
421	Singarayakonda		f	f	6
422	Somala		f	f	6
423	Sompeta		f	f	6
424	Srikakulam		f	f	6
425	Srikakulam (Illandu Junction),RBZ		f	f	6
426	Srikalahasti		f	f	6
427	Steel Plant,RBZ		f	f	6
428	Sullurpet		f	f	6
429	Swarajmaidan(Rythu Bazar)		f	f	6
430	Tadepalligudem		f	f	6
431	Tadikonda		f	f	6
432	Tadipatri		f	f	6
433	Tanuku		f	f	6
434	Tekkali		f	f	6
435	Tellarevu		f	f	6
436	Tenakallu		f	f	6
437	Tenali		f	f	6
438	Thambalapalli		f	f	6
439	Thottambedu		f	f	6
440	Tirupati		f	f	6
441	Tirupati (TUDA),RBZ		f	f	6
442	Tiruvuru		f	f	6
443	Tuni		f	f	6
444	Udayagiri		f	f	6
445	Undi		f	f	6
446	Ungatur		f	f	6
447	Urvakonda		f	f	6
448	V.Kota Mkt.Yard		f	f	6
449	Vadlapudi		f	f	6
450	Vakadu		f	f	6
451	Vayalapadu		f	f	6
452	Venkatagiri		f	f	6
453	Vepanjari		f	f	6
454	Vijayanagaram		f	f	6
455	Vijayanagaram(Rythu Bazar)		f	f	6
456	Vijayawada		f	f	6
457	Vijayawada(S.Maidan),RBZ		f	f	6
458	Vinukonda		f	f	6
459	Visakhapatnam		f	f	6
460	Vuyyur		f	f	6
461	Vuyyur,RBZ		f	f	6
462	Vuyyuru(Rythu Bazar)		f	f	6
463	Yellamanchili		f	f	6
464	Yemmiganur		f	f	6
465	Along		f	f	7
466	Anjaw		f	f	7
467	Bomdila		f	f	7
468	Daporijo		f	f	7
469	Khonsa		f	f	7
470	Kurung Kumey		f	f	7
471	Miao		f	f	7
472	Naharlagun		f	f	7
473	Pasighat		f	f	7
474	Roing		f	f	7
475	Seppa		f	f	7
476	Tawang		f	f	7
477	Tezu		f	f	7
478	Yingkiong		f	f	7
479	Ziro		f	f	7
480	Bohorihat		f	f	8
481	Bongiagaon		f	f	8
482	Cachar		f	f	8
483	Dhekiajuli		f	f	8
484	Dhing		f	f	8
485	Dibrugarh		f	f	8
486	Gauripur		f	f	8
487	Goalpara		f	f	8
488	Golaghat		f	f	8
489	Goreswar		f	f	8
490	Hailakandi		f	f	8
491	Howly		f	f	8
492	Jorhat		f	f	8
493	Karimganj		f	f	8
494	Kharupetia		f	f	8
495	Kushtholy		f	f	8
496	Lanka		f	f	8
497	Nalbari		f	f	8
498	North Lakhimpur		f	f	8
499	P.O. Uparhali Guwahati		f	f	8
500	Pamohi(Garchuk)		f	f	8
501	Silapathar		f	f	8
502	Sivasagar		f	f	8
503	Srirampur		f	f	8
504	Tinsukia		f	f	8
505	Aarah		f	f	9
506	Arreria		f	f	9
507	Arwal		f	f	9
508	Aurangabad		f	f	9
509	Bahadurganj		f	f	9
510	Barahat		f	f	9
511	Barsoi		f	f	9
512	Begusarai		f	f	9
513	Bettiah		f	f	9
514	Bhagalpur		f	f	9
515	Bihariganj		f	f	9
516	Biharsharif		f	f	9
517	Bihta		f	f	9
518	Biraul		f	f	9
519	Birpur		f	f	9
520	Buxur		f	f	9
521	Chakia		f	f	9
522	Chhapra		f	f	9
523	Danapur		f	f	9
524	Darbhanga		f	f	9
525	Forbesganj		f	f	9
526	Gaya		f	f	9
527	Gopalganj		f	f	9
528	Gulabbagh		f	f	9
529	Hajipur		f	f	9
530	Jahajharpur		f	f	9
531	Jainagar		f	f	9
532	Jamui		f	f	9
533	Jehanabad		f	f	9
534	Kahalgaon		f	f	9
535	Kaswa		f	f	9
536	Katihar		f	f	9
537	Khagaria		f	f	9
538	Kishanganj		f	f	9
539	Lakhisarai		f	f	9
540	Madhubani		f	f	9
541	Mohana		f	f	9
542	Mokama		f	f	9
543	Motihari		f	f	9
544	Munghair		f	f	9
545	Muzaffarpur		f	f	9
546	Narkatiaganj		f	f	9
547	Natwar		f	f	9
548	Nawada		f	f	9
549	Nokha		f	f	9
550	Patna (Musallahpur)		f	f	9
551	Patna City		f	f	9
552	Saharsa		f	f	9
553	Saidpurhat		f	f	9
554	Samastipur		f	f	9
555	Sasaram		f	f	9
556	Shekhpura		f	f	9
557	Singheswarsthan		f	f	9
558	Sitamarhi		f	f	9
559	Siwan		f	f	9
560	Supaul		f	f	9
561	Teghra		f	f	9
562	Thakurganj		f	f	9
563	Chandigarh (F&V)		f	f	10
564	Chandigarh(Grain/Fruit)		f	f	10
565	Aamdi		f	f	11
566	Abhanpur		f	f	11
567	Ahivara		f	f	11
568	Akaltara		f	f	11
569	Amadula		f	f	11
570	Ambagarh Chowki		f	f	11
571	Ambikapur		f	f	11
572	Amoda		f	f	11
573	Anand Nagar		f	f	11
574	Antagarh		f	f	11
575	Arang		f	f	11
576	Bagbahra		f	f	11
577	Bageecha		f	f	11
578	Baikunthpur		f	f	11
579	Balod		f	f	11
580	Baloda		f	f	11
581	Baloda(Janjgir Campus)		f	f	11
582	Balodabazar		f	f	11
583	Bandhabazar		f	f	11
584	Baradwar		f	f	11
585	Baramkela		f	f	11
586	Bardewri		f	f	11
587	Bariya		f	f	11
588	Bartori		f	f	11
589	Basana		f	f	11
590	Bastar		f	f	11
591	Bazar Atriya		f	f	11
592	Bededonger		f	f	11
593	Belarbahara		f	f	11
594	Belargaon		f	f	11
595	Belora		f	f	11
596	Beltara		f	f	11
597	Bemetara		f	f	11
598	Bemetara(Darhi)		f	f	11
599	Bemetara(Navagarh)		f	f	11
600	Bemetara(Thankhamaria)		f	f	11
601	Berla		f	f	11
602	Bhaisa		f	f	11
603	Bhaisma		f	f	11
604	Bhakhara		f	f	11
605	Bhanupratappur		f	f	11
606	Bharamgarh		f	f	11
607	Bhatapara		f	f	11
608	Bhatgaon		f	f	11
609	Bhavarpur		f	f	11
610	Bheemkhoj		f	f	11
611	Bhendri		f	f	11
612	Bhopalpattnam		f	f	11
613	Bhoring		f	f	11
614	Bhurkoni		f	f	11
615	Bijapur		f	f	11
616	Bilaspur		f	f	11
617	Bilha		f	f	11
618	Biranpur kalan (Sahaspur Lohra)		f	f	11
619	Birra		f	f	11
620	Boraee		f	f	11
621	Champa		f	f	11
622	Chandrapur		f	f	11
623	Charama		f	f	11
624	Chhati		f	f	11
625	Chhinari		f	f	11
626	Chhuria		f	f	11
627	Chikhli		f	f	11
628	Chura		f	f	11
629	Dadhi		f	f	11
630	Devbhog		f	f	11
631	Devda		f	f	11
632	Dhamdha		f	f	11
633	Dhamtari		f	f	11
634	Dhanora		f	f	11
635	Dharamjaygarh		f	f	11
636	Dondi		f	f	11
637	Dondilohara		f	f	11
638	Dongargaon		f	f	11
639	Dongargarh		f	f	11
640	Doranpal		f	f	11
641	Dudhawa		f	f	11
642	Durg		f	f	11
643	Gamhari		f	f	11
644	Gandai		f	f	11
645	Gariyaband		f	f	11
646	Gattasilli		f	f	11
647	Gaurella		f	f	11
648	Gharghoda		f	f	11
649	Gidam		f	f	11
650	Gurur		f	f	11
651	Hasoad		f	f	11
652	Hirapur		f	f	11
653	Jagdalpur		f	f	11
654	Jaijaipur		f	f	11
655	Jairamnagar		f	f	11
656	Jaitgiri		f	f	11
657	Jaspur		f	f	11
658	Jhalap		f	f	11
659	Kakni		f	f	11
660	Kanker		f	f	11
661	Karpawand		f	f	11
662	Kasdol		f	f	11
663	Katghora		f	f	11
664	Kathghora(Kharmora)		f	f	11
665	Kawardha		f	f	11
666	Kedar		f	f	11
667	Keshkal		f	f	11
668	Khamhariya		f	f	11
669	Kharora		f	f	11
670	Kharsiya		f	f	11
671	Kheragarh		f	f	11
672	Komakhan		f	f	11
673	Kondagoan		f	f	11
674	Konta		f	f	11
675	Korar		f	f	11
676	Kota		f	f	11
677	Kotba		f	f	11
678	Kotmi		f	f	11
679	Kukanar		f	f	11
680	Kunda		f	f	11
681	Kunkuri		f	f	11
682	Kurud		f	f	11
683	Kusmee		f	f	11
684	Lakhanpuri		f	f	11
685	Lohandiguda		f	f	11
686	Lormi		f	f	11
687	Magarload		f	f	11
688	Mahasamund		f	f	11
689	Mahuyatoli		f	f	11
690	Makdi		f	f	11
691	Mandirhasoad		f	f	11
692	Manendragarh		f	f	11
693	Mardapal		f	f	11
694	Muli		f	f	11
695	Munguli		f	f	11
696	Nagari		f	f	11
697	Naila		f	f	11
698	Narayanpur		f	f	11
699	Narharpur		f	f	11
700	Navagaon		f	f	11
701	Navapara		f	f	11
702	Neora		f	f	11
703	Pakhanjur		f	f	11
704	Palari		f	f	11
705	Pandariya		f	f	11
706	Pangaon		f	f	11
707	Patan		f	f	11
708	Patewa		f	f	11
709	Pathalgaon		f	f	11
710	Pathriya		f	f	11
711	Pendraroad		f	f	11
712	Pharasgaon		f	f	11
713	Phingeshwer		f	f	11
714	Pipriya		f	f	11
715	Pirda		f	f	11
716	Pithoura		f	f	11
717	Pratappur		f	f	11
718	Pusor		f	f	11
719	Raghunathpur		f	f	11
720	Rahod		f	f	11
721	Raigarh		f	f	11
722	Raipur		f	f	11
723	Rajim		f	f	11
724	Rajnandgaon		f	f	11
725	Rajpur		f	f	11
726	Ramanujganj		f	f	11
727	Ratanpur		f	f	11
728	Risgaon		f	f	11
729	Saja		f	f	11
730	Sakra		f	f	11
731	Sakri		f	f	11
732	Salihabhata		f	f	11
733	Sambalpur		f	f	11
734	Sambalpur (Bemetra)		f	f	11
735	Sapti		f	f	11
736	Sarangarh		f	f	11
737	Sarayapali		f	f	11
738	Sargaon		f	f	11
739	Sariya		f	f	11
740	Sarona		f	f	11
741	Sarsiwan		f	f	11
742	Shakti		f	f	11
743	Shivrinarayanpur		f	f	11
744	Silyari		f	f	11
745	Simga		f	f	11
746	Sindhanpur		f	f	11
747	Sirri		f	f	11
748	Sitapur		f	f	11
749	Sukma		f	f	11
750	Surajpur		f	f	11
751	Takhatpur		f	f	11
752	Tendukona		f	f	11
753	Tiphra		f	f	11
754	Tokapal		f	f	11
755	Toshgaon		f	f	11
756	Tulsi		f	f	11
757	Udaypur		f	f	11
758	Vishrampur		f	f	11
759	Silvassa		f	f	12
760	Daman		f	f	13
761	Diu		f	f	13
762	Canacona		f	f	14
763	Curchorem		f	f	14
764	Horticulture Corp,Caranzalem, Panaji		f	f	14
765	Mapusa		f	f	14
766	Margao		f	f	14
767	Pernem		f	f	14
768	Ponda		f	f	14
769	Ponda, Bagayatdar Bhawan		f	f	14
770	Registrar Co Op,Panaji		f	f	14
771	Sanquelim		f	f	14
772	Valpol		f	f	14
773	Abadasa		f	f	15
774	Ahmedabad		f	f	15
775	Ahmedabad(Chimanbhai Patal Market Vasana)		f	f	15
776	Ahmedabad(Flower Market Jamalpur)		f	f	15
777	Ahmedabad(Fruit Market, Naroda)		f	f	15
778	Ahmedabad(Manekchowk)		f	f	15
779	Ahmedabad(Rajnagar sub yard)		f	f	15
780	Ahwa-Dang		f	f	15
781	Amirgadh		f	f	15
782	Amod		f	f	15
783	Amod(Sarban)		f	f	15
784	Amreli		f	f	15
785	Anand		f	f	15
786	Anand(Veg,Yard,Anand)		f	f	15
787	Anjar		f	f	15
788	Anjar(Veg,Sub Yard)		f	f	15
789	Anklav		f	f	15
790	Anklav(Veg,Market,Asodar)		f	f	15
791	Ankleshwar		f	f	15
792	Babra		f	f	15
793	Bachau		f	f	15
794	Bagasara		f	f	15
795	Balasinor		f	f	15
796	Banaskantha		f	f	15
797	Bardoli		f	f	15
798	Bardoli(Katod)		f	f	15
799	Bardoli(Madhi)		f	f	15
800	Baruch(Vagara)		f	f	15
801	Barvala		f	f	15
802	Bavla		f	f	15
803	Bayad		f	f	15
804	Bayad(Demai)		f	f	15
805	Bayad(Sadamba)		f	f	15
806	Becharaji		f	f	15
807	Bhabhar		f	f	15
808	Bhanvad		f	f	15
809	Bharuch		f	f	15
810	Bhatiya		f	f	15
811	Bhavnagar		f	f	15
812	Bhesan		f	f	15
813	Bhiloda		f	f	15
814	Bhuj		f	f	15
815	Bilimora		f	f	15
816	Bilimora(Gandevi)		f	f	15
817	Bodeli		f	f	15
818	Bodeli(Hadod)		f	f	15
819	Bodeli(Kalediya)		f	f	15
820	Bodeli(Modasar)		f	f	15
821	Borsad		f	f	15
822	Borsad(Asodar)		f	f	15
823	Borsad(Veg Yard Barsad)		f	f	15
824	Botad		f	f	15
825	Botad(Bhabarkot)		f	f	15
826	Botad(Haddad)		f	f	15
827	Chansama		f	f	15
828	Chhota Udaipur		f	f	15
829	Chhota Udepur(Tejgadh)		f	f	15
830	Chikhali		f	f	15
831	Chikli(Khorgam)		f	f	15
832	Chitra		f	f	15
833	chorayashi		f	f	15
834	Chotial(Veg,Yard)		f	f	15
835	Chotila		f	f	15
836	Chotila(Veg,Yard Chotila)		f	f	15
837	Chuda		f	f	15
838	Dabhoi(Kayavarohan)		f	f	15
839	Daboi		f	f	15
840	Dahod		f	f	15
841	Dahod(Garbada)		f	f	15
842	Dahod(Himalaya)		f	f	15
843	Dahod(Jesavada)		f	f	15
844	Dahod(Veg. Market)		f	f	15
845	Dakor		f	f	15
846	Damnagar		f	f	15
847	Danta		f	f	15
848	Dantiwada		f	f	15
849	Dasada Patadi		f	f	15
850	Daskroi		f	f	15
851	Davgadbaria(Piplod)		f	f	15
852	Dayapar		f	f	15
853	Dediyapada		f	f	15
854	Deesa		f	f	15
855	Deesa(Bhildi)		f	f	15
856	Deesa(Deesa Veg Yard)		f	f	15
857	Dehgam		f	f	15
858	Dehgam(Dehgam Veg Yard)		f	f	15
859	Dehgam(Rekhiyal)		f	f	15
860	Derol		f	f	15
861	Derol(Adadara)		f	f	15
862	Derol(Vejalpur)		f	f	15
863	Detroj		f	f	15
864	Devgadhbaria		f	f	15
865	Dhandhuka		f	f	15
866	Dhandkuka(Dholera)		f	f	15
867	Dhanera		f	f	15
868	Dhanera(Samarwada)		f	f	15
869	Dhanera(Veg,Yard Dhanera)		f	f	15
870	Dhanpur		f	f	15
871	Dhansura		f	f	15
872	Dharampur(veg)		f	f	15
873	Dhari		f	f	15
874	Dhari(Chalala)		f	f	15
875	Dhodha		f	f	15
876	Dholka		f	f	15
877	Dholka(Koth)		f	f	15
878	Dholka(Market Yard Veg)		f	f	15
879	Dhoraji		f	f	15
880	Dhoraji(Chattle Market Yard)		f	f	15
881	Dhragradhra		f	f	15
882	Dhrol		f	f	15
883	Diyodar		f	f	15
884	Dolvan		f	f	15
885	Dwaraka		f	f	15
886	Gadada		f	f	15
887	Galteshwer		f	f	15
888	Gandhinagar(Board)		f	f	15
889	Gariyadar		f	f	15
890	Gir Gadhda		f	f	15
891	Godhra		f	f	15
892	Godhra(Kakanpur)		f	f	15
893	Godhra(Timbaroad)		f	f	15
894	Gogamba		f	f	15
895	Gogamba(Similiya)		f	f	15
896	Gondal		f	f	15
897	Gondal(Cattle Market Gondal)		f	f	15
898	Gondal(Veg.market Gondal)		f	f	15
899	Halol		f	f	15
900	Halvad		f	f	15
901	Harij		f	f	15
902	Hasot		f	f	15
903	Hasot(Elav)		f	f	15
904	Himatnagar		f	f	15
905	Himatnagar(Gambhoi)		f	f	15
906	Himatnagar(Veg.Market Himatnagar)		f	f	15
907	Idar		f	f	15
908	Idar(Jadar)		f	f	15
909	jafarabad		f	f	15
910	Jalalpor		f	f	15
911	Jam Jodhpur		f	f	15
912	Jam Khambalia		f	f	15
913	Jambudhoda		f	f	15
914	Jambusar		f	f	15
915	Jambusar(Kaavi)		f	f	15
916	Jamkandorna		f	f	15
917	Jamnagar		f	f	15
918	Jasdan		f	f	15
919	Jasdan(Vichhiya)		f	f	15
920	Jepur Pavi(Chackak)		f	f	15
921	Jetalpur (A'bad City)		f	f	15
922	Jetpur(Dist.Rajkot)		f	f	15
923	Jetpur-Pavi		f	f	15
924	Jhagadiya		f	f	15
925	Jhalod		f	f	15
926	Jodiya		f	f	15
927	Jotana		f	f	15
928	Junagadh		f	f	15
929	Junagadh(Veg,Yard, Junagadh)		f	f	15
930	K.Mandvi		f	f	15
931	Kadana		f	f	15
932	Kadi		f	f	15
933	Kadi(Kadi cotton Yard)		f	f	15
934	Kadodara		f	f	15
935	Kalawad		f	f	15
936	Kalol		f	f	15
937	Kalol(Veg,Market,Kalol)		f	f	15
938	Kalyanpur		f	f	15
939	Kamrej		f	f	15
940	Kankrej		f	f	15
941	Kapadanj(Moti Jaher)		f	f	15
942	Kapadvanj		f	f	15
943	Kaparada		f	f	15
944	Karjan		f	f	15
945	Kathlal		f	f	15
946	Katosan		f	f	15
947	Kawant		f	f	15
948	Kawant(Panvad)		f	f	15
949	Keshod		f	f	15
950	Khambha		f	f	15
951	Khambhaliya		f	f	15
952	Khambhat		f	f	15
953	Khambhat(Grain Market)		f	f	15
954	Khambhat(Veg Yard Khambhat)		f	f	15
955	Khanpur		f	f	15
956	Khavada		f	f	15
957	Kheda		f	f	15
958	Kheda(Nayaka)		f	f	15
959	Khedbrahma		f	f	15
960	Khedbrahma(Lambadia)		f	f	15
961	Khedbrahma(Posina)		f	f	15
962	Khergam		f	f	15
963	Kim		f	f	15
964	Kodinar		f	f	15
965	Kodinar(Dollasa)		f	f	15
966	Kosamba		f	f	15
967	Kosamba(Vankal)		f	f	15
968	Kosamba(Zangvav)		f	f	15
969	Kotadasagani		f	f	15
970	Kothamba		f	f	15
971	Kothara		f	f	15
972	Kutiyana		f	f	15
973	Kwat		f	f	15
974	Lakhani		f	f	15
975	Lakhpat		f	f	15
976	Lakhtar		f	f	15
977	Lalpur		f	f	15
978	Lathi		f	f	15
979	Liliya		f	f	15
980	Limdi		f	f	15
981	Limkheda		f	f	15
982	Lodhika		f	f	15
983	Lunavada		f	f	15
984	Lunavada(Kobamba)		f	f	15
985	Mahudha		f	f	15
986	Mahuva		f	f	15
987	Mahuva(Anaval)		f	f	15
988	Mahuva(Jesar)		f	f	15
989	Mahuva(Station Road)		f	f	15
990	Malia Hatina		f	f	15
991	Maliya-Miyana		f	f	15
992	Malpur		f	f	15
993	Manavdar		f	f	15
994	Mandal		f	f	15
995	Mandvi		f	f	15
996	Mandvi(Amba Paradi)		f	f	15
997	Mangarol		f	f	15
998	Mangrol		f	f	15
999	Mansa		f	f	15
1000	Mansa(Manas Veg Yard)		f	f	15
1001	Matar		f	f	15
1002	Matar(Limbasi)		f	f	15
1003	Medarada		f	f	15
1004	Meghraj		f	f	15
1005	Meghraj(Radlavada)		f	f	15
1006	Mehmadabad		f	f	15
1007	Mehmadabad(Veg ,market)		f	f	15
1008	Mehsana		f	f	15
1009	Mehsana(Jornang)		f	f	15
1010	Mehsana(Mehsana Veg)		f	f	15
1011	Modasa		f	f	15
1012	Modasa(Tintoi)		f	f	15
1013	Morbi		f	f	15
1014	Morbi(veg.sub,yard)		f	f	15
1015	Morva Hafad		f	f	15
1016	Muli		f	f	15
1017	Mundra		f	f	15
1018	Nadiad		f	f	15
1019	Nadiyad(Chaklasi)		f	f	15
1020	Nadiyad(Piplag)		f	f	15
1021	Nakhatrana		f	f	15
1022	Naliya		f	f	15
1023	Nandoda		f	f	15
1024	Nasvadi		f	f	15
1025	Nasvadi(Thalkala)		f	f	15
1026	Navagam		f	f	15
1027	Navsari		f	f	15
1028	Nizar		f	f	15
1029	Nizar(Kukarmuda)		f	f	15
1030	Nizar(Pumkitalov)		f	f	15
1031	Olapad		f	f	15
1032	Padadhari		f	f	15
1033	Padra		f	f	15
1034	Palanpur		f	f	15
1035	Palanpur(Veg,Yard Palanpur)		f	f	15
1036	Palitana		f	f	15
1037	Palsana		f	f	15
1038	Panthawada		f	f	15
1039	Pardi		f	f	15
1040	Pardi(Motavagachiya)		f	f	15
1041	Pardi(Rohinee)		f	f	15
1042	Pardi(Ugvada)		f	f	15
1043	Pardi(Vapi)		f	f	15
1044	Patan		f	f	15
1045	Patan(Veg,Yard Patan)		f	f	15
1046	Petlad		f	f	15
1047	Petlad(Veg Yard, Petlad)		f	f	15
1048	Porbandar		f	f	15
1049	Prantij		f	f	15
1050	Prantij(Salala)		f	f	15
1051	Radhanpur		f	f	15
1052	Radheja		f	f	15
1053	Rajkot		f	f	15
1054	Rajkot(Ghee Peeth)		f	f	15
1055	Rajpipla		f	f	15
1056	Rajpipla(Garudeshwal)		f	f	15
1057	Rajula		f	f	15
1058	Rajula(Dungar)		f	f	15
1059	Rampura		f	f	15
1060	Ranavav		f	f	15
1061	Randheja(Chiloda)		f	f	15
1062	Randheja(Veg.Market Gandhinagar)		f	f	15
1063	Ranpur		f	f	15
1064	Rapar		f	f	15
1065	S.Mandvi		f	f	15
1066	Sagabara		f	f	15
1067	Sami		f	f	15
1068	Sanad		f	f	15
1069	Sanjan		f	f	15
1070	Sankheda		f	f	15
1071	Santalpur		f	f	15
1072	Santrampur		f	f	15
1073	Santrampur(Fathaepura)		f	f	15
1074	Sarswati		f	f	15
1075	Satlasana		f	f	15
1076	Savarkundla		f	f	15
1077	Savli		f	f	15
1078	Savli(Desar)		f	f	15
1079	Savli(Samlaya)		f	f	15
1080	Sayala		f	f	15
1081	Selemba		f	f	15
1082	Selemba(Navgam Javli)		f	f	15
1083	Shehra		f	f	15
1084	Shihor		f	f	15
1085	Shinor		f	f	15
1086	Shinor(Shinor Veg)		f	f	15
1087	Shnkheshwar		f	f	15
1088	Siddhpur		f	f	15
1089	Singvad		f	f	15
1090	Siugam		f	f	15
1091	Sojitra		f	f	15
1092	Songadh		f	f	15
1093	Songadh(Badarpada)		f	f	15
1094	Songadh(Umrada)		f	f	15
1095	Subir		f	f	15
1096	Surat		f	f	15
1097	Surat(Old Sardar Market)		f	f	15
1098	Surendrangr		f	f	15
1099	Sutrapada		f	f	15
1100	Talala		f	f	15
1101	Talalagir		f	f	15
1102	Taleja		f	f	15
1103	Talod		f	f	15
1104	Talod(Harsol)		f	f	15
1105	Tankara		f	f	15
1106	Tarapur		f	f	15
1107	Thangdh		f	f	15
1108	Thara		f	f	15
1109	Thara(Shihori)		f	f	15
1110	Tharad		f	f	15
1111	Tharad(Rah)		f	f	15
1112	Thasara		f	f	15
1113	Thasara(Dokar)		f	f	15
1114	Tilakwada		f	f	15
1115	Timbi		f	f	15
1116	Uchhal		f	f	15
1117	Uchhal(Karod)		f	f	15
1118	Umarala		f	f	15
1119	Umargam		f	f	15
1120	Umarpada		f	f	15
1121	Umreth		f	f	15
1122	Una		f	f	15
1123	Unava		f	f	15
1124	Unjha		f	f	15
1125	Upleta		f	f	15
1126	Vadali		f	f	15
1127	Vadgam		f	f	15
1128	Vadhvan		f	f	15
1129	Vadiya		f	f	15
1130	Vadnagar		f	f	15
1131	Vadnagar(Kheralu)		f	f	15
1132	Vadodara		f	f	15
1133	Vadodara(Navapura)		f	f	15
1134	Vadodara(Sayajipura)		f	f	15
1135	Vaghai		f	f	15
1136	Vagodiya		f	f	15
1137	Valia		f	f	15
1138	Valia(Nethrang)		f	f	15
1139	Vallabhipur		f	f	15
1140	Valod		f	f	15
1141	Valod(Buhari)		f	f	15
1142	Valsad		f	f	15
1143	Valsad(Dungari)		f	f	15
1144	Vankaner		f	f	15
1145	Vankaner(Sub yard)		f	f	15
1146	Vansda		f	f	15
1147	Vansda(Limzar)		f	f	15
1148	Vanthli		f	f	15
1149	vapi		f	f	15
1150	Varahi		f	f	15
1151	Vaso		f	f	15
1152	Vav		f	f	15
1153	Veraval		f	f	15
1154	Vijapur		f	f	15
1155	Vijapur(Gojjariya)		f	f	15
1156	Vijapur(Kukarvada)		f	f	15
1157	Vijapur(Ladol)		f	f	15
1158	Vijapur(veg)		f	f	15
1159	Vijaynagar(Kundlakap)		f	f	15
1160	Viramgam		f	f	15
1161	Virpur		f	f	15
1162	Visavadar		f	f	15
1163	Visnagar		f	f	15
1164	Vyara(Paati)		f	f	15
1165	Vyra		f	f	15
1166	Zalod(Sanjeli)		f	f	15
1167	Zalod(Zalod)		f	f	15
1168	Adampur		f	f	16
1169	Adampur(Agroha)		f	f	16
1170	Ambala Cantt.		f	f	16
1171	Ambala City		f	f	16
1172	Ambala City(Subji Mandi)		f	f	16
1173	Asandh		f	f	16
1174	Ateli		f	f	16
1175	Babain		f	f	16
1176	Badshahpur		f	f	16
1177	Bahadurgarh		f	f	16
1178	Ballabhgarh		f	f	16
1179	Ballah		f	f	16
1180	Balu		f	f	16
1181	Bapauli		f	f	16
1182	Barara		f	f	16
1183	Barwala		f	f	16
1184	Barwala(Hisar)		f	f	16
1185	Behal		f	f	16
1186	Beri		f	f	16
1187	Bhattu Kalan		f	f	16
1188	Bhiwani		f	f	16
1189	Bhiwani(Bawani Khera)		f	f	16
1190	Bhuna		f	f	16
1191	Bilaspur		f	f	16
1192	Ch. Dadri		f	f	16
1193	Cheeka		f	f	16
1194	Chhachhrauli(Khizrabad)		f	f	16
1195	Chhachrauli		f	f	16
1196	Dabwali		f	f	16
1197	Dabwali(Chautala)		f	f	16
1198	Dhand		f	f	16
1199	Dharsul		f	f	16
1200	Ding		f	f	16
1201	Ellanabad		f	f	16
1202	Faridabad		f	f	16
1203	Faridabad(Fish Market)		f	f	16
1204	Farukh Nagar		f	f	16
1205	Fatehabad		f	f	16
1206	FerozpurZirkha(Nagina)		f	f	16
1207	Ganaur		f	f	16
1208	Gharaunda		f	f	16
1209	Gohana		f	f	16
1210	Gurgaon		f	f	16
1211	Hansi		f	f	16
1212	Hansi(Sisai)		f	f	16
1213	Hassanpur		f	f	16
1214	Hathin		f	f	16
1215	Hissar		f	f	16
1216	Hodal		f	f	16
1217	Iamailabad		f	f	16
1218	Indri		f	f	16
1219	Israna		f	f	16
1220	Jagadhri		f	f	16
1221	Jakhal		f	f	16
1222	Jhajjar		f	f	16
1223	Jind		f	f	16
1224	Jui		f	f	16
1225	Jullana		f	f	16
1226	Jundla		f	f	16
1227	Kaithal		f	f	16
1228	kalanwali		f	f	16
1229	Kalawali(Odhan)		f	f	16
1230	Kalayat		f	f	16
1231	Khanina		f	f	16
1232	Kosli		f	f	16
1233	Kunjpura		f	f	16
1234	Ladwa		f	f	16
1235	Loharu		f	f	16
1236	Loharu(Dighwa)		f	f	16
1237	Madlauda		f	f	16
1238	Meham		f	f	16
1239	Mohindergarh		f	f	16
1240	Mullana		f	f	16
1241	Mullana(saha)		f	f	16
1242	Mustafabad		f	f	16
1243	Naneola		f	f	16
1244	Naraingarh		f	f	16
1245	Narnaud(Bass)		f	f	16
1246	Narnaul		f	f	16
1247	Narnaund		f	f	16
1248	Narwana		f	f	16
1249	New Grain Market , Ambala		f	f	16
1250	New Grain Market , Bhiwani		f	f	16
1251	New Grain Market , Faridabad		f	f	16
1252	New Grain Market , Jind		f	f	16
1253	New Grain Market , Panchkula		f	f	16
1254	New Grain Market , Rohtak		f	f	16
1255	New Grain Market , Sirsa		f	f	16
1256	New Grain Market , Sonipat		f	f	16
1257	New Grain Market(main), Karnal		f	f	16
1258	New Grain Market-2 , Hisar		f	f	16
1259	Nigdu		f	f	16
1260	Nilokheri		f	f	16
1261	Nissing		f	f	16
1262	Nuh		f	f	16
1263	NVM Gurgaon		f	f	16
1264	Pai		f	f	16
1265	Pai(Rajaund)		f	f	16
1266	Palwal		f	f	16
1267	Panchkul(Kalka)		f	f	16
1268	Panchkula		f	f	16
1269	Panipat		f	f	16
1270	Panipat(Baharpur)		f	f	16
1271	Panipat(Fish Market)		f	f	16
1272	Pataudi		f	f	16
1273	Pehowa		f	f	16
1274	Pehowa(Gumthala Gahru)		f	f	16
1275	Pillukhera		f	f	16
1276	Pipli		f	f	16
1277	Pundri		f	f	16
1278	Punhana		f	f	16
1279	Radaur		f	f	16
1280	Raipur Rai		f	f	16
1281	Rania		f	f	16
1282	Rania(Jiwan nagar)		f	f	16
1283	Ratia		f	f	16
1284	Rattia		f	f	16
1285	Rerozepur Zhirka		f	f	16
1286	Rewari		f	f	16
1287	Rohtak		f	f	16
1288	Rohtak(Kalanaur)		f	f	16
1289	Sadhaura		f	f	16
1290	Safidon		f	f	16
1291	Samalkha		f	f	16
1292	Sampla		f	f	16
1293	Shahabad		f	f	16
1294	Shahzadpur		f	f	16
1295	Sirsa		f	f	16
1296	Sirsa(Malekan)		f	f	16
1297	Siwan		f	f	16
1298	Siwani		f	f	16
1299	Sohna		f	f	16
1300	Sonepat		f	f	16
1301	Sonepat(Kharkhoda)		f	f	16
1302	Tarori		f	f	16
1303	Taura		f	f	16
1304	Thanesar		f	f	16
1305	Tohana		f	f	16
1306	Tohana(New Veg Market)		f	f	16
1307	Tosham		f	f	16
1308	Uchana		f	f	16
1309	Uklana		f	f	16
1310	Yamuna Nagar		f	f	16
1311	Yamunanagar(Fish Market)		f	f	16
1312	Ghumarwin		f	f	1
1313	Hamirpur(Jahu)		f	f	1
1314	Jwaklaji		f	f	1
1315	Mandi(kangni)		f	f	1
1316	Santoshgarah		f	f	1
1317	Shimla and Kinnaur(Theog)		f	f	1
1318	Solan(Banalgi)		f	f	1
1319	Solan(ChakkikaMor)		f	f	1
1320	Airwan		f	f	17
1321	Akhnoor		f	f	17
1322	AMO, Ahmedabad		f	f	17
1323	AMO, Amritsar		f	f	17
1324	AMO, Banglore		f	f	17
1325	AMO, Chandigarh		f	f	17
1326	AMO, Chennai		f	f	17
1327	AMO, Delhi		f	f	17
1328	AMO, Jaipur		f	f	17
1329	AMO, Kolkata		f	f	17
1330	AMO, Lucknow		f	f	17
1331	AMO, Mumbai		f	f	17
1332	Ashahipora (Anantnagh)		f	f	17
1333	Badhore		f	f	17
1334	Bagh(Srinagar)		f	f	17
1335	Bajwal		f	f	17
1336	Bandipora		f	f	17
1337	Batingoo		f	f	17
1338	Batote		f	f	17
1339	Bishnah		f	f	17
1340	Budgam		f	f	17
1341	Bumhama-Kupwara (F&V)		f	f	17
1342	Chadoora		f	f	17
1343	Chann Arorian		f	f	17
1344	Chanuchak		f	f	17
1345	Dachinpora		f	f	17
1346	Ganderbal		f	f	17
1347	Ghajansoo		f	f	17
1348	HandwaraFV		f	f	17
1349	Jammu (Grain Mandi)		f	f	17
1350	Jourian		f	f	17
1351	Kalyanpur		f	f	17
1352	Kanispora Baramulla (F&V)		f	f	17
1353	Kathua		f	f	17
1354	Khor		f	f	17
1355	Khurbtang-Kargil		f	f	17
1356	Kulgam		f	f	17
1357	Lakhri		f	f	17
1358	Langate		f	f	17
1359	Leh		f	f	17
1360	Mandli		f	f	17
1361	Marh		f	f	17
1362	Nagri parole		f	f	17
1363	Narwal Jammu (F&V)		f	f	17
1364	Nowpora		f	f	17
1365	Palli morh		f	f	17
1366	Parimpore		f	f	17
1367	Pattan		f	f	17
1368	Pragwal		f	f	17
1369	Prahaladpur		f	f	17
1370	Pulwama (F&V)		f	f	17
1371	Qazigund		f	f	17
1372	Rafi-Abad		f	f	17
1373	Rajouri (F&V)		f	f	17
1374	Reasi		f	f	17
1375	Samba		f	f	17
1376	Sambal		f	f	17
1377	Sanjhi morh		f	f	17
1378	Shopian		f	f	17
1379	Sohanjana		f	f	17
1380	Tangmarg		f	f	17
1381	Tral		f	f	17
1382	Udhampur		f	f	17
1383	Vessue		f	f	17
1384	Zaloosa-Chararishrief (F&V)		f	f	17
1385	Barhmba		f	f	18
1386	Bermo		f	f	18
1387	Bokaro (Chas)		f	f	18
1388	Chaibasa		f	f	18
1389	Chakulia		f	f	18
1390	Chatra		f	f	18
1391	Daltenganj		f	f	18
1392	Deoghar		f	f	18
1393	Dhanbad		f	f	18
1394	Dumka		f	f	18
1395	Gadhwah		f	f	18
1396	Giridih		f	f	18
1397	Godda		f	f	18
1398	Gumla		f	f	18
1399	Hazaribagh		f	f	18
1400	Jamshedpur		f	f	18
1401	Jamtara		f	f	18
1402	Khunti		f	f	18
1403	Koderma		f	f	18
1404	Latehar		f	f	18
1405	Lohardaga		f	f	18
1406	Madhupur		f	f	18
1407	Pakur		f	f	18
1408	Pandara		f	f	18
1409	Ramgarh		f	f	18
1410	Ranchi		f	f	18
1411	Sahebganj		f	f	18
1412	Saraikela		f	f	18
1413	Simdega		f	f	18
1414	Alanda		f	f	19
1415	Annigeri		f	f	19
1416	Arakalgud		f	f	19
1417	Arasikere		f	f	19
1418	Athani		f	f	19
1419	Aurad		f	f	19
1420	Badami		f	f	19
1421	Badami(Keruru)		f	f	19
1422	Bagalakot		f	f	19
1423	Bagalkot(Bigali)		f	f	19
1424	Bagepalli		f	f	19
1425	Bailahongal		f	f	19
1426	Bangalore		f	f	19
1427	Bangarpet		f	f	19
1428	Bantvala(Vittla)		f	f	19
1429	Bantwala		f	f	19
1430	Basava Kalayana		f	f	19
1431	Belgaum		f	f	19
1432	Belgaum(Herebhagevadi)		f	f	19
1433	Bellary		f	f	19
1434	Belthangdi		f	f	19
1435	Belur		f	f	19
1436	Bhadravathi		f	f	19
1437	Bhagepalli		f	f	19
1438	Bhalki		f	f	19
1439	Bidar		f	f	19
1440	Bijapur		f	f	19
1441	Bijapur(Basavanabhage Vadi)		f	f	19
1442	Bilagi		f	f	19
1443	Binny Mill (F&V), Bangalore		f	f	19
1444	Byadagi		f	f	19
1445	Challakere		f	f	19
1446	Chamaraj Nagar		f	f	19
1447	Channagiri		f	f	19
1448	Channapatana		f	f	19
1449	Channarayapatna		f	f	19
1450	Chickkaballapura		f	f	19
1451	Chikkamagalore		f	f	19
1452	Chincholi		f	f	19
1453	Chintamani		f	f	19
1454	Chitradurga		f	f	19
1455	Chitradurga(Bheemasamudra)		f	f	19
1456	Chittapur		f	f	19
1457	Chittapura(Shahbad)		f	f	19
1458	Davangere		f	f	19
1459	Devadurga		f	f	19
1460	Dharwad(Alanawar)		f	f	19
1461	Dharwar		f	f	19
1462	Doddaballa Pur		f	f	19
1463	Fruits & Vegetable(Kalsipalya)		f	f	19
1464	Fruits & Vegetable(Singena Agrahara)		f	f	19
1465	Gadag		f	f	19
1466	Gadag(Hulakoti)		f	f	19
1467	Gadag(Mulagund)		f	f	19
1468	Gangavathi		f	f	19
1469	Gangavathi(Karatagi)		f	f	19
1470	Gokak		f	f	19
1471	Gonikappal		f	f	19
1472	Gowribidanoor		f	f	19
1473	Gubbi		f	f	19
1474	Gulbarga		f	f	19
1475	Gulburga(Afzalpur)		f	f	19
1476	Gulburga(Jhevargi)		f	f	19
1477	Gundlupet		f	f	19
1478	H.B. Halli		f	f	19
1479	Haliyala		f	f	19
1480	Haliyala(Dandeli)		f	f	19
1481	Hanagal		f	f	19
1482	Hanagal(Hakkihaluru)		f	f	19
1483	Harappana Halli		f	f	19
1484	Harihara		f	f	19
1485	Hassan		f	f	19
1486	Haveri		f	f	19
1487	Haveri(Guthal)		f	f	19
1488	Hirekerur		f	f	19
1489	Hirekeruru(Rattihalli)		f	f	19
1490	Hiriyur		f	f	19
1491	Holalkere		f	f	19
1492	Holehaluru(Rona)		f	f	19
1493	Holenarsipura		f	f	19
1494	Honnali		f	f	19
1495	Honnavar		f	f	19
1496	Honnavara(Bhatkal)		f	f	19
1497	Hoovinahadagali		f	f	19
1498	Hosadurga		f	f	19
1499	Hosanagar		f	f	19
1500	Hoskote		f	f	19
1501	Hospet		f	f	19
1502	Hospet(Kampli)		f	f	19
1503	Hospet(Mariyammana halli)		f	f	19
1504	Hubli (Amaragol)		f	f	19
1505	Huliyar		f	f	19
1506	Humanabad		f	f	19
1507	Hunagunda(Hilakal)		f	f	19
1508	Hungund		f	f	19
1509	Hunsur		f	f	19
1510	Jagalur		f	f	19
1511	Jamakhandi		f	f	19
1512	K.R. Pet		f	f	19
1513	K.R.Nagar		f	f	19
1514	Kadur		f	f	19
1515	Kalagategi		f	f	19
1516	Kanakapura		f	f	19
1517	Karatgi		f	f	19
1518	Karkala		f	f	19
1519	Karwar		f	f	19
1520	Kolar		f	f	19
1521	Kollegal		f	f	19
1522	Koppa		f	f	19
1523	Koppal		f	f	19
1524	Koratagere		f	f	19
1525	Kottur		f	f	19
1526	Kudchi		f	f	19
1527	Kumta		f	f	19
1528	Kundagol		f	f	19
1529	Kundapura		f	f	19
1530	Kunigal		f	f	19
1531	Kustagi		f	f	19
1532	Kustagi(Hanumasagar)		f	f	19
1533	Laxmeshwar		f	f	19
1534	Laxmeswar(Siratti)		f	f	19
1535	Lingasugur		f	f	19
1536	Lingasuguru(Maski)		f	f	19
1537	Lingasuguru(Mudagal)		f	f	19
1538	Maddur		f	f	19
1539	Madhugiri		f	f	19
1540	Madikeri		f	f	19
1541	Mahalingapura(Mudagol)		f	f	19
1542	Malavalli		f	f	19
1543	Malur		f	f	19
1544	Mandya		f	f	19
1545	Mangalore		f	f	19
1546	Manglore(Moodabidri)		f	f	19
1547	Manvi		f	f	19
1548	Mhalingapur		f	f	19
1549	Moodigere		f	f	19
1550	Mulabagilu		f	f	19
1551	Mundaragi		f	f	19
1552	Mundgod		f	f	19
1553	Mysore (Bandipalya)		f	f	19
1554	Nagamangala		f	f	19
1555	Nandagada		f	f	19
1556	Nanjangud		f	f	19
1557	Nargund(Sirol)		f	f	19
1558	Nargunda		f	f	19
1559	Nippani		f	f	19
1560	Pandavapura		f	f	19
1561	Pavagada		f	f	19
1562	Piriya Pattana		f	f	19
1563	Puttur		f	f	19
1564	Raichur		f	f	19
1565	Ramanagar		f	f	19
1566	Ramanagara		f	f	19
1567	Ramdurga		f	f	19
1568	Ramdurga(Katikola)		f	f	19
1569	Rampura		f	f	19
1570	Ranebennur		f	f	19
1571	Ranebennur(Halageri)		f	f	19
1572	Rona		f	f	19
1573	Sagar		f	f	19
1574	Sagar(Hosanagara)		f	f	19
1575	Sakaleshpura		f	f	19
1576	Sandur		f	f	19
1577	Sankeshwar		f	f	19
1578	Sankeshwara((Hukkeri)		f	f	19
1579	Santhesaguru(H.D.Kota)		f	f	19
1580	Santhesargur		f	f	19
1581	Savanur		f	f	19
1582	Sedam		f	f	19
1583	Shahapur		f	f	19
1584	Shiggauv		f	f	19
1585	Shikaripura		f	f	19
1586	Shimoga		f	f	19
1587	Shimoga(Theertahalli)		f	f	19
1588	Shorapur		f	f	19
1589	Siddapur		f	f	19
1590	Sindagi		f	f	19
1591	Sindagi(chadachan)		f	f	19
1592	Sindagi(Devarayipparagi)		f	f	19
1593	Sindagi(Hendi)		f	f	19
1594	Sindhanur		f	f	19
1595	Sira		f	f	19
1596	Sirguppa		f	f	19
1597	Sirsi		f	f	19
1598	Somawarpet(Suntikoppa)		f	f	19
1599	Somvarpet		f	f	19
1600	Sorabha		f	f	19
1601	Soundati		f	f	19
1602	Soundatti(Heragatti)		f	f	19
1603	Soundatti(Munavalli)		f	f	19
1604	Sringeri		f	f	19
1605	Srinivasapur		f	f	19
1606	Srirangapattana		f	f	19
1607	Sulya		f	f	19
1608	T. Narasipura		f	f	19
1609	T.Narasipura(Bannur)		f	f	19
1610	Talikot		f	f	19
1611	Talikot(Muddebehala)		f	f	19
1612	Tarikere		f	f	19
1613	Thirthahalli		f	f	19
1614	Tiptur		f	f	19
1615	Tumkur		f	f	19
1616	Turvekere		f	f	19
1617	Udupi		f	f	19
1618	Yadagiri(Gurumittkal)		f	f	19
1619	Yadgir		f	f	19
1620	Yalburga		f	f	19
1621	Yallapura(Kiruvathi)		f	f	19
1622	Yellapur		f	f	19
1623	Adimali		f	f	20
1624	Alappuzha		f	f	20
1625	Alathur		f	f	20
1626	Aluva		f	f	20
1627	Anchal		f	f	20
1628	Angamaly		f	f	20
1629	Anyara(EEC)		f	f	20
1630	Aralamoodu		f	f	20
1631	Aroor		f	f	20
1632	Athirampuzha		f	f	20
1633	Attingal		f	f	20
1634	Broadway market		f	f	20
1635	Chala		f	f	20
1636	Chalakudy		f	f	20
1637	Chanthroor		f	f	20
1638	Chathanoor		f	f	20
1639	Chavakkad		f	f	20
1640	Chavassery		f	f	20
1641	Chelakkara		f	f	20
1642	Chengannur		f	f	20
1643	Cherthala		f	f	20
1644	Cherthdla		f	f	20
1645	Dhara		f	f	20
1646	Elevancheri		f	f	20
1647	Ernakulam		f	f	20
1648	Ettumanoor		f	f	20
1649	Ezhamkulam		f	f	20
1650	Harippad		f	f	20
1651	Irikkur		f	f	20
1652	Irinjalakkuda		f	f	20
1653	Irityy		f	f	20
1654	Kaliyanchanda		f	f	20
1655	Kallachi		f	f	20
1656	Kalpetta		f	f	20
1657	Kamakshi		f	f	20
1658	Kanjangadu		f	f	20
1659	Kanjirappally		f	f	20
1660	Kannur		f	f	20
1661	Karimpuzha		f	f	20
1662	Karuvannur		f	f	20
1663	Kasargod		f	f	20
1664	Kattakada		f	f	20
1665	Kattappana		f	f	20
1666	Kayamkulam		f	f	20
1667	Kayamkulam(Alleppey)		f	f	20
1668	Keezhampara		f	f	20
1669	Kizhakkancheri		f	f	20
1670	Kodumgalloor		f	f	20
1671	Kodungalloor		f	f	20
1672	Koduvayoor		f	f	20
1673	Kollam		f	f	20
1674	Kollengode		f	f	20
1675	Kondotty		f	f	20
1676	Koovapadi		f	f	20
1677	Kothamangalam		f	f	20
1678	Kottakkal		f	f	20
1679	Kottarakkara		f	f	20
1680	Kottayam		f	f	20
1681	Kunnathukkal		f	f	20
1682	Kuruppanthura		f	f	20
1683	Kuthuparambu		f	f	20
1684	Kuttoor		f	f	20
1685	Madhavapuram		f	f	20
1686	Malampuzha		f	f	20
1687	Maloor		f	f	20
1688	Manathavady		f	f	20
1689	Manjeri		f	f	20
1690	Manjeswaram		f	f	20
1691	Mannar		f	f	20
1692	Maranelloor		f	f	20
1693	Mattathur		f	f	20
1694	Mazhuvannur		f	f	20
1695	Moovattupuzha		f	f	20
1696	Mukkom		f	f	20
1697	Munnar		f	f	20
1698	Nedumangadu		f	f	20
1699	Nedumkandam		f	f	20
1700	Neeleswaram		f	f	20
1701	Neyyatinkara		f	f	20
1702	North Paravur		f	f	20
1703	Omalloor		f	f	20
1704	Pala		f	f	20
1705	Palakkad		f	f	20
1706	Palayam		f	f	20
1707	Palayamangalam		f	f	20
1708	Pampady		f	f	20
1709	Panancheri		f	f	20
1710	Pandalam		f	f	20
1711	Parakkodu		f	f	20
1712	Parappanangadi		f	f	20
1713	Parassala		f	f	20
1714	Pariyaram		f	f	20
1715	Pattambi		f	f	20
1716	Pavaratty		f	f	20
1717	Payyannur		f	f	20
1718	Pazhayannur		f	f	20
1719	Perambra		f	f	20
1720	Perinthalmanna		f	f	20
1721	Perumbavoor		f	f	20
1722	Piravam		f	f	20
1723	Pothencode		f	f	20
1724	Pramadom		f	f	20
1725	Pulpally		f	f	20
1726	Punalur		f	f	20
1727	Puramattom		f	f	20
1728	Quilandy		f	f	20
1729	Ranniangadi		f	f	20
1730	Sasthamkotta		f	f	20
1731	Sultan bathery		f	f	20
1732	Taliparamba		f	f	20
1733	Thalasserry		f	f	20
1734	Thalayolaparambu		f	f	20
1735	Thamarassery		f	f	20
1736	Thirurrangadi		f	f	20
1737	Thiruvananthapuram		f	f	20
1738	Thodupuzha		f	f	20
1739	Thompramkudi		f	f	20
1740	Thrippunithura		f	f	20
1741	Thrissur		f	f	20
1742	Vadakara		f	f	20
1743	vadakarapathy		f	f	20
1744	Vadakkenchery		f	f	20
1745	Vamanapuram		f	f	20
1746	Vandiperiyar		f	f	20
1747	Vengeri(Kozhikode)		f	f	20
1748	Vithinasserri		f	f	20
1749	Wadakkanchery		f	f	20
1750	Kavaratti		f	f	21
1751	A lot		f	f	22
1752	Agar		f	f	22
1753	Ajaygarh		f	f	22
1754	Akodia		f	f	22
1755	Akodiya		f	f	22
1756	Alampur		f	f	22
1757	Alirajpur		f	f	22
1758	Alirajpur(F&V)		f	f	22
1759	Amarpatan		f	f	22
1760	Amarwda		f	f	22
1761	Ambaha		f	f	22
1762	Anjad		f	f	22
1763	Anuppur		f	f	22
1764	Aron		f	f	22
1765	Ashoknagar		f	f	22
1766	Ashoknagar(F&V)		f	f	22
1767	Ashta		f	f	22
1768	Babai		f	f	22
1769	Badamalhera		f	f	22
1770	Badarwas		f	f	22
1771	Badnagar		f	f	22
1772	Badnawar		f	f	22
1773	Badnawar(F&V)		f	f	22
1774	Badod		f	f	22
1775	Badwaha		f	f	22
1776	Badwani		f	f	22
1777	Bagli		f	f	22
1778	Baikunthpur		f	f	22
1779	Bakswaha		f	f	22
1780	Baktara		f	f	22
1781	Balaghat		f	f	22
1782	Balaghat(F&V)		f	f	22
1783	Balwadi		f	f	22
1784	Bamora		f	f	22
1785	Banapura		f	f	22
1786	Banda		f	f	22
1787	Bankhedi		f	f	22
1788	Banmorkalan		f	f	22
1789	Barad		f	f	22
1790	Bareli		f	f	22
1791	Barghat		f	f	22
1792	Begamganj		f	f	22
1793	Beohari		f	f	22
1794	Berachha		f	f	22
1795	Berasia		f	f	22
1796	Betul		f	f	22
1797	Bhander		f	f	22
1798	Bhanpura		f	f	22
1799	Bhensdehi		f	f	22
1800	Bhikangaon		f	f	22
1801	Bhind		f	f	22
1802	Bhind(F&V)		f	f	22
1803	Bhitarwar		f	f	22
1804	Bhopal		f	f	22
1805	Bhopal(F&V)		f	f	22
1806	Biaora		f	f	22
1807	Bichhiya		f	f	22
1808	Bijawar		f	f	22
1809	Bina		f	f	22
1810	Binaganj		f	f	22
1811	Budhar		f	f	22
1812	Burhanpur		f	f	22
1813	Burhanpur(F&V)		f	f	22
1814	Chaakghat		f	f	22
1815	Chanderi		f	f	22
1816	Chaurai		f	f	22
1817	Chhapiheda		f	f	22
1818	Chhatarpur		f	f	22
1819	Chhindwara		f	f	22
1820	Chhindwara(F&V)		f	f	22
1821	Chhpara		f	f	22
1822	Dabra		f	f	22
1823	Daloda		f	f	22
1824	Damoh		f	f	22
1825	Damoh(F&V)		f	f	22
1826	Datia		f	f	22
1827	Deori		f	f	22
1828	Devandranagar		f	f	22
1829	Dewas		f	f	22
1830	Dewas(F&V)		f	f	22
1831	Dhamnod		f	f	22
1832	Dhar		f	f	22
1833	Dhar(F&V)		f	f	22
1834	Dindori		f	f	22
1835	Gadarwada		f	f	22
1836	Gairatganj		f	f	22
1837	Gandhwani		f	f	22
1838	Ganjbasoda		f	f	22
1839	Garhakota		f	f	22
1840	Garoth		f	f	22
1841	Gautampura		f	f	22
1842	Ghansour		f	f	22
1843	Gohad		f	f	22
1844	Gorakhpur		f	f	22
1845	Gotegaon		f	f	22
1846	Gulabganj		f	f	22
1847	Guna		f	f	22
1848	Guna(F&V)		f	f	22
1849	Haatpipliya		f	f	22
1850	Hanumana		f	f	22
1851	Harda		f	f	22
1852	Harda(F&V)		f	f	22
1853	Harpalpur		f	f	22
1854	Harsood		f	f	22
1855	Hata		f	f	22
1856	Hoshangabad		f	f	22
1857	Ichhawar		f	f	22
1858	Indore		f	f	22
1859	Indore(F&V)		f	f	22
1860	Isagarh		f	f	22
1861	Itarsi		f	f	22
1862	Jabalpur		f	f	22
1863	Jabalpur(F&V)		f	f	22
1864	Jaisinagar		f	f	22
1865	Jaithari		f	f	22
1866	Jaora		f	f	22
1867	Jatara		f	f	22
1868	Javad		f	f	22
1869	Javera		f	f	22
1870	Jawar		f	f	22
1871	Jeerapur		f	f	22
1872	Jhabua		f	f	22
1873	Jobat		f	f	22
1874	Jora		f	f	22
1875	Kailaras		f	f	22
1876	Kalapipal		f	f	22
1877	Kannod		f	f	22
1878	Kareli		f	f	22
1879	Karera		f	f	22
1880	Karhi		f	f	22
1881	Kasrawad		f	f	22
1882	Katangi		f	f	22
1883	Katni		f	f	22
1884	Katni(F&V)		f	f	22
1885	Keolari		f	f	22
1886	Kesli		f	f	22
1887	Khachrod		f	f	22
1888	Khairlangi		f	f	22
1889	Khandwa		f	f	22
1890	Khandwa(F&V)		f	f	22
1891	Khaniadhana		f	f	22
1892	Khanyadhana		f	f	22
1893	Khargapur		f	f	22
1894	Khargone		f	f	22
1895	Khategaon		f	f	22
1896	Khatora		f	f	22
1897	Khetia		f	f	22
1898	Khilchipur		f	f	22
1899	Khirakiya		f	f	22
1900	Khujner		f	f	22
1901	Khurai		f	f	22
1902	Kolaras		f	f	22
1903	Kotma		f	f	22
1904	Kukshi		f	f	22
1905	Kumbhraj		f	f	22
1906	Kurawar		f	f	22
1907	Kurwai		f	f	22
1908	Lahar		f	f	22
1909	Lakhnadon		f	f	22
1910	Lakhnadon(F&V)		f	f	22
1911	Lalbarra		f	f	22
1912	Lashkar		f	f	22
1913	Lashkar(F&V)		f	f	22
1914	Lateri		f	f	22
1915	LavKush Nagar(Laundi)		f	f	22
1916	Loharda		f	f	22
1917	Machalpur		f	f	22
1918	Magroni		f	f	22
1919	Mahidpur		f	f	22
1920	Maksi		f	f	22
1921	Maksudangarh		f	f	22
1922	Malthone		f	f	22
1923	Manasa		f	f	22
1924	Manawar		f	f	22
1925	Mandla		f	f	22
1926	Mandsaur		f	f	22
1927	Mandsaur(F&V)		f	f	22
1928	Mehar		f	f	22
1929	Mehgaon		f	f	22
1930	Mhow		f	f	22
1931	Mohgaon		f	f	22
1932	Momanbadodiya		f	f	22
1933	Morena		f	f	22
1934	Morena(F&V)		f	f	22
1935	Mow		f	f	22
1936	Multai		f	f	22
1937	Mungawali		f	f	22
1938	Nagda		f	f	22
1939	Nagod		f	f	22
1940	Nainpur		f	f	22
1941	Nalkehda		f	f	22
1942	Narsinghgarh		f	f	22
1943	Narsinghpur		f	f	22
1944	Nasrullaganj		f	f	22
1945	Naugaon		f	f	22
1946	Neemuch		f	f	22
1947	Niwadi		f	f	22
1948	Niwadi(F&V)		f	f	22
1949	Obedullaganj		f	f	22
1950	Paatan		f	f	22
1951	Pachaur		f	f	22
1952	Palari		f	f	22
1953	Palera		f	f	22
1954	Pandhana		f	f	22
1955	Pandhana(F&V)		f	f	22
1956	Pandhurna		f	f	22
1957	Pandhurna(F&V)		f	f	22
1958	Panna		f	f	22
1959	Patharia		f	f	22
1960	Pawai		f	f	22
1961	Petlawad		f	f	22
1962	Pichhour		f	f	22
1963	Pipariya		f	f	22
1964	Piplya		f	f	22
1965	Piprai		f	f	22
1966	Pohari		f	f	22
1967	Porsa		f	f	22
1968	Porsa(F&V)		f	f	22
1969	Praswada		f	f	22
1970	Prithvipur		f	f	22
1971	Raghogarh		f	f	22
1972	Rahatgarh		f	f	22
1973	Raisen		f	f	22
1974	Rajgarh		f	f	22
1975	Rajnagar		f	f	22
1976	Ramnagar		f	f	22
1977	Rannod		f	f	22
1978	Ratlam		f	f	22
1979	Ratlam(F&V)		f	f	22
1980	Rehati		f	f	22
1981	Rehli		f	f	22
1982	Rewa		f	f	22
1983	Sabalgarh		f	f	22
1984	Sagar		f	f	22
1985	Sagar(F&V)		f	f	22
1986	Sailana		f	f	22
1987	Sajapur		f	f	22
1988	Sanawad		f	f	22
1989	Sanwer		f	f	22
1990	Sarangpur		f	f	22
1991	Satna		f	f	22
1992	Satna(F&V)		f	f	22
1993	Saunsar		f	f	22
1994	Saunsar (F&V)		f	f	22
1995	Segaon		f	f	22
1996	Sehora		f	f	22
1997	Sehore		f	f	22
1998	Semriharchand		f	f	22
1999	Sendhwa		f	f	22
2000	Seoni		f	f	22
2001	Sevda		f	f	22
2002	Shadora		f	f	22
2003	Shahagarh		f	f	22
2004	Shahdol		f	f	22
2005	Shahpura		f	f	22
2006	Shahpura Bhitoni (F&V)		f	f	22
2007	Shahpura(Jabalpur)		f	f	22
2008	Shajapur		f	f	22
2009	Shajapur(F&V)		f	f	22
2010	Shamgarh		f	f	22
2011	Shamgarh(F&V)		f	f	22
2012	Shamshabad		f	f	22
2013	Sheopurbadod		f	f	22
2014	Sheopurkalan		f	f	22
2015	Shivpuri		f	f	22
2016	Shivpuri(F&V)		f	f	22
2017	Shujalpur		f	f	22
2018	Shyampur		f	f	22
2019	Sidhi		f	f	22
2020	Sihora		f	f	22
2021	Sihora(F&V)		f	f	22
2022	Silvani		f	f	22
2023	Simariya		f	f	22
2024	Singroli		f	f	22
2025	Sirali		f	f	22
2026	Sironj		f	f	22
2027	Sitmau		f	f	22
2028	Sonkatch		f	f	22
2029	Soyatkalan		f	f	22
2030	Susner		f	f	22
2031	Suthalia		f	f	22
2032	Suvasra		f	f	22
2033	Syopurkalan(F&V)		f	f	22
2034	Taal		f	f	22
2035	Tarana		f	f	22
2036	Tendukheda		f	f	22
2037	Thandla		f	f	22
2038	Tikamgarh		f	f	22
2039	Timarni		f	f	22
2040	Udaipura		f	f	22
2041	Ujjain		f	f	22
2042	Ujjain(F&V)		f	f	22
2043	Umariya		f	f	22
2044	Unhel		f	f	22
2045	Varaseoni		f	f	22
2046	Vidisha		f	f	22
2047	Vijaypur		f	f	22
2048	Aarni		f	f	23
2049	Aatpadi		f	f	23
2050	Achalpur		f	f	23
2051	Aheri		f	f	23
2052	Ahmednagar		f	f	23
2053	Ahmedpur		f	f	23
2054	Akhadabalapur		f	f	23
2055	Akkalkot		f	f	23
2056	Akkalkuwa		f	f	23
2057	Akluj		f	f	23
2058	Akola		f	f	23
2059	Akola(Borgaon Manju)		f	f	23
2060	Akole		f	f	23
2061	Akot		f	f	23
2062	Alibagh		f	f	23
2063	All India Cottonseed Crushers Association		f	f	23
2064	Amalner		f	f	23
2065	Amarawati		f	f	23
2066	Ambad (Vadigodri)		f	f	23
2067	Ambejaogai		f	f	23
2068	Amgaon		f	f	23
2069	Amrawati(Frui & Veg. Market)		f	f	23
2070	Anajngaon		f	f	23
2071	Arjuni		f	f	23
2072	Armori		f	f	23
2073	Armori(Desaiganj)		f	f	23
2074	Arvi		f	f	23
2075	Ashti		f	f	23
2076	Ashti(Jalna)		f	f	23
2077	Ashti(Karanja)		f	f	23
2078	Aurad Shahajani		f	f	23
2079	Aurangabad		f	f	23
2080	Ausa		f	f	23
2081	Babhulgaon		f	f	23
2082	Balapur		f	f	23
2083	Baramati		f	f	23
2084	Barshi		f	f	23
2085	Barshi Takli		f	f	23
2086	Barshi(Vairag)		f	f	23
2087	Basmat		f	f	23
2088	Basmat(Kurunda)		f	f	23
2089	Baswant		f	f	23
2090	Beed		f	f	23
2091	Bhadrawati		f	f	23
2092	Bhandara		f	f	23
2093	Bhivandi		f	f	23
2094	Bhiwapur		f	f	23
2095	Bhokar		f	f	23
2096	Bhokardan		f	f	23
2097	Bhokardan(Pimpalgaon Renu)		f	f	23
2098	Bhoom		f	f	23
2099	Bhor		f	f	23
2100	Bhusaval		f	f	23
2101	Biloli		f	f	23
2102	Bodwad		f	f	23
2103	Bodwad(Varangaon)		f	f	23
2104	Bori		f	f	23
2105	Bori Arab		f	f	23
2106	Brahmpuri		f	f	23
2107	Buldhana		f	f	23
2108	Buldhana(Dhad)		f	f	23
2109	Chakur		f	f	23
2110	Chalisgaon		f	f	23
2111	Chamorshi		f	f	23
2112	Chandrapur		f	f	23
2113	Chandrapur(Ganjwad)		f	f	23
2114	Chandur Bazar		f	f	23
2115	Chandur Railway		f	f	23
2116	Chandvad		f	f	23
2117	Chikali		f	f	23
2118	Chimur		f	f	23
2119	Chopada		f	f	23
2120	Dahanu		f	f	23
2121	Dahivadi		f	f	23
2122	Darwha		f	f	23
2123	Daryapur		f	f	23
2124	Deglur		f	f	23
2125	Deoulgaon Raja		f	f	23
2126	Devala		f	f	23
2127	Devani		f	f	23
2128	Devri		f	f	23
2129	Dhadgaon		f	f	23
2130	Dhamngaon-Railway		f	f	23
2131	Dharangaon		f	f	23
2132	Dharmabad		f	f	23
2133	Dharni		f	f	23
2134	Dhule		f	f	23
2135	Digras		f	f	23
2136	Dindori		f	f	23
2137	Dindori(Vani)		f	f	23
2138	Dondaicha		f	f	23
2139	Dondaicha(Sindhkheda)		f	f	23
2140	Dound		f	f	23
2141	Dudhani		f	f	23
2142	Fruit Market		f	f	23
2143	Fulmbri		f	f	23
2144	Gadhinglaj		f	f	23
2145	Gandchiroli		f	f	23
2146	Gangakhed		f	f	23
2147	Gangapur		f	f	23
2148	Gevrai		f	f	23
2149	Ghansawangi		f	f	23
2150	Ghatanji		f	f	23
2151	Ghoti		f	f	23
2152	Gondiya		f	f	23
2153	Gondpimpri		f	f	23
2154	Goregaon		f	f	23
2155	Hadgaon		f	f	23
2156	Hadgaon(Tamsa)		f	f	23
2157	Hanegaon		f	f	23
2158	Himalyatnagar		f	f	23
2159	Hinganghat		f	f	23
2160	Hingna		f	f	23
2161	Hingoli		f	f	23
2162	Hingoli(Kanegoan Naka)		f	f	23
2163	Indapur		f	f	23
2164	Indapur(Bhigwan)		f	f	23
2165	Indapur(Nimgaon Ketki)		f	f	23
2166	Islampur		f	f	23
2167	Islapur		f	f	23
2168	Jafrabad		f	f	23
2169	Jalana		f	f	23
2170	Jalgaon		f	f	23
2171	Jalgaon Jamod(Aasalgaon)		f	f	23
2172	Jalgaon(Jamod)		f	f	23
2173	Jalgaon(Masawat)		f	f	23
2174	Jalkot		f	f	23
2175	Jalna(Badnapur)		f	f	23
2176	Jamkhed		f	f	23
2177	Jamner		f	f	23
2178	Jamner(Neri)		f	f	23
2179	Jawala-Bajar		f	f	23
2180	Jawali		f	f	23
2181	Jaysingpur		f	f	23
2182	Jintur		f	f	23
2183	Jintur(Bori)		f	f	23
2184	Junnar		f	f	23
2185	Junnar(Alephata)		f	f	23
2186	Junnar(Bhlhe)		f	f	23
2187	Junnar(Narayangaon)		f	f	23
2188	Junnar(Otur)		f	f	23
2189	Kada		f	f	23
2190	Kada(Ashti)		f	f	23
2191	Kaij		f	f	23
2192	Kalamb		f	f	23
2193	Kalamb(Osmanabad)		f	f	23
2194	Kalamnuri		f	f	23
2195	Kalmeshwar		f	f	23
2196	Kalvan		f	f	23
2197	Kalyan		f	f	23
2198	Kalyan(Cattle Market)		f	f	23
2199	Kamthi		f	f	23
2200	Kandhar		f	f	23
2201	Kannad		f	f	23
2202	Karad		f	f	23
2203	Karanja		f	f	23
2204	Karjat		f	f	23
2205	Karjat(Raigad)		f	f	23
2206	Karjat(Rashin)		f	f	23
2207	Karmala		f	f	23
2208	Katol		f	f	23
2209	Khalanpur		f	f	23
2210	Khamgaon		f	f	23
2211	Khed		f	f	23
2212	Khed(Chakan)		f	f	23
2213	Khed(Shel Pimpalgaon)		f	f	23
2214	Khultabad		f	f	23
2215	Kille Dharur		f	f	23
2216	Kinwat		f	f	23
2217	Kolhapur		f	f	23
2218	Kolhapur(Laxmipuri)		f	f	23
2219	Kolhapur(Malkapur)		f	f	23
2220	Kopargaon		f	f	23
2221	Koregaon		f	f	23
2222	Korpana		f	f	23
2223	Kundalwadi		f	f	23
2224	Kuntur		f	f	23
2225	Kurdwadi		f	f	23
2226	Kurdwadi(Modnimb)		f	f	23
2227	Lakhandur		f	f	23
2228	Lakhani		f	f	23
2229	Lasalgaon		f	f	23
2230	Lasalgaon(Niphad)		f	f	23
2231	Lasalgaon(Vinchur)		f	f	23
2232	Lasur Station		f	f	23
2233	Latur		f	f	23
2234	Latur(Murud)		f	f	23
2235	Loha		f	f	23
2236	Lohara		f	f	23
2237	Lonand		f	f	23
2238	Lonar		f	f	23
2239	Maanachar		f	f	23
2240	Mahad		f	f	23
2241	Mahagaon		f	f	23
2242	Mahur		f	f	23
2243	Majalgaon		f	f	23
2244	Malegaon		f	f	23
2245	Malegaon(Umarane)		f	f	23
2246	Malegaon(Vashim)		f	f	23
2247	Malkapur		f	f	23
2248	Mandhal		f	f	23
2249	Mangal Wedha		f	f	23
2250	Mangaon		f	f	23
2251	Mangrulpeer		f	f	23
2252	Manmad		f	f	23
2253	Manora		f	f	23
2254	Mantha		f	f	23
2255	Manwat		f	f	23
2256	Maregoan		f	f	23
2257	Mauda		f	f	23
2258	Mehekar		f	f	23
2259	Mohol		f	f	23
2260	Morshi		f	f	23
2261	Motala		f	f	23
2262	Mudkhed		f	f	23
2263	Mukhed		f	f	23
2264	Mukhed(Mukkambad)		f	f	23
2265	Mul		f	f	23
2266	Mulshi		f	f	23
2267	Mumbai		f	f	23
2268	Murbad		f	f	23
2269	Murim		f	f	23
2270	Murtizapur		f	f	23
2271	Murud		f	f	23
2272	Nagbhid		f	f	23
2273	Nagpur		f	f	23
2274	Nagpur(Hingna)		f	f	23
2275	Nagpur(Mahatma Phule Market)		f	f	23
2276	Naigaon		f	f	23
2277	Nampur		f	f	23
2278	Nanded		f	f	23
2279	Nandgaon		f	f	23
2280	Nandubar(Koparli)		f	f	23
2281	Nandura		f	f	23
2282	Nandurbar		f	f	23
2283	Nanggaon		f	f	23
2284	Narkhed		f	f	23
2285	Nashik(Devlali)		f	f	23
2286	Nasik		f	f	23
2287	Navapur		f	f	23
2288	Ner Parasopant		f	f	23
2289	Newasa		f	f	23
2290	Newasa(Ghodegaon)		f	f	23
2291	Nilanga		f	f	23
2292	Nira		f	f	23
2293	Nira(Saswad)		f	f	23
2294	Osmanabad		f	f	23
2295	Pachora		f	f	23
2296	Pachora(Bhadgaon)		f	f	23
2297	Paithan		f	f	23
2298	Palam		f	f	23
2299	Palghar		f	f	23
2300	Palthan		f	f	23
2301	Palus		f	f	23
2302	Pandhakawada		f	f	23
2303	Pandharpur		f	f	23
2304	Panvel		f	f	23
2305	Parali Vaijyanath		f	f	23
2306	Paranda		f	f	23
2307	Parbhani		f	f	23
2308	Parner		f	f	23
2309	Parola		f	f	23
2310	Parshiwani		f	f	23
2311	Partur		f	f	23
2312	Partur(Vatur)		f	f	23
2313	Patan		f	f	23
2314	Pathardi		f	f	23
2315	Pathari		f	f	23
2316	Patoda		f	f	23
2317	Patur		f	f	23
2318	Pavani		f	f	23
2319	Pen		f	f	23
2320	Pimpalgaon		f	f	23
2321	Pimpalgaon Baswant(Saykheda)		f	f	23
2322	Pombhurni		f	f	23
2323	Pulgaon		f	f	23
2324	Pune		f	f	23
2325	Pune(Hadapsar)		f	f	23
2326	Pune(Khadiki)		f	f	23
2327	Pune(Manjri)		f	f	23
2328	Pune(Moshi)		f	f	23
2329	Pune(Pimpri)		f	f	23
2330	Purna		f	f	23
2331	Pusad		f	f	23
2332	Rahata		f	f	23
2333	Rahuri		f	f	23
2334	Rahuri(Songaon)		f	f	23
2335	Rahuri(Vambori)		f	f	23
2336	Rajura		f	f	23
2337	Ralegaon		f	f	23
2338	Ramtek		f	f	23
2339	Ratnagiri (Nachane)		f	f	23
2340	Raver		f	f	23
2341	Raver(Sauda)		f	f	23
2342	Renapur		f	f	23
2343	Risod		f	f	23
2344	Roha		f	f	23
2345	Sadak Arjuni		f	f	23
2346	Sakri		f	f	23
2347	Samudrapur		f	f	23
2348	Sangamner		f	f	23
2349	Sangli		f	f	23
2350	Sangli(Miraj)		f	f	23
2351	Sangli(Phale, Bhajipura Market)		f	f	23
2352	Sangola		f	f	23
2353	Sangrampur		f	f	23
2354	Sangrampur(Varvatbakal)		f	f	23
2355	Satana		f	f	23
2356	Satara		f	f	23
2357	Savali		f	f	23
2358	Savner		f	f	23
2359	Selu		f	f	23
2360	Sengoan		f	f	23
2361	Shahada		f	f	23
2362	Shahapur		f	f	23
2363	Shegaon		f	f	23
2364	Shevgaon		f	f	23
2365	Shevgaon(Bodhegaon)		f	f	23
2366	Shirala		f	f	23
2367	Shirpur		f	f	23
2368	Shirur		f	f	23
2369	Shirur Anantpal		f	f	23
2370	Shrigonda		f	f	23
2371	Shrigonda(Gogargaon)		f	f	23
2372	Shrirampur		f	f	23
2373	Shrirampur(Belapur)		f	f	23
2374	Sillod		f	f	23
2375	Sillod(Bharadi)		f	f	23
2376	Sindevahi		f	f	23
2377	Sindhudurg		f	f	23
2378	Sindi		f	f	23
2379	Sindi(Selu)		f	f	23
2380	Sindkhed Raja		f	f	23
2381	Sinner		f	f	23
2382	Sironcha		f	f	23
2383	Sirsam		f	f	23
2384	Solapur		f	f	23
2385	Sonpeth		f	f	23
2386	Soygaon		f	f	23
2387	Suragana		f	f	23
2388	Tadkalas		f	f	23
2389	Talegaon Dabhade		f	f	23
2390	Taloda		f	f	23
2391	Tasgaon		f	f	23
2392	Telhara		f	f	23
2393	Thane Market		f	f	23
2394	Tiroda		f	f	23
2395	Tiwasa		f	f	23
2396	Tuljapur		f	f	23
2397	Tumsar		f	f	23
2398	Udgir		f	f	23
2399	Udgir(Devanibud)		f	f	23
2400	Udgir(Hali)		f	f	23
2401	Ulhasnagar		f	f	23
2402	Umared		f	f	23
2403	Umarga		f	f	23
2404	Umari		f	f	23
2405	Umarked(Danki)		f	f	23
2406	Umarkhed		f	f	23
2407	Umrane		f	f	23
2408	Vadgaonpeth		f	f	23
2409	Vaduj		f	f	23
2410	Vadvani		f	f	23
2411	Vai		f	f	23
2412	Vaijpur		f	f	23
2413	Vani		f	f	23
2414	Varora		f	f	23
2415	Varud		f	f	23
2416	Varud(Rajura Bazar)		f	f	23
2417	Vasai		f	f	23
2418	Vashi New Mumbai		f	f	23
2419	Vita		f	f	23
2420	Wardha		f	f	23
2421	Washi(Thane Market)		f	f	23
2422	Washim		f	f	23
2423	Washim(Ansing)		f	f	23
2424	Yawal		f	f	23
2425	Yeola		f	f	23
2426	Yeotmal		f	f	23
2427	ZariZamini		f	f	23
2428	Bishenpur		f	f	24
2429	Imphal		f	f	24
2430	Lamlong Bazaar		f	f	24
2431	Moreh		f	f	24
2432	Thoubal		f	f	24
2433	Amlarem		f	f	25
2434	Ampati		f	f	25
2435	Baghmara		f	f	25
2436	Dadengiri		f	f	25
2437	Dawki		f	f	25
2438	Garobadha		f	f	25
2439	Gasuapara		f	f	25
2440	Jowai		f	f	25
2441	Khliehriat		f	f	25
2442	Laskein		f	f	25
2443	Mawiong Regulated Market		f	f	25
2444	Mawkyrwat		f	f	25
2445	Nongpoh (R-Bhoi)		f	f	25
2446	Nongstoin		f	f	25
2447	Rongram		f	f	25
2448	Shillong		f	f	25
2449	Sohra		f	f	25
2450	Tura		f	f	25
2451	Wahiajer		f	f	25
2452	Williamnagar		f	f	25
2453	Bairabi		f	f	26
2454	Champhai		f	f	26
2455	Dawrpuri		f	f	26
2456	Kanhmun		f	f	26
2457	Kolasib		f	f	26
2458	Lungli		f	f	26
2459	Mission		f	f	26
2460	New Market Aizawl		f	f	26
2461	Serchhip		f	f	26
2462	Super Market Lungli (Bara Bazar)		f	f	26
2463	Vairengte		f	f	26
2464	4th Mile Dimapur		f	f	27
2465	Aizuto		f	f	27
2466	Baghry		f	f	27
2467	Dimapur		f	f	27
2468	Ghathashi		f	f	27
2469	Jalukie		f	f	27
2470	Khuzama		f	f	27
2471	Kipheri		f	f	27
2472	Kohima		f	f	27
2473	Kuhuboto		f	f	27
2474	Longleng		f	f	27
2475	Mangkolemba		f	f	27
2476	Mokokchung Town		f	f	27
2477	Naginimora		f	f	27
2478	Niuland		f	f	27
2479	Pfatsero		f	f	27
2480	Phek		f	f	27
2481	Tenning		f	f	27
2482	Tseminyu		f	f	27
2483	Tuensang		f	f	27
2484	Tuli		f	f	27
2485	Wokha Town		f	f	27
2486	Zunheboto		f	f	27
2487	Fish,Poultry & Egg Market, Gazipur		f	f	2
2488	Flower Market, Canaught Place(Pr. Yard,Mehrauli)		f	f	2
2489	Flower Market, Fatehpuri(Principal Yard, Mehrauli)		f	f	2
2490	Flower Market,Gazipur		f	f	2
2491	Fodder Market, Mangolpuri		f	f	2
2492	Khoya Market, Kashmiri Gate		f	f	2
2493	Najafgarh		f	f	2
2494	Narela		f	f	2
2495	Anandapur		f	f	4
2496	Damana Hat		f	f	4
2497	Dumal		f	f	4
2498	Gabadkunda		f	f	4
2499	Garadipanchan		f	f	4
2500	Gosala		f	f	4
2501	Jagatsinghpur		f	f	4
2502	Jatni		f	f	4
2503	Jharsuguda		f	f	4
2504	Karanjia		f	f	4
2505	Nabarangpur(Umerkote)		f	f	4
2506	Pratap Rudrapur		f	f	4
2507	Puri(Brahmagiri)		f	f	4
2508	Rahama		f	f	4
2509	Rayagada		f	f	4
2510	Sakhigopal		f	f	4
2511	Tikabali		f	f	4
2512	Karaikal		f	f	28
2513	Madagadipet		f	f	28
2514	Thattanchavady		f	f	28
2515	Yanam		f	f	28
2516	Abohar		f	f	29
2517	Adampur		f	f	29
2518	Adampur(Bahodinpur)		f	f	29
2519	Adampur(Daroli Kalan)		f	f	29
2520	Ahemadpur		f	f	29
2521	Ahmedgarh		f	f	29
2522	Ajitwal		f	f	29
2523	Ajitwal (Chogawan)		f	f	29
2524	Ajitwal (Dala)		f	f	29
2525	Ajnala		f	f	29
2526	Ajnala (Sudhar)		f	f	29
2527	Alisher Kalan		f	f	29
2528	Amargarh		f	f	29
2529	Amloh		f	f	29
2530	Amloh(Gobind Garh Mandi)		f	f	29
2531	Amritsar		f	f	29
2532	Amritsar(Amritsar Mewa Mandi)		f	f	29
2533	Amritsar(Chehreta)		f	f	29
2534	Amritsar(Takharpura)		f	f	29
2535	Anandpur Sahib		f	f	29
2536	Atla Kalan		f	f	29
2537	Attari		f	f	29
2538	Badhni Kalan		f	f	29
2539	Badhni Kallan (Bilaspur)		f	f	29
2540	Badrukha		f	f	29
2541	Baghapurana		f	f	29
2542	Bakthgarh		f	f	29
2543	Balachaur		f	f	29
2544	Balianwali		f	f	29
2545	Bamial		f	f	29
2546	Banga		f	f	29
2547	Banga (Kataria)		f	f	29
2548	Bangowagi Kunjar		f	f	29
2549	Banur		f	f	29
2550	Banur (Kheragaju)		f	f	29
2551	Bareta		f	f	29
2552	Bariwala		f	f	29
2553	Barnala		f	f	29
2554	Bassi Pathana		f	f	29
2555	Bassi Pathana((Nanadpur Kalour)		f	f	29
2556	Batala		f	f	29
2557	Bathinda		f	f	29
2558	Behloor Kalan		f	f	29
2559	Behram		f	f	29
2560	Bhadaur		f	f	29
2561	Bhadaur(Sehna)		f	f	29
2562	Bhadson		f	f	29
2563	Bhagta Bhai Ka		f	f	29
2564	Bhagta Bhai Ka (Jalal)		f	f	29
2565	Bhagta Bhai Ka (Kalyansukha)		f	f	29
2566	Bhagta Bhai Ka(Kotha Guru Ka)		f	f	29
2567	Bhaini Mian Khan		f	f	29
2568	Bhawanigarh		f	f	29
2569	Bhawanigarh (Rampura)		f	f	29
2570	Bhikhi		f	f	29
2571	Bhikhiwind		f	f	29
2572	Bhikhiwind (Algo)		f	f	29
2573	Bhikhiwind (Basarke)		f	f	29
2574	Bhikhiwind (Marrimegha)		f	f	29
2575	Bhikhiwind (Sursingh)		f	f	29
2576	Bhikhiwind(Khalra)		f	f	29
2577	Bhindran		f	f	29
2578	Bhode Saprai		f	f	29
2579	Bhogpur		f	f	29
2580	Bhootgarh		f	f	29
2581	Bhotna		f	f	29
2582	Bhucho		f	f	29
2583	Bhulath		f	f	29
2584	Bhulath (Ibrahimaaaaval)		f	f	29
2585	Bhulath (Nadala)		f	f	29
2586	Bhundan		f	f	29
2587	Bilga		f	f	29
2588	Bilga (Talwan )		f	f	29
2589	Birewala Dogra		f	f	29
2590	Boha		f	f	29
2591	Budalada		f	f	29
2592	Budhlada (Phaphre Bhaike)		f	f	29
2593	Chabhal		f	f	29
2594	Chak Alisher		f	f	29
2595	Chamkaur Sahib		f	f	29
2596	Chamkaur Sahib (Bela)		f	f	29
2597	Chanarthal		f	f	29
2598	Chaudna		f	f	29
2599	Cheema		f	f	29
2600	Cheema (Lonogal)		f	f	29
2601	Chhajli		f	f	29
2602	Chogawan		f	f	29
2603	Chone		f	f	29
2604	Dakala		f	f	29
2605	Dalelwala		f	f	29
2606	Dasuya		f	f	29
2607	Dau Majra		f	f	29
2608	Deon		f	f	29
2609	Dera Baba Nanak		f	f	29
2610	Dera Bassi		f	f	29
2611	Dhadhrian		f	f	29
2612	Dhanaula		f	f	29
2613	Dhandoi		f	f	29
2614	Dhanula (Kaleke)		f	f	29
2615	Dharamkot		f	f	29
2616	Dhariwal		f	f	29
2617	Dhilwan		f	f	29
2618	Dhuri		f	f	29
2619	Dinanagar		f	f	29
2620	Dirba		f	f	29
2621	Doraha		f	f	29
2622	Doraha (Dhamot)		f	f	29
2623	Doraha (Payal)		f	f	29
2624	Dudhansadhan		f	f	29
2625	Duggan		f	f	29
2626	F.G.Churian		f	f	29
2627	Faridkot		f	f	29
2628	Faridkot (Kotsukhian)		f	f	29
2629	Faridkot (Machakikalan)		f	f	29
2630	Fatehgarh Panjtoor		f	f	29
2631	Fazilka		f	f	29
2632	Fazilka (Ladhuka)		f	f	29
2633	Ferozepur Cantt(Jhok Harihar)		f	f	29
2634	Ferozepur Cantt, (Sadehasham)		f	f	29
2635	Ferozepur Cantt.		f	f	29
2636	Firozepur City		f	f	29
2637	Gaggarpur		f	f	29
2638	Garh Shankar		f	f	29
2639	Garh Shankar(Mahalpur)		f	f	29
2640	GarhShankar (Kotfatuhi)		f	f	29
2641	Garhshankar(Saila Khurd)		f	f	29
2642	Gehal		f	f	29
2643	Gehri		f	f	29
2644	Gehri(Jandiala mandi)		f	f	29
2645	Ghabdan		f	f	29
2646	Ghanaur		f	f	29
2647	Giddarbaha		f	f	29
2648	Gidderpindi		f	f	29
2649	Goniana		f	f	29
2650	Goniana(Mehma Sarja)		f	f	29
2651	Goraya		f	f	29
2652	Gurdas Nangal		f	f	29
2653	Gurdaspur		f	f	29
2654	Gurm		f	f	29
2655	Guru Har Sahai		f	f	29
2656	Hanbran		f	f	29
2657	Harike		f	f	29
2658	Hathan		f	f	29
2659	Hathur		f	f	29
2660	Hoshiarpur		f	f	29
2661	Hoshiarpur(Chara Mandi)		f	f	29
2662	Hoshiarpur(Sham Churasi)		f	f	29
2663	Jagjitpura		f	f	29
2664	Jagraon		f	f	29
2665	Jaitu		f	f	29
2666	Jaitu(Bajakhana)		f	f	29
2667	Jalalabad		f	f	29
2668	Jalandhar Cantt (Jamshedpur Dana Mandi)		f	f	29
2669	Jalandhar Cantt(Hoshiarpur Road)		f	f	29
2670	Jalandhar Cantt.		f	f	29
2671	Jalandhar City		f	f	29
2672	Jalandhar City(Faintan Ganj)		f	f	29
2673	Jalandhar City(Jalandhar)		f	f	29
2674	Jalandhar City(Kartar Pur Dana mandi)		f	f	29
2675	Jamshere		f	f	29
2676	Jand Mangoli		f	f	29
2677	Jhunir		f	f	29
2678	Jollian		f	f	29
2679	Kahnuwan		f	f	29
2680	Kal Jharani		f	f	29
2681	Kala Afgana		f	f	29
2682	Kalanaur		f	f	29
2683	Kandhala guru		f	f	29
2684	Kang Khurd		f	f	29
2685	Kankwal Chahlan		f	f	29
2686	Kapurthala		f	f	29
2687	Katron		f	f	29
2688	Khadur Sahib		f	f	29
2689	Khadur Sahib(Fetehabad)		f	f	29
2690	Khamano		f	f	29
2691	Khamano (Sanghol)		f	f	29
2692	Khanauri		f	f	29
2693	Khanna		f	f	29
2694	Khanpur		f	f	29
2695	Kharar		f	f	29
2696	Khem karan		f	f	29
2697	Khemkaran (Amarkot)		f	f	29
2698	Khiali		f	f	29
2699	Khizrabad		f	f	29
2700	Khokhar		f	f	29
2701	Khokhar Khurd		f	f	29
2702	Kila Raipur		f	f	29
2703	Killa Raipur (Jodhan)		f	f	29
2704	Killi Nihal Singh Wala		f	f	29
2705	Kishangarh SS Wala		f	f	29
2706	Koreana		f	f	29
2707	Kot ise Khan		f	f	29
2708	Kot Santokh Rai		f	f	29
2709	Kotkapura		f	f	29
2710	Kukar pind		f	f	29
2711	kum Kalan		f	f	29
2712	Kunganwai		f	f	29
2713	Kurali		f	f	29
2714	Lairagaga		f	f	29
2715	lakhowal		f	f	29
2716	Laleana		f	f	29
2717	Lallton Kalan		f	f	29
2718	Lalru		f	f	29
2719	Lehra Gaga		f	f	29
2720	Lohian Khas		f	f	29
2721	Longowal		f	f	29
2722	Lout		f	f	29
2723	Ludhiana		f	f	29
2724	Ludhiana(Mandi gill Road)		f	f	29
2725	Ludhiana(Salem Tabri)		f	f	29
2726	Machhiwara		f	f	29
2727	Majitha		f	f	29
2728	Makha		f	f	29
2729	Makhu		f	f	29
2730	Malaoud (Siar)		f	f	29
2731	Malerkotla		f	f	29
2732	Malian kalan		f	f	29
2733	Mallanwala		f	f	29
2734	Mallanwala (KhosaDalSinghwala)		f	f	29
2735	Maloud		f	f	29
2736	Malout		f	f	29
2737	Malout (Kilianwali)		f	f	29
2738	Malout (Panniwala)		f	f	29
2739	Mamdot		f	f	29
2740	Mamdot(Tibbi Khurd)		f	f	29
2741	Mandi kalan		f	f	29
2742	Mandour		f	f	29
2743	Mansa		f	f	29
2744	Mansa (Bhamekalan)		f	f	29
2745	Mansa (Khiala kalan)		f	f	29
2746	Mansa(Ubha Buraj Dhilwan)		f	f	29
2747	Mansura		f	f	29
2748	Manvi		f	f	29
2749	Mari Buchain		f	f	29
2750	Marori		f	f	29
2751	Maru		f	f	29
2752	Maur		f	f	29
2753	Maur Maqsudan		f	f	29
2754	Mehal Kalan		f	f	29
2755	Mehal Kallan (ChananWal)		f	f	29
2756	Mehatpur		f	f	29
2757	Mehil Gehlan		f	f	29
2758	Mehta		f	f	29
2759	Moga		f	f	29
2760	Moga(Charik)		f	f	29
2761	Moga(Khosa Pando)		f	f	29
2762	Moga(Khukhrana)		f	f	29
2763	Moonak		f	f	29
2764	Morinda		f	f	29
2765	Mukerian		f	f	29
2766	Mukerian(Talwara)		f	f	29
2767	Muktsar		f	f	29
2768	Mullanpur		f	f	29
2769	Mullanpur Dakha (Sawadi)		f	f	29
2770	Nabha		f	f	29
2771	Nagra		f	f	29
2772	Nakodar		f	f	29
2773	Nakodar(Sarih)		f	f	29
2774	Namol		f	f	29
2775	Narot J Singh		f	f	29
2776	Nathea		f	f	29
2777	Naushera Pannua (Dhotian)		f	f	29
2778	Naushera Pannuan		f	f	29
2779	Nawan Shahar(Mandi Aur)		f	f	29
2780	Nawan Shahar(Mandi Jadla)		f	f	29
2781	Nawan Shahar(MandiRaho)		f	f	29
2782	Nawan Shahar(Subzi Mandi)		f	f	29
2783	Nawanshahar		f	f	29
2784	Nihal Singh Wala		f	f	29
2785	Nihal Singh Wala (Himmatpura)		f	f	29
2786	Nihal Singh Wala (Rautan)		f	f	29
2787	Noona		f	f	29
2788	Noor Mehal		f	f	29
2789	Noor Mehal(Kot Badal Khan)		f	f	29
2790	Nurpurbet		f	f	29
2791	Partappura(E)		f	f	29
2792	Pathankot		f	f	29
2793	Pathankot (Kanwa)		f	f	29
2794	Patiala		f	f	29
2795	Patiala(Anaj Mandi Sanaur Road)		f	f	29
2796	Patiala(New Anaj Mandi)		f	f	29
2797	Patran		f	f	29
2798	Patran(Ghagga Mandi)		f	f	29
2799	Patti		f	f	29
2800	Patti Multani		f	f	29
2801	Phagwara		f	f	29
2802	Phallarh		f	f	29
2803	Phambra		f	f	29
2804	Phillaur		f	f	29
2805	Phillaur(Apra Mandi)		f	f	29
2806	Pur		f	f	29
2807	Purain		f	f	29
2808	Quadian		f	f	29
2809	Raike Kalan		f	f	29
2810	Raikot		f	f	29
2811	Raikot (Nathowal)		f	f	29
2812	Raikot (Talwandi rai)		f	f	29
2813	Rajpura		f	f	29
2814	Raman		f	f	29
2815	Rampura Phul		f	f	29
2816	Rampuraphul(Bhai Rupan)		f	f	29
2817	Rampuraphul(Chowke)		f	f	29
2818	Rampuraphul(Dhapali)		f	f	29
2819	Rampuraphul(Mehraj)		f	f	29
2820	Rampuraphul(Nabha Mandi)		f	f	29
2821	Rayya		f	f	29
2822	Rayya(Sathiala)		f	f	29
2823	Reon Kalan		f	f	29
2824	Ropar		f	f	29
2825	Sadiq		f	f	29
2826	Sahnewal		f	f	29
2827	Samana		f	f	29
2828	Samana(Gajewas)		f	f	29
2829	Samana(Kakrala)		f	f	29
2830	Samrala		f	f	29
2831	Sandaur		f	f	29
2832	Sangat		f	f	29
2833	Sangowal		f	f	29
2834	Sangrur		f	f	29
2835	Sardargarh		f	f	29
2836	Sardulgarh		f	f	29
2837	Shahkot		f	f	29
2838	Shakot (Malsian)		f	f	29
2839	Sherpur		f	f	29
2840	Sidhwan Bet		f	f	29
2841	Sidhwan Bet (Lodhiwala)		f	f	29
2842	Sirhind		f	f	29
2843	Sri Har Gobindpur		f	f	29
2844	Sri Har Gobindpur(Harechowal)		f	f	29
2845	Sulargharat		f	f	29
2846	Sultanpur		f	f	29
2847	Sultanpur Lodhi (Tibba)		f	f	29
2848	Sunam		f	f	29
2849	Talwandi Bhai		f	f	29
2850	Talwandi Bhai(Mudki)		f	f	29
2851	Talwandi Sabo		f	f	29
2852	Talwandi Sabo(Kot Fatta)		f	f	29
2853	Talwandi Sabo(Shekhupura)		f	f	29
2854	Talwandi Sanghere		f	f	29
2855	Tanda UrMar (Miani mandi)		f	f	29
2856	Tanda Urmur		f	f	29
2857	Tapa		f	f	29
2858	Tapa(Sadar Bazar)		f	f	29
2859	Tapa(Tapa Mandi)		f	f	29
2860	Tarantaran		f	f	29
2861	Teoan Pujarian		f	f	29
2862	Udat Bhagta Ram		f	f	29
2863	Warsola		f	f	29
2864	Zira		f	f	29
2865	27-A		f	f	30
2866	50-GB		f	f	30
2867	Abu Road		f	f	30
2868	Ajmer (Grain)		f	f	30
2869	Ajmer(F&V)		f	f	30
2870	Aklera		f	f	30
2871	Akola		f	f	30
2872	Aligarh gon		f	f	30
2873	Alwar		f	f	30
2874	Alwar(FV)		f	f	30
2875	Anoopgarh		f	f	30
2876	Anta		f	f	30
2877	Ashpur		f	f	30
2878	Atru		f	f	30
2879	Atru(Kawai Salpura)		f	f	30
2880	Badi		f	f	30
2881	Badrisadri		f	f	30
2882	Bagru		f	f	30
2883	Bahdsora		f	f	30
2884	Bahrawandakhurd		f	f	30
2885	Bahroad		f	f	30
2886	Bajju		f	f	30
2887	Bakani		f	f	30
2888	Bali		f	f	30
2889	Balotra		f	f	30
2890	Bandikui		f	f	30
2891	Bandikui(Geejgarh)		f	f	30
2892	Bansi		f	f	30
2893	Bansoor		f	f	30
2894	Banswara		f	f	30
2895	Baran		f	f	30
2896	Baraodia		f	f	30
2897	Barmer		f	f	30
2898	Bassi		f	f	30
2899	Bayana		f	f	30
2900	Beawar		f	f	30
2901	Beenjhwaila		f	f	30
2902	Begu		f	f	30
2903	Behrampur Bodla		f	f	30
2904	Behror		f	f	30
2905	Bhadara		f	f	30
2906	Bhadesar		f	f	30
2907	Bhadoti		f	f	30
2908	Bharatpur		f	f	30
2909	Bharatpur(Kumer)		f	f	30
2910	Bhawani Mandi		f	f	30
2911	Bhawani Mandi(Choumehla)		f	f	30
2912	Bhawani Mandi(Raipur)		f	f	30
2913	Bheenmal(Ranlwada)		f	f	30
2914	Bhilwara		f	f	30
2915	Bhindsar		f	f	30
2916	Bhinmal		f	f	30
2917	Bhiya		f	f	30
2918	Bhuhana		f	f	30
2919	Bhusawar		f	f	30
2920	Bigod		f	f	30
2921	Bijay Nagar		f	f	30
2922	Bijolia		f	f	30
2923	Bikaner (Grain)		f	f	30
2924	Bikaner(F&V)		f	f	30
2925	Bikaner(Wool Mandi)		f	f	30
2926	Bilara		f	f	30
2927	Binjbayla		f	f	30
2928	Bisau		f	f	30
2929	Boli		f	f	30
2930	Bundi		f	f	30
2931	Chaksu		f	f	30
2932	Chechat		f	f	30
2933	Chhabra		f	f	30
2934	Chhabra(Chhipabadod)		f	f	30
2935	Chinch		f	f	30
2936	Chirwa		f	f	30
2937	Chitava		f	f	30
2938	Chittorgarh		f	f	30
2939	Chohtan		f	f	30
2940	Chomu		f	f	30
2941	Chomu(F&V)		f	f	30
2942	Choth ka barwara		f	f	30
2943	Choti Sadri		f	f	30
2944	Churu		f	f	30
2945	Dablirathan		f	f	30
2946	Dausa		f	f	30
2947	Deedwana		f	f	30
2948	Deedwana(Choti Khatu)		f	f	30
2949	Deeg		f	f	30
2950	Degana		f	f	30
2951	DEI(Bundi)		f	f	30
2952	Deoli		f	f	30
2953	Dhariyavad		f	f	30
2954	Dholpur		f	f	30
2955	Dhorimanna		f	f	30
2956	Dooni		f	f	30
2957	Dug		f	f	30
2958	Dun		f	f	30
2959	Dungargarh		f	f	30
2960	Dungarpur		f	f	30
2961	Dungla		f	f	30
2962	Fatehnagar		f	f	30
2963	Fatehpur		f	f	30
2964	Fefana		f	f	30
2965	Gadhi Pratapur		f	f	30
2966	Gajsinghpur		f	f	30
2967	Gangapur		f	f	30
2968	Gangapur City		f	f	30
2969	Gangapurcity(Old Lal mandi)		f	f	30
2970	Gangrar		f	f	30
2971	Gharsana		f	f	30
2972	Ghatol		f	f	30
2973	Goluwala		f	f	30
2974	Gopalgarh		f	f	30
2975	Govindgarh		f	f	30
2976	Guda(Godaji)		f	f	30
2977	Hanumangarh		f	f	30
2978	Hanumangarh Town		f	f	30
2979	Hanumangarh(Urlivas)		f	f	30
2980	Hindoli		f	f	30
2981	Hindoun		f	f	30
2982	Hirnawali		f	f	30
2983	Itawa		f	f	30
2984	Jaavda		f	f	30
2985	Jahajpur		f	f	30
2986	Jaipur (Grain)		f	f	30
2987	Jaipur(Bassi)		f	f	30
2988	Jaipur(F&V)		f	f	30
2989	Jaipur(Grain)(Chandpole)		f	f	30
2990	Jaipur(Grain)(Sodala)		f	f	30
2991	Jaisalmer		f	f	30
2992	Jaitaran		f	f	30
2993	Jaitsar		f	f	30
2994	Jakhrawali		f	f	30
2995	Jalore		f	f	30
2996	Janta Market		f	f	30
2997	Jayal		f	f	30
2998	Jhalarapatan		f	f	30
2999	Jhana chank		f	f	30
3000	Jhunjhunu		f	f	30
3001	Jodhewala		f	f	30
3002	Jodhpur (Grain)(Mandor)		f	f	30
3003	Jodhpur(F&V)(Bhadwasia)		f	f	30
3004	Jodhpur(F&V)(Paota)		f	f	30
3005	Jodhpur(Grain)(Bhagat Ki Kothi)		f	f	30
3006	Jodhpur(Grain)(Phalodi)		f	f	30
3007	Jurhera		f	f	30
3008	Kama		f	f	30
3009	Kapasan		f	f	30
3010	Kapren		f	f	30
3011	Karauli		f	f	30
3012	Kathumar		f	f	30
3013	Kekri		f	f	30
3014	Kesarisinghpur		f	f	30
3015	Keshoraipatan		f	f	30
3016	Khairthal		f	f	30
3017	Khajuwala		f	f	30
3018	Khandar		f	f	30
3019	Khanpur		f	f	30
3020	Khedh(Bodaramev)		f	f	30
3021	Khedli(laxmangarh)		f	f	30
3022	Kheenwsar		f	f	30
3023	Kherli		f	f	30
3024	Khetri		f	f	30
3025	Kishan Renwal(Fulera)		f	f	30
3026	Kishan Renwal(Sambhar)		f	f	30
3027	Kishangarh		f	f	30
3028	Kishangarh Renwal		f	f	30
3029	Kishangarhbas		f	f	30
3030	Kishanpura borda		f	f	30
3031	Kolayat		f	f	30
3032	Kota		f	f	30
3033	Kota (FV)		f	f	30
3034	Kota(Mandana)		f	f	30
3035	Kotdi		f	f	30
3036	Kotputli		f	f	30
3037	Kotputli(Pawla)		f	f	30
3038	Kuchaman City		f	f	30
3039	Kundanpur		f	f	30
3040	Ladhuwala		f	f	30
3041	Lakhasar		f	f	30
3042	Lakhia		f	f	30
3043	Lalgarh Jatan		f	f	30
3044	Lalsot		f	f	30
3045	Lalsot(Mandabari)		f	f	30
3046	Lathawali		f	f	30
3047	Lawan		f	f	30
3048	Loonkarnser		f	f	30
3049	Lunkaransar		f	f	30
3050	Madanganj Kishanganj		f	f	30
3051	Mahiyawali		f	f	30
3052	Mahua Mandabar(Mahua)		f	f	30
3053	Mahuwa Mandawar		f	f	30
3054	Malakhere		f	f	30
3055	Malpura		f	f	30
3056	Malpura(Todaraisingh)		f	f	30
3057	Mandalgarh		f	f	30
3058	Mangrole		f	f	30
3059	Manohararthana		f	f	30
3060	Mathania		f	f	30
3061	Merta City		f	f	30
3062	Mohangarh		f	f	30
3063	Moranjakhari		f	f	30
3064	Mukundgarh		f	f	30
3065	Nadoti		f	f	30
3066	Nadwai		f	f	30
3067	Nagar		f	f	30
3068	Nagaur		f	f	30
3069	Nagaur(Jayal)		f	f	30
3070	Nagour(FV)		f	f	30
3071	Naharawali		f	f	30
3072	Nahargarh		f	f	30
3073	Narayanpur		f	f	30
3074	Naseerabad		f	f	30
3075	Nawalgarh		f	f	30
3076	Neem Ka Thana		f	f	30
3077	Nikumbh		f	f	30
3078	Nimbahera		f	f	30
3079	Niwai		f	f	30
3080	Nohar		f	f	30
3081	Nokha		f	f	30
3082	Padampur		f	f	30
3083	Pahadai		f	f	30
3084	Pahari		f	f	30
3085	Pakkasarna		f	f	30
3086	Palaytha		f	f	30
3087	Pali		f	f	30
3088	Pallu		f	f	30
3089	Palsana		f	f	30
3090	Paniyawali		f	f	30
3091	Panwar		f	f	30
3092	Parsoli		f	f	30
3093	Patroda		f	f	30
3094	Pidawa		f	f	30
3095	Pilli Banga		f	f	30
3096	Pipar City		f	f	30
3097	Pirawa		f	f	30
3098	Pratapgarh		f	f	30
3099	Pugal Road Bikaner		f	f	30
3100	Rahsmi		f	f	30
3101	Raini		f	f	30
3102	Raisingh Nagar		f	f	30
3103	Rajasamand		f	f	30
3104	Rajdhani Mandi (Kukarkheda)		f	f	30
3105	Rajgarh		f	f	30
3106	Ramaganj Mandi		f	f	30
3107	Ramgang Mandi(Bapawarkala)		f	f	30
3108	Ramgang Mandi(Samod)		f	f	30
3109	Ramgarh		f	f	30
3110	Ramsara Jakhran		f	f	30
3111	Ramsingpur		f	f	30
3112	Rani		f	f	30
3113	Ratangarh		f	f	30
3114	Ratlai		f	f	30
3115	Rawatsar		f	f	30
3116	Rawla		f	f	30
3117	RD 36 5		f	f	30
3118	Ridmalsar		f	f	30
3119	Rolia		f	f	30
3120	Roopbas		f	f	30
3121	Sadulpur		f	f	30
3122	Sadulpur(ph 3)		f	f	30
3123	Sadulshahar		f	f	30
3124	Salumber		f	f	30
3125	Samejakothi		f	f	30
3126	Samraniyan		f	f	30
3127	Sanchor		f	f	30
3128	Sanganer		f	f	30
3129	Sangod		f	f	30
3130	Sangriya		f	f	30
3131	Sardar Shahar		f	f	30
3132	Sarolakalan		f	f	30
3133	Sarwar		f	f	30
3134	Sawai Madhopur		f	f	30
3135	Selempura		f	f	30
3136	Shahpura		f	f	30
3137	Sikar		f	f	30
3138	Sikri		f	f	30
3139	Siswali		f	f	30
3140	Sitapura		f	f	30
3141	Sojat City		f	f	30
3142	Sojat Road		f	f	30
3143	Sri Karanpur		f	f	30
3144	Sri Madhopur		f	f	30
3145	Sri Vijayanagar		f	f	30
3146	Sridungargarh		f	f	30
3147	Sriganganagar		f	f	30
3148	Sriganganagar(F&V)		f	f	30
3149	Sujangarh(Churu)		f	f	30
3150	Sujawalpur		f	f	30
3151	Sukhchainpura		f	f	30
3152	Sultanpur		f	f	30
3153	Sumerganj		f	f	30
3154	Sumerpur		f	f	30
3155	Surajgarh		f	f	30
3156	Suratgarh		f	f	30
3157	Talwara		f	f	30
3158	Talwara Jheel		f	f	30
3159	Tibbi		f	f	30
3160	Tijara		f	f	30
3161	Todabhim		f	f	30
3162	Todaraisingh		f	f	30
3163	Tonk		f	f	30
3164	Udaipur		f	f	30
3165	Udaipur(F&V)		f	f	30
3166	Uniyara		f	f	30
3167	Vallabhnagar		f	f	30
3168	Vijay Nagar(Gulabpura)		f	f	30
3169	Vinayak Krishi-Mandi Yard		f	f	30
3170	Weir		f	f	30
3171	Zerota		f	f	30
3172	East Shikkim		f	f	31
3173	Gangtok		f	f	31
3174	Gyalsing		f	f	31
3175	Kamling		f	f	31
3176	Mangan		f	f	31
3177	Melli		f	f	31
3178	Namchi		f	f	31
3179	Rangpo		f	f	31
3180	Rangpo Check Post		f	f	31
3181	Acharapakkam		f	f	32
3182	Alangeyam		f	f	32
3183	Alangudi		f	f	32
3184	Ambasamudram		f	f	32
3185	Ambur		f	f	32
3186	Ammoor		f	f	32
3187	Anaimalai		f	f	32
3188	Ananthapuram		f	f	32
3189	Andimadom		f	f	32
3190	Annur		f	f	32
3191	Anthiyur		f	f	32
3192	Appta		f	f	32
3193	Arani		f	f	32
3194	Aranthangi		f	f	32
3195	Arcot		f	f	32
3196	Ariyalur Market		f	f	32
3197	Arkonam		f	f	32
3198	Aruppukottai		f	f	32
3199	Arur		f	f	32
3200	Attur		f	f	32
3201	Avalpoonthurai		f	f	32
3202	Avalurpet		f	f	32
3203	Bargur		f	f	32
3204	Bhavani		f	f	32
3205	Bhuvanagiri		f	f	32
3206	Bodinayakkanur		f	f	32
3207	Boothapadi		f	f	32
3208	Budalur		f	f	32
3209	Chengalpattu		f	f	32
3210	Chengam		f	f	32
3211	Chengeri		f	f	32
3212	Chennai		f	f	32
3213	Chethupattu		f	f	32
3214	Cheyyar		f	f	32
3215	Chidambaram		f	f	32
3216	Chinnamanur		f	f	32
3217	Chinnasalem		f	f	32
3218	Chithode		f	f	32
3219	Coimbatore		f	f	32
3220	Cuddalore		f	f	32
3221	Cumbum		f	f	32
3222	Denkanikottai		f	f	32
3223	Desur		f	f	32
3224	Devakottai		f	f	32
3225	Dharampuri		f	f	32
3226	Dharapuram		f	f	32
3227	Dindigul		f	f	32
3228	Dusi		f	f	32
3229	Eathamozhi		f	f	32
3230	Elumathur		f	f	32
3231	Erode		f	f	32
3232	Gangavalli		f	f	32
3233	Gingee		f	f	32
3234	Gobichettipalayam		f	f	32
3235	Gopalpatti		f	f	32
3236	Gopichetty		f	f	32
3237	Gudiyatham		f	f	32
3238	Gummidipoondy		f	f	32
3239	Hosur		f	f	32
3240	Jayamkondam		f	f	32
3241	Kalavai		f	f	32
3242	Kallakurichi		f	f	32
3243	Kalliakavillai		f	f	32
3244	Kambainallur		f	f	32
3245	Kamuthi		f	f	32
3246	Kanayakumari		f	f	32
3247	Kanchipuram		f	f	32
3248	Kangeyam		f	f	32
3249	Karaikudi		f	f	32
3250	Karamadai		f	f	32
3251	Karumanturai		f	f	32
3252	Karur		f	f	32
3253	Katpadi		f	f	32
3254	Katpadi(Uzhavar Santhai)		f	f	32
3255	Kattumaner koil		f	f	32
3256	Kaveripakkam		f	f	32
3257	Kavunthapadi		f	f	32
3258	Kianthukadavu		f	f	32
3259	Kilpennathur		f	f	32
3260	Kilvelur		f	f	32
3261	Kodumudi		f	f	32
3262	Kolathur		f	f	32
3263	Konganapuram		f	f	32
3264	Konganapuram (Agri. Coop. Marketing Society)		f	f	32
3265	Koradacheri		f	f	32
3266	Kovilpatti		f	f	32
3267	Koyambedu		f	f	32
3268	Krishnagiri		f	f	32
3269	Kudavasal		f	f	32
3270	Kulasekaram		f	f	32
3271	Kumbakonam		f	f	32
3272	Kunnathur		f	f	32
3273	Kurinchipadi		f	f	32
3274	Kuttulam		f	f	32
3275	Lalgudi		f	f	32
3276	Madathukulam		f	f	32
3277	Madurai		f	f	32
3278	Maduranthagam		f	f	32
3279	Mailaduthurai		f	f	32
3280	Manachanallur		f	f	32
3281	Manalurpet		f	f	32
3282	Manalurpettai		f	f	32
3283	Manamadurai		f	f	32
3284	Manapparai		f	f	32
3285	Mangala Mamandur		f	f	32
3286	Mannargudi		f	f	32
3287	Mannarkudi		f	f	32
3288	Marakkanam		f	f	32
3289	Maylampadi		f	f	32
3290	Melur		f	f	32
3291	Monday Market		f	f	32
3292	Moolanur		f	f	32
3293	Moongilthuraipattu		f	f	32
3294	Muthur		f	f	32
3295	Mylampadi		f	f	32
3296	Nagapattinam		f	f	32
3297	Namagiripettai		f	f	32
3298	Namakkal		f	f	32
3299	Namakkal(Agri. Coop. Marketing Society)		f	f	32
3300	Nambiyur		f	f	32
3301	Natham		f	f	32
3302	Nazerethpet		f	f	32
3303	Negamam		f	f	32
3304	Nilgiris		f	f	32
3305	Oddunchairum		f	f	32
3306	Omalur		f	f	32
3307	Orathanadu		f	f	32
3308	Palakode		f	f	32
3309	Palani		f	f	32
3310	Palladam		f	f	32
3311	Pallipattu		f	f	32
3312	Panruti		f	f	32
3313	Papanasam		f	f	32
3314	Papparapatti		f	f	32
3315	Pappireddipatti		f	f	32
3316	Paramakudi		f	f	32
3317	Pattukottai		f	f	32
3318	Pennagaram		f	f	32
3319	Pernamallur		f	f	32
3320	Perundurai		f	f	32
3321	Pethappampatti		f	f	32
3322	Pochampalli		f	f	32
3323	Pollachi		f	f	32
3324	Polur		f	f	32
3325	Polur(Thiruvannamalai)		f	f	32
3326	Pongalur		f	f	32
3327	Ponner		f	f	32
3328	Poonthottam		f	f	32
3329	Pudukottai		f	f	32
3330	Pudupalayam		f	f	32
3331	Punchaipuliyampatti		f	f	32
3332	Rajapalayam		f	f	32
3333	Rajasingamangalam		f	f	32
3334	Ramanathapuram		f	f	32
3335	Ramanathapuram(phase 3)		f	f	32
3336	Rasipuram		f	f	32
3337	Rasipuram(Agri. Coop. Marketing Society)		f	f	32
3338	Redhills		f	f	32
3339	Salem		f	f	32
3340	Sangarapuram		f	f	32
3341	Sankarankovil		f	f	32
3342	Sathur		f	f	32
3343	Sathyamangalam		f	f	32
3344	Sembanarkoil		f	f	32
3345	Senjeri		f	f	32
3346	Sethiathoppu		f	f	32
3347	Sevur		f	f	32
3348	Shrimushnam		f	f	32
3349	Singampuneri		f	f	32
3350	Sirkali		f	f	32
3351	Sivagangai		f	f	32
3352	Sivagiri		f	f	32
3353	Sulur		f	f	32
3354	Sunguvarchatram		f	f	32
3355	Thalaivasal		f	f	32
3356	Thalavadi		f	f	32
3357	Thammampati		f	f	32
3358	Thanjavur		f	f	32
3359	Thellar		f	f	32
3360	Theni		f	f	32
3361	Thenkasi		f	f	32
3362	Thimiri		f	f	32
3363	Thirukkalukundram		f	f	32
3364	Thirukovilur		f	f	32
3365	Thirumangalam		f	f	32
3366	Thirupathur		f	f	32
3367	Thirupoondi		f	f	32
3368	Thiruppananthal		f	f	32
3369	Thiruppur		f	f	32
3370	Thiruvannamalai		f	f	32
3371	Thiruvarur		f	f	32
3372	Thiruvennainallur		f	f	32
3373	Thiryagadurgam		f	f	32
3374	Thoduvetty		f	f	32
3375	Thondamuthur		f	f	32
3376	Thoothukudi		f	f	32
3377	Thuraiyur		f	f	32
3378	Tindivanam		f	f	32
3379	Tiruchengode		f	f	32
3380	Tiruchengode(Agri. Coop. Marketing Society)		f	f	32
3381	Tirunelvali		f	f	32
3382	Tiruthuraipoondi		f	f	32
3383	Tiruttani		f	f	32
3384	Tiruvellore		f	f	32
3385	Tiruvennainallur		f	f	32
3386	Tittakudi		f	f	32
3387	Trichy		f	f	32
3388	Tukkapettai		f	f	32
3389	Udumalpet		f	f	32
3390	Ulundurpettai		f	f	32
3391	Usilampatty		f	f	32
3392	Uthangarai		f	f	32
3393	Uthiramerur		f	f	32
3394	Uthukottai		f	f	32
3395	Vadakanandhal		f	f	32
3396	Vadamadurai		f	f	32
3397	Vadaseri		f	f	32
3398	Vaduvur		f	f	32
3399	Valangaiman		f	f	32
3400	Valathi		f	f	32
3401	Vallam		f	f	32
3402	Vanapuram		f	f	32
3403	Vandavasi		f	f	32
3404	Vaniyambadi		f	f	32
3405	Vathlagundu		f	f	32
3406	Vazhapadi		f	f	32
3407	Vedachandur		f	f	32
3408	Vedaranyam		f	f	32
3409	Vellakkoil		f	f	32
3410	Vellakovil		f	f	32
3411	Vellankoil		f	f	32
3412	Vellore		f	f	32
3413	Velur		f	f	32
3414	Vettavalam		f	f	32
3415	Vikkiravandi		f	f	32
3416	Vilathikulam		f	f	32
3417	Villupuram		f	f	32
3418	Virudhachalam		f	f	32
3419	Virudhunagar		f	f	32
3420	Achampet		f	f	33
3421	Achampet(Amrabad)		f	f	33
3422	Achampet(Lingal)		f	f	33
3423	Adilabad		f	f	33
3424	Adilabad(Rythu Bazar)		f	f	33
3425	Alampur		f	f	33
3426	Aler		f	f	33
3427	Alwal,RBZ		f	f	33
3428	Amangal		f	f	33
3429	Armoor		f	f	33
3430	Asifabad		f	f	33
3431	Asifabad(Wankidi)		f	f	33
3432	Atmakur		f	f	33
3433	Badepalli		f	f	33
3434	Banswada		f	f	33
3435	Bela		f	f	33
3436	Bellampally		f	f	33
3437	Bhadrachalam		f	f	33
3438	Bhainsa		f	f	33
3439	Bhiknoor		f	f	33
3440	Bhongir		f	f	33
3441	Bhongir,RBZ		f	f	33
3442	Bichkunda		f	f	33
3443	Birkur		f	f	33
3444	Boath		f	f	33
3445	Bodhan		f	f	33
3446	Bowenpally		f	f	33
3447	Burgampadu		f	f	33
3448	Chandur		f	f	33
3449	Chandur(Mungodu)		f	f	33
3450	Charla		f	f	33
3451	Cherial		f	f	33
3452	Chevella		f	f	33
3453	Chinnoar		f	f	33
3454	Chityal		f	f	33
3455	Chityal (Narket pally)		f	f	33
3456	Choppadandi		f	f	33
3457	Choutuppal		f	f	33
3458	Dammapet		f	f	33
3459	Devarakadra		f	f	33
3460	Devarakonda		f	f	33
3461	Devarkonda(Dindi)		f	f	33
3462	Devarkonda(Mallepalli)		f	f	33
3463	Dhammapet		f	f	33
3464	Dharmapuri		f	f	33
3465	Dharmaram		f	f	33
3466	Dornakal		f	f	33
3467	Dubbak		f	f	33
3468	Enkoor		f	f	33
3469	Erragadda(Rythu Bazar)		f	f	33
3470	Erragadda,RBZ		f	f	33
3471	Excise Colony,RBZ		f	f	33
3472	Falaknama,RBZ		f	f	33
3473	Gaddiannaram		f	f	33
3474	Gadwal		f	f	33
3475	Gadwal(Lezza)		f	f	33
3476	Gajwel		f	f	33
3477	Gandhari		f	f	33
3478	Gangadhara		f	f	33
3479	Ghanpur		f	f	33
3480	Gollapally		f	f	33
3481	Gopalraopet		f	f	33
3482	Gudimalkapur		f	f	33
3483	Halia		f	f	33
3484	Hanmarkonda(Rythu Bazar)		f	f	33
3485	Husnabad		f	f	33
3486	Huzumnagar(Garidepally)		f	f	33
3487	Huzurnagar		f	f	33
3488	Huzurnagar(Matampally)		f	f	33
3489	Huzzurabad		f	f	33
3490	Hyderabad (F&V)		f	f	33
3491	Ibrahimpatnam		f	f	33
3492	Ibrahimputnam		f	f	33
3493	Ichoda		f	f	33
3494	Indravelly(Utnoor)		f	f	33
3495	Jagityal Rythu Bazar,RBZ		f	f	33
3496	Jagtial		f	f	33
3497	Jainath		f	f	33
3498	Jainoor		f	f	33
3499	Jammikunta		f	f	33
3500	Jangaon		f	f	33
3501	Jogipet		f	f	33
3502	Jullapally		f	f	33
3503	Kadthal		f	f	33
3504	Kagaznagar		f	f	33
3505	Kallur		f	f	33
3506	Kalluru		f	f	33
3507	Kalwakurthy		f	f	33
3508	Kamareddy		f	f	33
3509	Kammarpally		f	f	33
3510	Kanagal		f	f	33
3511	Karimnagar		f	f	33
3512	Karimnagar(Rythu Bazar)		f	f	33
3513	Kashmir Gadda Area,RBZ		f	f	33
3514	Kataram		f	f	33
3515	Kathalapur		f	f	33
3516	Kesamudram		f	f	33
3517	Khammam		f	f	33
3518	Khanapur		f	f	33
3519	Kodad		f	f	33
3520	Kodad,RBZ		f	f	33
3521	Kodakandal		f	f	33
3522	Kodangal		f	f	33
3523	Kollapur		f	f	33
3524	Koratla		f	f	33
3525	Kosgi		f	f	33
3526	Kotagiri		f	f	33
3527	Kothagudem		f	f	33
3528	Kothagudem P.Stadium,RBZ		f	f	33
3529	Kuber		f	f	33
3530	Kukatpally(Rythu Bazar)		f	f	33
3531	Kukatpally,RBZ		f	f	33
3532	L B Nagar		f	f	33
3533	Laxettipet		f	f	33
3534	Madhira		f	f	33
3535	Madnoor		f	f	33
3536	Mahabubabad		f	f	33
3537	Mahabubnagar(Rythu Bazar)		f	f	33
3538	Mahboob Manison		f	f	33
3539	Mahbubnagar		f	f	33
3540	Mahbubnagar(Nawabpet)		f	f	33
3541	Makthal		f	f	33
3542	Mallapur		f	f	33
3543	Mallial(Cheppial)		f	f	33
3544	Manakodur		f	f	33
3545	Mancharial		f	f	33
3546	Manthani		f	f	33
3547	Marapally		f	f	33
3548	Medak		f	f	33
3549	Medak Town,RBZ		f	f	33
3550	Medchal		f	f	33
3551	Medipally		f	f	33
3552	Mehdipatnam,RBZ		f	f	33
3553	Mehndipatnam(Rythu Bazar)		f	f	33
3554	Metpally		f	f	33
3555	Miryalaguda		f	f	33
3556	Miryalaguda (NSP Camp),RBZ		f	f	33
3557	Miryalguda(Rythu Bazar)		f	f	33
3558	Mothkur		f	f	33
3559	Mulugu		f	f	33
3560	Nagarkurnool		f	f	33
3561	Nagarkurnool(Talkapalli)		f	f	33
3562	Nagur		f	f	33
3563	Nakrekal		f	f	33
3564	Nalgonda		f	f	33
3565	Narayankhed		f	f	33
3566	Narayanpet		f	f	33
3567	Narnoor		f	f	33
3568	Narsampet		f	f	33
3569	Narsampet(Nekonda)		f	f	33
3570	Narsapur		f	f	33
3571	Narsingi		f	f	33
3572	Narsingi(Babbuguda)		f	f	33
3573	Near Rly. Gate,Mahbubnagar,RBZ		f	f	33
3574	Nelakondapally		f	f	33
3575	Neredcherla		f	f	33
3576	NGOs Colony,RBZ		f	f	33
3577	Nidamanoor		f	f	33
3578	Nirmal		f	f	33
3579	Nizamabad		f	f	33
3580	Opp.Municipal Office,Adilabad,RBZ		f	f	33
3581	Pargi		f	f	33
3582	Parkal		f	f	33
3583	Pavilion Ground,Khammam,RBZ		f	f	33
3584	Peddapalli		f	f	33
3585	Pegadapally		f	f	33
3586	Pitlam		f	f	33
3587	Pochamma Maidan,RBZ		f	f	33
3588	Pothgal		f	f	33
3589	Pothkapally		f	f	33
3590	Pudur		f	f	33
3591	Pullanga X Road,RBZ		f	f	33
3592	Qutubullahpur,RBZ		f	f	33
3593	Racharla(Boppapur)		f	f	33
3594	Railway Over Bridge./Fatima,RBZ		f	f	33
3595	Ramakrisnapuram,RBZ		f	f	33
3596	Ramannapet		f	f	33
3597	Ramayampet		f	f	33
3598	Ramchandrapuram,RBZ		f	f	33
3599	Rudrangi		f	f	33
3600	Sadashivnagar		f	f	33
3601	Sadasivpet		f	f	33
3602	Sadasivpet(Sangareddy)		f	f	33
3603	Sangareddy		f	f	33
3604	Sarangapur		f	f	33
3605	Sardarnagar		f	f	33
3606	Saroornagar,RBZ		f	f	33
3607	Sathupalli(Rythu Bazar)		f	f	33
3608	Sathupally		f	f	33
3609	Sattupalli		f	f	33
3610	Sattupalli (ramalayam),RBZ		f	f	33
3611	Secunderabad		f	f	33
3612	Shadnagar		f	f	33
3613	Shadnagar (Chowderguda)		f	f	33
3614	Shankarapally		f	f	33
3615	Siddipet		f	f	33
3616	Siddipet Town,RBZ		f	f	33
3617	Siddipet(Rythu Bazar)		f	f	33
3618	Sircilla		f	f	33
3619	Sultanabad		f	f	33
3620	Sultanabad(Garrepally)		f	f	33
3621	Suryapet,RBZ		f	f	33
3622	Suryapeta		f	f	33
3623	Tanduru		f	f	33
3624	Thittarthy		f	f	33
3625	Thorrur		f	f	33
3626	Thungathurthy		f	f	33
3627	Tirumalagiri		f	f	33
3628	Togguta		f	f	33
3629	Ursu Premises, Nalgonda,RBZ		f	f	33
3630	Valigonda		f	f	33
3631	Vanasthalipuram,RBZ		f	f	33
3632	Vantamamidi		f	f	33
3633	Varni		f	f	33
3634	Vatpally		f	f	33
3635	Velpur		f	f	33
3636	Vemulawada		f	f	33
3637	Vemulawada(Boinpally)		f	f	33
3638	Venkateswarnagar		f	f	33
3639	Venkateswarnagar(Chintapalli)		f	f	33
3640	Vikarabad		f	f	33
3641	Voligonda		f	f	33
3642	Voligonda(Ramannapet)		f	f	33
3643	Wanaparthy Road		f	f	33
3644	Wanaparthy Road(Prbbair)		f	f	33
3645	Wanaparthy town		f	f	33
3646	Warangal		f	f	33
3647	Wardhannapet		f	f	33
3648	Weekly Market Area,RBZ		f	f	33
3649	Wyra		f	f	33
3650	Yellandu		f	f	33
3651	Yellareddy		f	f	33
3652	Zaheerabad		f	f	33
3653	Bachaibari		f	f	34
3654	Barpathari		f	f	34
3655	Biokhora		f	f	34
3656	Bishalgarh		f	f	34
3657	Bishramganj		f	f	34
3658	Boxonagar		f	f	34
3659	Champaknagar		f	f	34
3660	Chowmanu		f	f	34
3661	Dasda		f	f	34
3662	Gandacharra		f	f	34
3663	Garjee		f	f	34
3664	Halahali		f	f	34
3665	Jumpuijala		f	f	34
3666	Kadamtala		f	f	34
3667	Kalsi		f	f	34
3668	Kalyanpur		f	f	34
3669	Kamalghat		f	f	34
3670	Kanchanpur		f	f	34
3671	Kulai		f	f	34
3672	Manubazar		f	f	34
3673	Masli		f	f	34
3674	Masmara		f	f	34
3675	Melaghar		f	f	34
3676	Mohanpur		f	f	34
3677	Nutanbazar		f	f	34
3678	Pabiacherra		f	f	34
3679	Panichowki		f	f	34
3680	Panisagar		f	f	34
3681	Santir Bazar		f	f	34
3682	Silachhari		f	f	34
3683	Sonamura		f	f	34
3684	Teliamura		f	f	34
3685	Achalda		f	f	35
3686	Achnera		f	f	35
3687	Agra		f	f	35
3688	Ahirora		f	f	35
3689	Ait		f	f	35
3690	Ajuha		f	f	35
3691	Akbarpur		f	f	35
3692	Aliganj		f	f	35
3693	Aligarh		f	f	35
3694	Allahabad		f	f	35
3695	Amroha		f	f	35
3696	Anandnagar		f	f	35
3697	Anoop Shahar		f	f	35
3698	Anwala		f	f	35
3699	Atarra		f	f	35
3700	Atrauli		f	f	35
3701	Auraiya		f	f	35
3702	Awagarh		f	f	35
3703	Azamgarh		f	f	35
3704	Baberu		f	f	35
3705	Babrala		f	f	35
3706	Bachranwa		f	f	35
3707	Badayoun		f	f	35
3708	Badda		f	f	35
3709	Bagpat		f	f	35
3710	Bahedi		f	f	35
3711	Bahraich		f	f	35
3712	Ballia		f	f	35
3713	Balrampur		f	f	35
3714	Banda		f	f	35
3715	Bangarmau		f	f	35
3716	Banthara		f	f	35
3717	Barabanki		f	f	35
3718	Baraut		f	f	35
3719	Bareilly		f	f	35
3720	Barhaj		f	f	35
3721	Baruwasagar		f	f	35
3722	Basti		f	f	35
3723	Bewar		f	f	35
3724	Bharthna		f	f	35
3725	Bharuasumerpur		f	f	35
3726	Bharwari		f	f	35
3727	Bhehjoi		f	f	35
3728	Bijnaur		f	f	35
3729	Billsadda		f	f	35
3730	Bilsi		f	f	35
3731	Bindki		f	f	35
3732	Buland Shahr		f	f	35
3733	Chaandpur		f	f	35
3734	Chandausi		f	f	35
3735	Chandoli		f	f	35
3736	Charkhari		f	f	35
3737	Charra		f	f	35
3738	Chhibramau		f	f	35
3739	Chhibramau(Kannuj)		f	f	35
3740	Chirgaon		f	f	35
3741	Chitwadagaon		f	f	35
3742	Chorichora		f	f	35
3743	Choubepur		f	f	35
3744	Chutmalpur		f	f	35
3745	Dadri		f	f	35
3746	Dankaur		f	f	35
3747	Dataganj		f	f	35
3748	Devariya		f	f	35
3749	Devband		f	f	35
3750	Dhampur		f	f	35
3751	Dhanura		f	f	35
3752	Dibiapur		f	f	35
3753	Divai		f	f	35
3754	Doharighat		f	f	35
3755	Dudhi		f	f	35
3756	Etah		f	f	35
3757	Etawah		f	f	35
3758	Faizabad		f	f	35
3759	Farukhabad		f	f	35
3760	Fatehabad		f	f	35
3761	Fatehpur		f	f	35
3762	Fatehpur Sikri		f	f	35
3763	Firozabad		f	f	35
3764	Gadaura		f	f	35
3765	Gangoh		f	f	35
3766	Ganjdudwara		f	f	35
3767	Gazipur		f	f	35
3768	Ghaziabad		f	f	35
3769	Ghiraur		f	f	35
3770	Golagokarnath		f	f	35
3771	Gonda		f	f	35
3772	Gopiganj		f	f	35
3773	Gorakhpur		f	f	35
3774	Gulavati		f	f	35
3775	Gurusarai		f	f	35
3776	Haathras		f	f	35
3777	Haldaur		f	f	35
3778	Hamirpur		f	f	35
3779	Hapur		f	f	35
3780	Hardoi		f	f	35
3781	Hargaon (Laharpur)		f	f	35
3782	Hasanpur		f	f	35
3783	Jafarganj		f	f	35
3784	Jagnair		f	f	35
3785	Jahanabad		f	f	35
3786	Jahangirabad		f	f	35
3787	Jalalabad		f	f	35
3788	Jalaun		f	f	35
3789	Jamanian		f	f	35
3790	Jangipura		f	f	35
3791	Jarar		f	f	35
3792	Jasra		f	f	35
3793	Jasvantnagar		f	f	35
3794	Jaunpur		f	f	35
3795	Javer		f	f	35
3796	Jayas		f	f	35
3797	Jhansi		f	f	35
3798	Jhijhank		f	f	35
3799	Kadaura		f	f	35
3800	Kadhle		f	f	35
3801	Kairana		f	f	35
3802	Kalpi		f	f	35
3803	Kamlaganj		f	f	35
3804	Kannauj		f	f	35
3805	Kanpur(Grain)		f	f	35
3806	Karnailganj		f	f	35
3807	Karvi		f	f	35
3808	Kasganj		f	f	35
3809	Katra		f	f	35
3810	Kayamganj		f	f	35
3811	Khaga		f	f	35
3812	Khair		f	f	35
3813	Khairagarh		f	f	35
3814	Khalilabad		f	f	35
3815	Khatauli		f	f	35
3816	Khekda		f	f	35
3817	Khurja		f	f	35
3818	Kiratpur		f	f	35
3819	Kishunpur		f	f	35
3820	Konch		f	f	35
3821	Kopaganj		f	f	35
3822	Kosikalan		f	f	35
3823	Kurara		f	f	35
3824	Lakhimpur		f	f	35
3825	Lalganj		f	f	35
3826	Lalitpur		f	f	35
3827	Lucknow		f	f	35
3828	Madhoganj		f	f	35
3829	Madhogarh		f	f	35
3830	Maharajganj		f	f	35
3831	Mahoba		f	f	35
3832	Maholi		f	f	35
3833	Maigalganj		f	f	35
3834	Mainpuri		f	f	35
3835	Mathura		f	f	35
3836	Mau		f	f	35
3837	Mau(Chitrakut)		f	f	35
3838	Maudaha		f	f	35
3839	Mauranipur		f	f	35
3840	Mawana		f	f	35
3841	Meerut		f	f	35
3842	Mehmoodabad		f	f	35
3843	Mehrauni		f	f	35
3844	Mihipurwa		f	f	35
3845	Milak		f	f	35
3846	Mirzapur		f	f	35
3847	Misrikh		f	f	35
3848	Mohamadabad		f	f	35
3849	Mohammdi		f	f	35
3850	Moth		f	f	35
3851	Mugrabaadshahpur		f	f	35
3852	Muradabad		f	f	35
3853	Muradnagar		f	f	35
3854	Muskara		f	f	35
3855	Muzzafarnagar		f	f	35
3856	Naanpara		f	f	35
3857	Nagina		f	f	35
3858	Najibabad		f	f	35
3859	Nakud		f	f	35
3860	Nanuta		f	f	35
3861	Naugarh		f	f	35
3862	Nautnava		f	f	35
3863	Nawabganj		f	f	35
3864	Niralangar (F&V)		f	f	35
3865	Noida		f	f	35
3866	Orai		f	f	35
3867	Pahariya pandeypur(F&V)		f	f	35
3868	Paliakala		f	f	35
3869	Panchpedwa		f	f	35
3870	Panwadi		f	f	35
3871	Parikshitgarh		f	f	35
3872	Partaval		f	f	35
3873	Payagpur		f	f	35
3874	Pilibhit		f	f	35
3875	Pratapgarh		f	f	35
3876	Pukhrayan		f	f	35
3877	Puranpur		f	f	35
3878	Purwa		f	f	35
3879	Puwaha		f	f	35
3880	Raath		f	f	35
3881	Raibareilly		f	f	35
3882	Rampur		f	f	35
3883	Rampurmaniharan		f	f	35
3884	Rasda		f	f	35
3885	Richha		f	f	35
3886	Risia		f	f	35
3887	Robertsganj		f	f	35
3888	Rudauli		f	f	35
3889	Ruperdeeha		f	f	35
3890	Rura		f	f	35
3891	Safdarganj		f	f	35
3892	Saharanpur		f	f	35
3893	Sahiyapur		f	f	35
3894	Saidpur		f	f	35
3895	Salon		f	f	35
3896	Sambhal		f	f	35
3897	Samsabad		f	f	35
3898	Sandi		f	f	35
3899	Sandila		f	f	35
3900	Sardhana		f	f	35
3901	Sehjanwa		f	f	35
3902	Shadabad		f	f	35
3903	Shahabad		f	f	35
3904	Shahabad(New Mandi)		f	f	35
3905	Shahaswan		f	f	35
3906	Shahganj		f	f	35
3907	Shahjahanpur		f	f	35
3908	Shahpur		f	f	35
3909	Shamli		f	f	35
3910	Shikohabad		f	f	35
3911	Sikanderabad		f	f	35
3912	Sikandraraau		f	f	35
3913	Sikarpur		f	f	35
3914	Sindholi		f	f	35
3915	Sirsa		f	f	35
3916	Sirsaganj		f	f	35
3917	Sitapur		f	f	35
3918	Siyana		f	f	35
3919	Soharatgarh		f	f	35
3920	Sultanpur		f	f	35
3921	Sultanpurchilkana		f	f	35
3922	Tamkuhi Road		f	f	35
3923	Tanda		f	f	35
3924	Tanda(Rampur)		f	f	35
3925	Thanabhawan		f	f	35
3926	Tikonia		f	f	35
3927	Tilhar		f	f	35
3928	Tulsipur		f	f	35
3929	Tundla		f	f	35
3930	Ujhani		f	f	35
3931	Unnao		f	f	35
3932	Utraula		f	f	35
3933	Uttaripura		f	f	35
3934	Varanasi(F&V)		f	f	35
3935	Varanasi(Grain)		f	f	35
3936	Varipaal		f	f	35
3937	Vilaspur		f	f	35
3938	Vilthararoad		f	f	35
3939	Vishalpur		f	f	35
3940	Visoli		f	f	35
3941	Viswan		f	f	35
3942	Wansi		f	f	35
3943	Wazirganj		f	f	35
3944	Yusufpur		f	f	35
3945	Bazpur		f	f	36
3946	Bhagwanpur(Naveen Mandi Sthal)		f	f	36
3947	Bhowali(Naveen Mandi Sthal)		f	f	36
3948	Chakrata		f	f	36
3949	Dehradoon		f	f	36
3950	Gadarpur		f	f	36
3951	Haldwani		f	f	36
3952	Haridwar Union		f	f	36
3953	Jaspur(UC)		f	f	36
3954	Kaladhungi(Naveen Mandi Sthal)		f	f	36
3955	Kashipur		f	f	36
3956	Khateema		f	f	36
3957	Kicchha		f	f	36
3958	Kotadwara		f	f	36
3959	Lakshar		f	f	36
3960	Lohaghat(Naveen Mandi Sthal)		f	f	36
3961	Manglaur		f	f	36
3962	Nanakmatta		f	f	36
3963	Ramnagar		f	f	36
3964	Rishikesh		f	f	36
3965	Roorkee		f	f	36
3966	Rudrapur		f	f	36
3967	Sitarganj		f	f	36
3968	Tanakpur		f	f	36
3969	Vikasnagar		f	f	36
3970	Bankura Sadar		f	f	3
3971	Bara Bazar (Posta Bazar)		f	f	3
3972	Beldanga		f	f	3
3973	Bethuadahari		f	f	3
3974	Bishnupur		f	f	3
3975	Bishnupur(Bankura)		f	f	3
3976	Chakdah(Kalyani)		f	f	3
3977	ChinSurah		f	f	3
3978	Dakshin Dinajpur		f	f	3
3979	Darjeeling(Klimpong)		f	f	3
3980	Diamond Harbour		f	f	3
3981	Dinhata		f	f	3
3982	English Bazar		f	f	3
3983	Falakata(Dhupguri)		f	f	3
3984	Gajol		f	f	3
3985	Gangarampur		f	f	3
3986	Garbeta		f	f	3
3987	Ghatal		f	f	3
3988	Guskara		f	f	3
3989	Guskara(Burdwan)		f	f	3
3990	Howrah		f	f	3
3991	Indus		f	f	3
3992	Indus(Bankura Sadar)		f	f	3
3993	Islampur		f	f	3
3994	Jangipur		f	f	3
3995	Jhargram		f	f	3
3996	Jiaganj		f	f	3
3997	Jiaganj(Lalbagh)		f	f	3
3998	Kaliaganj		f	f	3
3999	Kalimpong		f	f	3
4000	Kalipur(Champadanga)		f	f	3
4001	Kalyani		f	f	3
4002	Kandi		f	f	3
4003	Karimpur		f	f	3
4004	Kasimbazar		f	f	3
4005	Kasipur		f	f	3
4006	Kasipur(Jhalda)		f	f	3
4007	Katwa		f	f	3
4008	Kolaghat		f	f	3
4009	Lalbagh		f	f	3
4010	Mathabhanga		f	f	3
4011	Matigara		f	f	3
4012	Midnapore Sadar		f	f	3
4013	Moynaguri(Dhupguri)		f	f	3
4014	Nadia		f	f	3
4015	Pandua		f	f	3
4016	Raiganj		f	f	3
4017	Raiganj(Kalinganj)		f	f	3
4018	Rampurhat		f	f	3
4019	Ranaghat(Kalyani)		f	f	3
4020	Sainthia(Suri)		f	f	3
4021	Samsi		f	f	3
4022	South 24-PGS		f	f	3
4023	Tamluk (Medinipur E)		f	f	3
\.

COPY public.prediction_mlmarketdataindia (id, date, state_label, district_label, market_label, commodity_label, arrivals_metric_tons, modal_price_rs_per_quintal, last_price_1d, last_price_2d, last_price_3d, last_price_4d, last_price_5d, last_price_6d, last_price_7d, week, day, month, usd_to_inr, brent_oil_price, state_rollup, district_rollup, availability, price_available, price_available_1d, price_available_2d, price_available_3d, price_available_4d, price_available_5d, price_available_6d, price_available_7d, usd_to_inr_1d, usd_to_inr_2d, usd_to_inr_3d, usd_to_inr_4d, usd_to_inr_5d, usd_to_inr_6d, usd_to_inr_7d, usd_to_inr_8d, usd_to_inr_9d, usd_to_inr_10d, usd_to_inr_11d, usd_to_inr_12d, usd_to_inr_13d, usd_to_inr_14d, usd_to_inr_lag, brent_oil_price_1d, brent_oil_price_2d, brent_oil_price_3d, brent_oil_price_4d, brent_oil_price_5d, brent_oil_price_6d, brent_oil_price_7d, brent_oil_price_8d, brent_oil_price_9d, brent_oil_price_10d, brent_oil_price_11d, brent_oil_price_12d, brent_oil_price_13d, brent_oil_price_14d, brent_oil_price_lag, availability_bit, crop_id, market_id) FROM stdin;
\.

COPY public.prediction_mlmarketdatanigeria (id, date, state_label, commodity_label, price, last_price_1m, last_price_2m, last_price_3m, last_price_4m, last_price_5m, usd_to_ngn, state_rollup, cpi, crop_id, state_id) FROM stdin;
\.

COPY public.prediction_mlpredictiondata (id, fetched_at, reference_date, price_forecast_1, price_forecast_2, price_forecast_3, price_forecast_4, price_forecast_5, price_forecast_6, price_forecast_7, price_forecast_8, price_forecast_9, price_forecast_10, price_forecast_11, price_forecast_12, price_forecast_13, price_forecast_14, only_interpolated_data, crop_id, market_id) FROM stdin;
\.

COPY public.prediction_mlpredictiondatang (id, fetched_at, reference_date, price_forecast_1, price_forecast_2, price_forecast_3, price_forecast_4, price_forecast_5, price_forecast_6, price_forecast_7, price_forecast_8, only_interpolated_data, crop_id, state_id) FROM stdin;
\.

COPY public.prediction_state (id, name, added_by_user, country_id) FROM stdin;
1	Himachal Pradesh	f	1
2	NCT of Delhi	f	1
3	West Bengal	f	1
4	Odisha	f	1
5	Andaman and Nicobar	f	1
6	Andhra Pradesh	f	1
7	Arunachal Pradesh	f	1
8	Assam	f	1
9	Bihar	f	1
10	Chandigarh	f	1
11	Chattisgarh	f	1
12	Dadra and Nagar Haveli	f	1
13	Daman and Diu	f	1
14	Goa	f	1
15	Gujarat	f	1
16	Haryana	f	1
17	Jammu and Kashmir	f	1
18	Jharkhand	f	1
19	Karnataka	f	1
20	Kerala	f	1
21	Lakshadweep	f	1
22	Madhya Pradesh	f	1
23	Maharashtra	f	1
24	Manipur	f	1
25	Meghalaya	f	1
26	Mizoram	f	1
27	Nagaland	f	1
28	Pondicherry	f	1
29	Punjab	f	1
30	Rajasthan	f	1
31	Sikkim	f	1
32	Tamil Nadu	f	1
33	Telangana	f	1
34	Tripura	f	1
35	Uttar Pradesh	f	1
36	Uttrakhand	f	1
\.

COPY public.prediction_stateng (id, name, added_by_user, country_id) FROM stdin;
37	Zamfara	f	2
36	Yobe	f	2
35	Taraba	f	2
34	Sokoto	f	2
33	Rivers	f	2
32	Plateau	f	2
31	Oyo	f	2
30	Osun	f	2
29	Ondo	f	2
28	Ogun	f	2
27	Niger	f	2
26	Nassarawa	f	2
25	Lagos	f	2
24	Kwara	f	2
23	Kogi	f	2
22	Kebbi	f	2
21	Katsina	f	2
20	Kano	f	2
19	Kaduna	f	2
18	Jigawa	f	2
17	Imo	f	2
16	Gombe	f	2
15	Fct Abuja	f	2
14	Enugu	f	2
13	Ekiti	f	2
12	Edo	f	2
11	Ebonyi	f	2
10	Delta	f	2
9	Cross River	f	2
8	Borno	f	2
7	Benue	f	2
6	Bayelsa	f	2
5	Bauchi	f	2
4	Anambra	f	2
3	Akwa-Ibom	t	2
2	Adamawa	f	2
1	Abia	f	2
\.

COPY public.storage_coolingunit (id, name, capacity_in_metric_tons, capacity_in_number_crates, metric, sensor, cooling_unit_type, time_pickup_to_customer, crate_length, crate_width, crate_height, crate_weight, location_id, deleted, food_capacity_in_metric_tons, date_creation, date_last_modified, occupancy, occupancy_modified_date, public, room_height, room_length, room_weight, room_width, editable_checkins) FROM stdin;
\.

COPY public.storage_coolingunit_date_operator_assigned (id, coolingunit_id, operatorassignedcoolingunit_id) FROM stdin;
\.

COPY public.storage_coolingunit_operators (id, coolingunit_id, user_id) FROM stdin;
\.

COPY public.storage_coolingunitcrop (id, active, cooling_unit_id, crop_id, pricing_id) FROM stdin;
\.

COPY public.storage_coolingunitpower (id, power_consumption_in_mt, daily_room_wattage, power_source_diesel_percent, power_source_grid_percent, power_source_pv_percent, power_source_biomass_percent, power_source_diesel_consumption_kwh, pv_panel_count, pv_panel_size, pv_panel_weight, pv_panel_max_power, battery_count, battery_capacity, battery_max_current, battery_peak_energy_storage, refrigerant_type, power_source, electricity_storage_system, thermal_storage_method, cooling_unit_id, amount_refrigerant, battery_weight, room_insulator, battery_type, pv_panel_type) FROM stdin;
\.

COPY public.storage_coolingunitspecifications (id, value, specification_type, datetime_stamp, cooling_unit_id, set_point_value) FROM stdin;
\.

COPY public.storage_crate (id, weight, remaining_shelf_life, quality_dt, temperature_dt, modified_dt, planned_days, price_per_crate_per_pricing_type, cooling_unit_id, produce_id, run_dt, currency, tag, cmp_fully_checked_out, initial_weight, cmp_last_updated_at, cmp_total_due_in_cooling_fees, cmp_total_in_cooling_fees, cmp_total_paid_in_cooling_fees) FROM stdin;
\.

COPY public.storage_cratepartialcheckout (id, percentage, weight_in_kg, cooling_fees, checkout_id, crate_id) FROM stdin;
\.

COPY public.storage_crop (id, name, image, optimal_storage_temperature, approximate_shelf_life, harvested_today, harvested_yesterday, harvested_day_before_yesterday, harvested_before, size_selection_1, size_selection_2, size_selection_3, digital_twin_identifier, crop_type_id, activation_energy_constant, dependent_constant) FROM stdin;
73	Meat	crop_images/meat.jpg	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
61	Scent leaf	crop_images/Scent_leaves.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
74	Fish	crop_images/fish.jpg	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
75	Flowers	crop_images/flowers.jpg	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
4	Beetroot	crop_images/beetroot.png	0 °C	4 month	100	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
7	Bottle Gourd	crop_images/bottleGourd.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
8	Broccoli	crop_images/broccoli1.png	0 °C	10-14 days	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
9	Cabbage	crop_images/cabbage.png	0°C	3-6 weeks	100	\N	\N	\N	\N	\N	\N	5	2	70567	9707912
10	Carrot	crop_images/carrot.png	0 °C	3-6 months	100	33	11	4	Size 150 to 200 mm	Size Above 200to 275 mm	Size Below 150 & above 275 mm	6	3	52089	12170
11	Tapioca (Cassava)	crop_images/cassava.png	0-5 °C	1-2 months	100	81	65	52	\N	\N	\N	7	3	45328	160.94
12	Cauliflower	crop_images/cauliflower_dVI5dHi.jpg	0 °C	3-4 weeks	100	\N	\N	\N	\N	\N	\N	8	2	70597	20802669
13	Bathua (Chenopodium)	crop_images/Screenshot_2022-07-27_at_17.38.06.png	0-5 °C	1-2 weeks	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
14	Colacasia	crop_images/cocoyam.png	7-10 °C	4 months	100	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
15	Coriander	crop_images/coriander.png	0-1 °C	2 weeks	100	\N	\N	\N	\N	\N	\N	9	2	79474	1306554620
16	Cucumber	crop_images/cucumber.png	10-12 °C	7 days	100	54	29	16	\N	\N	\N	10	2	63608	656587
17	Drum stick	crop_images/drumStick.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
18	Brinjal (Aubergine)	crop_images/eggplant.png	10-12 °C	1-2 weeks	100	59	35	21	\N	\N	\N	11	2	48117	1186
19	Flat Beans	crop_images/flatBeans.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
20	Garlic	crop_images/garlic.png	-1-1 °C	6-7 months	100	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
21	Ginger	crop_images/ginger.png	13 °C	6 months	100	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
22	Grapes	crop_images/grapes.png	-0.5-0	1-6 months	100	78	61	47	\N	\N	\N	12	1	44523	135
24	Green Gram	crop_images/greenGram.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
25	Guava	crop_images/guava_NEW.jpg	5-10 °C	2-3 weeks	100	59	35	21	Size 50 to 90 mm	Size Below 50 and more than 90 mm	Size Below 50 and more than 90 mm	13	1	54938	17887
26	Ivy Gourd	crop_images/ivy-Gourd.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
27	Jackfruit	crop_images/jackfruit_kBpd54C.jpg	13 °C	2-4 weeks	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
28	Lemon	crop_images/lemon.png	10-13 °C	1-6 months	100	\N	\N	\N	Size Above 30 mm	Size 20 to 30 mm	Size Below 20 mm	\N	1	\N	\N
29	Lettuce	crop_images/lettuce.png	0 °C	2-3 weeks	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
30	Litchi	crop_images/litchi.png	1-2 °C	3-5 weeks	100	\N	\N	\N	Size 33 mm	Size 28 mm	Size 23 mm	\N	1	\N	\N
31	Mango	crop_images/mango.png	13 °C	2-3 weeks	100	57	32	18	\N	\N	\N	15	1	77324	138838016
32	Musk Melon	crop_images/melon.png	5-10 °C	3-4 weeks	100	48	24	11	\N	\N	\N	16	1	68537	4945484
33	Mint leaves	crop_images/mint.png	0 °C	2-3 weeks	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
34	Methi	crop_images/moringa-leaves.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
35	Mushroom	crop_images/mushroom.png	0 °C	7-14 days	100	\N	\N	\N	Size  5 cm and above	Size  upto 5 cm	Size below 3 cm	\N	2	\N	\N
36	Ladyfinger	crop_images/okra.png	7-10 °C	7-10 days	100	\N	\N	\N	Size 30 to 110 mm	Size 110 to 135 mm	Size Below 30 & above 135 mm	14	2	74428	189682337
37	Onion	crop_images/onion.png	0 °C	1-8 months	100	\N	\N	\N	Size Up to 65 mm	Size Up to 45mm	Size Up to 25 mm	\N	2	\N	\N
38	Orange	crop_images/orange.png	3-9 °C	3-8 weeks	100	82	67	55	Size Upto 1500 mm	Size Upto 1000 mm	Size Upto 500 mm	17	1	44523	110
39	Papaya	crop_images/papaya.png	7-13 °C	1-3 weeks	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
40	Peach	crop_images/Screenshot_2022-07-27_at_17.38.48.png	-0.5-0 °C	2-4 weeks	100	27	7	2	Size Above 45 mm	Size 35 to 45 mm	Size Below 35 mm	18	1	64978	2367166
41	Pear	crop_images/pear.png	-1.5 to -0.5 °C	2-7 months	100	85	72	62	Size Upto 65mm	Size Upto 55mm	Size Upto 45 mm	19	1	59281	30640
42	Peas	crop_images/peas.png	0 °C	1-2 weeks	100	20	0	0	Length Upto 65mm	Length Upto 55mm	Length Upto 45 mm	20	2	70567	55473784
43	Pineapple	crop_images/pineapple.png	7-13 °C	2-4 weeks	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
44	Plantain	crop_images/plantains.png	13-15 °C	1-5 weeks	100	72	53	38	\N	\N	\N	21	1	64935	576216
45	Pointed Gourd	crop_images/Screenshot_2022-07-27_at_17.40.24.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
46	Pomegranate	crop_images/pomegranate.png	5-7.2 °C	2-3 months	100	\N	\N	\N	Size Upto 90 mm	Size Upto 75 mm	Size Upto 65 mm	\N	1	\N	\N
47	Irish Potato	crop_images/potato.png	4-8   °C	5-10 months	100	95	90	85	Size  Up to 70	Size  Up to 55	Size  Up to 25	22	3	64935	576216
48	Pumpkin	crop_images/pumpkin_RRUi3mX.jpg	12-15 °C	2-3 months	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
49	Radish	crop_images/radish.png	0 °C	1-2 months	100	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
50	Ridge Gourd	crop_images/ridgeGourd.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
51	Spinach	crop_images/spinach.png	0 °C	10-14 days	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
52	Spring onion	crop_images/springOnion.png	0 °C	3 weeks	100	\N	\N	\N	diameter 10-15 mm	diameter 15-18 mm	diameter more than 18 mm	\N	2	\N	\N
53	Strawberry	crop_images/strawberry.png	0 °C	7-10 days	100	16	3	0	Size Above 25 mm	Size Above 18 mm	\N	24	1	64978	3314033
59	Other	crop_images/other_b3HuBUE.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
60	Other	crop_images/other.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
62	Roselle	crop_images/Roselle.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
63	Oha/Ora Leaf	crop_images/OhaLeaves.jpg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
64	Jute leaves	crop_images/Jute_GTIG44R.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
65	Fluted pumpkin (leaves)	crop_images/Fluted_pumpkin_leaves.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
66	Bitter Leaf	crop_images/BitterLeaf.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
68	Avocado	crop_images/Avocado.png	3-7°C	2-4 weeks	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
0	Default	crop_images/Screenshot_2022-07-27_at_17.40.24.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
5	Capsicum (Bell Pepper)	crop_images/bellPepper.png	7-10 °C	2-3 weeks	100	60	36	21	\N	\N	\N	3	2	58202	63460
23	Green Chilli	crop_images/greenChilly.png	5-10 °C	2-3 weeks	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
6	Bitter Gourd	crop_images/bitterGourd.png	10-12 °C	2-3 weeks	100	\N	\N	\N	Size Above 150 to 200 mm	Size Above 100 to 150 mm	Size 60 to 100 mm	4	2	75737	166424846
76	Dairy	crop_images/diary.jpg	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
77	Others	crop_images/Screenshot_2022-07-27_at_17.40.24.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	4	\N	\N
1	Apple	crop_images/apple.png	-1.1-0 °C	3-6 months	100	79	62	48	size 50 mm	size 70 mm	size 90 mm	1	1	70567	4044963
2	Banana	crop_images/banana.png	13-15 °C	1-4 weeks	100	66	44	29	50	70	90	2	1	72613	15444224
3	Beans	crop_images/beans.png	4-7 °C	7-10 days	100	\N	\N	\N	\N	\N	\N	26	2	66862	7450486
58	Other	crop_images/other_xB1V9FU.png	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
54	Sweet Lime	crop_images/SweetLime.png	10-13 °C	1-6 months	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
70	Lemon basil	crop_images/lemon_basil.jpg	10 °C	7	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
55	Taro root	crop_images/taro-root.png	7-10 °C	4 months	100	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
56	Tomato	crop_images/tomato.png	8-13 °C	1-3 weeks	100	51	26	13	Size Upto 65 mm	Size Upto 55 mm	Size Upto 45 mm	25	2	67234	2982842
57	Water Melon	crop_images/waterMelon2.png	10-15 °C	2-3 weeks	100	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
69	African star apple	crop_images/AfricanStarApple.png	15°C	15 days	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
72	Sweet Potato	crop_images/potato.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	3	\N	\N
71	Waterleaf	crop_images/waterleaf.png	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	2	\N	\N
\.

COPY public.storage_croptype (id, name) FROM stdin;
1	Fruits
2	Vegetables
3	Root Vegetables
4	Other Items
\.

COPY public.storage_location (id, name, state, city, street, street_number, zip_code, latitude, longitude, company_id, deleted, date_creation, date_last_modified) FROM stdin;
\.

COPY public.storage_operatorassignedcoolingunit (id, date, operator_id) FROM stdin;
\.

COPY public.storage_pricing (id, pricing_type, fixed_rate, daily_rate) FROM stdin;
\.

COPY public.storage_produce (id, harvest_date, initial_grade, size, cmp_checkout_completed, checkin_id, crop_id, picture, additional_info, cmp_last_updated_at) FROM stdin;
\.

COPY public.storage_sensorusermodel (id, machine_id, username, access_token, cooling_unit_id, date_sensor_first_linked, date_sensor_modified, password, type, account_key, channel_id, field) FROM stdin;
\.

COPY public.user_bankaccount (id, account_name, account_number, bank_name) FROM stdin;
\.

COPY public.user_company (id, name, country, logo, currency, digital_twin, "ML4_market", "ML4_quality", "ML4_farmers", date_joined, bank_account_id, flag_opt_out_from_marketplace_filter) FROM stdin;
\.

COPY public.user_company_crop (id, company_id, crop_id) FROM stdin;
\.

COPY public.user_country (id, country) FROM stdin;
1	IN
2	NG
3	CH
4	AF
5	AX
6	AL
7	DZ
8	AS
9	AD
10	AO
11	AI
12	AQ
13	AG
14	AR
15	AM
16	AW
17	AU
18	AT
19	AZ
20	BS
21	BH
22	BD
23	BB
24	BY
25	BE
26	BZ
27	BJ
28	BM
29	BT
30	BO
31	BQ
32	BA
33	BW
34	BV
35	BR
36	IO
37	BN
38	BG
39	BF
40	BI
41	CV
42	KH
43	CM
44	CA
45	KY
46	CF
47	TD
48	CL
49	CN
50	CX
51	CC
52	CO
53	KM
54	CG
55	CD
56	CK
57	CR
58	CI
59	HR
60	CU
61	CW
62	CY
63	CZ
64	DK
65	DJ
66	DM
67	DO
68	EC
69	EG
70	SV
71	GQ
72	ER
73	EE
74	SZ
75	ET
76	FK
77	FO
78	FJ
79	FI
80	FR
81	GF
82	PF
83	TF
84	GA
85	GM
86	GE
87	DE
88	GH
89	GI
90	GR
91	GL
92	GD
93	GP
94	GU
95	GT
96	GG
97	GN
98	GW
99	GY
100	HT
101	HM
102	VA
103	HN
104	HK
105	HU
106	IS
107	ID
108	IR
109	IQ
110	IE
111	IM
112	IL
113	IT
114	JM
115	JP
116	JE
117	JO
118	KZ
119	KE
120	KI
121	KW
122	KG
123	LA
124	LV
125	LB
126	LS
127	LR
128	LY
129	LI
130	LT
131	LU
132	MO
133	MG
134	MW
135	MY
136	MV
137	ML
138	MT
139	MH
140	MQ
141	MR
142	MU
143	YT
144	MX
145	FM
146	MD
147	MC
148	MN
149	ME
150	MS
151	MA
152	MZ
153	MM
154	NA
155	NR
156	NP
157	NL
158	NC
159	NZ
160	NI
161	NE
162	NU
163	NF
164	KP
165	MK
166	MP
167	NO
168	PK
169	PW
170	PS
171	PA
172	PG
173	PY
174	PE
175	PH
176	PN
177	PL
178	PT
179	PR
180	QA
181	RE
182	RO
183	RU
184	RW
185	BL
186	SH
187	KN
188	MF
189	PM
190	VC
191	WS
192	ST
193	SA
194	SN
195	RS
196	SC
197	SL
198	SG
199	SX
200	SK
201	SI
202	SB
203	SO
204	ZA
205	GS
206	KR
207	SS
208	ES
209	LK
210	SD
211	SR
212	SJ
213	SE
214	SY
215	TW
216	TJ
217	TZ
218	TH
219	TL
220	TG
221	TK
222	TO
223	TT
224	TN
225	TR
226	TM
227	TC
228	TV
229	UG
230	UA
231	AE
232	GB
233	UM
234	US
235	UY
236	UZ
237	VU
238	VE
239	VN
240	VG
241	VI
242	WF
243	EH
244	YE
245	ZM
246	ZW
\.

COPY public.user_country_crop (id, country_id, crop_id) FROM stdin;
69006	1	1
69007	1	2
69008	1	3
69009	1	4
69010	1	5
69011	1	6
69012	1	7
69013	1	8
69014	1	9
69015	1	10
69016	1	11
69017	1	12
69018	1	13
69019	1	14
69020	1	15
69021	1	16
69022	1	17
69023	1	18
69024	1	19
69025	1	20
69026	1	21
69027	1	22
69028	1	23
69029	1	24
69030	1	25
69031	1	26
69032	1	27
69033	1	28
69034	1	29
69035	1	30
69036	1	31
69037	1	32
69038	1	33
69039	1	34
69040	1	35
69041	1	36
69042	1	37
69043	1	38
69044	1	39
69045	1	40
69046	1	41
69047	1	42
69048	1	43
69049	1	44
69050	1	45
69051	1	46
69052	1	47
69053	1	48
69054	1	49
69055	1	50
69056	1	51
69057	1	52
69058	1	53
69059	1	54
69060	1	55
69061	1	56
69062	1	57
69063	1	58
69064	1	59
69065	1	60
69066	1	61
69067	1	62
69068	1	64
69069	1	65
69070	1	66
69071	1	68
69072	1	69
69073	1	70
69074	1	71
69075	1	72
69076	1	73
69077	1	74
69078	1	75
69079	1	76
69080	1	77
69081	2	1
69082	2	2
69083	2	3
69084	2	4
69085	2	5
69086	2	6
69087	2	7
69088	2	8
69089	2	9
69090	2	10
69091	2	11
69092	2	12
69093	2	13
69094	2	14
69095	2	15
69096	2	16
69097	2	18
69098	2	20
69099	2	21
69100	2	22
69101	2	23
69102	2	24
69103	2	25
69104	2	29
69105	2	30
69106	2	31
69107	2	32
69108	2	33
69109	2	34
69110	2	35
69111	2	36
69112	2	37
69113	2	38
69114	2	39
69115	2	40
69116	2	41
69117	2	42
69118	2	43
69119	2	44
69120	2	47
69121	2	49
69122	2	51
69123	2	52
69124	2	53
69125	2	54
69126	2	55
69127	2	56
69128	2	57
69129	2	58
69130	2	59
69131	2	60
69132	2	61
69133	2	62
69134	2	63
69135	2	64
69136	2	65
69137	2	66
69138	2	68
69139	2	69
69140	2	70
69141	2	71
69142	2	72
69143	2	73
69144	2	74
69145	2	75
69146	2	76
69147	2	77
69148	3	1
69149	3	2
69150	3	3
69151	3	4
69152	3	5
69153	3	6
69154	3	7
69155	3	8
69156	3	9
69157	3	10
69158	3	11
69159	3	12
69160	3	13
69161	3	14
69162	3	15
69163	3	16
69164	3	17
69165	3	18
69166	3	19
69167	3	20
69168	3	21
69169	3	22
69170	3	23
69171	3	24
69172	3	25
69173	3	26
69174	3	27
69175	3	28
69176	3	29
69177	3	30
69178	3	31
69179	3	32
69180	3	33
69181	3	34
69182	3	35
69183	3	36
69184	3	37
69185	3	38
69186	3	39
69187	3	40
69188	3	41
69189	3	42
69190	3	43
69191	3	44
69192	3	45
69193	3	46
69194	3	47
69195	3	48
69196	3	49
69197	3	50
69198	3	51
69199	3	52
69200	3	53
69201	3	54
69202	3	55
69203	3	56
69204	3	57
69205	3	58
69206	3	59
69207	3	60
69208	3	61
69209	3	62
69210	3	63
69211	3	64
69212	3	65
69213	3	66
69214	3	68
69215	3	69
69216	3	70
69217	3	71
69218	3	72
69219	3	73
69220	3	74
69221	3	75
69222	3	76
69223	3	77
69224	4	1
69225	4	2
69226	4	3
69227	4	4
69228	4	5
69229	4	6
69230	4	7
69231	4	8
69232	4	9
69233	4	10
69234	4	11
69235	4	12
69236	4	13
69237	4	14
69238	4	15
69239	4	16
69240	4	17
69241	4	18
69242	4	19
69243	4	20
69244	4	21
69245	4	22
69246	4	23
69247	4	24
69248	4	25
69249	4	26
69250	4	27
69251	4	28
69252	4	29
69253	4	30
69254	4	31
69255	4	32
69256	4	33
69257	4	34
69258	4	35
69259	4	36
69260	4	37
69261	4	38
69262	4	39
69263	4	40
69264	4	41
69265	4	42
69266	4	43
69267	4	44
69268	4	45
69269	4	46
69270	4	47
69271	4	48
69272	4	49
69273	4	50
69274	4	51
69275	4	52
69276	4	53
69277	4	54
69278	4	55
69279	4	56
69280	4	57
69281	4	58
69282	4	59
69283	4	60
69284	4	61
69285	4	62
69286	4	63
69287	4	64
69288	4	65
69289	4	66
69290	4	68
69291	4	69
69292	4	70
69293	4	71
69294	4	72
69295	4	73
69296	4	74
69297	4	75
69298	4	76
69299	4	77
69300	5	1
69301	5	2
69302	5	3
69303	5	4
69304	5	5
69305	5	6
69306	5	7
69307	5	8
69308	5	9
69309	5	10
69310	5	11
69311	5	12
69312	5	13
69313	5	14
69314	5	15
69315	5	16
69316	5	17
69317	5	18
69318	5	19
69319	5	20
69320	5	21
69321	5	22
69322	5	23
69323	5	24
69324	5	25
69325	5	26
69326	5	27
69327	5	28
69328	5	29
69329	5	30
69330	5	31
69331	5	32
69332	5	33
69333	5	34
69334	5	35
69335	5	36
69336	5	37
69337	5	38
69338	5	39
69339	5	40
69340	5	41
69341	5	42
69342	5	43
69343	5	44
69344	5	45
69345	5	46
69346	5	47
69347	5	48
69348	5	49
69349	5	50
69350	5	51
69351	5	52
69352	5	53
69353	5	54
69354	5	55
69355	5	56
69356	5	57
69357	5	58
69358	5	59
69359	5	60
69360	5	61
69361	5	62
69362	5	63
69363	5	64
69364	5	65
69365	5	66
69366	5	68
69367	5	69
69368	5	70
69369	5	71
69370	5	72
69371	5	73
69372	5	74
69373	5	75
69374	5	76
69375	5	77
69376	6	1
69377	6	2
69378	6	3
69379	6	4
69380	6	5
69381	6	6
69382	6	7
69383	6	8
69384	6	9
69385	6	10
69386	6	11
69387	6	12
69388	6	13
69389	6	14
69390	6	15
69391	6	16
69392	6	17
69393	6	18
69394	6	19
69395	6	20
69396	6	21
69397	6	22
69398	6	23
69399	6	24
69400	6	25
69401	6	26
69402	6	27
69403	6	28
69404	6	29
69405	6	30
69406	6	31
69407	6	32
69408	6	33
69409	6	34
69410	6	35
69411	6	36
69412	6	37
69413	6	38
69414	6	39
69415	6	40
69416	6	41
69417	6	42
69418	6	43
69419	6	44
69420	6	45
69421	6	46
69422	6	47
69423	6	48
69424	6	49
69425	6	50
69426	6	51
69427	6	52
69428	6	53
69429	6	54
69430	6	55
69431	6	56
69432	6	57
69433	6	58
69434	6	59
69435	6	60
69436	6	61
69437	6	62
69438	6	63
69439	6	64
69440	6	65
69441	6	66
69442	6	68
69443	6	69
69444	6	70
69445	6	71
69446	6	72
69447	6	73
69448	6	74
69449	6	75
69450	6	76
69451	6	77
69452	7	1
69453	7	2
69454	7	3
69455	7	4
69456	7	5
69457	7	6
69458	7	7
69459	7	8
69460	7	9
69461	7	10
69462	7	11
69463	7	12
69464	7	13
69465	7	14
69466	7	15
69467	7	16
69468	7	17
69469	7	18
69470	7	19
69471	7	20
69472	7	21
69473	7	22
69474	7	23
69475	7	24
69476	7	25
69477	7	26
69478	7	27
69479	7	28
69480	7	29
69481	7	30
69482	7	31
69483	7	32
69484	7	33
69485	7	34
69486	7	35
69487	7	36
69488	7	37
69489	7	38
69490	7	39
69491	7	40
69492	7	41
69493	7	42
69494	7	43
69495	7	44
69496	7	45
69497	7	46
69498	7	47
69499	7	48
69500	7	49
69501	7	50
69502	7	51
69503	7	52
69504	7	53
69505	7	54
69506	7	55
69507	7	56
69508	7	57
69509	7	58
69510	7	59
69511	7	60
69512	7	61
69513	7	62
69514	7	63
69515	7	64
69516	7	65
69517	7	66
69518	7	68
69519	7	69
69520	7	70
69521	7	71
69522	7	72
69523	7	73
69524	7	74
69525	7	75
69526	7	76
69527	7	77
69528	8	1
69529	8	2
69530	8	3
69531	8	4
69532	8	5
69533	8	6
69534	8	7
69535	8	8
69536	8	9
69537	8	10
69538	8	11
69539	8	12
69540	8	13
69541	8	14
69542	8	15
69543	8	16
69544	8	17
69545	8	18
69546	8	19
69547	8	20
69548	8	21
69549	8	22
69550	8	23
69551	8	24
69552	8	25
69553	8	26
69554	8	27
69555	8	28
69556	8	29
69557	8	30
69558	8	31
69559	8	32
69560	8	33
69561	8	34
69562	8	35
69563	8	36
69564	8	37
69565	8	38
69566	8	39
69567	8	40
69568	8	41
69569	8	42
69570	8	43
69571	8	44
69572	8	45
69573	8	46
69574	8	47
69575	8	48
69576	8	49
69577	8	50
69578	8	51
69579	8	52
69580	8	53
69581	8	54
69582	8	55
69583	8	56
69584	8	57
69585	8	58
69586	8	59
69587	8	60
69588	8	61
69589	8	62
69590	8	63
69591	8	64
69592	8	65
69593	8	66
69594	8	68
69595	8	69
69596	8	70
69597	8	71
69598	8	72
69599	8	73
69600	8	74
69601	8	75
69602	8	76
69603	8	77
69604	9	1
69605	9	2
69606	9	3
69607	9	4
69608	9	5
69609	9	6
69610	9	7
69611	9	8
69612	9	9
69613	9	10
69614	9	11
69615	9	12
69616	9	13
69617	9	14
69618	9	15
69619	9	16
69620	9	17
69621	9	18
69622	9	19
69623	9	20
69624	9	21
69625	9	22
69626	9	23
69627	9	24
69628	9	25
69629	9	26
69630	9	27
69631	9	28
69632	9	29
69633	9	30
69634	9	31
69635	9	32
69636	9	33
69637	9	34
69638	9	35
69639	9	36
69640	9	37
69641	9	38
69642	9	39
69643	9	40
69644	9	41
69645	9	42
69646	9	43
69647	9	44
69648	9	45
69649	9	46
69650	9	47
69651	9	48
69652	9	49
69653	9	50
69654	9	51
69655	9	52
69656	9	53
69657	9	54
69658	9	55
69659	9	56
69660	9	57
69661	9	58
69662	9	59
69663	9	60
69664	9	61
69665	9	62
69666	9	63
69667	9	64
69668	9	65
69669	9	66
69670	9	68
69671	9	69
69672	9	70
69673	9	71
69674	9	72
69675	9	73
69676	9	74
69677	9	75
69678	9	76
69679	9	77
69680	10	1
69681	10	2
69682	10	3
69683	10	4
69684	10	5
69685	10	6
69686	10	7
69687	10	8
69688	10	9
69689	10	10
69690	10	11
69691	10	12
69692	10	13
69693	10	14
69694	10	15
69695	10	16
69696	10	17
69697	10	18
69698	10	19
69699	10	20
69700	10	21
69701	10	22
69702	10	23
69703	10	24
69704	10	25
69705	10	26
69706	10	27
69707	10	28
69708	10	29
69709	10	30
69710	10	31
69711	10	32
69712	10	33
69713	10	34
69714	10	35
69715	10	36
69716	10	37
69717	10	38
69718	10	39
69719	10	40
69720	10	41
69721	10	42
69722	10	43
69723	10	44
69724	10	45
69725	10	46
69726	10	47
69727	10	48
69728	10	49
69729	10	50
69730	10	51
69731	10	52
69732	10	53
69733	10	54
69734	10	55
69735	10	56
69736	10	57
69737	10	58
69738	10	59
69739	10	60
69740	10	61
69741	10	62
69742	10	63
69743	10	64
69744	10	65
69745	10	66
69746	10	68
69747	10	69
69748	10	70
69749	10	71
69750	10	72
69751	10	73
69752	10	74
69753	10	75
69754	10	76
69755	10	77
69756	11	1
69757	11	2
69758	11	3
69759	11	4
69760	11	5
69761	11	6
69762	11	7
69763	11	8
69764	11	9
69765	11	10
69766	11	11
69767	11	12
69768	11	13
69769	11	14
69770	11	15
69771	11	16
69772	11	17
69773	11	18
69774	11	19
69775	11	20
69776	11	21
69777	11	22
69778	11	23
69779	11	24
69780	11	25
69781	11	26
69782	11	27
69783	11	28
69784	11	29
69785	11	30
69786	11	31
69787	11	32
69788	11	33
69789	11	34
69790	11	35
69791	11	36
69792	11	37
69793	11	38
69794	11	39
69795	11	40
69796	11	41
69797	11	42
69798	11	43
69799	11	44
69800	11	45
69801	11	46
69802	11	47
69803	11	48
69804	11	49
69805	11	50
69806	11	51
69807	11	52
69808	11	53
69809	11	54
69810	11	55
69811	11	56
69812	11	57
69813	11	58
69814	11	59
69815	11	60
69816	11	61
69817	11	62
69818	11	63
69819	11	64
69820	11	65
69821	11	66
69822	11	68
69823	11	69
69824	11	70
69825	11	71
69826	11	72
69827	11	73
69828	11	74
69829	11	75
69830	11	76
69831	11	77
69832	12	1
69833	12	2
69834	12	3
69835	12	4
69836	12	5
69837	12	6
69838	12	7
69839	12	8
69840	12	9
69841	12	10
69842	12	11
69843	12	12
69844	12	13
69845	12	14
69846	12	15
69847	12	16
69848	12	17
69849	12	18
69850	12	19
69851	12	20
69852	12	21
69853	12	22
69854	12	23
69855	12	24
69856	12	25
69857	12	26
69858	12	27
69859	12	28
69860	12	29
69861	12	30
69862	12	31
69863	12	32
69864	12	33
69865	12	34
69866	12	35
69867	12	36
69868	12	37
69869	12	38
69870	12	39
69871	12	40
69872	12	41
69873	12	42
69874	12	43
69875	12	44
69876	12	45
69877	12	46
69878	12	47
69879	12	48
69880	12	49
69881	12	50
69882	12	51
69883	12	52
69884	12	53
69885	12	54
69886	12	55
69887	12	56
69888	12	57
69889	12	58
69890	12	59
69891	12	60
69892	12	61
69893	12	62
69894	12	63
69895	12	64
69896	12	65
69897	12	66
69898	12	68
69899	12	69
69900	12	70
69901	12	71
69902	12	72
69903	12	73
69904	12	74
69905	12	75
69906	12	76
69907	12	77
69908	13	1
69909	13	2
69910	13	3
69911	13	4
69912	13	5
69913	13	6
69914	13	7
69915	13	8
69916	13	9
69917	13	10
69918	13	11
69919	13	12
69920	13	13
69921	13	14
69922	13	15
69923	13	16
69924	13	17
69925	13	18
69926	13	19
69927	13	20
69928	13	21
69929	13	22
69930	13	23
69931	13	24
69932	13	25
69933	13	26
69934	13	27
69935	13	28
69936	13	29
69937	13	30
69938	13	31
69939	13	32
69940	13	33
69941	13	34
69942	13	35
69943	13	36
69944	13	37
69945	13	38
69946	13	39
69947	13	40
69948	13	41
69949	13	42
69950	13	43
69951	13	44
69952	13	45
69953	13	46
69954	13	47
69955	13	48
69956	13	49
69957	13	50
69958	13	51
69959	13	52
69960	13	53
69961	13	54
69962	13	55
69963	13	56
69964	13	57
69965	13	58
69966	13	59
69967	13	60
69968	13	61
69969	13	62
69970	13	63
69971	13	64
69972	13	65
69973	13	66
69974	13	68
69975	13	69
69976	13	70
69977	13	71
69978	13	72
69979	13	73
69980	13	74
69981	13	75
69982	13	76
69983	13	77
69984	14	1
69985	14	2
69986	14	3
69987	14	4
69988	14	5
69989	14	6
69990	14	7
69991	14	8
69992	14	9
69993	14	10
69994	14	11
69995	14	12
69996	14	13
69997	14	14
69998	14	15
69999	14	16
70000	14	17
70001	14	18
70002	14	19
70003	14	20
70004	14	21
70005	14	22
70006	14	23
70007	14	24
70008	14	25
70009	14	26
70010	14	27
70011	14	28
70012	14	29
70013	14	30
70014	14	31
70015	14	32
70016	14	33
70017	14	34
70018	14	35
70019	14	36
70020	14	37
70021	14	38
70022	14	39
70023	14	40
70024	14	41
70025	14	42
70026	14	43
70027	14	44
70028	14	45
70029	14	46
70030	14	47
70031	14	48
70032	14	49
70033	14	50
70034	14	51
70035	14	52
70036	14	53
70037	14	54
70038	14	55
70039	14	56
70040	14	57
70041	14	58
70042	14	59
70043	14	60
70044	14	61
70045	14	62
70046	14	63
70047	14	64
70048	14	65
70049	14	66
70050	14	68
70051	14	69
70052	14	70
70053	14	71
70054	14	72
70055	14	73
70056	14	74
70057	14	75
70058	14	76
70059	14	77
70060	15	1
70061	15	2
70062	15	3
70063	15	4
70064	15	5
70065	15	6
70066	15	7
70067	15	8
70068	15	9
70069	15	10
70070	15	11
70071	15	12
70072	15	13
70073	15	14
70074	15	15
70075	15	16
70076	15	17
70077	15	18
70078	15	19
70079	15	20
70080	15	21
70081	15	22
70082	15	23
70083	15	24
70084	15	25
70085	15	26
70086	15	27
70087	15	28
70088	15	29
70089	15	30
70090	15	31
70091	15	32
70092	15	33
70093	15	34
70094	15	35
70095	15	36
70096	15	37
70097	15	38
70098	15	39
70099	15	40
70100	15	41
70101	15	42
70102	15	43
70103	15	44
70104	15	45
70105	15	46
70106	15	47
70107	15	48
70108	15	49
70109	15	50
70110	15	51
70111	15	52
70112	15	53
70113	15	54
70114	15	55
70115	15	56
70116	15	57
70117	15	58
70118	15	59
70119	15	60
70120	15	61
70121	15	62
70122	15	63
70123	15	64
70124	15	65
70125	15	66
70126	15	68
70127	15	69
70128	15	70
70129	15	71
70130	15	72
70131	15	73
70132	15	74
70133	15	75
70134	15	76
70135	15	77
70136	16	1
70137	16	2
70138	16	3
70139	16	4
70140	16	5
70141	16	6
70142	16	7
70143	16	8
70144	16	9
70145	16	10
70146	16	11
70147	16	12
70148	16	13
70149	16	14
70150	16	15
70151	16	16
70152	16	17
70153	16	18
70154	16	19
70155	16	20
70156	16	21
70157	16	22
70158	16	23
70159	16	24
70160	16	25
70161	16	26
70162	16	27
70163	16	28
70164	16	29
70165	16	30
70166	16	31
70167	16	32
70168	16	33
70169	16	34
70170	16	35
70171	16	36
70172	16	37
70173	16	38
70174	16	39
70175	16	40
70176	16	41
70177	16	42
70178	16	43
70179	16	44
70180	16	45
70181	16	46
70182	16	47
70183	16	48
70184	16	49
70185	16	50
70186	16	51
70187	16	52
70188	16	53
70189	16	54
70190	16	55
70191	16	56
70192	16	57
70193	16	58
70194	16	59
70195	16	60
70196	16	61
70197	16	62
70198	16	63
70199	16	64
70200	16	65
70201	16	66
70202	16	68
70203	16	69
70204	16	70
70205	16	71
70206	16	72
70207	16	73
70208	16	74
70209	16	75
70210	16	76
70211	16	77
70212	17	1
70213	17	2
70214	17	3
70215	17	4
70216	17	5
70217	17	6
70218	17	7
70219	17	8
70220	17	9
70221	17	10
70222	17	11
70223	17	12
70224	17	13
70225	17	14
70226	17	15
70227	17	16
70228	17	17
70229	17	18
70230	17	19
70231	17	20
70232	17	21
70233	17	22
70234	17	23
70235	17	24
70236	17	25
70237	17	26
70238	17	27
70239	17	28
70240	17	29
70241	17	30
70242	17	31
70243	17	32
70244	17	33
70245	17	34
70246	17	35
70247	17	36
70248	17	37
70249	17	38
70250	17	39
70251	17	40
70252	17	41
70253	17	42
70254	17	43
70255	17	44
70256	17	45
70257	17	46
70258	17	47
70259	17	48
70260	17	49
70261	17	50
70262	17	51
70263	17	52
70264	17	53
70265	17	54
70266	17	55
70267	17	56
70268	17	57
70269	17	58
70270	17	59
70271	17	60
70272	17	61
70273	17	62
70274	17	63
70275	17	64
70276	17	65
70277	17	66
70278	17	68
70279	17	69
70280	17	70
70281	17	71
70282	17	72
70283	17	73
70284	17	74
70285	17	75
70286	17	76
70287	17	77
70288	18	1
70289	18	2
70290	18	3
70291	18	4
70292	18	5
70293	18	6
70294	18	7
70295	18	8
70296	18	9
70297	18	10
70298	18	11
70299	18	12
70300	18	13
70301	18	14
70302	18	15
70303	18	16
70304	18	17
70305	18	18
70306	18	19
70307	18	20
70308	18	21
70309	18	22
70310	18	23
70311	18	24
70312	18	25
70313	18	26
70314	18	27
70315	18	28
70316	18	29
70317	18	30
70318	18	31
70319	18	32
70320	18	33
70321	18	34
70322	18	35
70323	18	36
70324	18	37
70325	18	38
70326	18	39
70327	18	40
70328	18	41
70329	18	42
70330	18	43
70331	18	44
70332	18	45
70333	18	46
70334	18	47
70335	18	48
70336	18	49
70337	18	50
70338	18	51
70339	18	52
70340	18	53
70341	18	54
70342	18	55
70343	18	56
70344	18	57
70345	18	58
70346	18	59
70347	18	60
70348	18	61
70349	18	62
70350	18	63
70351	18	64
70352	18	65
70353	18	66
70354	18	68
70355	18	69
70356	18	70
70357	18	71
70358	18	72
70359	18	73
70360	18	74
70361	18	75
70362	18	76
70363	18	77
70364	19	1
70365	19	2
70366	19	3
70367	19	4
70368	19	5
70369	19	6
70370	19	7
70371	19	8
70372	19	9
70373	19	10
70374	19	11
70375	19	12
70376	19	13
70377	19	14
70378	19	15
70379	19	16
70380	19	17
70381	19	18
70382	19	19
70383	19	20
70384	19	21
70385	19	22
70386	19	23
70387	19	24
70388	19	25
70389	19	26
70390	19	27
70391	19	28
70392	19	29
70393	19	30
70394	19	31
70395	19	32
70396	19	33
70397	19	34
70398	19	35
70399	19	36
70400	19	37
70401	19	38
70402	19	39
70403	19	40
70404	19	41
70405	19	42
70406	19	43
70407	19	44
70408	19	45
70409	19	46
70410	19	47
70411	19	48
70412	19	49
70413	19	50
70414	19	51
70415	19	52
70416	19	53
70417	19	54
70418	19	55
70419	19	56
70420	19	57
70421	19	58
70422	19	59
70423	19	60
70424	19	61
70425	19	62
70426	19	63
70427	19	64
70428	19	65
70429	19	66
70430	19	68
70431	19	69
70432	19	70
70433	19	71
70434	19	72
70435	19	73
70436	19	74
70437	19	75
70438	19	76
70439	19	77
70440	20	1
70441	20	2
70442	20	3
70443	20	4
70444	20	5
70445	20	6
70446	20	7
70447	20	8
70448	20	9
70449	20	10
70450	20	11
70451	20	12
70452	20	13
70453	20	14
70454	20	15
70455	20	16
70456	20	17
70457	20	18
70458	20	19
70459	20	20
70460	20	21
70461	20	22
70462	20	23
70463	20	24
70464	20	25
70465	20	26
70466	20	27
70467	20	28
70468	20	29
70469	20	30
70470	20	31
70471	20	32
70472	20	33
70473	20	34
70474	20	35
70475	20	36
70476	20	37
70477	20	38
70478	20	39
70479	20	40
70480	20	41
70481	20	42
70482	20	43
70483	20	44
70484	20	45
70485	20	46
70486	20	47
70487	20	48
70488	20	49
70489	20	50
70490	20	51
70491	20	52
70492	20	53
70493	20	54
70494	20	55
70495	20	56
70496	20	57
70497	20	58
70498	20	59
70499	20	60
70500	20	61
70501	20	62
70502	20	63
70503	20	64
70504	20	65
70505	20	66
70506	20	68
70507	20	69
70508	20	70
70509	20	71
70510	20	72
70511	20	73
70512	20	74
70513	20	75
70514	20	76
70515	20	77
70516	21	1
70517	21	2
70518	21	3
70519	21	4
70520	21	5
70521	21	6
70522	21	7
70523	21	8
70524	21	9
70525	21	10
70526	21	11
70527	21	12
70528	21	13
70529	21	14
70530	21	15
70531	21	16
70532	21	17
70533	21	18
70534	21	19
70535	21	20
70536	21	21
70537	21	22
70538	21	23
70539	21	24
70540	21	25
70541	21	26
70542	21	27
70543	21	28
70544	21	29
70545	21	30
70546	21	31
70547	21	32
70548	21	33
70549	21	34
70550	21	35
70551	21	36
70552	21	37
70553	21	38
70554	21	39
70555	21	40
70556	21	41
70557	21	42
70558	21	43
70559	21	44
70560	21	45
70561	21	46
70562	21	47
70563	21	48
70564	21	49
70565	21	50
70566	21	51
70567	21	52
70568	21	53
70569	21	54
70570	21	55
70571	21	56
70572	21	57
70573	21	58
70574	21	59
70575	21	60
70576	21	61
70577	21	62
70578	21	63
70579	21	64
70580	21	65
70581	21	66
70582	21	68
70583	21	69
70584	21	70
70585	21	71
70586	21	72
70587	21	73
70588	21	74
70589	21	75
70590	21	76
70591	21	77
70592	22	1
70593	22	2
70594	22	3
70595	22	4
70596	22	5
70597	22	6
70598	22	7
70599	22	8
70600	22	9
70601	22	10
70602	22	11
70603	22	12
70604	22	13
70605	22	14
70606	22	15
70607	22	16
70608	22	17
70609	22	18
70610	22	19
70611	22	20
70612	22	21
70613	22	22
70614	22	23
70615	22	24
70616	22	25
70617	22	26
70618	22	27
70619	22	28
70620	22	29
70621	22	30
70622	22	31
70623	22	32
70624	22	33
70625	22	34
70626	22	35
70627	22	36
70628	22	37
70629	22	38
70630	22	39
70631	22	40
70632	22	41
70633	22	42
70634	22	43
70635	22	44
70636	22	45
70637	22	46
70638	22	47
70639	22	48
70640	22	49
70641	22	50
70642	22	51
70643	22	52
70644	22	53
70645	22	54
70646	22	55
70647	22	56
70648	22	57
70649	22	58
70650	22	59
70651	22	60
70652	22	61
70653	22	62
70654	22	63
70655	22	64
70656	22	65
70657	22	66
70658	22	68
70659	22	69
70660	22	70
70661	22	71
70662	22	72
70663	22	73
70664	22	74
70665	22	75
70666	22	76
70667	22	77
70668	23	1
70669	23	2
70670	23	3
70671	23	4
70672	23	5
70673	23	6
70674	23	7
70675	23	8
70676	23	9
70677	23	10
70678	23	11
70679	23	12
70680	23	13
70681	23	14
70682	23	15
70683	23	16
70684	23	17
70685	23	18
70686	23	19
70687	23	20
70688	23	21
70689	23	22
70690	23	23
70691	23	24
70692	23	25
70693	23	26
70694	23	27
70695	23	28
70696	23	29
70697	23	30
70698	23	31
70699	23	32
70700	23	33
70701	23	34
70702	23	35
70703	23	36
70704	23	37
70705	23	38
70706	23	39
70707	23	40
70708	23	41
70709	23	42
70710	23	43
70711	23	44
70712	23	45
70713	23	46
70714	23	47
70715	23	48
70716	23	49
70717	23	50
70718	23	51
70719	23	52
70720	23	53
70721	23	54
70722	23	55
70723	23	56
70724	23	57
70725	23	58
70726	23	59
70727	23	60
70728	23	61
70729	23	62
70730	23	63
70731	23	64
70732	23	65
70733	23	66
70734	23	68
70735	23	69
70736	23	70
70737	23	71
70738	23	72
70739	23	73
70740	23	74
70741	23	75
70742	23	76
70743	23	77
70744	24	1
70745	24	2
70746	24	3
70747	24	4
70748	24	5
70749	24	6
70750	24	7
70751	24	8
70752	24	9
70753	24	10
70754	24	11
70755	24	12
70756	24	13
70757	24	14
70758	24	15
70759	24	16
70760	24	17
70761	24	18
70762	24	19
70763	24	20
70764	24	21
70765	24	22
70766	24	23
70767	24	24
70768	24	25
70769	24	26
70770	24	27
70771	24	28
70772	24	29
70773	24	30
70774	24	31
70775	24	32
70776	24	33
70777	24	34
70778	24	35
70779	24	36
70780	24	37
70781	24	38
70782	24	39
70783	24	40
70784	24	41
70785	24	42
70786	24	43
70787	24	44
70788	24	45
70789	24	46
70790	24	47
70791	24	48
70792	24	49
70793	24	50
70794	24	51
70795	24	52
70796	24	53
70797	24	54
70798	24	55
70799	24	56
70800	24	57
70801	24	58
70802	24	59
70803	24	60
70804	24	61
70805	24	62
70806	24	63
70807	24	64
70808	24	65
70809	24	66
70810	24	68
70811	24	69
70812	24	70
70813	24	71
70814	24	72
70815	24	73
70816	24	74
70817	24	75
70818	24	76
70819	24	77
70820	25	1
70821	25	2
70822	25	3
70823	25	4
70824	25	5
70825	25	6
70826	25	7
70827	25	8
70828	25	9
70829	25	10
70830	25	11
70831	25	12
70832	25	13
70833	25	14
70834	25	15
70835	25	16
70836	25	17
70837	25	18
70838	25	19
70839	25	20
70840	25	21
70841	25	22
70842	25	23
70843	25	24
70844	25	25
70845	25	26
70846	25	27
70847	25	28
70848	25	29
70849	25	30
70850	25	31
70851	25	32
70852	25	33
70853	25	34
70854	25	35
70855	25	36
70856	25	37
70857	25	38
70858	25	39
70859	25	40
70860	25	41
70861	25	42
70862	25	43
70863	25	44
70864	25	45
70865	25	46
70866	25	47
70867	25	48
70868	25	49
70869	25	50
70870	25	51
70871	25	52
70872	25	53
70873	25	54
70874	25	55
70875	25	56
70876	25	57
70877	25	58
70878	25	59
70879	25	60
70880	25	61
70881	25	62
70882	25	63
70883	25	64
70884	25	65
70885	25	66
70886	25	68
70887	25	69
70888	25	70
70889	25	71
70890	25	72
70891	25	73
70892	25	74
70893	25	75
70894	25	76
70895	25	77
70896	26	1
70897	26	2
70898	26	3
70899	26	4
70900	26	5
70901	26	6
70902	26	7
70903	26	8
70904	26	9
70905	26	10
70906	26	11
70907	26	12
70908	26	13
70909	26	14
70910	26	15
70911	26	16
70912	26	17
70913	26	18
70914	26	19
70915	26	20
70916	26	21
70917	26	22
70918	26	23
70919	26	24
70920	26	25
70921	26	26
70922	26	27
70923	26	28
70924	26	29
70925	26	30
70926	26	31
70927	26	32
70928	26	33
70929	26	34
70930	26	35
70931	26	36
70932	26	37
70933	26	38
70934	26	39
70935	26	40
70936	26	41
70937	26	42
70938	26	43
70939	26	44
70940	26	45
70941	26	46
70942	26	47
70943	26	48
70944	26	49
70945	26	50
70946	26	51
70947	26	52
70948	26	53
70949	26	54
70950	26	55
70951	26	56
70952	26	57
70953	26	58
70954	26	59
70955	26	60
70956	26	61
70957	26	62
70958	26	63
70959	26	64
70960	26	65
70961	26	66
70962	26	68
70963	26	69
70964	26	70
70965	26	71
70966	26	72
70967	26	73
70968	26	74
70969	26	75
70970	26	76
70971	26	77
70972	27	1
70973	27	2
70974	27	3
70975	27	4
70976	27	5
70977	27	6
70978	27	7
70979	27	8
70980	27	9
70981	27	10
70982	27	11
70983	27	12
70984	27	13
70985	27	14
70986	27	15
70987	27	16
70988	27	17
70989	27	18
70990	27	19
70991	27	20
70992	27	21
70993	27	22
70994	27	23
70995	27	24
70996	27	25
70997	27	26
70998	27	27
70999	27	28
71000	27	29
71001	27	30
71002	27	31
71003	27	32
71004	27	33
71005	27	34
71006	27	35
71007	27	36
71008	27	37
71009	27	38
71010	27	39
71011	27	40
71012	27	41
71013	27	42
71014	27	43
71015	27	44
71016	27	45
71017	27	46
71018	27	47
71019	27	48
71020	27	49
71021	27	50
71022	27	51
71023	27	52
71024	27	53
71025	27	54
71026	27	55
71027	27	56
71028	27	57
71029	27	58
71030	27	59
71031	27	60
71032	27	61
71033	27	62
71034	27	63
71035	27	64
71036	27	65
71037	27	66
71038	27	68
71039	27	69
71040	27	70
71041	27	71
71042	27	72
71043	27	73
71044	27	74
71045	27	75
71046	27	76
71047	27	77
71048	28	1
71049	28	2
71050	28	3
71051	28	4
71052	28	5
71053	28	6
71054	28	7
71055	28	8
71056	28	9
71057	28	10
71058	28	11
71059	28	12
71060	28	13
71061	28	14
71062	28	15
71063	28	16
71064	28	17
71065	28	18
71066	28	19
71067	28	20
71068	28	21
71069	28	22
71070	28	23
71071	28	24
71072	28	25
71073	28	26
71074	28	27
71075	28	28
71076	28	29
71077	28	30
71078	28	31
71079	28	32
71080	28	33
71081	28	34
71082	28	35
71083	28	36
71084	28	37
71085	28	38
71086	28	39
71087	28	40
71088	28	41
71089	28	42
71090	28	43
71091	28	44
71092	28	45
71093	28	46
71094	28	47
71095	28	48
71096	28	49
71097	28	50
71098	28	51
71099	28	52
71100	28	53
71101	28	54
71102	28	55
71103	28	56
71104	28	57
71105	28	58
71106	28	59
71107	28	60
71108	28	61
71109	28	62
71110	28	63
71111	28	64
71112	28	65
71113	28	66
71114	28	68
71115	28	69
71116	28	70
71117	28	71
71118	28	72
71119	28	73
71120	28	74
71121	28	75
71122	28	76
71123	28	77
71124	29	1
71125	29	2
71126	29	3
71127	29	4
71128	29	5
71129	29	6
71130	29	7
71131	29	8
71132	29	9
71133	29	10
71134	29	11
71135	29	12
71136	29	13
71137	29	14
71138	29	15
71139	29	16
71140	29	17
71141	29	18
71142	29	19
71143	29	20
71144	29	21
71145	29	22
71146	29	23
71147	29	24
71148	29	25
71149	29	26
71150	29	27
71151	29	28
71152	29	29
71153	29	30
71154	29	31
71155	29	32
71156	29	33
71157	29	34
71158	29	35
71159	29	36
71160	29	37
71161	29	38
71162	29	39
71163	29	40
71164	29	41
71165	29	42
71166	29	43
71167	29	44
71168	29	45
71169	29	46
71170	29	47
71171	29	48
71172	29	49
71173	29	50
71174	29	51
71175	29	52
71176	29	53
71177	29	54
71178	29	55
71179	29	56
71180	29	57
71181	29	58
71182	29	59
71183	29	60
71184	29	61
71185	29	62
71186	29	63
71187	29	64
71188	29	65
71189	29	66
71190	29	68
71191	29	69
71192	29	70
71193	29	71
71194	29	72
71195	29	73
71196	29	74
71197	29	75
71198	29	76
71199	29	77
71200	30	1
71201	30	2
71202	30	3
71203	30	4
71204	30	5
71205	30	6
71206	30	7
71207	30	8
71208	30	9
71209	30	10
71210	30	11
71211	30	12
71212	30	13
71213	30	14
71214	30	15
71215	30	16
71216	30	17
71217	30	18
71218	30	19
71219	30	20
71220	30	21
71221	30	22
71222	30	23
71223	30	24
71224	30	25
71225	30	26
71226	30	27
71227	30	28
71228	30	29
71229	30	30
71230	30	31
71231	30	32
71232	30	33
71233	30	34
71234	30	35
71235	30	36
71236	30	37
71237	30	38
71238	30	39
71239	30	40
71240	30	41
71241	30	42
71242	30	43
71243	30	44
71244	30	45
71245	30	46
71246	30	47
71247	30	48
71248	30	49
71249	30	50
71250	30	51
71251	30	52
71252	30	53
71253	30	54
71254	30	55
71255	30	56
71256	30	57
71257	30	58
71258	30	59
71259	30	60
71260	30	61
71261	30	62
71262	30	63
71263	30	64
71264	30	65
71265	30	66
71266	30	68
71267	30	69
71268	30	70
71269	30	71
71270	30	72
71271	30	73
71272	30	74
71273	30	75
71274	30	76
71275	30	77
71276	31	1
71277	31	2
71278	31	3
71279	31	4
71280	31	5
71281	31	6
71282	31	7
71283	31	8
71284	31	9
71285	31	10
71286	31	11
71287	31	12
71288	31	13
71289	31	14
71290	31	15
71291	31	16
71292	31	17
71293	31	18
71294	31	19
71295	31	20
71296	31	21
71297	31	22
71298	31	23
71299	31	24
71300	31	25
71301	31	26
71302	31	27
71303	31	28
71304	31	29
71305	31	30
71306	31	31
71307	31	32
71308	31	33
71309	31	34
71310	31	35
71311	31	36
71312	31	37
71313	31	38
71314	31	39
71315	31	40
71316	31	41
71317	31	42
71318	31	43
71319	31	44
71320	31	45
71321	31	46
71322	31	47
71323	31	48
71324	31	49
71325	31	50
71326	31	51
71327	31	52
71328	31	53
71329	31	54
71330	31	55
71331	31	56
71332	31	57
71333	31	58
71334	31	59
71335	31	60
71336	31	61
71337	31	62
71338	31	63
71339	31	64
71340	31	65
71341	31	66
71342	31	68
71343	31	69
71344	31	70
71345	31	71
71346	31	72
71347	31	73
71348	31	74
71349	31	75
71350	31	76
71351	31	77
71352	32	1
71353	32	2
71354	32	3
71355	32	4
71356	32	5
71357	32	6
71358	32	7
71359	32	8
71360	32	9
71361	32	10
71362	32	11
71363	32	12
71364	32	13
71365	32	14
71366	32	15
71367	32	16
71368	32	17
71369	32	18
71370	32	19
71371	32	20
71372	32	21
71373	32	22
71374	32	23
71375	32	24
71376	32	25
71377	32	26
71378	32	27
71379	32	28
71380	32	29
71381	32	30
71382	32	31
71383	32	32
71384	32	33
71385	32	34
71386	32	35
71387	32	36
71388	32	37
71389	32	38
71390	32	39
71391	32	40
71392	32	41
71393	32	42
71394	32	43
71395	32	44
71396	32	45
71397	32	46
71398	32	47
71399	32	48
71400	32	49
71401	32	50
71402	32	51
71403	32	52
71404	32	53
71405	32	54
71406	32	55
71407	32	56
71408	32	57
71409	32	58
71410	32	59
71411	32	60
71412	32	61
71413	32	62
71414	32	63
71415	32	64
71416	32	65
71417	32	66
71418	32	68
71419	32	69
71420	32	70
71421	32	71
71422	32	72
71423	32	73
71424	32	74
71425	32	75
71426	32	76
71427	32	77
71428	33	1
71429	33	2
71430	33	3
71431	33	4
71432	33	5
71433	33	6
71434	33	7
71435	33	8
71436	33	9
71437	33	10
71438	33	11
71439	33	12
71440	33	13
71441	33	14
71442	33	15
71443	33	16
71444	33	17
71445	33	18
71446	33	19
71447	33	20
71448	33	21
71449	33	22
71450	33	23
71451	33	24
71452	33	25
71453	33	26
71454	33	27
71455	33	28
71456	33	29
71457	33	30
71458	33	31
71459	33	32
71460	33	33
71461	33	34
71462	33	35
71463	33	36
71464	33	37
71465	33	38
71466	33	39
71467	33	40
71468	33	41
71469	33	42
71470	33	43
71471	33	44
71472	33	45
71473	33	46
71474	33	47
71475	33	48
71476	33	49
71477	33	50
71478	33	51
71479	33	52
71480	33	53
71481	33	54
71482	33	55
71483	33	56
71484	33	57
71485	33	58
71486	33	59
71487	33	60
71488	33	61
71489	33	62
71490	33	63
71491	33	64
71492	33	65
71493	33	66
71494	33	68
71495	33	69
71496	33	70
71497	33	71
71498	33	72
71499	33	73
71500	33	74
71501	33	75
71502	33	76
71503	33	77
71504	34	1
71505	34	2
71506	34	3
71507	34	4
71508	34	5
71509	34	6
71510	34	7
71511	34	8
71512	34	9
71513	34	10
71514	34	11
71515	34	12
71516	34	13
71517	34	14
71518	34	15
71519	34	16
71520	34	17
71521	34	18
71522	34	19
71523	34	20
71524	34	21
71525	34	22
71526	34	23
71527	34	24
71528	34	25
71529	34	26
71530	34	27
71531	34	28
71532	34	29
71533	34	30
71534	34	31
71535	34	32
71536	34	33
71537	34	34
71538	34	35
71539	34	36
71540	34	37
71541	34	38
71542	34	39
71543	34	40
71544	34	41
71545	34	42
71546	34	43
71547	34	44
71548	34	45
71549	34	46
71550	34	47
71551	34	48
71552	34	49
71553	34	50
71554	34	51
71555	34	52
71556	34	53
71557	34	54
71558	34	55
71559	34	56
71560	34	57
71561	34	58
71562	34	59
71563	34	60
71564	34	61
71565	34	62
71566	34	63
71567	34	64
71568	34	65
71569	34	66
71570	34	68
71571	34	69
71572	34	70
71573	34	71
71574	34	72
71575	34	73
71576	34	74
71577	34	75
71578	34	76
71579	34	77
71580	35	1
71581	35	2
71582	35	3
71583	35	4
71584	35	5
71585	35	6
71586	35	7
71587	35	8
71588	35	9
71589	35	10
71590	35	11
71591	35	12
71592	35	13
71593	35	14
71594	35	15
71595	35	16
71596	35	17
71597	35	18
71598	35	19
71599	35	20
71600	35	21
71601	35	22
71602	35	23
71603	35	24
71604	35	25
71605	35	26
71606	35	27
71607	35	28
71608	35	29
71609	35	30
71610	35	31
71611	35	32
71612	35	33
71613	35	34
71614	35	35
71615	35	36
71616	35	37
71617	35	38
71618	35	39
71619	35	40
71620	35	41
71621	35	42
71622	35	43
71623	35	44
71624	35	45
71625	35	46
71626	35	47
71627	35	48
71628	35	49
71629	35	50
71630	35	51
71631	35	52
71632	35	53
71633	35	54
71634	35	55
71635	35	56
71636	35	57
71637	35	58
71638	35	59
71639	35	60
71640	35	61
71641	35	62
71642	35	63
71643	35	64
71644	35	65
71645	35	66
71646	35	68
71647	35	69
71648	35	70
71649	35	71
71650	35	72
71651	35	73
71652	35	74
71653	35	75
71654	35	76
71655	35	77
71656	36	1
71657	36	2
71658	36	3
71659	36	4
71660	36	5
71661	36	6
71662	36	7
71663	36	8
71664	36	9
71665	36	10
71666	36	11
71667	36	12
71668	36	13
71669	36	14
71670	36	15
71671	36	16
71672	36	17
71673	36	18
71674	36	19
71675	36	20
71676	36	21
71677	36	22
71678	36	23
71679	36	24
71680	36	25
71681	36	26
71682	36	27
71683	36	28
71684	36	29
71685	36	30
71686	36	31
71687	36	32
71688	36	33
71689	36	34
71690	36	35
71691	36	36
71692	36	37
71693	36	38
71694	36	39
71695	36	40
71696	36	41
71697	36	42
71698	36	43
71699	36	44
71700	36	45
71701	36	46
71702	36	47
71703	36	48
71704	36	49
71705	36	50
71706	36	51
71707	36	52
71708	36	53
71709	36	54
71710	36	55
71711	36	56
71712	36	57
71713	36	58
71714	36	59
71715	36	60
71716	36	61
71717	36	62
71718	36	63
71719	36	64
71720	36	65
71721	36	66
71722	36	68
71723	36	69
71724	36	70
71725	36	71
71726	36	72
71727	36	73
71728	36	74
71729	36	75
71730	36	76
71731	36	77
71732	37	1
71733	37	2
71734	37	3
71735	37	4
71736	37	5
71737	37	6
71738	37	7
71739	37	8
71740	37	9
71741	37	10
71742	37	11
71743	37	12
71744	37	13
71745	37	14
71746	37	15
71747	37	16
71748	37	17
71749	37	18
71750	37	19
71751	37	20
71752	37	21
71753	37	22
71754	37	23
71755	37	24
71756	37	25
71757	37	26
71758	37	27
71759	37	28
71760	37	29
71761	37	30
71762	37	31
71763	37	32
71764	37	33
71765	37	34
71766	37	35
71767	37	36
71768	37	37
71769	37	38
71770	37	39
71771	37	40
71772	37	41
71773	37	42
71774	37	43
71775	37	44
71776	37	45
71777	37	46
71778	37	47
71779	37	48
71780	37	49
71781	37	50
71782	37	51
71783	37	52
71784	37	53
71785	37	54
71786	37	55
71787	37	56
71788	37	57
71789	37	58
71790	37	59
71791	37	60
71792	37	61
71793	37	62
71794	37	63
71795	37	64
71796	37	65
71797	37	66
71798	37	68
71799	37	69
71800	37	70
71801	37	71
71802	37	72
71803	37	73
71804	37	74
71805	37	75
71806	37	76
71807	37	77
71808	38	1
71809	38	2
71810	38	3
71811	38	4
71812	38	5
71813	38	6
71814	38	7
71815	38	8
71816	38	9
71817	38	10
71818	38	11
71819	38	12
71820	38	13
71821	38	14
71822	38	15
71823	38	16
71824	38	17
71825	38	18
71826	38	19
71827	38	20
71828	38	21
71829	38	22
71830	38	23
71831	38	24
71832	38	25
71833	38	26
71834	38	27
71835	38	28
71836	38	29
71837	38	30
71838	38	31
71839	38	32
71840	38	33
71841	38	34
71842	38	35
71843	38	36
71844	38	37
71845	38	38
71846	38	39
71847	38	40
71848	38	41
71849	38	42
71850	38	43
71851	38	44
71852	38	45
71853	38	46
71854	38	47
71855	38	48
71856	38	49
71857	38	50
71858	38	51
71859	38	52
71860	38	53
71861	38	54
71862	38	55
71863	38	56
71864	38	57
71865	38	58
71866	38	59
71867	38	60
71868	38	61
71869	38	62
71870	38	63
71871	38	64
71872	38	65
71873	38	66
71874	38	68
71875	38	69
71876	38	70
71877	38	71
71878	38	72
71879	38	73
71880	38	74
71881	38	75
71882	38	76
71883	38	77
71884	39	1
71885	39	2
71886	39	3
71887	39	4
71888	39	5
71889	39	6
71890	39	7
71891	39	8
71892	39	9
71893	39	10
71894	39	11
71895	39	12
71896	39	13
71897	39	14
71898	39	15
71899	39	16
71900	39	17
71901	39	18
71902	39	19
71903	39	20
71904	39	21
71905	39	22
71906	39	23
71907	39	24
71908	39	25
71909	39	26
71910	39	27
71911	39	28
71912	39	29
71913	39	30
71914	39	31
71915	39	32
71916	39	33
71917	39	34
71918	39	35
71919	39	36
71920	39	37
71921	39	38
71922	39	39
71923	39	40
71924	39	41
71925	39	42
71926	39	43
71927	39	44
71928	39	45
71929	39	46
71930	39	47
71931	39	48
71932	39	49
71933	39	50
71934	39	51
71935	39	52
71936	39	53
71937	39	54
71938	39	55
71939	39	56
71940	39	57
71941	39	58
71942	39	59
71943	39	60
71944	39	61
71945	39	62
71946	39	63
71947	39	64
71948	39	65
71949	39	66
71950	39	68
71951	39	69
71952	39	70
71953	39	71
71954	39	72
71955	39	73
71956	39	74
71957	39	75
71958	39	76
71959	39	77
71960	40	1
71961	40	2
71962	40	3
71963	40	4
71964	40	5
71965	40	6
71966	40	7
71967	40	8
71968	40	9
71969	40	10
71970	40	11
71971	40	12
71972	40	13
71973	40	14
71974	40	15
71975	40	16
71976	40	17
71977	40	18
71978	40	19
71979	40	20
71980	40	21
71981	40	22
71982	40	23
71983	40	24
71984	40	25
71985	40	26
71986	40	27
71987	40	28
71988	40	29
71989	40	30
71990	40	31
71991	40	32
71992	40	33
71993	40	34
71994	40	35
71995	40	36
71996	40	37
71997	40	38
71998	40	39
71999	40	40
72000	40	41
72001	40	42
72002	40	43
72003	40	44
72004	40	45
72005	40	46
72006	40	47
72007	40	48
72008	40	49
72009	40	50
72010	40	51
72011	40	52
72012	40	53
72013	40	54
72014	40	55
72015	40	56
72016	40	57
72017	40	58
72018	40	59
72019	40	60
72020	40	61
72021	40	62
72022	40	63
72023	40	64
72024	40	65
72025	40	66
72026	40	68
72027	40	69
72028	40	70
72029	40	71
72030	40	72
72031	40	73
72032	40	74
72033	40	75
72034	40	76
72035	40	77
72036	41	1
72037	41	2
72038	41	3
72039	41	4
72040	41	5
72041	41	6
72042	41	7
72043	41	8
72044	41	9
72045	41	10
72046	41	11
72047	41	12
72048	41	13
72049	41	14
72050	41	15
72051	41	16
72052	41	17
72053	41	18
72054	41	19
72055	41	20
72056	41	21
72057	41	22
72058	41	23
72059	41	24
72060	41	25
72061	41	26
72062	41	27
72063	41	28
72064	41	29
72065	41	30
72066	41	31
72067	41	32
72068	41	33
72069	41	34
72070	41	35
72071	41	36
72072	41	37
72073	41	38
72074	41	39
72075	41	40
72076	41	41
72077	41	42
72078	41	43
72079	41	44
72080	41	45
72081	41	46
72082	41	47
72083	41	48
72084	41	49
72085	41	50
72086	41	51
72087	41	52
72088	41	53
72089	41	54
72090	41	55
72091	41	56
72092	41	57
72093	41	58
72094	41	59
72095	41	60
72096	41	61
72097	41	62
72098	41	63
72099	41	64
72100	41	65
72101	41	66
72102	41	68
72103	41	69
72104	41	70
72105	41	71
72106	41	72
72107	41	73
72108	41	74
72109	41	75
72110	41	76
72111	41	77
72112	42	1
72113	42	2
72114	42	3
72115	42	4
72116	42	5
72117	42	6
72118	42	7
72119	42	8
72120	42	9
72121	42	10
72122	42	11
72123	42	12
72124	42	13
72125	42	14
72126	42	15
72127	42	16
72128	42	17
72129	42	18
72130	42	19
72131	42	20
72132	42	21
72133	42	22
72134	42	23
72135	42	24
72136	42	25
72137	42	26
72138	42	27
72139	42	28
72140	42	29
72141	42	30
72142	42	31
72143	42	32
72144	42	33
72145	42	34
72146	42	35
72147	42	36
72148	42	37
72149	42	38
72150	42	39
72151	42	40
72152	42	41
72153	42	42
72154	42	43
72155	42	44
72156	42	45
72157	42	46
72158	42	47
72159	42	48
72160	42	49
72161	42	50
72162	42	51
72163	42	52
72164	42	53
72165	42	54
72166	42	55
72167	42	56
72168	42	57
72169	42	58
72170	42	59
72171	42	60
72172	42	61
72173	42	62
72174	42	63
72175	42	64
72176	42	65
72177	42	66
72178	42	68
72179	42	69
72180	42	70
72181	42	71
72182	42	72
72183	42	73
72184	42	74
72185	42	75
72186	42	76
72187	42	77
72188	43	1
72189	43	2
72190	43	3
72191	43	4
72192	43	5
72193	43	6
72194	43	7
72195	43	8
72196	43	9
72197	43	10
72198	43	11
72199	43	12
72200	43	13
72201	43	14
72202	43	15
72203	43	16
72204	43	17
72205	43	18
72206	43	19
72207	43	20
72208	43	21
72209	43	22
72210	43	23
72211	43	24
72212	43	25
72213	43	26
72214	43	27
72215	43	28
72216	43	29
72217	43	30
72218	43	31
72219	43	32
72220	43	33
72221	43	34
72222	43	35
72223	43	36
72224	43	37
72225	43	38
72226	43	39
72227	43	40
72228	43	41
72229	43	42
72230	43	43
72231	43	44
72232	43	45
72233	43	46
72234	43	47
72235	43	48
72236	43	49
72237	43	50
72238	43	51
72239	43	52
72240	43	53
72241	43	54
72242	43	55
72243	43	56
72244	43	57
72245	43	58
72246	43	59
72247	43	60
72248	43	61
72249	43	62
72250	43	63
72251	43	64
72252	43	65
72253	43	66
72254	43	68
72255	43	69
72256	43	70
72257	43	71
72258	43	72
72259	43	73
72260	43	74
72261	43	75
72262	43	76
72263	43	77
72264	44	1
72265	44	2
72266	44	3
72267	44	4
72268	44	5
72269	44	6
72270	44	7
72271	44	8
72272	44	9
72273	44	10
72274	44	11
72275	44	12
72276	44	13
72277	44	14
72278	44	15
72279	44	16
72280	44	17
72281	44	18
72282	44	19
72283	44	20
72284	44	21
72285	44	22
72286	44	23
72287	44	24
72288	44	25
72289	44	26
72290	44	27
72291	44	28
72292	44	29
72293	44	30
72294	44	31
72295	44	32
72296	44	33
72297	44	34
72298	44	35
72299	44	36
72300	44	37
72301	44	38
72302	44	39
72303	44	40
72304	44	41
72305	44	42
72306	44	43
72307	44	44
72308	44	45
72309	44	46
72310	44	47
72311	44	48
72312	44	49
72313	44	50
72314	44	51
72315	44	52
72316	44	53
72317	44	54
72318	44	55
72319	44	56
72320	44	57
72321	44	58
72322	44	59
72323	44	60
72324	44	61
72325	44	62
72326	44	63
72327	44	64
72328	44	65
72329	44	66
72330	44	68
72331	44	69
72332	44	70
72333	44	71
72334	44	72
72335	44	73
72336	44	74
72337	44	75
72338	44	76
72339	44	77
72340	45	1
72341	45	2
72342	45	3
72343	45	4
72344	45	5
72345	45	6
72346	45	7
72347	45	8
72348	45	9
72349	45	10
72350	45	11
72351	45	12
72352	45	13
72353	45	14
72354	45	15
72355	45	16
72356	45	17
72357	45	18
72358	45	19
72359	45	20
72360	45	21
72361	45	22
72362	45	23
72363	45	24
72364	45	25
72365	45	26
72366	45	27
72367	45	28
72368	45	29
72369	45	30
72370	45	31
72371	45	32
72372	45	33
72373	45	34
72374	45	35
72375	45	36
72376	45	37
72377	45	38
72378	45	39
72379	45	40
72380	45	41
72381	45	42
72382	45	43
72383	45	44
72384	45	45
72385	45	46
72386	45	47
72387	45	48
72388	45	49
72389	45	50
72390	45	51
72391	45	52
72392	45	53
72393	45	54
72394	45	55
72395	45	56
72396	45	57
72397	45	58
72398	45	59
72399	45	60
72400	45	61
72401	45	62
72402	45	63
72403	45	64
72404	45	65
72405	45	66
72406	45	68
72407	45	69
72408	45	70
72409	45	71
72410	45	72
72411	45	73
72412	45	74
72413	45	75
72414	45	76
72415	45	77
72416	46	1
72417	46	2
72418	46	3
72419	46	4
72420	46	5
72421	46	6
72422	46	7
72423	46	8
72424	46	9
72425	46	10
72426	46	11
72427	46	12
72428	46	13
72429	46	14
72430	46	15
72431	46	16
72432	46	17
72433	46	18
72434	46	19
72435	46	20
72436	46	21
72437	46	22
72438	46	23
72439	46	24
72440	46	25
72441	46	26
72442	46	27
72443	46	28
72444	46	29
72445	46	30
72446	46	31
72447	46	32
72448	46	33
72449	46	34
72450	46	35
72451	46	36
72452	46	37
72453	46	38
72454	46	39
72455	46	40
72456	46	41
72457	46	42
72458	46	43
72459	46	44
72460	46	45
72461	46	46
72462	46	47
72463	46	48
72464	46	49
72465	46	50
72466	46	51
72467	46	52
72468	46	53
72469	46	54
72470	46	55
72471	46	56
72472	46	57
72473	46	58
72474	46	59
72475	46	60
72476	46	61
72477	46	62
72478	46	63
72479	46	64
72480	46	65
72481	46	66
72482	46	68
72483	46	69
72484	46	70
72485	46	71
72486	46	72
72487	46	73
72488	46	74
72489	46	75
72490	46	76
72491	46	77
72492	47	1
72493	47	2
72494	47	3
72495	47	4
72496	47	5
72497	47	6
72498	47	7
72499	47	8
72500	47	9
72501	47	10
72502	47	11
72503	47	12
72504	47	13
72505	47	14
72506	47	15
72507	47	16
72508	47	17
72509	47	18
72510	47	19
72511	47	20
72512	47	21
72513	47	22
72514	47	23
72515	47	24
72516	47	25
72517	47	26
72518	47	27
72519	47	28
72520	47	29
72521	47	30
72522	47	31
72523	47	32
72524	47	33
72525	47	34
72526	47	35
72527	47	36
72528	47	37
72529	47	38
72530	47	39
72531	47	40
72532	47	41
72533	47	42
72534	47	43
72535	47	44
72536	47	45
72537	47	46
72538	47	47
72539	47	48
72540	47	49
72541	47	50
72542	47	51
72543	47	52
72544	47	53
72545	47	54
72546	47	55
72547	47	56
72548	47	57
72549	47	58
72550	47	59
72551	47	60
72552	47	61
72553	47	62
72554	47	63
72555	47	64
72556	47	65
72557	47	66
72558	47	68
72559	47	69
72560	47	70
72561	47	71
72562	47	72
72563	47	73
72564	47	74
72565	47	75
72566	47	76
72567	47	77
72568	48	1
72569	48	2
72570	48	3
72571	48	4
72572	48	5
72573	48	6
72574	48	7
72575	48	8
72576	48	9
72577	48	10
72578	48	11
72579	48	12
72580	48	13
72581	48	14
72582	48	15
72583	48	16
72584	48	17
72585	48	18
72586	48	19
72587	48	20
72588	48	21
72589	48	22
72590	48	23
72591	48	24
72592	48	25
72593	48	26
72594	48	27
72595	48	28
72596	48	29
72597	48	30
72598	48	31
72599	48	32
72600	48	33
72601	48	34
72602	48	35
72603	48	36
72604	48	37
72605	48	38
72606	48	39
72607	48	40
72608	48	41
72609	48	42
72610	48	43
72611	48	44
72612	48	45
72613	48	46
72614	48	47
72615	48	48
72616	48	49
72617	48	50
72618	48	51
72619	48	52
72620	48	53
72621	48	54
72622	48	55
72623	48	56
72624	48	57
72625	48	58
72626	48	59
72627	48	60
72628	48	61
72629	48	62
72630	48	63
72631	48	64
72632	48	65
72633	48	66
72634	48	68
72635	48	69
72636	48	70
72637	48	71
72638	48	72
72639	48	73
72640	48	74
72641	48	75
72642	48	76
72643	48	77
72644	49	1
72645	49	2
72646	49	3
72647	49	4
72648	49	5
72649	49	6
72650	49	7
72651	49	8
72652	49	9
72653	49	10
72654	49	11
72655	49	12
72656	49	13
72657	49	14
72658	49	15
72659	49	16
72660	49	17
72661	49	18
72662	49	19
72663	49	20
72664	49	21
72665	49	22
72666	49	23
72667	49	24
72668	49	25
72669	49	26
72670	49	27
72671	49	28
72672	49	29
72673	49	30
72674	49	31
72675	49	32
72676	49	33
72677	49	34
72678	49	35
72679	49	36
72680	49	37
72681	49	38
72682	49	39
72683	49	40
72684	49	41
72685	49	42
72686	49	43
72687	49	44
72688	49	45
72689	49	46
72690	49	47
72691	49	48
72692	49	49
72693	49	50
72694	49	51
72695	49	52
72696	49	53
72697	49	54
72698	49	55
72699	49	56
72700	49	57
72701	49	58
72702	49	59
72703	49	60
72704	49	61
72705	49	62
72706	49	63
72707	49	64
72708	49	65
72709	49	66
72710	49	68
72711	49	69
72712	49	70
72713	49	71
72714	49	72
72715	49	73
72716	49	74
72717	49	75
72718	49	76
72719	49	77
72720	50	1
72721	50	2
72722	50	3
72723	50	4
72724	50	5
72725	50	6
72726	50	7
72727	50	8
72728	50	9
72729	50	10
72730	50	11
72731	50	12
72732	50	13
72733	50	14
72734	50	15
72735	50	16
72736	50	17
72737	50	18
72738	50	19
72739	50	20
72740	50	21
72741	50	22
72742	50	23
72743	50	24
72744	50	25
72745	50	26
72746	50	27
72747	50	28
72748	50	29
72749	50	30
72750	50	31
72751	50	32
72752	50	33
72753	50	34
72754	50	35
72755	50	36
72756	50	37
72757	50	38
72758	50	39
72759	50	40
72760	50	41
72761	50	42
72762	50	43
72763	50	44
72764	50	45
72765	50	46
72766	50	47
72767	50	48
72768	50	49
72769	50	50
72770	50	51
72771	50	52
72772	50	53
72773	50	54
72774	50	55
72775	50	56
72776	50	57
72777	50	58
72778	50	59
72779	50	60
72780	50	61
72781	50	62
72782	50	63
72783	50	64
72784	50	65
72785	50	66
72786	50	68
72787	50	69
72788	50	70
72789	50	71
72790	50	72
72791	50	73
72792	50	74
72793	50	75
72794	50	76
72795	50	77
72796	51	1
72797	51	2
72798	51	3
72799	51	4
72800	51	5
72801	51	6
72802	51	7
72803	51	8
72804	51	9
72805	51	10
72806	51	11
72807	51	12
72808	51	13
72809	51	14
72810	51	15
72811	51	16
72812	51	17
72813	51	18
72814	51	19
72815	51	20
72816	51	21
72817	51	22
72818	51	23
72819	51	24
72820	51	25
72821	51	26
72822	51	27
72823	51	28
72824	51	29
72825	51	30
72826	51	31
72827	51	32
72828	51	33
72829	51	34
72830	51	35
72831	51	36
72832	51	37
72833	51	38
72834	51	39
72835	51	40
72836	51	41
72837	51	42
72838	51	43
72839	51	44
72840	51	45
72841	51	46
72842	51	47
72843	51	48
72844	51	49
72845	51	50
72846	51	51
72847	51	52
72848	51	53
72849	51	54
72850	51	55
72851	51	56
72852	51	57
72853	51	58
72854	51	59
72855	51	60
72856	51	61
72857	51	62
72858	51	63
72859	51	64
72860	51	65
72861	51	66
72862	51	68
72863	51	69
72864	51	70
72865	51	71
72866	51	72
72867	51	73
72868	51	74
72869	51	75
72870	51	76
72871	51	77
72872	52	1
72873	52	2
72874	52	3
72875	52	4
72876	52	5
72877	52	6
72878	52	7
72879	52	8
72880	52	9
72881	52	10
72882	52	11
72883	52	12
72884	52	13
72885	52	14
72886	52	15
72887	52	16
72888	52	17
72889	52	18
72890	52	19
72891	52	20
72892	52	21
72893	52	22
72894	52	23
72895	52	24
72896	52	25
72897	52	26
72898	52	27
72899	52	28
72900	52	29
72901	52	30
72902	52	31
72903	52	32
72904	52	33
72905	52	34
72906	52	35
72907	52	36
72908	52	37
72909	52	38
72910	52	39
72911	52	40
72912	52	41
72913	52	42
72914	52	43
72915	52	44
72916	52	45
72917	52	46
72918	52	47
72919	52	48
72920	52	49
72921	52	50
72922	52	51
72923	52	52
72924	52	53
72925	52	54
72926	52	55
72927	52	56
72928	52	57
72929	52	58
72930	52	59
72931	52	60
72932	52	61
72933	52	62
72934	52	63
72935	52	64
72936	52	65
72937	52	66
72938	52	68
72939	52	69
72940	52	70
72941	52	71
72942	52	72
72943	52	73
72944	52	74
72945	52	75
72946	52	76
72947	52	77
72948	53	1
72949	53	2
72950	53	3
72951	53	4
72952	53	5
72953	53	6
72954	53	7
72955	53	8
72956	53	9
72957	53	10
72958	53	11
72959	53	12
72960	53	13
72961	53	14
72962	53	15
72963	53	16
72964	53	17
72965	53	18
72966	53	19
72967	53	20
72968	53	21
72969	53	22
72970	53	23
72971	53	24
72972	53	25
72973	53	26
72974	53	27
72975	53	28
72976	53	29
72977	53	30
72978	53	31
72979	53	32
72980	53	33
72981	53	34
72982	53	35
72983	53	36
72984	53	37
72985	53	38
72986	53	39
72987	53	40
72988	53	41
72989	53	42
72990	53	43
72991	53	44
72992	53	45
72993	53	46
72994	53	47
72995	53	48
72996	53	49
72997	53	50
72998	53	51
72999	53	52
73000	53	53
73001	53	54
73002	53	55
73003	53	56
73004	53	57
73005	53	58
73006	53	59
73007	53	60
73008	53	61
73009	53	62
73010	53	63
73011	53	64
73012	53	65
73013	53	66
73014	53	68
73015	53	69
73016	53	70
73017	53	71
73018	53	72
73019	53	73
73020	53	74
73021	53	75
73022	53	76
73023	53	77
73024	54	1
73025	54	2
73026	54	3
73027	54	4
73028	54	5
73029	54	6
73030	54	7
73031	54	8
73032	54	9
73033	54	10
73034	54	11
73035	54	12
73036	54	13
73037	54	14
73038	54	15
73039	54	16
73040	54	17
73041	54	18
73042	54	19
73043	54	20
73044	54	21
73045	54	22
73046	54	23
73047	54	24
73048	54	25
73049	54	26
73050	54	27
73051	54	28
73052	54	29
73053	54	30
73054	54	31
73055	54	32
73056	54	33
73057	54	34
73058	54	35
73059	54	36
73060	54	37
73061	54	38
73062	54	39
73063	54	40
73064	54	41
73065	54	42
73066	54	43
73067	54	44
73068	54	45
73069	54	46
73070	54	47
73071	54	48
73072	54	49
73073	54	50
73074	54	51
73075	54	52
73076	54	53
73077	54	54
73078	54	55
73079	54	56
73080	54	57
73081	54	58
73082	54	59
73083	54	60
73084	54	61
73085	54	62
73086	54	63
73087	54	64
73088	54	65
73089	54	66
73090	54	68
73091	54	69
73092	54	70
73093	54	71
73094	54	72
73095	54	73
73096	54	74
73097	54	75
73098	54	76
73099	54	77
73100	55	1
73101	55	2
73102	55	3
73103	55	4
73104	55	5
73105	55	6
73106	55	7
73107	55	8
73108	55	9
73109	55	10
73110	55	11
73111	55	12
73112	55	13
73113	55	14
73114	55	15
73115	55	16
73116	55	17
73117	55	18
73118	55	19
73119	55	20
73120	55	21
73121	55	22
73122	55	23
73123	55	24
73124	55	25
73125	55	26
73126	55	27
73127	55	28
73128	55	29
73129	55	30
73130	55	31
73131	55	32
73132	55	33
73133	55	34
73134	55	35
73135	55	36
73136	55	37
73137	55	38
73138	55	39
73139	55	40
73140	55	41
73141	55	42
73142	55	43
73143	55	44
73144	55	45
73145	55	46
73146	55	47
73147	55	48
73148	55	49
73149	55	50
73150	55	51
73151	55	52
73152	55	53
73153	55	54
73154	55	55
73155	55	56
73156	55	57
73157	55	58
73158	55	59
73159	55	60
73160	55	61
73161	55	62
73162	55	63
73163	55	64
73164	55	65
73165	55	66
73166	55	68
73167	55	69
73168	55	70
73169	55	71
73170	55	72
73171	55	73
73172	55	74
73173	55	75
73174	55	76
73175	55	77
73176	56	1
73177	56	2
73178	56	3
73179	56	4
73180	56	5
73181	56	6
73182	56	7
73183	56	8
73184	56	9
73185	56	10
73186	56	11
73187	56	12
73188	56	13
73189	56	14
73190	56	15
73191	56	16
73192	56	17
73193	56	18
73194	56	19
73195	56	20
73196	56	21
73197	56	22
73198	56	23
73199	56	24
73200	56	25
73201	56	26
73202	56	27
73203	56	28
73204	56	29
73205	56	30
73206	56	31
73207	56	32
73208	56	33
73209	56	34
73210	56	35
73211	56	36
73212	56	37
73213	56	38
73214	56	39
73215	56	40
73216	56	41
73217	56	42
73218	56	43
73219	56	44
73220	56	45
73221	56	46
73222	56	47
73223	56	48
73224	56	49
73225	56	50
73226	56	51
73227	56	52
73228	56	53
73229	56	54
73230	56	55
73231	56	56
73232	56	57
73233	56	58
73234	56	59
73235	56	60
73236	56	61
73237	56	62
73238	56	63
73239	56	64
73240	56	65
73241	56	66
73242	56	68
73243	56	69
73244	56	70
73245	56	71
73246	56	72
73247	56	73
73248	56	74
73249	56	75
73250	56	76
73251	56	77
73252	57	1
73253	57	2
73254	57	3
73255	57	4
73256	57	5
73257	57	6
73258	57	7
73259	57	8
73260	57	9
73261	57	10
73262	57	11
73263	57	12
73264	57	13
73265	57	14
73266	57	15
73267	57	16
73268	57	17
73269	57	18
73270	57	19
73271	57	20
73272	57	21
73273	57	22
73274	57	23
73275	57	24
73276	57	25
73277	57	26
73278	57	27
73279	57	28
73280	57	29
73281	57	30
73282	57	31
73283	57	32
73284	57	33
73285	57	34
73286	57	35
73287	57	36
73288	57	37
73289	57	38
73290	57	39
73291	57	40
73292	57	41
73293	57	42
73294	57	43
73295	57	44
73296	57	45
73297	57	46
73298	57	47
73299	57	48
73300	57	49
73301	57	50
73302	57	51
73303	57	52
73304	57	53
73305	57	54
73306	57	55
73307	57	56
73308	57	57
73309	57	58
73310	57	59
73311	57	60
73312	57	61
73313	57	62
73314	57	63
73315	57	64
73316	57	65
73317	57	66
73318	57	68
73319	57	69
73320	57	70
73321	57	71
73322	57	72
73323	57	73
73324	57	74
73325	57	75
73326	57	76
73327	57	77
73328	58	1
73329	58	2
73330	58	3
73331	58	4
73332	58	5
73333	58	6
73334	58	7
73335	58	8
73336	58	9
73337	58	10
73338	58	11
73339	58	12
73340	58	13
73341	58	14
73342	58	15
73343	58	16
73344	58	17
73345	58	18
73346	58	19
73347	58	20
73348	58	21
73349	58	22
73350	58	23
73351	58	24
73352	58	25
73353	58	26
73354	58	27
73355	58	28
73356	58	29
73357	58	30
73358	58	31
73359	58	32
73360	58	33
73361	58	34
73362	58	35
73363	58	36
73364	58	37
73365	58	38
73366	58	39
73367	58	40
73368	58	41
73369	58	42
73370	58	43
73371	58	44
73372	58	45
73373	58	46
73374	58	47
73375	58	48
73376	58	49
73377	58	50
73378	58	51
73379	58	52
73380	58	53
73381	58	54
73382	58	55
73383	58	56
73384	58	57
73385	58	58
73386	58	59
73387	58	60
73388	58	61
73389	58	62
73390	58	63
73391	58	64
73392	58	65
73393	58	66
73394	58	68
73395	58	69
73396	58	70
73397	58	71
73398	58	72
73399	58	73
73400	58	74
73401	58	75
73402	58	76
73403	58	77
73404	59	1
73405	59	2
73406	59	3
73407	59	4
73408	59	5
73409	59	6
73410	59	7
73411	59	8
73412	59	9
73413	59	10
73414	59	11
73415	59	12
73416	59	13
73417	59	14
73418	59	15
73419	59	16
73420	59	17
73421	59	18
73422	59	19
73423	59	20
73424	59	21
73425	59	22
73426	59	23
73427	59	24
73428	59	25
73429	59	26
73430	59	27
73431	59	28
73432	59	29
73433	59	30
73434	59	31
73435	59	32
73436	59	33
73437	59	34
73438	59	35
73439	59	36
73440	59	37
73441	59	38
73442	59	39
73443	59	40
73444	59	41
73445	59	42
73446	59	43
73447	59	44
73448	59	45
73449	59	46
73450	59	47
73451	59	48
73452	59	49
73453	59	50
73454	59	51
73455	59	52
73456	59	53
73457	59	54
73458	59	55
73459	59	56
73460	59	57
73461	59	58
73462	59	59
73463	59	60
73464	59	61
73465	59	62
73466	59	63
73467	59	64
73468	59	65
73469	59	66
73470	59	68
73471	59	69
73472	59	70
73473	59	71
73474	59	72
73475	59	73
73476	59	74
73477	59	75
73478	59	76
73479	59	77
73480	60	1
73481	60	2
73482	60	3
73483	60	4
73484	60	5
73485	60	6
73486	60	7
73487	60	8
73488	60	9
73489	60	10
73490	60	11
73491	60	12
73492	60	13
73493	60	14
73494	60	15
73495	60	16
73496	60	17
73497	60	18
73498	60	19
73499	60	20
73500	60	21
73501	60	22
73502	60	23
73503	60	24
73504	60	25
73505	60	26
73506	60	27
73507	60	28
73508	60	29
73509	60	30
73510	60	31
73511	60	32
73512	60	33
73513	60	34
73514	60	35
73515	60	36
73516	60	37
73517	60	38
73518	60	39
73519	60	40
73520	60	41
73521	60	42
73522	60	43
73523	60	44
73524	60	45
73525	60	46
73526	60	47
73527	60	48
73528	60	49
73529	60	50
73530	60	51
73531	60	52
73532	60	53
73533	60	54
73534	60	55
73535	60	56
73536	60	57
73537	60	58
73538	60	59
73539	60	60
73540	60	61
73541	60	62
73542	60	63
73543	60	64
73544	60	65
73545	60	66
73546	60	68
73547	60	69
73548	60	70
73549	60	71
73550	60	72
73551	60	73
73552	60	74
73553	60	75
73554	60	76
73555	60	77
73556	61	1
73557	61	2
73558	61	3
73559	61	4
73560	61	5
73561	61	6
73562	61	7
73563	61	8
73564	61	9
73565	61	10
73566	61	11
73567	61	12
73568	61	13
73569	61	14
73570	61	15
73571	61	16
73572	61	17
73573	61	18
73574	61	19
73575	61	20
73576	61	21
73577	61	22
73578	61	23
73579	61	24
73580	61	25
73581	61	26
73582	61	27
73583	61	28
73584	61	29
73585	61	30
73586	61	31
73587	61	32
73588	61	33
73589	61	34
73590	61	35
73591	61	36
73592	61	37
73593	61	38
73594	61	39
73595	61	40
73596	61	41
73597	61	42
73598	61	43
73599	61	44
73600	61	45
73601	61	46
73602	61	47
73603	61	48
73604	61	49
73605	61	50
73606	61	51
73607	61	52
73608	61	53
73609	61	54
73610	61	55
73611	61	56
73612	61	57
73613	61	58
73614	61	59
73615	61	60
73616	61	61
73617	61	62
73618	61	63
73619	61	64
73620	61	65
73621	61	66
73622	61	68
73623	61	69
73624	61	70
73625	61	71
73626	61	72
73627	61	73
73628	61	74
73629	61	75
73630	61	76
73631	61	77
73632	62	1
73633	62	2
73634	62	3
73635	62	4
73636	62	5
73637	62	6
73638	62	7
73639	62	8
73640	62	9
73641	62	10
73642	62	11
73643	62	12
73644	62	13
73645	62	14
73646	62	15
73647	62	16
73648	62	17
73649	62	18
73650	62	19
73651	62	20
73652	62	21
73653	62	22
73654	62	23
73655	62	24
73656	62	25
73657	62	26
73658	62	27
73659	62	28
73660	62	29
73661	62	30
73662	62	31
73663	62	32
73664	62	33
73665	62	34
73666	62	35
73667	62	36
73668	62	37
73669	62	38
73670	62	39
73671	62	40
73672	62	41
73673	62	42
73674	62	43
73675	62	44
73676	62	45
73677	62	46
73678	62	47
73679	62	48
73680	62	49
73681	62	50
73682	62	51
73683	62	52
73684	62	53
73685	62	54
73686	62	55
73687	62	56
73688	62	57
73689	62	58
73690	62	59
73691	62	60
73692	62	61
73693	62	62
73694	62	63
73695	62	64
73696	62	65
73697	62	66
73698	62	68
73699	62	69
73700	62	70
73701	62	71
73702	62	72
73703	62	73
73704	62	74
73705	62	75
73706	62	76
73707	62	77
73708	63	1
73709	63	2
73710	63	3
73711	63	4
73712	63	5
73713	63	6
73714	63	7
73715	63	8
73716	63	9
73717	63	10
73718	63	11
73719	63	12
73720	63	13
73721	63	14
73722	63	15
73723	63	16
73724	63	17
73725	63	18
73726	63	19
73727	63	20
73728	63	21
73729	63	22
73730	63	23
73731	63	24
73732	63	25
73733	63	26
73734	63	27
73735	63	28
73736	63	29
73737	63	30
73738	63	31
73739	63	32
73740	63	33
73741	63	34
73742	63	35
73743	63	36
73744	63	37
73745	63	38
73746	63	39
73747	63	40
73748	63	41
73749	63	42
73750	63	43
73751	63	44
73752	63	45
73753	63	46
73754	63	47
73755	63	48
73756	63	49
73757	63	50
73758	63	51
73759	63	52
73760	63	53
73761	63	54
73762	63	55
73763	63	56
73764	63	57
73765	63	58
73766	63	59
73767	63	60
73768	63	61
73769	63	62
73770	63	63
73771	63	64
73772	63	65
73773	63	66
73774	63	68
73775	63	69
73776	63	70
73777	63	71
73778	63	72
73779	63	73
73780	63	74
73781	63	75
73782	63	76
73783	63	77
73784	64	1
73785	64	2
73786	64	3
73787	64	4
73788	64	5
73789	64	6
73790	64	7
73791	64	8
73792	64	9
73793	64	10
73794	64	11
73795	64	12
73796	64	13
73797	64	14
73798	64	15
73799	64	16
73800	64	17
73801	64	18
73802	64	19
73803	64	20
73804	64	21
73805	64	22
73806	64	23
73807	64	24
73808	64	25
73809	64	26
73810	64	27
73811	64	28
73812	64	29
73813	64	30
73814	64	31
73815	64	32
73816	64	33
73817	64	34
73818	64	35
73819	64	36
73820	64	37
73821	64	38
73822	64	39
73823	64	40
73824	64	41
73825	64	42
73826	64	43
73827	64	44
73828	64	45
73829	64	46
73830	64	47
73831	64	48
73832	64	49
73833	64	50
73834	64	51
73835	64	52
73836	64	53
73837	64	54
73838	64	55
73839	64	56
73840	64	57
73841	64	58
73842	64	59
73843	64	60
73844	64	61
73845	64	62
73846	64	63
73847	64	64
73848	64	65
73849	64	66
73850	64	68
73851	64	69
73852	64	70
73853	64	71
73854	64	72
73855	64	73
73856	64	74
73857	64	75
73858	64	76
73859	64	77
73860	65	1
73861	65	2
73862	65	3
73863	65	4
73864	65	5
73865	65	6
73866	65	7
73867	65	8
73868	65	9
73869	65	10
73870	65	11
73871	65	12
73872	65	13
73873	65	14
73874	65	15
73875	65	16
73876	65	17
73877	65	18
73878	65	19
73879	65	20
73880	65	21
73881	65	22
73882	65	23
73883	65	24
73884	65	25
73885	65	26
73886	65	27
73887	65	28
73888	65	29
73889	65	30
73890	65	31
73891	65	32
73892	65	33
73893	65	34
73894	65	35
73895	65	36
73896	65	37
73897	65	38
73898	65	39
73899	65	40
73900	65	41
73901	65	42
73902	65	43
73903	65	44
73904	65	45
73905	65	46
73906	65	47
73907	65	48
73908	65	49
73909	65	50
73910	65	51
73911	65	52
73912	65	53
73913	65	54
73914	65	55
73915	65	56
73916	65	57
73917	65	58
73918	65	59
73919	65	60
73920	65	61
73921	65	62
73922	65	63
73923	65	64
73924	65	65
73925	65	66
73926	65	68
73927	65	69
73928	65	70
73929	65	71
73930	65	72
73931	65	73
73932	65	74
73933	65	75
73934	65	76
73935	65	77
73936	66	1
73937	66	2
73938	66	3
73939	66	4
73940	66	5
73941	66	6
73942	66	7
73943	66	8
73944	66	9
73945	66	10
73946	66	11
73947	66	12
73948	66	13
73949	66	14
73950	66	15
73951	66	16
73952	66	17
73953	66	18
73954	66	19
73955	66	20
73956	66	21
73957	66	22
73958	66	23
73959	66	24
73960	66	25
73961	66	26
73962	66	27
73963	66	28
73964	66	29
73965	66	30
73966	66	31
73967	66	32
73968	66	33
73969	66	34
73970	66	35
73971	66	36
73972	66	37
73973	66	38
73974	66	39
73975	66	40
73976	66	41
73977	66	42
73978	66	43
73979	66	44
73980	66	45
73981	66	46
73982	66	47
73983	66	48
73984	66	49
73985	66	50
73986	66	51
73987	66	52
73988	66	53
73989	66	54
73990	66	55
73991	66	56
73992	66	57
73993	66	58
73994	66	59
73995	66	60
73996	66	61
73997	66	62
73998	66	63
73999	66	64
74000	66	65
74001	66	66
74002	66	68
74003	66	69
74004	66	70
74005	66	71
74006	66	72
74007	66	73
74008	66	74
74009	66	75
74010	66	76
74011	66	77
74012	67	1
74013	67	2
74014	67	3
74015	67	4
74016	67	5
74017	67	6
74018	67	7
74019	67	8
74020	67	9
74021	67	10
74022	67	11
74023	67	12
74024	67	13
74025	67	14
74026	67	15
74027	67	16
74028	67	17
74029	67	18
74030	67	19
74031	67	20
74032	67	21
74033	67	22
74034	67	23
74035	67	24
74036	67	25
74037	67	26
74038	67	27
74039	67	28
74040	67	29
74041	67	30
74042	67	31
74043	67	32
74044	67	33
74045	67	34
74046	67	35
74047	67	36
74048	67	37
74049	67	38
74050	67	39
74051	67	40
74052	67	41
74053	67	42
74054	67	43
74055	67	44
74056	67	45
74057	67	46
74058	67	47
74059	67	48
74060	67	49
74061	67	50
74062	67	51
74063	67	52
74064	67	53
74065	67	54
74066	67	55
74067	67	56
74068	67	57
74069	67	58
74070	67	59
74071	67	60
74072	67	61
74073	67	62
74074	67	63
74075	67	64
74076	67	65
74077	67	66
74078	67	68
74079	67	69
74080	67	70
74081	67	71
74082	67	72
74083	67	73
74084	67	74
74085	67	75
74086	67	76
74087	67	77
74088	68	1
74089	68	2
74090	68	3
74091	68	4
74092	68	5
74093	68	6
74094	68	7
74095	68	8
74096	68	9
74097	68	10
74098	68	11
74099	68	12
74100	68	13
74101	68	14
74102	68	15
74103	68	16
74104	68	17
74105	68	18
74106	68	19
74107	68	20
74108	68	21
74109	68	22
74110	68	23
74111	68	24
74112	68	25
74113	68	26
74114	68	27
74115	68	28
74116	68	29
74117	68	30
74118	68	31
74119	68	32
74120	68	33
74121	68	34
74122	68	35
74123	68	36
74124	68	37
74125	68	38
74126	68	39
74127	68	40
74128	68	41
74129	68	42
74130	68	43
74131	68	44
74132	68	45
74133	68	46
74134	68	47
74135	68	48
74136	68	49
74137	68	50
74138	68	51
74139	68	52
74140	68	53
74141	68	54
74142	68	55
74143	68	56
74144	68	57
74145	68	58
74146	68	59
74147	68	60
74148	68	61
74149	68	62
74150	68	63
74151	68	64
74152	68	65
74153	68	66
74154	68	68
74155	68	69
74156	68	70
74157	68	71
74158	68	72
74159	68	73
74160	68	74
74161	68	75
74162	68	76
74163	68	77
74164	69	1
74165	69	2
74166	69	3
74167	69	4
74168	69	5
74169	69	6
74170	69	7
74171	69	8
74172	69	9
74173	69	10
74174	69	11
74175	69	12
74176	69	13
74177	69	14
74178	69	15
74179	69	16
74180	69	17
74181	69	18
74182	69	19
74183	69	20
74184	69	21
74185	69	22
74186	69	23
74187	69	24
74188	69	25
74189	69	26
74190	69	27
74191	69	28
74192	69	29
74193	69	30
74194	69	31
74195	69	32
74196	69	33
74197	69	34
74198	69	35
74199	69	36
74200	69	37
74201	69	38
74202	69	39
74203	69	40
74204	69	41
74205	69	42
74206	69	43
74207	69	44
74208	69	45
74209	69	46
74210	69	47
74211	69	48
74212	69	49
74213	69	50
74214	69	51
74215	69	52
74216	69	53
74217	69	54
74218	69	55
74219	69	56
74220	69	57
74221	69	58
74222	69	59
74223	69	60
74224	69	61
74225	69	62
74226	69	63
74227	69	64
74228	69	65
74229	69	66
74230	69	68
74231	69	69
74232	69	70
74233	69	71
74234	69	72
74235	69	73
74236	69	74
74237	69	75
74238	69	76
74239	69	77
74240	70	1
74241	70	2
74242	70	3
74243	70	4
74244	70	5
74245	70	6
74246	70	7
74247	70	8
74248	70	9
74249	70	10
74250	70	11
74251	70	12
74252	70	13
74253	70	14
74254	70	15
74255	70	16
74256	70	17
74257	70	18
74258	70	19
74259	70	20
74260	70	21
74261	70	22
74262	70	23
74263	70	24
74264	70	25
74265	70	26
74266	70	27
74267	70	28
74268	70	29
74269	70	30
74270	70	31
74271	70	32
74272	70	33
74273	70	34
74274	70	35
74275	70	36
74276	70	37
74277	70	38
74278	70	39
74279	70	40
74280	70	41
74281	70	42
74282	70	43
74283	70	44
74284	70	45
74285	70	46
74286	70	47
74287	70	48
74288	70	49
74289	70	50
74290	70	51
74291	70	52
74292	70	53
74293	70	54
74294	70	55
74295	70	56
74296	70	57
74297	70	58
74298	70	59
74299	70	60
74300	70	61
74301	70	62
74302	70	63
74303	70	64
74304	70	65
74305	70	66
74306	70	68
74307	70	69
74308	70	70
74309	70	71
74310	70	72
74311	70	73
74312	70	74
74313	70	75
74314	70	76
74315	70	77
74316	71	1
74317	71	2
74318	71	3
74319	71	4
74320	71	5
74321	71	6
74322	71	7
74323	71	8
74324	71	9
74325	71	10
74326	71	11
74327	71	12
74328	71	13
74329	71	14
74330	71	15
74331	71	16
74332	71	17
74333	71	18
74334	71	19
74335	71	20
74336	71	21
74337	71	22
74338	71	23
74339	71	24
74340	71	25
74341	71	26
74342	71	27
74343	71	28
74344	71	29
74345	71	30
74346	71	31
74347	71	32
74348	71	33
74349	71	34
74350	71	35
74351	71	36
74352	71	37
74353	71	38
74354	71	39
74355	71	40
74356	71	41
74357	71	42
74358	71	43
74359	71	44
74360	71	45
74361	71	46
74362	71	47
74363	71	48
74364	71	49
74365	71	50
74366	71	51
74367	71	52
74368	71	53
74369	71	54
74370	71	55
74371	71	56
74372	71	57
74373	71	58
74374	71	59
74375	71	60
74376	71	61
74377	71	62
74378	71	63
74379	71	64
74380	71	65
74381	71	66
74382	71	68
74383	71	69
74384	71	70
74385	71	71
74386	71	72
74387	71	73
74388	71	74
74389	71	75
74390	71	76
74391	71	77
74392	72	1
74393	72	2
74394	72	3
74395	72	4
74396	72	5
74397	72	6
74398	72	7
74399	72	8
74400	72	9
74401	72	10
74402	72	11
74403	72	12
74404	72	13
74405	72	14
74406	72	15
74407	72	16
74408	72	17
74409	72	18
74410	72	19
74411	72	20
74412	72	21
74413	72	22
74414	72	23
74415	72	24
74416	72	25
74417	72	26
74418	72	27
74419	72	28
74420	72	29
74421	72	30
74422	72	31
74423	72	32
74424	72	33
74425	72	34
74426	72	35
74427	72	36
74428	72	37
74429	72	38
74430	72	39
74431	72	40
74432	72	41
74433	72	42
74434	72	43
74435	72	44
74436	72	45
74437	72	46
74438	72	47
74439	72	48
74440	72	49
74441	72	50
74442	72	51
74443	72	52
74444	72	53
74445	72	54
74446	72	55
74447	72	56
74448	72	57
74449	72	58
74450	72	59
74451	72	60
74452	72	61
74453	72	62
74454	72	63
74455	72	64
74456	72	65
74457	72	66
74458	72	68
74459	72	69
74460	72	70
74461	72	71
74462	72	72
74463	72	73
74464	72	74
74465	72	75
74466	72	76
74467	72	77
74468	73	1
74469	73	2
74470	73	3
74471	73	4
74472	73	5
74473	73	6
74474	73	7
74475	73	8
74476	73	9
74477	73	10
74478	73	11
74479	73	12
74480	73	13
74481	73	14
74482	73	15
74483	73	16
74484	73	17
74485	73	18
74486	73	19
74487	73	20
74488	73	21
74489	73	22
74490	73	23
74491	73	24
74492	73	25
74493	73	26
74494	73	27
74495	73	28
74496	73	29
74497	73	30
74498	73	31
74499	73	32
74500	73	33
74501	73	34
74502	73	35
74503	73	36
74504	73	37
74505	73	38
74506	73	39
74507	73	40
74508	73	41
74509	73	42
74510	73	43
74511	73	44
74512	73	45
74513	73	46
74514	73	47
74515	73	48
74516	73	49
74517	73	50
74518	73	51
74519	73	52
74520	73	53
74521	73	54
74522	73	55
74523	73	56
74524	73	57
74525	73	58
74526	73	59
74527	73	60
74528	73	61
74529	73	62
74530	73	63
74531	73	64
74532	73	65
74533	73	66
74534	73	68
74535	73	69
74536	73	70
74537	73	71
74538	73	72
74539	73	73
74540	73	74
74541	73	75
74542	73	76
74543	73	77
74544	74	1
74545	74	2
74546	74	3
74547	74	4
74548	74	5
74549	74	6
74550	74	7
74551	74	8
74552	74	9
74553	74	10
74554	74	11
74555	74	12
74556	74	13
74557	74	14
74558	74	15
74559	74	16
74560	74	17
74561	74	18
74562	74	19
74563	74	20
74564	74	21
74565	74	22
74566	74	23
74567	74	24
74568	74	25
74569	74	26
74570	74	27
74571	74	28
74572	74	29
74573	74	30
74574	74	31
74575	74	32
74576	74	33
74577	74	34
74578	74	35
74579	74	36
74580	74	37
74581	74	38
74582	74	39
74583	74	40
74584	74	41
74585	74	42
74586	74	43
74587	74	44
74588	74	45
74589	74	46
74590	74	47
74591	74	48
74592	74	49
74593	74	50
74594	74	51
74595	74	52
74596	74	53
74597	74	54
74598	74	55
74599	74	56
74600	74	57
74601	74	58
74602	74	59
74603	74	60
74604	74	61
74605	74	62
74606	74	63
74607	74	64
74608	74	65
74609	74	66
74610	74	68
74611	74	69
74612	74	70
74613	74	71
74614	74	72
74615	74	73
74616	74	74
74617	74	75
74618	74	76
74619	74	77
74620	75	1
74621	75	2
74622	75	3
74623	75	4
74624	75	5
74625	75	6
74626	75	7
74627	75	8
74628	75	9
74629	75	10
74630	75	11
74631	75	12
74632	75	13
74633	75	14
74634	75	15
74635	75	16
74636	75	17
74637	75	18
74638	75	19
74639	75	20
74640	75	21
74641	75	22
74642	75	23
74643	75	24
74644	75	25
74645	75	26
74646	75	27
74647	75	28
74648	75	29
74649	75	30
74650	75	31
74651	75	32
74652	75	33
74653	75	34
74654	75	35
74655	75	36
74656	75	37
74657	75	38
74658	75	39
74659	75	40
74660	75	41
74661	75	42
74662	75	43
74663	75	44
74664	75	45
74665	75	46
74666	75	47
74667	75	48
74668	75	49
74669	75	50
74670	75	51
74671	75	52
74672	75	53
74673	75	54
74674	75	55
74675	75	56
74676	75	57
74677	75	58
74678	75	59
74679	75	60
74680	75	61
74681	75	62
74682	75	63
74683	75	64
74684	75	65
74685	75	66
74686	75	68
74687	75	69
74688	75	70
74689	75	71
74690	75	72
74691	75	73
74692	75	74
74693	75	75
74694	75	76
74695	75	77
74696	76	1
74697	76	2
74698	76	3
74699	76	4
74700	76	5
74701	76	6
74702	76	7
74703	76	8
74704	76	9
74705	76	10
74706	76	11
74707	76	12
74708	76	13
74709	76	14
74710	76	15
74711	76	16
74712	76	17
74713	76	18
74714	76	19
74715	76	20
74716	76	21
74717	76	22
74718	76	23
74719	76	24
74720	76	25
74721	76	26
74722	76	27
74723	76	28
74724	76	29
74725	76	30
74726	76	31
74727	76	32
74728	76	33
74729	76	34
74730	76	35
74731	76	36
74732	76	37
74733	76	38
74734	76	39
74735	76	40
74736	76	41
74737	76	42
74738	76	43
74739	76	44
74740	76	45
74741	76	46
74742	76	47
74743	76	48
74744	76	49
74745	76	50
74746	76	51
74747	76	52
74748	76	53
74749	76	54
74750	76	55
74751	76	56
74752	76	57
74753	76	58
74754	76	59
74755	76	60
74756	76	61
74757	76	62
74758	76	63
74759	76	64
74760	76	65
74761	76	66
74762	76	68
74763	76	69
74764	76	70
74765	76	71
74766	76	72
74767	76	73
74768	76	74
74769	76	75
74770	76	76
74771	76	77
74772	77	1
74773	77	2
74774	77	3
74775	77	4
74776	77	5
74777	77	6
74778	77	7
74779	77	8
74780	77	9
74781	77	10
74782	77	11
74783	77	12
74784	77	13
74785	77	14
74786	77	15
74787	77	16
74788	77	17
74789	77	18
74790	77	19
74791	77	20
74792	77	21
74793	77	22
74794	77	23
74795	77	24
74796	77	25
74797	77	26
74798	77	27
74799	77	28
74800	77	29
74801	77	30
74802	77	31
74803	77	32
74804	77	33
74805	77	34
74806	77	35
74807	77	36
74808	77	37
74809	77	38
74810	77	39
74811	77	40
74812	77	41
74813	77	42
74814	77	43
74815	77	44
74816	77	45
74817	77	46
74818	77	47
74819	77	48
74820	77	49
74821	77	50
74822	77	51
74823	77	52
74824	77	53
74825	77	54
74826	77	55
74827	77	56
74828	77	57
74829	77	58
74830	77	59
74831	77	60
74832	77	61
74833	77	62
74834	77	63
74835	77	64
74836	77	65
74837	77	66
74838	77	68
74839	77	69
74840	77	70
74841	77	71
74842	77	72
74843	77	73
74844	77	74
74845	77	75
74846	77	76
74847	77	77
74848	78	1
74849	78	2
74850	78	3
74851	78	4
74852	78	5
74853	78	6
74854	78	7
74855	78	8
74856	78	9
74857	78	10
74858	78	11
74859	78	12
74860	78	13
74861	78	14
74862	78	15
74863	78	16
74864	78	17
74865	78	18
74866	78	19
74867	78	20
74868	78	21
74869	78	22
74870	78	23
74871	78	24
74872	78	25
74873	78	26
74874	78	27
74875	78	28
74876	78	29
74877	78	30
74878	78	31
74879	78	32
74880	78	33
74881	78	34
74882	78	35
74883	78	36
74884	78	37
74885	78	38
74886	78	39
74887	78	40
74888	78	41
74889	78	42
74890	78	43
74891	78	44
74892	78	45
74893	78	46
74894	78	47
74895	78	48
74896	78	49
74897	78	50
74898	78	51
74899	78	52
74900	78	53
74901	78	54
74902	78	55
74903	78	56
74904	78	57
74905	78	58
74906	78	59
74907	78	60
74908	78	61
74909	78	62
74910	78	63
74911	78	64
74912	78	65
74913	78	66
74914	78	68
74915	78	69
74916	78	70
74917	78	71
74918	78	72
74919	78	73
74920	78	74
74921	78	75
74922	78	76
74923	78	77
74924	79	1
74925	79	2
74926	79	3
74927	79	4
74928	79	5
74929	79	6
74930	79	7
74931	79	8
74932	79	9
74933	79	10
74934	79	11
74935	79	12
74936	79	13
74937	79	14
74938	79	15
74939	79	16
74940	79	17
74941	79	18
74942	79	19
74943	79	20
74944	79	21
74945	79	22
74946	79	23
74947	79	24
74948	79	25
74949	79	26
74950	79	27
74951	79	28
74952	79	29
74953	79	30
74954	79	31
74955	79	32
74956	79	33
74957	79	34
74958	79	35
74959	79	36
74960	79	37
74961	79	38
74962	79	39
74963	79	40
74964	79	41
74965	79	42
74966	79	43
74967	79	44
74968	79	45
74969	79	46
74970	79	47
74971	79	48
74972	79	49
74973	79	50
74974	79	51
74975	79	52
74976	79	53
74977	79	54
74978	79	55
74979	79	56
74980	79	57
74981	79	58
74982	79	59
74983	79	60
74984	79	61
74985	79	62
74986	79	63
74987	79	64
74988	79	65
74989	79	66
74990	79	68
74991	79	69
74992	79	70
74993	79	71
74994	79	72
74995	79	73
74996	79	74
74997	79	75
74998	79	76
74999	79	77
75000	80	1
75001	80	2
75002	80	3
75003	80	4
75004	80	5
75005	80	6
75006	80	7
75007	80	8
75008	80	9
75009	80	10
75010	80	11
75011	80	12
75012	80	13
75013	80	14
75014	80	15
75015	80	16
75016	80	17
75017	80	18
75018	80	19
75019	80	20
75020	80	21
75021	80	22
75022	80	23
75023	80	24
75024	80	25
75025	80	26
75026	80	27
75027	80	28
75028	80	29
75029	80	30
75030	80	31
75031	80	32
75032	80	33
75033	80	34
75034	80	35
75035	80	36
75036	80	37
75037	80	38
75038	80	39
75039	80	40
75040	80	41
75041	80	42
75042	80	43
75043	80	44
75044	80	45
75045	80	46
75046	80	47
75047	80	48
75048	80	49
75049	80	50
75050	80	51
75051	80	52
75052	80	53
75053	80	54
75054	80	55
75055	80	56
75056	80	57
75057	80	58
75058	80	59
75059	80	60
75060	80	61
75061	80	62
75062	80	63
75063	80	64
75064	80	65
75065	80	66
75066	80	68
75067	80	69
75068	80	70
75069	80	71
75070	80	72
75071	80	73
75072	80	74
75073	80	75
75074	80	76
75075	80	77
75076	81	1
75077	81	2
75078	81	3
75079	81	4
75080	81	5
75081	81	6
75082	81	7
75083	81	8
75084	81	9
75085	81	10
75086	81	11
75087	81	12
75088	81	13
75089	81	14
75090	81	15
75091	81	16
75092	81	17
75093	81	18
75094	81	19
75095	81	20
75096	81	21
75097	81	22
75098	81	23
75099	81	24
75100	81	25
75101	81	26
75102	81	27
75103	81	28
75104	81	29
75105	81	30
75106	81	31
75107	81	32
75108	81	33
75109	81	34
75110	81	35
75111	81	36
75112	81	37
75113	81	38
75114	81	39
75115	81	40
75116	81	41
75117	81	42
75118	81	43
75119	81	44
75120	81	45
75121	81	46
75122	81	47
75123	81	48
75124	81	49
75125	81	50
75126	81	51
75127	81	52
75128	81	53
75129	81	54
75130	81	55
75131	81	56
75132	81	57
75133	81	58
75134	81	59
75135	81	60
75136	81	61
75137	81	62
75138	81	63
75139	81	64
75140	81	65
75141	81	66
75142	81	68
75143	81	69
75144	81	70
75145	81	71
75146	81	72
75147	81	73
75148	81	74
75149	81	75
75150	81	76
75151	81	77
75152	82	1
75153	82	2
75154	82	3
75155	82	4
75156	82	5
75157	82	6
75158	82	7
75159	82	8
75160	82	9
75161	82	10
75162	82	11
75163	82	12
75164	82	13
75165	82	14
75166	82	15
75167	82	16
75168	82	17
75169	82	18
75170	82	19
75171	82	20
75172	82	21
75173	82	22
75174	82	23
75175	82	24
75176	82	25
75177	82	26
75178	82	27
75179	82	28
75180	82	29
75181	82	30
75182	82	31
75183	82	32
75184	82	33
75185	82	34
75186	82	35
75187	82	36
75188	82	37
75189	82	38
75190	82	39
75191	82	40
75192	82	41
75193	82	42
75194	82	43
75195	82	44
75196	82	45
75197	82	46
75198	82	47
75199	82	48
75200	82	49
75201	82	50
75202	82	51
75203	82	52
75204	82	53
75205	82	54
75206	82	55
75207	82	56
75208	82	57
75209	82	58
75210	82	59
75211	82	60
75212	82	61
75213	82	62
75214	82	63
75215	82	64
75216	82	65
75217	82	66
75218	82	68
75219	82	69
75220	82	70
75221	82	71
75222	82	72
75223	82	73
75224	82	74
75225	82	75
75226	82	76
75227	82	77
75228	83	1
75229	83	2
75230	83	3
75231	83	4
75232	83	5
75233	83	6
75234	83	7
75235	83	8
75236	83	9
75237	83	10
75238	83	11
75239	83	12
75240	83	13
75241	83	14
75242	83	15
75243	83	16
75244	83	17
75245	83	18
75246	83	19
75247	83	20
75248	83	21
75249	83	22
75250	83	23
75251	83	24
75252	83	25
75253	83	26
75254	83	27
75255	83	28
75256	83	29
75257	83	30
75258	83	31
75259	83	32
75260	83	33
75261	83	34
75262	83	35
75263	83	36
75264	83	37
75265	83	38
75266	83	39
75267	83	40
75268	83	41
75269	83	42
75270	83	43
75271	83	44
75272	83	45
75273	83	46
75274	83	47
75275	83	48
75276	83	49
75277	83	50
75278	83	51
75279	83	52
75280	83	53
75281	83	54
75282	83	55
75283	83	56
75284	83	57
75285	83	58
75286	83	59
75287	83	60
75288	83	61
75289	83	62
75290	83	63
75291	83	64
75292	83	65
75293	83	66
75294	83	68
75295	83	69
75296	83	70
75297	83	71
75298	83	72
75299	83	73
75300	83	74
75301	83	75
75302	83	76
75303	83	77
75304	84	1
75305	84	2
75306	84	3
75307	84	4
75308	84	5
75309	84	6
75310	84	7
75311	84	8
75312	84	9
75313	84	10
75314	84	11
75315	84	12
75316	84	13
75317	84	14
75318	84	15
75319	84	16
75320	84	17
75321	84	18
75322	84	19
75323	84	20
75324	84	21
75325	84	22
75326	84	23
75327	84	24
75328	84	25
75329	84	26
75330	84	27
75331	84	28
75332	84	29
75333	84	30
75334	84	31
75335	84	32
75336	84	33
75337	84	34
75338	84	35
75339	84	36
75340	84	37
75341	84	38
75342	84	39
75343	84	40
75344	84	41
75345	84	42
75346	84	43
75347	84	44
75348	84	45
75349	84	46
75350	84	47
75351	84	48
75352	84	49
75353	84	50
75354	84	51
75355	84	52
75356	84	53
75357	84	54
75358	84	55
75359	84	56
75360	84	57
75361	84	58
75362	84	59
75363	84	60
75364	84	61
75365	84	62
75366	84	63
75367	84	64
75368	84	65
75369	84	66
75370	84	68
75371	84	69
75372	84	70
75373	84	71
75374	84	72
75375	84	73
75376	84	74
75377	84	75
75378	84	76
75379	84	77
75380	85	1
75381	85	2
75382	85	3
75383	85	4
75384	85	5
75385	85	6
75386	85	7
75387	85	8
75388	85	9
75389	85	10
75390	85	11
75391	85	12
75392	85	13
75393	85	14
75394	85	15
75395	85	16
75396	85	17
75397	85	18
75398	85	19
75399	85	20
75400	85	21
75401	85	22
75402	85	23
75403	85	24
75404	85	25
75405	85	26
75406	85	27
75407	85	28
75408	85	29
75409	85	30
75410	85	31
75411	85	32
75412	85	33
75413	85	34
75414	85	35
75415	85	36
75416	85	37
75417	85	38
75418	85	39
75419	85	40
75420	85	41
75421	85	42
75422	85	43
75423	85	44
75424	85	45
75425	85	46
75426	85	47
75427	85	48
75428	85	49
75429	85	50
75430	85	51
75431	85	52
75432	85	53
75433	85	54
75434	85	55
75435	85	56
75436	85	57
75437	85	58
75438	85	59
75439	85	60
75440	85	61
75441	85	62
75442	85	63
75443	85	64
75444	85	65
75445	85	66
75446	85	68
75447	85	69
75448	85	70
75449	85	71
75450	85	72
75451	85	73
75452	85	74
75453	85	75
75454	85	76
75455	85	77
75456	86	1
75457	86	2
75458	86	3
75459	86	4
75460	86	5
75461	86	6
75462	86	7
75463	86	8
75464	86	9
75465	86	10
75466	86	11
75467	86	12
75468	86	13
75469	86	14
75470	86	15
75471	86	16
75472	86	17
75473	86	18
75474	86	19
75475	86	20
75476	86	21
75477	86	22
75478	86	23
75479	86	24
75480	86	25
75481	86	26
75482	86	27
75483	86	28
75484	86	29
75485	86	30
75486	86	31
75487	86	32
75488	86	33
75489	86	34
75490	86	35
75491	86	36
75492	86	37
75493	86	38
75494	86	39
75495	86	40
75496	86	41
75497	86	42
75498	86	43
75499	86	44
75500	86	45
75501	86	46
75502	86	47
75503	86	48
75504	86	49
75505	86	50
75506	86	51
75507	86	52
75508	86	53
75509	86	54
75510	86	55
75511	86	56
75512	86	57
75513	86	58
75514	86	59
75515	86	60
75516	86	61
75517	86	62
75518	86	63
75519	86	64
75520	86	65
75521	86	66
75522	86	68
75523	86	69
75524	86	70
75525	86	71
75526	86	72
75527	86	73
75528	86	74
75529	86	75
75530	86	76
75531	86	77
75532	87	1
75533	87	2
75534	87	3
75535	87	4
75536	87	5
75537	87	6
75538	87	7
75539	87	8
75540	87	9
75541	87	10
75542	87	11
75543	87	12
75544	87	13
75545	87	14
75546	87	15
75547	87	16
75548	87	17
75549	87	18
75550	87	19
75551	87	20
75552	87	21
75553	87	22
75554	87	23
75555	87	24
75556	87	25
75557	87	26
75558	87	27
75559	87	28
75560	87	29
75561	87	30
75562	87	31
75563	87	32
75564	87	33
75565	87	34
75566	87	35
75567	87	36
75568	87	37
75569	87	38
75570	87	39
75571	87	40
75572	87	41
75573	87	42
75574	87	43
75575	87	44
75576	87	45
75577	87	46
75578	87	47
75579	87	48
75580	87	49
75581	87	50
75582	87	51
75583	87	52
75584	87	53
75585	87	54
75586	87	55
75587	87	56
75588	87	57
75589	87	58
75590	87	59
75591	87	60
75592	87	61
75593	87	62
75594	87	63
75595	87	64
75596	87	65
75597	87	66
75598	87	68
75599	87	69
75600	87	70
75601	87	71
75602	87	72
75603	87	73
75604	87	74
75605	87	75
75606	87	76
75607	87	77
75608	88	1
75609	88	2
75610	88	3
75611	88	4
75612	88	5
75613	88	6
75614	88	7
75615	88	8
75616	88	9
75617	88	10
75618	88	11
75619	88	12
75620	88	13
75621	88	14
75622	88	15
75623	88	16
75624	88	17
75625	88	18
75626	88	19
75627	88	20
75628	88	21
75629	88	22
75630	88	23
75631	88	24
75632	88	25
75633	88	26
75634	88	27
75635	88	28
75636	88	29
75637	88	30
75638	88	31
75639	88	32
75640	88	33
75641	88	34
75642	88	35
75643	88	36
75644	88	37
75645	88	38
75646	88	39
75647	88	40
75648	88	41
75649	88	42
75650	88	43
75651	88	44
75652	88	45
75653	88	46
75654	88	47
75655	88	48
75656	88	49
75657	88	50
75658	88	51
75659	88	52
75660	88	53
75661	88	54
75662	88	55
75663	88	56
75664	88	57
75665	88	58
75666	88	59
75667	88	60
75668	88	61
75669	88	62
75670	88	63
75671	88	64
75672	88	65
75673	88	66
75674	88	68
75675	88	69
75676	88	70
75677	88	71
75678	88	72
75679	88	73
75680	88	74
75681	88	75
75682	88	76
75683	88	77
75684	89	1
75685	89	2
75686	89	3
75687	89	4
75688	89	5
75689	89	6
75690	89	7
75691	89	8
75692	89	9
75693	89	10
75694	89	11
75695	89	12
75696	89	13
75697	89	14
75698	89	15
75699	89	16
75700	89	17
75701	89	18
75702	89	19
75703	89	20
75704	89	21
75705	89	22
75706	89	23
75707	89	24
75708	89	25
75709	89	26
75710	89	27
75711	89	28
75712	89	29
75713	89	30
75714	89	31
75715	89	32
75716	89	33
75717	89	34
75718	89	35
75719	89	36
75720	89	37
75721	89	38
75722	89	39
75723	89	40
75724	89	41
75725	89	42
75726	89	43
75727	89	44
75728	89	45
75729	89	46
75730	89	47
75731	89	48
75732	89	49
75733	89	50
75734	89	51
75735	89	52
75736	89	53
75737	89	54
75738	89	55
75739	89	56
75740	89	57
75741	89	58
75742	89	59
75743	89	60
75744	89	61
75745	89	62
75746	89	63
75747	89	64
75748	89	65
75749	89	66
75750	89	68
75751	89	69
75752	89	70
75753	89	71
75754	89	72
75755	89	73
75756	89	74
75757	89	75
75758	89	76
75759	89	77
75760	90	1
75761	90	2
75762	90	3
75763	90	4
75764	90	5
75765	90	6
75766	90	7
75767	90	8
75768	90	9
75769	90	10
75770	90	11
75771	90	12
75772	90	13
75773	90	14
75774	90	15
75775	90	16
75776	90	17
75777	90	18
75778	90	19
75779	90	20
75780	90	21
75781	90	22
75782	90	23
75783	90	24
75784	90	25
75785	90	26
75786	90	27
75787	90	28
75788	90	29
75789	90	30
75790	90	31
75791	90	32
75792	90	33
75793	90	34
75794	90	35
75795	90	36
75796	90	37
75797	90	38
75798	90	39
75799	90	40
75800	90	41
75801	90	42
75802	90	43
75803	90	44
75804	90	45
75805	90	46
75806	90	47
75807	90	48
75808	90	49
75809	90	50
75810	90	51
75811	90	52
75812	90	53
75813	90	54
75814	90	55
75815	90	56
75816	90	57
75817	90	58
75818	90	59
75819	90	60
75820	90	61
75821	90	62
75822	90	63
75823	90	64
75824	90	65
75825	90	66
75826	90	68
75827	90	69
75828	90	70
75829	90	71
75830	90	72
75831	90	73
75832	90	74
75833	90	75
75834	90	76
75835	90	77
75836	91	1
75837	91	2
75838	91	3
75839	91	4
75840	91	5
75841	91	6
75842	91	7
75843	91	8
75844	91	9
75845	91	10
75846	91	11
75847	91	12
75848	91	13
75849	91	14
75850	91	15
75851	91	16
75852	91	17
75853	91	18
75854	91	19
75855	91	20
75856	91	21
75857	91	22
75858	91	23
75859	91	24
75860	91	25
75861	91	26
75862	91	27
75863	91	28
75864	91	29
75865	91	30
75866	91	31
75867	91	32
75868	91	33
75869	91	34
75870	91	35
75871	91	36
75872	91	37
75873	91	38
75874	91	39
75875	91	40
75876	91	41
75877	91	42
75878	91	43
75879	91	44
75880	91	45
75881	91	46
75882	91	47
75883	91	48
75884	91	49
75885	91	50
75886	91	51
75887	91	52
75888	91	53
75889	91	54
75890	91	55
75891	91	56
75892	91	57
75893	91	58
75894	91	59
75895	91	60
75896	91	61
75897	91	62
75898	91	63
75899	91	64
75900	91	65
75901	91	66
75902	91	68
75903	91	69
75904	91	70
75905	91	71
75906	91	72
75907	91	73
75908	91	74
75909	91	75
75910	91	76
75911	91	77
75912	92	1
75913	92	2
75914	92	3
75915	92	4
75916	92	5
75917	92	6
75918	92	7
75919	92	8
75920	92	9
75921	92	10
75922	92	11
75923	92	12
75924	92	13
75925	92	14
75926	92	15
75927	92	16
75928	92	17
75929	92	18
75930	92	19
75931	92	20
75932	92	21
75933	92	22
75934	92	23
75935	92	24
75936	92	25
75937	92	26
75938	92	27
75939	92	28
75940	92	29
75941	92	30
75942	92	31
75943	92	32
75944	92	33
75945	92	34
75946	92	35
75947	92	36
75948	92	37
75949	92	38
75950	92	39
75951	92	40
75952	92	41
75953	92	42
75954	92	43
75955	92	44
75956	92	45
75957	92	46
75958	92	47
75959	92	48
75960	92	49
75961	92	50
75962	92	51
75963	92	52
75964	92	53
75965	92	54
75966	92	55
75967	92	56
75968	92	57
75969	92	58
75970	92	59
75971	92	60
75972	92	61
75973	92	62
75974	92	63
75975	92	64
75976	92	65
75977	92	66
75978	92	68
75979	92	69
75980	92	70
75981	92	71
75982	92	72
75983	92	73
75984	92	74
75985	92	75
75986	92	76
75987	92	77
75988	93	1
75989	93	2
75990	93	3
75991	93	4
75992	93	5
75993	93	6
75994	93	7
75995	93	8
75996	93	9
75997	93	10
75998	93	11
75999	93	12
76000	93	13
76001	93	14
76002	93	15
76003	93	16
76004	93	17
76005	93	18
76006	93	19
76007	93	20
76008	93	21
76009	93	22
76010	93	23
76011	93	24
76012	93	25
76013	93	26
76014	93	27
76015	93	28
76016	93	29
76017	93	30
76018	93	31
76019	93	32
76020	93	33
76021	93	34
76022	93	35
76023	93	36
76024	93	37
76025	93	38
76026	93	39
76027	93	40
76028	93	41
76029	93	42
76030	93	43
76031	93	44
76032	93	45
76033	93	46
76034	93	47
76035	93	48
76036	93	49
76037	93	50
76038	93	51
76039	93	52
76040	93	53
76041	93	54
76042	93	55
76043	93	56
76044	93	57
76045	93	58
76046	93	59
76047	93	60
76048	93	61
76049	93	62
76050	93	63
76051	93	64
76052	93	65
76053	93	66
76054	93	68
76055	93	69
76056	93	70
76057	93	71
76058	93	72
76059	93	73
76060	93	74
76061	93	75
76062	93	76
76063	93	77
76064	94	1
76065	94	2
76066	94	3
76067	94	4
76068	94	5
76069	94	6
76070	94	7
76071	94	8
76072	94	9
76073	94	10
76074	94	11
76075	94	12
76076	94	13
76077	94	14
76078	94	15
76079	94	16
76080	94	17
76081	94	18
76082	94	19
76083	94	20
76084	94	21
76085	94	22
76086	94	23
76087	94	24
76088	94	25
76089	94	26
76090	94	27
76091	94	28
76092	94	29
76093	94	30
76094	94	31
76095	94	32
76096	94	33
76097	94	34
76098	94	35
76099	94	36
76100	94	37
76101	94	38
76102	94	39
76103	94	40
76104	94	41
76105	94	42
76106	94	43
76107	94	44
76108	94	45
76109	94	46
76110	94	47
76111	94	48
76112	94	49
76113	94	50
76114	94	51
76115	94	52
76116	94	53
76117	94	54
76118	94	55
76119	94	56
76120	94	57
76121	94	58
76122	94	59
76123	94	60
76124	94	61
76125	94	62
76126	94	63
76127	94	64
76128	94	65
76129	94	66
76130	94	68
76131	94	69
76132	94	70
76133	94	71
76134	94	72
76135	94	73
76136	94	74
76137	94	75
76138	94	76
76139	94	77
76140	95	1
76141	95	2
76142	95	3
76143	95	4
76144	95	5
76145	95	6
76146	95	7
76147	95	8
76148	95	9
76149	95	10
76150	95	11
76151	95	12
76152	95	13
76153	95	14
76154	95	15
76155	95	16
76156	95	17
76157	95	18
76158	95	19
76159	95	20
76160	95	21
76161	95	22
76162	95	23
76163	95	24
76164	95	25
76165	95	26
76166	95	27
76167	95	28
76168	95	29
76169	95	30
76170	95	31
76171	95	32
76172	95	33
76173	95	34
76174	95	35
76175	95	36
76176	95	37
76177	95	38
76178	95	39
76179	95	40
76180	95	41
76181	95	42
76182	95	43
76183	95	44
76184	95	45
76185	95	46
76186	95	47
76187	95	48
76188	95	49
76189	95	50
76190	95	51
76191	95	52
76192	95	53
76193	95	54
76194	95	55
76195	95	56
76196	95	57
76197	95	58
76198	95	59
76199	95	60
76200	95	61
76201	95	62
76202	95	63
76203	95	64
76204	95	65
76205	95	66
76206	95	68
76207	95	69
76208	95	70
76209	95	71
76210	95	72
76211	95	73
76212	95	74
76213	95	75
76214	95	76
76215	95	77
76216	96	1
76217	96	2
76218	96	3
76219	96	4
76220	96	5
76221	96	6
76222	96	7
76223	96	8
76224	96	9
76225	96	10
76226	96	11
76227	96	12
76228	96	13
76229	96	14
76230	96	15
76231	96	16
76232	96	17
76233	96	18
76234	96	19
76235	96	20
76236	96	21
76237	96	22
76238	96	23
76239	96	24
76240	96	25
76241	96	26
76242	96	27
76243	96	28
76244	96	29
76245	96	30
76246	96	31
76247	96	32
76248	96	33
76249	96	34
76250	96	35
76251	96	36
76252	96	37
76253	96	38
76254	96	39
76255	96	40
76256	96	41
76257	96	42
76258	96	43
76259	96	44
76260	96	45
76261	96	46
76262	96	47
76263	96	48
76264	96	49
76265	96	50
76266	96	51
76267	96	52
76268	96	53
76269	96	54
76270	96	55
76271	96	56
76272	96	57
76273	96	58
76274	96	59
76275	96	60
76276	96	61
76277	96	62
76278	96	63
76279	96	64
76280	96	65
76281	96	66
76282	96	68
76283	96	69
76284	96	70
76285	96	71
76286	96	72
76287	96	73
76288	96	74
76289	96	75
76290	96	76
76291	96	77
76292	97	1
76293	97	2
76294	97	3
76295	97	4
76296	97	5
76297	97	6
76298	97	7
76299	97	8
76300	97	9
76301	97	10
76302	97	11
76303	97	12
76304	97	13
76305	97	14
76306	97	15
76307	97	16
76308	97	17
76309	97	18
76310	97	19
76311	97	20
76312	97	21
76313	97	22
76314	97	23
76315	97	24
76316	97	25
76317	97	26
76318	97	27
76319	97	28
76320	97	29
76321	97	30
76322	97	31
76323	97	32
76324	97	33
76325	97	34
76326	97	35
76327	97	36
76328	97	37
76329	97	38
76330	97	39
76331	97	40
76332	97	41
76333	97	42
76334	97	43
76335	97	44
76336	97	45
76337	97	46
76338	97	47
76339	97	48
76340	97	49
76341	97	50
76342	97	51
76343	97	52
76344	97	53
76345	97	54
76346	97	55
76347	97	56
76348	97	57
76349	97	58
76350	97	59
76351	97	60
76352	97	61
76353	97	62
76354	97	63
76355	97	64
76356	97	65
76357	97	66
76358	97	68
76359	97	69
76360	97	70
76361	97	71
76362	97	72
76363	97	73
76364	97	74
76365	97	75
76366	97	76
76367	97	77
76368	98	1
76369	98	2
76370	98	3
76371	98	4
76372	98	5
76373	98	6
76374	98	7
76375	98	8
76376	98	9
76377	98	10
76378	98	11
76379	98	12
76380	98	13
76381	98	14
76382	98	15
76383	98	16
76384	98	17
76385	98	18
76386	98	19
76387	98	20
76388	98	21
76389	98	22
76390	98	23
76391	98	24
76392	98	25
76393	98	26
76394	98	27
76395	98	28
76396	98	29
76397	98	30
76398	98	31
76399	98	32
76400	98	33
76401	98	34
76402	98	35
76403	98	36
76404	98	37
76405	98	38
76406	98	39
76407	98	40
76408	98	41
76409	98	42
76410	98	43
76411	98	44
76412	98	45
76413	98	46
76414	98	47
76415	98	48
76416	98	49
76417	98	50
76418	98	51
76419	98	52
76420	98	53
76421	98	54
76422	98	55
76423	98	56
76424	98	57
76425	98	58
76426	98	59
76427	98	60
76428	98	61
76429	98	62
76430	98	63
76431	98	64
76432	98	65
76433	98	66
76434	98	68
76435	98	69
76436	98	70
76437	98	71
76438	98	72
76439	98	73
76440	98	74
76441	98	75
76442	98	76
76443	98	77
76444	99	1
76445	99	2
76446	99	3
76447	99	4
76448	99	5
76449	99	6
76450	99	7
76451	99	8
76452	99	9
76453	99	10
76454	99	11
76455	99	12
76456	99	13
76457	99	14
76458	99	15
76459	99	16
76460	99	17
76461	99	18
76462	99	19
76463	99	20
76464	99	21
76465	99	22
76466	99	23
76467	99	24
76468	99	25
76469	99	26
76470	99	27
76471	99	28
76472	99	29
76473	99	30
76474	99	31
76475	99	32
76476	99	33
76477	99	34
76478	99	35
76479	99	36
76480	99	37
76481	99	38
76482	99	39
76483	99	40
76484	99	41
76485	99	42
76486	99	43
76487	99	44
76488	99	45
76489	99	46
76490	99	47
76491	99	48
76492	99	49
76493	99	50
76494	99	51
76495	99	52
76496	99	53
76497	99	54
76498	99	55
76499	99	56
76500	99	57
76501	99	58
76502	99	59
76503	99	60
76504	99	61
76505	99	62
76506	99	63
76507	99	64
76508	99	65
76509	99	66
76510	99	68
76511	99	69
76512	99	70
76513	99	71
76514	99	72
76515	99	73
76516	99	74
76517	99	75
76518	99	76
76519	99	77
76520	100	1
76521	100	2
76522	100	3
76523	100	4
76524	100	5
76525	100	6
76526	100	7
76527	100	8
76528	100	9
76529	100	10
76530	100	11
76531	100	12
76532	100	13
76533	100	14
76534	100	15
76535	100	16
76536	100	17
76537	100	18
76538	100	19
76539	100	20
76540	100	21
76541	100	22
76542	100	23
76543	100	24
76544	100	25
76545	100	26
76546	100	27
76547	100	28
76548	100	29
76549	100	30
76550	100	31
76551	100	32
76552	100	33
76553	100	34
76554	100	35
76555	100	36
76556	100	37
76557	100	38
76558	100	39
76559	100	40
76560	100	41
76561	100	42
76562	100	43
76563	100	44
76564	100	45
76565	100	46
76566	100	47
76567	100	48
76568	100	49
76569	100	50
76570	100	51
76571	100	52
76572	100	53
76573	100	54
76574	100	55
76575	100	56
76576	100	57
76577	100	58
76578	100	59
76579	100	60
76580	100	61
76581	100	62
76582	100	63
76583	100	64
76584	100	65
76585	100	66
76586	100	68
76587	100	69
76588	100	70
76589	100	71
76590	100	72
76591	100	73
76592	100	74
76593	100	75
76594	100	76
76595	100	77
76596	101	1
76597	101	2
76598	101	3
76599	101	4
76600	101	5
76601	101	6
76602	101	7
76603	101	8
76604	101	9
76605	101	10
76606	101	11
76607	101	12
76608	101	13
76609	101	14
76610	101	15
76611	101	16
76612	101	17
76613	101	18
76614	101	19
76615	101	20
76616	101	21
76617	101	22
76618	101	23
76619	101	24
76620	101	25
76621	101	26
76622	101	27
76623	101	28
76624	101	29
76625	101	30
76626	101	31
76627	101	32
76628	101	33
76629	101	34
76630	101	35
76631	101	36
76632	101	37
76633	101	38
76634	101	39
76635	101	40
76636	101	41
76637	101	42
76638	101	43
76639	101	44
76640	101	45
76641	101	46
76642	101	47
76643	101	48
76644	101	49
76645	101	50
76646	101	51
76647	101	52
76648	101	53
76649	101	54
76650	101	55
76651	101	56
76652	101	57
76653	101	58
76654	101	59
76655	101	60
76656	101	61
76657	101	62
76658	101	63
76659	101	64
76660	101	65
76661	101	66
76662	101	68
76663	101	69
76664	101	70
76665	101	71
76666	101	72
76667	101	73
76668	101	74
76669	101	75
76670	101	76
76671	101	77
76672	102	1
76673	102	2
76674	102	3
76675	102	4
76676	102	5
76677	102	6
76678	102	7
76679	102	8
76680	102	9
76681	102	10
76682	102	11
76683	102	12
76684	102	13
76685	102	14
76686	102	15
76687	102	16
76688	102	17
76689	102	18
76690	102	19
76691	102	20
76692	102	21
76693	102	22
76694	102	23
76695	102	24
76696	102	25
76697	102	26
76698	102	27
76699	102	28
76700	102	29
76701	102	30
76702	102	31
76703	102	32
76704	102	33
76705	102	34
76706	102	35
76707	102	36
76708	102	37
76709	102	38
76710	102	39
76711	102	40
76712	102	41
76713	102	42
76714	102	43
76715	102	44
76716	102	45
76717	102	46
76718	102	47
76719	102	48
76720	102	49
76721	102	50
76722	102	51
76723	102	52
76724	102	53
76725	102	54
76726	102	55
76727	102	56
76728	102	57
76729	102	58
76730	102	59
76731	102	60
76732	102	61
76733	102	62
76734	102	63
76735	102	64
76736	102	65
76737	102	66
76738	102	68
76739	102	69
76740	102	70
76741	102	71
76742	102	72
76743	102	73
76744	102	74
76745	102	75
76746	102	76
76747	102	77
76748	103	1
76749	103	2
76750	103	3
76751	103	4
76752	103	5
76753	103	6
76754	103	7
76755	103	8
76756	103	9
76757	103	10
76758	103	11
76759	103	12
76760	103	13
76761	103	14
76762	103	15
76763	103	16
76764	103	17
76765	103	18
76766	103	19
76767	103	20
76768	103	21
76769	103	22
76770	103	23
76771	103	24
76772	103	25
76773	103	26
76774	103	27
76775	103	28
76776	103	29
76777	103	30
76778	103	31
76779	103	32
76780	103	33
76781	103	34
76782	103	35
76783	103	36
76784	103	37
76785	103	38
76786	103	39
76787	103	40
76788	103	41
76789	103	42
76790	103	43
76791	103	44
76792	103	45
76793	103	46
76794	103	47
76795	103	48
76796	103	49
76797	103	50
76798	103	51
76799	103	52
76800	103	53
76801	103	54
76802	103	55
76803	103	56
76804	103	57
76805	103	58
76806	103	59
76807	103	60
76808	103	61
76809	103	62
76810	103	63
76811	103	64
76812	103	65
76813	103	66
76814	103	68
76815	103	69
76816	103	70
76817	103	71
76818	103	72
76819	103	73
76820	103	74
76821	103	75
76822	103	76
76823	103	77
76824	104	1
76825	104	2
76826	104	3
76827	104	4
76828	104	5
76829	104	6
76830	104	7
76831	104	8
76832	104	9
76833	104	10
76834	104	11
76835	104	12
76836	104	13
76837	104	14
76838	104	15
76839	104	16
76840	104	17
76841	104	18
76842	104	19
76843	104	20
76844	104	21
76845	104	22
76846	104	23
76847	104	24
76848	104	25
76849	104	26
76850	104	27
76851	104	28
76852	104	29
76853	104	30
76854	104	31
76855	104	32
76856	104	33
76857	104	34
76858	104	35
76859	104	36
76860	104	37
76861	104	38
76862	104	39
76863	104	40
76864	104	41
76865	104	42
76866	104	43
76867	104	44
76868	104	45
76869	104	46
76870	104	47
76871	104	48
76872	104	49
76873	104	50
76874	104	51
76875	104	52
76876	104	53
76877	104	54
76878	104	55
76879	104	56
76880	104	57
76881	104	58
76882	104	59
76883	104	60
76884	104	61
76885	104	62
76886	104	63
76887	104	64
76888	104	65
76889	104	66
76890	104	68
76891	104	69
76892	104	70
76893	104	71
76894	104	72
76895	104	73
76896	104	74
76897	104	75
76898	104	76
76899	104	77
76900	105	1
76901	105	2
76902	105	3
76903	105	4
76904	105	5
76905	105	6
76906	105	7
76907	105	8
76908	105	9
76909	105	10
76910	105	11
76911	105	12
76912	105	13
76913	105	14
76914	105	15
76915	105	16
76916	105	17
76917	105	18
76918	105	19
76919	105	20
76920	105	21
76921	105	22
76922	105	23
76923	105	24
76924	105	25
76925	105	26
76926	105	27
76927	105	28
76928	105	29
76929	105	30
76930	105	31
76931	105	32
76932	105	33
76933	105	34
76934	105	35
76935	105	36
76936	105	37
76937	105	38
76938	105	39
76939	105	40
76940	105	41
76941	105	42
76942	105	43
76943	105	44
76944	105	45
76945	105	46
76946	105	47
76947	105	48
76948	105	49
76949	105	50
76950	105	51
76951	105	52
76952	105	53
76953	105	54
76954	105	55
76955	105	56
76956	105	57
76957	105	58
76958	105	59
76959	105	60
76960	105	61
76961	105	62
76962	105	63
76963	105	64
76964	105	65
76965	105	66
76966	105	68
76967	105	69
76968	105	70
76969	105	71
76970	105	72
76971	105	73
76972	105	74
76973	105	75
76974	105	76
76975	105	77
76976	106	1
76977	106	2
76978	106	3
76979	106	4
76980	106	5
76981	106	6
76982	106	7
76983	106	8
76984	106	9
76985	106	10
76986	106	11
76987	106	12
76988	106	13
76989	106	14
76990	106	15
76991	106	16
76992	106	17
76993	106	18
76994	106	19
76995	106	20
76996	106	21
76997	106	22
76998	106	23
76999	106	24
77000	106	25
77001	106	26
77002	106	27
77003	106	28
77004	106	29
77005	106	30
77006	106	31
77007	106	32
77008	106	33
77009	106	34
77010	106	35
77011	106	36
77012	106	37
77013	106	38
77014	106	39
77015	106	40
77016	106	41
77017	106	42
77018	106	43
77019	106	44
77020	106	45
77021	106	46
77022	106	47
77023	106	48
77024	106	49
77025	106	50
77026	106	51
77027	106	52
77028	106	53
77029	106	54
77030	106	55
77031	106	56
77032	106	57
77033	106	58
77034	106	59
77035	106	60
77036	106	61
77037	106	62
77038	106	63
77039	106	64
77040	106	65
77041	106	66
77042	106	68
77043	106	69
77044	106	70
77045	106	71
77046	106	72
77047	106	73
77048	106	74
77049	106	75
77050	106	76
77051	106	77
77052	107	1
77053	107	2
77054	107	3
77055	107	4
77056	107	5
77057	107	6
77058	107	7
77059	107	8
77060	107	9
77061	107	10
77062	107	11
77063	107	12
77064	107	13
77065	107	14
77066	107	15
77067	107	16
77068	107	17
77069	107	18
77070	107	19
77071	107	20
77072	107	21
77073	107	22
77074	107	23
77075	107	24
77076	107	25
77077	107	26
77078	107	27
77079	107	28
77080	107	29
77081	107	30
77082	107	31
77083	107	32
77084	107	33
77085	107	34
77086	107	35
77087	107	36
77088	107	37
77089	107	38
77090	107	39
77091	107	40
77092	107	41
77093	107	42
77094	107	43
77095	107	44
77096	107	45
77097	107	46
77098	107	47
77099	107	48
77100	107	49
77101	107	50
77102	107	51
77103	107	52
77104	107	53
77105	107	54
77106	107	55
77107	107	56
77108	107	57
77109	107	58
77110	107	59
77111	107	60
77112	107	61
77113	107	62
77114	107	63
77115	107	64
77116	107	65
77117	107	66
77118	107	68
77119	107	69
77120	107	70
77121	107	71
77122	107	72
77123	107	73
77124	107	74
77125	107	75
77126	107	76
77127	107	77
77128	108	1
77129	108	2
77130	108	3
77131	108	4
77132	108	5
77133	108	6
77134	108	7
77135	108	8
77136	108	9
77137	108	10
77138	108	11
77139	108	12
77140	108	13
77141	108	14
77142	108	15
77143	108	16
77144	108	17
77145	108	18
77146	108	19
77147	108	20
77148	108	21
77149	108	22
77150	108	23
77151	108	24
77152	108	25
77153	108	26
77154	108	27
77155	108	28
77156	108	29
77157	108	30
77158	108	31
77159	108	32
77160	108	33
77161	108	34
77162	108	35
77163	108	36
77164	108	37
77165	108	38
77166	108	39
77167	108	40
77168	108	41
77169	108	42
77170	108	43
77171	108	44
77172	108	45
77173	108	46
77174	108	47
77175	108	48
77176	108	49
77177	108	50
77178	108	51
77179	108	52
77180	108	53
77181	108	54
77182	108	55
77183	108	56
77184	108	57
77185	108	58
77186	108	59
77187	108	60
77188	108	61
77189	108	62
77190	108	63
77191	108	64
77192	108	65
77193	108	66
77194	108	68
77195	108	69
77196	108	70
77197	108	71
77198	108	72
77199	108	73
77200	108	74
77201	108	75
77202	108	76
77203	108	77
77204	109	1
77205	109	2
77206	109	3
77207	109	4
77208	109	5
77209	109	6
77210	109	7
77211	109	8
77212	109	9
77213	109	10
77214	109	11
77215	109	12
77216	109	13
77217	109	14
77218	109	15
77219	109	16
77220	109	17
77221	109	18
77222	109	19
77223	109	20
77224	109	21
77225	109	22
77226	109	23
77227	109	24
77228	109	25
77229	109	26
77230	109	27
77231	109	28
77232	109	29
77233	109	30
77234	109	31
77235	109	32
77236	109	33
77237	109	34
77238	109	35
77239	109	36
77240	109	37
77241	109	38
77242	109	39
77243	109	40
77244	109	41
77245	109	42
77246	109	43
77247	109	44
77248	109	45
77249	109	46
77250	109	47
77251	109	48
77252	109	49
77253	109	50
77254	109	51
77255	109	52
77256	109	53
77257	109	54
77258	109	55
77259	109	56
77260	109	57
77261	109	58
77262	109	59
77263	109	60
77264	109	61
77265	109	62
77266	109	63
77267	109	64
77268	109	65
77269	109	66
77270	109	68
77271	109	69
77272	109	70
77273	109	71
77274	109	72
77275	109	73
77276	109	74
77277	109	75
77278	109	76
77279	109	77
77280	110	1
77281	110	2
77282	110	3
77283	110	4
77284	110	5
77285	110	6
77286	110	7
77287	110	8
77288	110	9
77289	110	10
77290	110	11
77291	110	12
77292	110	13
77293	110	14
77294	110	15
77295	110	16
77296	110	17
77297	110	18
77298	110	19
77299	110	20
77300	110	21
77301	110	22
77302	110	23
77303	110	24
77304	110	25
77305	110	26
77306	110	27
77307	110	28
77308	110	29
77309	110	30
77310	110	31
77311	110	32
77312	110	33
77313	110	34
77314	110	35
77315	110	36
77316	110	37
77317	110	38
77318	110	39
77319	110	40
77320	110	41
77321	110	42
77322	110	43
77323	110	44
77324	110	45
77325	110	46
77326	110	47
77327	110	48
77328	110	49
77329	110	50
77330	110	51
77331	110	52
77332	110	53
77333	110	54
77334	110	55
77335	110	56
77336	110	57
77337	110	58
77338	110	59
77339	110	60
77340	110	61
77341	110	62
77342	110	63
77343	110	64
77344	110	65
77345	110	66
77346	110	68
77347	110	69
77348	110	70
77349	110	71
77350	110	72
77351	110	73
77352	110	74
77353	110	75
77354	110	76
77355	110	77
77356	111	1
77357	111	2
77358	111	3
77359	111	4
77360	111	5
77361	111	6
77362	111	7
77363	111	8
77364	111	9
77365	111	10
77366	111	11
77367	111	12
77368	111	13
77369	111	14
77370	111	15
77371	111	16
77372	111	17
77373	111	18
77374	111	19
77375	111	20
77376	111	21
77377	111	22
77378	111	23
77379	111	24
77380	111	25
77381	111	26
77382	111	27
77383	111	28
77384	111	29
77385	111	30
77386	111	31
77387	111	32
77388	111	33
77389	111	34
77390	111	35
77391	111	36
77392	111	37
77393	111	38
77394	111	39
77395	111	40
77396	111	41
77397	111	42
77398	111	43
77399	111	44
77400	111	45
77401	111	46
77402	111	47
77403	111	48
77404	111	49
77405	111	50
77406	111	51
77407	111	52
77408	111	53
77409	111	54
77410	111	55
77411	111	56
77412	111	57
77413	111	58
77414	111	59
77415	111	60
77416	111	61
77417	111	62
77418	111	63
77419	111	64
77420	111	65
77421	111	66
77422	111	68
77423	111	69
77424	111	70
77425	111	71
77426	111	72
77427	111	73
77428	111	74
77429	111	75
77430	111	76
77431	111	77
77432	112	1
77433	112	2
77434	112	3
77435	112	4
77436	112	5
77437	112	6
77438	112	7
77439	112	8
77440	112	9
77441	112	10
77442	112	11
77443	112	12
77444	112	13
77445	112	14
77446	112	15
77447	112	16
77448	112	17
77449	112	18
77450	112	19
77451	112	20
77452	112	21
77453	112	22
77454	112	23
77455	112	24
77456	112	25
77457	112	26
77458	112	27
77459	112	28
77460	112	29
77461	112	30
77462	112	31
77463	112	32
77464	112	33
77465	112	34
77466	112	35
77467	112	36
77468	112	37
77469	112	38
77470	112	39
77471	112	40
77472	112	41
77473	112	42
77474	112	43
77475	112	44
77476	112	45
77477	112	46
77478	112	47
77479	112	48
77480	112	49
77481	112	50
77482	112	51
77483	112	52
77484	112	53
77485	112	54
77486	112	55
77487	112	56
77488	112	57
77489	112	58
77490	112	59
77491	112	60
77492	112	61
77493	112	62
77494	112	63
77495	112	64
77496	112	65
77497	112	66
77498	112	68
77499	112	69
77500	112	70
77501	112	71
77502	112	72
77503	112	73
77504	112	74
77505	112	75
77506	112	76
77507	112	77
77508	113	1
77509	113	2
77510	113	3
77511	113	4
77512	113	5
77513	113	6
77514	113	7
77515	113	8
77516	113	9
77517	113	10
77518	113	11
77519	113	12
77520	113	13
77521	113	14
77522	113	15
77523	113	16
77524	113	17
77525	113	18
77526	113	19
77527	113	20
77528	113	21
77529	113	22
77530	113	23
77531	113	24
77532	113	25
77533	113	26
77534	113	27
77535	113	28
77536	113	29
77537	113	30
77538	113	31
77539	113	32
77540	113	33
77541	113	34
77542	113	35
77543	113	36
77544	113	37
77545	113	38
77546	113	39
77547	113	40
77548	113	41
77549	113	42
77550	113	43
77551	113	44
77552	113	45
77553	113	46
77554	113	47
77555	113	48
77556	113	49
77557	113	50
77558	113	51
77559	113	52
77560	113	53
77561	113	54
77562	113	55
77563	113	56
77564	113	57
77565	113	58
77566	113	59
77567	113	60
77568	113	61
77569	113	62
77570	113	63
77571	113	64
77572	113	65
77573	113	66
77574	113	68
77575	113	69
77576	113	70
77577	113	71
77578	113	72
77579	113	73
77580	113	74
77581	113	75
77582	113	76
77583	113	77
77584	114	1
77585	114	2
77586	114	3
77587	114	4
77588	114	5
77589	114	6
77590	114	7
77591	114	8
77592	114	9
77593	114	10
77594	114	11
77595	114	12
77596	114	13
77597	114	14
77598	114	15
77599	114	16
77600	114	17
77601	114	18
77602	114	19
77603	114	20
77604	114	21
77605	114	22
77606	114	23
77607	114	24
77608	114	25
77609	114	26
77610	114	27
77611	114	28
77612	114	29
77613	114	30
77614	114	31
77615	114	32
77616	114	33
77617	114	34
77618	114	35
77619	114	36
77620	114	37
77621	114	38
77622	114	39
77623	114	40
77624	114	41
77625	114	42
77626	114	43
77627	114	44
77628	114	45
77629	114	46
77630	114	47
77631	114	48
77632	114	49
77633	114	50
77634	114	51
77635	114	52
77636	114	53
77637	114	54
77638	114	55
77639	114	56
77640	114	57
77641	114	58
77642	114	59
77643	114	60
77644	114	61
77645	114	62
77646	114	63
77647	114	64
77648	114	65
77649	114	66
77650	114	68
77651	114	69
77652	114	70
77653	114	71
77654	114	72
77655	114	73
77656	114	74
77657	114	75
77658	114	76
77659	114	77
77660	115	1
77661	115	2
77662	115	3
77663	115	4
77664	115	5
77665	115	6
77666	115	7
77667	115	8
77668	115	9
77669	115	10
77670	115	11
77671	115	12
77672	115	13
77673	115	14
77674	115	15
77675	115	16
77676	115	17
77677	115	18
77678	115	19
77679	115	20
77680	115	21
77681	115	22
77682	115	23
77683	115	24
77684	115	25
77685	115	26
77686	115	27
77687	115	28
77688	115	29
77689	115	30
77690	115	31
77691	115	32
77692	115	33
77693	115	34
77694	115	35
77695	115	36
77696	115	37
77697	115	38
77698	115	39
77699	115	40
77700	115	41
77701	115	42
77702	115	43
77703	115	44
77704	115	45
77705	115	46
77706	115	47
77707	115	48
77708	115	49
77709	115	50
77710	115	51
77711	115	52
77712	115	53
77713	115	54
77714	115	55
77715	115	56
77716	115	57
77717	115	58
77718	115	59
77719	115	60
77720	115	61
77721	115	62
77722	115	63
77723	115	64
77724	115	65
77725	115	66
77726	115	68
77727	115	69
77728	115	70
77729	115	71
77730	115	72
77731	115	73
77732	115	74
77733	115	75
77734	115	76
77735	115	77
77736	116	1
77737	116	2
77738	116	3
77739	116	4
77740	116	5
77741	116	6
77742	116	7
77743	116	8
77744	116	9
77745	116	10
77746	116	11
77747	116	12
77748	116	13
77749	116	14
77750	116	15
77751	116	16
77752	116	17
77753	116	18
77754	116	19
77755	116	20
77756	116	21
77757	116	22
77758	116	23
77759	116	24
77760	116	25
77761	116	26
77762	116	27
77763	116	28
77764	116	29
77765	116	30
77766	116	31
77767	116	32
77768	116	33
77769	116	34
77770	116	35
77771	116	36
77772	116	37
77773	116	38
77774	116	39
77775	116	40
77776	116	41
77777	116	42
77778	116	43
77779	116	44
77780	116	45
77781	116	46
77782	116	47
77783	116	48
77784	116	49
77785	116	50
77786	116	51
77787	116	52
77788	116	53
77789	116	54
77790	116	55
77791	116	56
77792	116	57
77793	116	58
77794	116	59
77795	116	60
77796	116	61
77797	116	62
77798	116	63
77799	116	64
77800	116	65
77801	116	66
77802	116	68
77803	116	69
77804	116	70
77805	116	71
77806	116	72
77807	116	73
77808	116	74
77809	116	75
77810	116	76
77811	116	77
77812	117	1
77813	117	2
77814	117	3
77815	117	4
77816	117	5
77817	117	6
77818	117	7
77819	117	8
77820	117	9
77821	117	10
77822	117	11
77823	117	12
77824	117	13
77825	117	14
77826	117	15
77827	117	16
77828	117	17
77829	117	18
77830	117	19
77831	117	20
77832	117	21
77833	117	22
77834	117	23
77835	117	24
77836	117	25
77837	117	26
77838	117	27
77839	117	28
77840	117	29
77841	117	30
77842	117	31
77843	117	32
77844	117	33
77845	117	34
77846	117	35
77847	117	36
77848	117	37
77849	117	38
77850	117	39
77851	117	40
77852	117	41
77853	117	42
77854	117	43
77855	117	44
77856	117	45
77857	117	46
77858	117	47
77859	117	48
77860	117	49
77861	117	50
77862	117	51
77863	117	52
77864	117	53
77865	117	54
77866	117	55
77867	117	56
77868	117	57
77869	117	58
77870	117	59
77871	117	60
77872	117	61
77873	117	62
77874	117	63
77875	117	64
77876	117	65
77877	117	66
77878	117	68
77879	117	69
77880	117	70
77881	117	71
77882	117	72
77883	117	73
77884	117	74
77885	117	75
77886	117	76
77887	117	77
77888	118	1
77889	118	2
77890	118	3
77891	118	4
77892	118	5
77893	118	6
77894	118	7
77895	118	8
77896	118	9
77897	118	10
77898	118	11
77899	118	12
77900	118	13
77901	118	14
77902	118	15
77903	118	16
77904	118	17
77905	118	18
77906	118	19
77907	118	20
77908	118	21
77909	118	22
77910	118	23
77911	118	24
77912	118	25
77913	118	26
77914	118	27
77915	118	28
77916	118	29
77917	118	30
77918	118	31
77919	118	32
77920	118	33
77921	118	34
77922	118	35
77923	118	36
77924	118	37
77925	118	38
77926	118	39
77927	118	40
77928	118	41
77929	118	42
77930	118	43
77931	118	44
77932	118	45
77933	118	46
77934	118	47
77935	118	48
77936	118	49
77937	118	50
77938	118	51
77939	118	52
77940	118	53
77941	118	54
77942	118	55
77943	118	56
77944	118	57
77945	118	58
77946	118	59
77947	118	60
77948	118	61
77949	118	62
77950	118	63
77951	118	64
77952	118	65
77953	118	66
77954	118	68
77955	118	69
77956	118	70
77957	118	71
77958	118	72
77959	118	73
77960	118	74
77961	118	75
77962	118	76
77963	118	77
77964	119	1
77965	119	2
77966	119	3
77967	119	4
77968	119	5
77969	119	6
77970	119	7
77971	119	8
77972	119	9
77973	119	10
77974	119	11
77975	119	12
77976	119	13
77977	119	14
77978	119	15
77979	119	16
77980	119	17
77981	119	18
77982	119	19
77983	119	20
77984	119	21
77985	119	22
77986	119	23
77987	119	24
77988	119	25
77989	119	26
77990	119	27
77991	119	28
77992	119	29
77993	119	30
77994	119	31
77995	119	32
77996	119	33
77997	119	34
77998	119	35
77999	119	36
78000	119	37
78001	119	38
78002	119	39
78003	119	40
78004	119	41
78005	119	42
78006	119	43
78007	119	44
78008	119	45
78009	119	46
78010	119	47
78011	119	48
78012	119	49
78013	119	50
78014	119	51
78015	119	52
78016	119	53
78017	119	54
78018	119	55
78019	119	56
78020	119	57
78021	119	58
78022	119	59
78023	119	60
78024	119	61
78025	119	62
78026	119	63
78027	119	64
78028	119	65
78029	119	66
78030	119	68
78031	119	69
78032	119	70
78033	119	71
78034	119	72
78035	119	73
78036	119	74
78037	119	75
78038	119	76
78039	119	77
78040	120	1
78041	120	2
78042	120	3
78043	120	4
78044	120	5
78045	120	6
78046	120	7
78047	120	8
78048	120	9
78049	120	10
78050	120	11
78051	120	12
78052	120	13
78053	120	14
78054	120	15
78055	120	16
78056	120	17
78057	120	18
78058	120	19
78059	120	20
78060	120	21
78061	120	22
78062	120	23
78063	120	24
78064	120	25
78065	120	26
78066	120	27
78067	120	28
78068	120	29
78069	120	30
78070	120	31
78071	120	32
78072	120	33
78073	120	34
78074	120	35
78075	120	36
78076	120	37
78077	120	38
78078	120	39
78079	120	40
78080	120	41
78081	120	42
78082	120	43
78083	120	44
78084	120	45
78085	120	46
78086	120	47
78087	120	48
78088	120	49
78089	120	50
78090	120	51
78091	120	52
78092	120	53
78093	120	54
78094	120	55
78095	120	56
78096	120	57
78097	120	58
78098	120	59
78099	120	60
78100	120	61
78101	120	62
78102	120	63
78103	120	64
78104	120	65
78105	120	66
78106	120	68
78107	120	69
78108	120	70
78109	120	71
78110	120	72
78111	120	73
78112	120	74
78113	120	75
78114	120	76
78115	120	77
78116	121	1
78117	121	2
78118	121	3
78119	121	4
78120	121	5
78121	121	6
78122	121	7
78123	121	8
78124	121	9
78125	121	10
78126	121	11
78127	121	12
78128	121	13
78129	121	14
78130	121	15
78131	121	16
78132	121	17
78133	121	18
78134	121	19
78135	121	20
78136	121	21
78137	121	22
78138	121	23
78139	121	24
78140	121	25
78141	121	26
78142	121	27
78143	121	28
78144	121	29
78145	121	30
78146	121	31
78147	121	32
78148	121	33
78149	121	34
78150	121	35
78151	121	36
78152	121	37
78153	121	38
78154	121	39
78155	121	40
78156	121	41
78157	121	42
78158	121	43
78159	121	44
78160	121	45
78161	121	46
78162	121	47
78163	121	48
78164	121	49
78165	121	50
78166	121	51
78167	121	52
78168	121	53
78169	121	54
78170	121	55
78171	121	56
78172	121	57
78173	121	58
78174	121	59
78175	121	60
78176	121	61
78177	121	62
78178	121	63
78179	121	64
78180	121	65
78181	121	66
78182	121	68
78183	121	69
78184	121	70
78185	121	71
78186	121	72
78187	121	73
78188	121	74
78189	121	75
78190	121	76
78191	121	77
78192	122	1
78193	122	2
78194	122	3
78195	122	4
78196	122	5
78197	122	6
78198	122	7
78199	122	8
78200	122	9
78201	122	10
78202	122	11
78203	122	12
78204	122	13
78205	122	14
78206	122	15
78207	122	16
78208	122	17
78209	122	18
78210	122	19
78211	122	20
78212	122	21
78213	122	22
78214	122	23
78215	122	24
78216	122	25
78217	122	26
78218	122	27
78219	122	28
78220	122	29
78221	122	30
78222	122	31
78223	122	32
78224	122	33
78225	122	34
78226	122	35
78227	122	36
78228	122	37
78229	122	38
78230	122	39
78231	122	40
78232	122	41
78233	122	42
78234	122	43
78235	122	44
78236	122	45
78237	122	46
78238	122	47
78239	122	48
78240	122	49
78241	122	50
78242	122	51
78243	122	52
78244	122	53
78245	122	54
78246	122	55
78247	122	56
78248	122	57
78249	122	58
78250	122	59
78251	122	60
78252	122	61
78253	122	62
78254	122	63
78255	122	64
78256	122	65
78257	122	66
78258	122	68
78259	122	69
78260	122	70
78261	122	71
78262	122	72
78263	122	73
78264	122	74
78265	122	75
78266	122	76
78267	122	77
78268	123	1
78269	123	2
78270	123	3
78271	123	4
78272	123	5
78273	123	6
78274	123	7
78275	123	8
78276	123	9
78277	123	10
78278	123	11
78279	123	12
78280	123	13
78281	123	14
78282	123	15
78283	123	16
78284	123	17
78285	123	18
78286	123	19
78287	123	20
78288	123	21
78289	123	22
78290	123	23
78291	123	24
78292	123	25
78293	123	26
78294	123	27
78295	123	28
78296	123	29
78297	123	30
78298	123	31
78299	123	32
78300	123	33
78301	123	34
78302	123	35
78303	123	36
78304	123	37
78305	123	38
78306	123	39
78307	123	40
78308	123	41
78309	123	42
78310	123	43
78311	123	44
78312	123	45
78313	123	46
78314	123	47
78315	123	48
78316	123	49
78317	123	50
78318	123	51
78319	123	52
78320	123	53
78321	123	54
78322	123	55
78323	123	56
78324	123	57
78325	123	58
78326	123	59
78327	123	60
78328	123	61
78329	123	62
78330	123	63
78331	123	64
78332	123	65
78333	123	66
78334	123	68
78335	123	69
78336	123	70
78337	123	71
78338	123	72
78339	123	73
78340	123	74
78341	123	75
78342	123	76
78343	123	77
78344	124	1
78345	124	2
78346	124	3
78347	124	4
78348	124	5
78349	124	6
78350	124	7
78351	124	8
78352	124	9
78353	124	10
78354	124	11
78355	124	12
78356	124	13
78357	124	14
78358	124	15
78359	124	16
78360	124	17
78361	124	18
78362	124	19
78363	124	20
78364	124	21
78365	124	22
78366	124	23
78367	124	24
78368	124	25
78369	124	26
78370	124	27
78371	124	28
78372	124	29
78373	124	30
78374	124	31
78375	124	32
78376	124	33
78377	124	34
78378	124	35
78379	124	36
78380	124	37
78381	124	38
78382	124	39
78383	124	40
78384	124	41
78385	124	42
78386	124	43
78387	124	44
78388	124	45
78389	124	46
78390	124	47
78391	124	48
78392	124	49
78393	124	50
78394	124	51
78395	124	52
78396	124	53
78397	124	54
78398	124	55
78399	124	56
78400	124	57
78401	124	58
78402	124	59
78403	124	60
78404	124	61
78405	124	62
78406	124	63
78407	124	64
78408	124	65
78409	124	66
78410	124	68
78411	124	69
78412	124	70
78413	124	71
78414	124	72
78415	124	73
78416	124	74
78417	124	75
78418	124	76
78419	124	77
78420	125	1
78421	125	2
78422	125	3
78423	125	4
78424	125	5
78425	125	6
78426	125	7
78427	125	8
78428	125	9
78429	125	10
78430	125	11
78431	125	12
78432	125	13
78433	125	14
78434	125	15
78435	125	16
78436	125	17
78437	125	18
78438	125	19
78439	125	20
78440	125	21
78441	125	22
78442	125	23
78443	125	24
78444	125	25
78445	125	26
78446	125	27
78447	125	28
78448	125	29
78449	125	30
78450	125	31
78451	125	32
78452	125	33
78453	125	34
78454	125	35
78455	125	36
78456	125	37
78457	125	38
78458	125	39
78459	125	40
78460	125	41
78461	125	42
78462	125	43
78463	125	44
78464	125	45
78465	125	46
78466	125	47
78467	125	48
78468	125	49
78469	125	50
78470	125	51
78471	125	52
78472	125	53
78473	125	54
78474	125	55
78475	125	56
78476	125	57
78477	125	58
78478	125	59
78479	125	60
78480	125	61
78481	125	62
78482	125	63
78483	125	64
78484	125	65
78485	125	66
78486	125	68
78487	125	69
78488	125	70
78489	125	71
78490	125	72
78491	125	73
78492	125	74
78493	125	75
78494	125	76
78495	125	77
78496	126	1
78497	126	2
78498	126	3
78499	126	4
78500	126	5
78501	126	6
78502	126	7
78503	126	8
78504	126	9
78505	126	10
78506	126	11
78507	126	12
78508	126	13
78509	126	14
78510	126	15
78511	126	16
78512	126	17
78513	126	18
78514	126	19
78515	126	20
78516	126	21
78517	126	22
78518	126	23
78519	126	24
78520	126	25
78521	126	26
78522	126	27
78523	126	28
78524	126	29
78525	126	30
78526	126	31
78527	126	32
78528	126	33
78529	126	34
78530	126	35
78531	126	36
78532	126	37
78533	126	38
78534	126	39
78535	126	40
78536	126	41
78537	126	42
78538	126	43
78539	126	44
78540	126	45
78541	126	46
78542	126	47
78543	126	48
78544	126	49
78545	126	50
78546	126	51
78547	126	52
78548	126	53
78549	126	54
78550	126	55
78551	126	56
78552	126	57
78553	126	58
78554	126	59
78555	126	60
78556	126	61
78557	126	62
78558	126	63
78559	126	64
78560	126	65
78561	126	66
78562	126	68
78563	126	69
78564	126	70
78565	126	71
78566	126	72
78567	126	73
78568	126	74
78569	126	75
78570	126	76
78571	126	77
78572	127	1
78573	127	2
78574	127	3
78575	127	4
78576	127	5
78577	127	6
78578	127	7
78579	127	8
78580	127	9
78581	127	10
78582	127	11
78583	127	12
78584	127	13
78585	127	14
78586	127	15
78587	127	16
78588	127	17
78589	127	18
78590	127	19
78591	127	20
78592	127	21
78593	127	22
78594	127	23
78595	127	24
78596	127	25
78597	127	26
78598	127	27
78599	127	28
78600	127	29
78601	127	30
78602	127	31
78603	127	32
78604	127	33
78605	127	34
78606	127	35
78607	127	36
78608	127	37
78609	127	38
78610	127	39
78611	127	40
78612	127	41
78613	127	42
78614	127	43
78615	127	44
78616	127	45
78617	127	46
78618	127	47
78619	127	48
78620	127	49
78621	127	50
78622	127	51
78623	127	52
78624	127	53
78625	127	54
78626	127	55
78627	127	56
78628	127	57
78629	127	58
78630	127	59
78631	127	60
78632	127	61
78633	127	62
78634	127	63
78635	127	64
78636	127	65
78637	127	66
78638	127	68
78639	127	69
78640	127	70
78641	127	71
78642	127	72
78643	127	73
78644	127	74
78645	127	75
78646	127	76
78647	127	77
78648	128	1
78649	128	2
78650	128	3
78651	128	4
78652	128	5
78653	128	6
78654	128	7
78655	128	8
78656	128	9
78657	128	10
78658	128	11
78659	128	12
78660	128	13
78661	128	14
78662	128	15
78663	128	16
78664	128	17
78665	128	18
78666	128	19
78667	128	20
78668	128	21
78669	128	22
78670	128	23
78671	128	24
78672	128	25
78673	128	26
78674	128	27
78675	128	28
78676	128	29
78677	128	30
78678	128	31
78679	128	32
78680	128	33
78681	128	34
78682	128	35
78683	128	36
78684	128	37
78685	128	38
78686	128	39
78687	128	40
78688	128	41
78689	128	42
78690	128	43
78691	128	44
78692	128	45
78693	128	46
78694	128	47
78695	128	48
78696	128	49
78697	128	50
78698	128	51
78699	128	52
78700	128	53
78701	128	54
78702	128	55
78703	128	56
78704	128	57
78705	128	58
78706	128	59
78707	128	60
78708	128	61
78709	128	62
78710	128	63
78711	128	64
78712	128	65
78713	128	66
78714	128	68
78715	128	69
78716	128	70
78717	128	71
78718	128	72
78719	128	73
78720	128	74
78721	128	75
78722	128	76
78723	128	77
78724	129	1
78725	129	2
78726	129	3
78727	129	4
78728	129	5
78729	129	6
78730	129	7
78731	129	8
78732	129	9
78733	129	10
78734	129	11
78735	129	12
78736	129	13
78737	129	14
78738	129	15
78739	129	16
78740	129	17
78741	129	18
78742	129	19
78743	129	20
78744	129	21
78745	129	22
78746	129	23
78747	129	24
78748	129	25
78749	129	26
78750	129	27
78751	129	28
78752	129	29
78753	129	30
78754	129	31
78755	129	32
78756	129	33
78757	129	34
78758	129	35
78759	129	36
78760	129	37
78761	129	38
78762	129	39
78763	129	40
78764	129	41
78765	129	42
78766	129	43
78767	129	44
78768	129	45
78769	129	46
78770	129	47
78771	129	48
78772	129	49
78773	129	50
78774	129	51
78775	129	52
78776	129	53
78777	129	54
78778	129	55
78779	129	56
78780	129	57
78781	129	58
78782	129	59
78783	129	60
78784	129	61
78785	129	62
78786	129	63
78787	129	64
78788	129	65
78789	129	66
78790	129	68
78791	129	69
78792	129	70
78793	129	71
78794	129	72
78795	129	73
78796	129	74
78797	129	75
78798	129	76
78799	129	77
78800	130	1
78801	130	2
78802	130	3
78803	130	4
78804	130	5
78805	130	6
78806	130	7
78807	130	8
78808	130	9
78809	130	10
78810	130	11
78811	130	12
78812	130	13
78813	130	14
78814	130	15
78815	130	16
78816	130	17
78817	130	18
78818	130	19
78819	130	20
78820	130	21
78821	130	22
78822	130	23
78823	130	24
78824	130	25
78825	130	26
78826	130	27
78827	130	28
78828	130	29
78829	130	30
78830	130	31
78831	130	32
78832	130	33
78833	130	34
78834	130	35
78835	130	36
78836	130	37
78837	130	38
78838	130	39
78839	130	40
78840	130	41
78841	130	42
78842	130	43
78843	130	44
78844	130	45
78845	130	46
78846	130	47
78847	130	48
78848	130	49
78849	130	50
78850	130	51
78851	130	52
78852	130	53
78853	130	54
78854	130	55
78855	130	56
78856	130	57
78857	130	58
78858	130	59
78859	130	60
78860	130	61
78861	130	62
78862	130	63
78863	130	64
78864	130	65
78865	130	66
78866	130	68
78867	130	69
78868	130	70
78869	130	71
78870	130	72
78871	130	73
78872	130	74
78873	130	75
78874	130	76
78875	130	77
78876	131	1
78877	131	2
78878	131	3
78879	131	4
78880	131	5
78881	131	6
78882	131	7
78883	131	8
78884	131	9
78885	131	10
78886	131	11
78887	131	12
78888	131	13
78889	131	14
78890	131	15
78891	131	16
78892	131	17
78893	131	18
78894	131	19
78895	131	20
78896	131	21
78897	131	22
78898	131	23
78899	131	24
78900	131	25
78901	131	26
78902	131	27
78903	131	28
78904	131	29
78905	131	30
78906	131	31
78907	131	32
78908	131	33
78909	131	34
78910	131	35
78911	131	36
78912	131	37
78913	131	38
78914	131	39
78915	131	40
78916	131	41
78917	131	42
78918	131	43
78919	131	44
78920	131	45
78921	131	46
78922	131	47
78923	131	48
78924	131	49
78925	131	50
78926	131	51
78927	131	52
78928	131	53
78929	131	54
78930	131	55
78931	131	56
78932	131	57
78933	131	58
78934	131	59
78935	131	60
78936	131	61
78937	131	62
78938	131	63
78939	131	64
78940	131	65
78941	131	66
78942	131	68
78943	131	69
78944	131	70
78945	131	71
78946	131	72
78947	131	73
78948	131	74
78949	131	75
78950	131	76
78951	131	77
78952	132	1
78953	132	2
78954	132	3
78955	132	4
78956	132	5
78957	132	6
78958	132	7
78959	132	8
78960	132	9
78961	132	10
78962	132	11
78963	132	12
78964	132	13
78965	132	14
78966	132	15
78967	132	16
78968	132	17
78969	132	18
78970	132	19
78971	132	20
78972	132	21
78973	132	22
78974	132	23
78975	132	24
78976	132	25
78977	132	26
78978	132	27
78979	132	28
78980	132	29
78981	132	30
78982	132	31
78983	132	32
78984	132	33
78985	132	34
78986	132	35
78987	132	36
78988	132	37
78989	132	38
78990	132	39
78991	132	40
78992	132	41
78993	132	42
78994	132	43
78995	132	44
78996	132	45
78997	132	46
78998	132	47
78999	132	48
79000	132	49
79001	132	50
79002	132	51
79003	132	52
79004	132	53
79005	132	54
79006	132	55
79007	132	56
79008	132	57
79009	132	58
79010	132	59
79011	132	60
79012	132	61
79013	132	62
79014	132	63
79015	132	64
79016	132	65
79017	132	66
79018	132	68
79019	132	69
79020	132	70
79021	132	71
79022	132	72
79023	132	73
79024	132	74
79025	132	75
79026	132	76
79027	132	77
79028	133	1
79029	133	2
79030	133	3
79031	133	4
79032	133	5
79033	133	6
79034	133	7
79035	133	8
79036	133	9
79037	133	10
79038	133	11
79039	133	12
79040	133	13
79041	133	14
79042	133	15
79043	133	16
79044	133	17
79045	133	18
79046	133	19
79047	133	20
79048	133	21
79049	133	22
79050	133	23
79051	133	24
79052	133	25
79053	133	26
79054	133	27
79055	133	28
79056	133	29
79057	133	30
79058	133	31
79059	133	32
79060	133	33
79061	133	34
79062	133	35
79063	133	36
79064	133	37
79065	133	38
79066	133	39
79067	133	40
79068	133	41
79069	133	42
79070	133	43
79071	133	44
79072	133	45
79073	133	46
79074	133	47
79075	133	48
79076	133	49
79077	133	50
79078	133	51
79079	133	52
79080	133	53
79081	133	54
79082	133	55
79083	133	56
79084	133	57
79085	133	58
79086	133	59
79087	133	60
79088	133	61
79089	133	62
79090	133	63
79091	133	64
79092	133	65
79093	133	66
79094	133	68
79095	133	69
79096	133	70
79097	133	71
79098	133	72
79099	133	73
79100	133	74
79101	133	75
79102	133	76
79103	133	77
79104	134	1
79105	134	2
79106	134	3
79107	134	4
79108	134	5
79109	134	6
79110	134	7
79111	134	8
79112	134	9
79113	134	10
79114	134	11
79115	134	12
79116	134	13
79117	134	14
79118	134	15
79119	134	16
79120	134	17
79121	134	18
79122	134	19
79123	134	20
79124	134	21
79125	134	22
79126	134	23
79127	134	24
79128	134	25
79129	134	26
79130	134	27
79131	134	28
79132	134	29
79133	134	30
79134	134	31
79135	134	32
79136	134	33
79137	134	34
79138	134	35
79139	134	36
79140	134	37
79141	134	38
79142	134	39
79143	134	40
79144	134	41
79145	134	42
79146	134	43
79147	134	44
79148	134	45
79149	134	46
79150	134	47
79151	134	48
79152	134	49
79153	134	50
79154	134	51
79155	134	52
79156	134	53
79157	134	54
79158	134	55
79159	134	56
79160	134	57
79161	134	58
79162	134	59
79163	134	60
79164	134	61
79165	134	62
79166	134	63
79167	134	64
79168	134	65
79169	134	66
79170	134	68
79171	134	69
79172	134	70
79173	134	71
79174	134	72
79175	134	73
79176	134	74
79177	134	75
79178	134	76
79179	134	77
79180	135	1
79181	135	2
79182	135	3
79183	135	4
79184	135	5
79185	135	6
79186	135	7
79187	135	8
79188	135	9
79189	135	10
79190	135	11
79191	135	12
79192	135	13
79193	135	14
79194	135	15
79195	135	16
79196	135	17
79197	135	18
79198	135	19
79199	135	20
79200	135	21
79201	135	22
79202	135	23
79203	135	24
79204	135	25
79205	135	26
79206	135	27
79207	135	28
79208	135	29
79209	135	30
79210	135	31
79211	135	32
79212	135	33
79213	135	34
79214	135	35
79215	135	36
79216	135	37
79217	135	38
79218	135	39
79219	135	40
79220	135	41
79221	135	42
79222	135	43
79223	135	44
79224	135	45
79225	135	46
79226	135	47
79227	135	48
79228	135	49
79229	135	50
79230	135	51
79231	135	52
79232	135	53
79233	135	54
79234	135	55
79235	135	56
79236	135	57
79237	135	58
79238	135	59
79239	135	60
79240	135	61
79241	135	62
79242	135	63
79243	135	64
79244	135	65
79245	135	66
79246	135	68
79247	135	69
79248	135	70
79249	135	71
79250	135	72
79251	135	73
79252	135	74
79253	135	75
79254	135	76
79255	135	77
79256	136	1
79257	136	2
79258	136	3
79259	136	4
79260	136	5
79261	136	6
79262	136	7
79263	136	8
79264	136	9
79265	136	10
79266	136	11
79267	136	12
79268	136	13
79269	136	14
79270	136	15
79271	136	16
79272	136	17
79273	136	18
79274	136	19
79275	136	20
79276	136	21
79277	136	22
79278	136	23
79279	136	24
79280	136	25
79281	136	26
79282	136	27
79283	136	28
79284	136	29
79285	136	30
79286	136	31
79287	136	32
79288	136	33
79289	136	34
79290	136	35
79291	136	36
79292	136	37
79293	136	38
79294	136	39
79295	136	40
79296	136	41
79297	136	42
79298	136	43
79299	136	44
79300	136	45
79301	136	46
79302	136	47
79303	136	48
79304	136	49
79305	136	50
79306	136	51
79307	136	52
79308	136	53
79309	136	54
79310	136	55
79311	136	56
79312	136	57
79313	136	58
79314	136	59
79315	136	60
79316	136	61
79317	136	62
79318	136	63
79319	136	64
79320	136	65
79321	136	66
79322	136	68
79323	136	69
79324	136	70
79325	136	71
79326	136	72
79327	136	73
79328	136	74
79329	136	75
79330	136	76
79331	136	77
79332	137	1
79333	137	2
79334	137	3
79335	137	4
79336	137	5
79337	137	6
79338	137	7
79339	137	8
79340	137	9
79341	137	10
79342	137	11
79343	137	12
79344	137	13
79345	137	14
79346	137	15
79347	137	16
79348	137	17
79349	137	18
79350	137	19
79351	137	20
79352	137	21
79353	137	22
79354	137	23
79355	137	24
79356	137	25
79357	137	26
79358	137	27
79359	137	28
79360	137	29
79361	137	30
79362	137	31
79363	137	32
79364	137	33
79365	137	34
79366	137	35
79367	137	36
79368	137	37
79369	137	38
79370	137	39
79371	137	40
79372	137	41
79373	137	42
79374	137	43
79375	137	44
79376	137	45
79377	137	46
79378	137	47
79379	137	48
79380	137	49
79381	137	50
79382	137	51
79383	137	52
79384	137	53
79385	137	54
79386	137	55
79387	137	56
79388	137	57
79389	137	58
79390	137	59
79391	137	60
79392	137	61
79393	137	62
79394	137	63
79395	137	64
79396	137	65
79397	137	66
79398	137	68
79399	137	69
79400	137	70
79401	137	71
79402	137	72
79403	137	73
79404	137	74
79405	137	75
79406	137	76
79407	137	77
79408	138	1
79409	138	2
79410	138	3
79411	138	4
79412	138	5
79413	138	6
79414	138	7
79415	138	8
79416	138	9
79417	138	10
79418	138	11
79419	138	12
79420	138	13
79421	138	14
79422	138	15
79423	138	16
79424	138	17
79425	138	18
79426	138	19
79427	138	20
79428	138	21
79429	138	22
79430	138	23
79431	138	24
79432	138	25
79433	138	26
79434	138	27
79435	138	28
79436	138	29
79437	138	30
79438	138	31
79439	138	32
79440	138	33
79441	138	34
79442	138	35
79443	138	36
79444	138	37
79445	138	38
79446	138	39
79447	138	40
79448	138	41
79449	138	42
79450	138	43
79451	138	44
79452	138	45
79453	138	46
79454	138	47
79455	138	48
79456	138	49
79457	138	50
79458	138	51
79459	138	52
79460	138	53
79461	138	54
79462	138	55
79463	138	56
79464	138	57
79465	138	58
79466	138	59
79467	138	60
79468	138	61
79469	138	62
79470	138	63
79471	138	64
79472	138	65
79473	138	66
79474	138	68
79475	138	69
79476	138	70
79477	138	71
79478	138	72
79479	138	73
79480	138	74
79481	138	75
79482	138	76
79483	138	77
79484	139	1
79485	139	2
79486	139	3
79487	139	4
79488	139	5
79489	139	6
79490	139	7
79491	139	8
79492	139	9
79493	139	10
79494	139	11
79495	139	12
79496	139	13
79497	139	14
79498	139	15
79499	139	16
79500	139	17
79501	139	18
79502	139	19
79503	139	20
79504	139	21
79505	139	22
79506	139	23
79507	139	24
79508	139	25
79509	139	26
79510	139	27
79511	139	28
79512	139	29
79513	139	30
79514	139	31
79515	139	32
79516	139	33
79517	139	34
79518	139	35
79519	139	36
79520	139	37
79521	139	38
79522	139	39
79523	139	40
79524	139	41
79525	139	42
79526	139	43
79527	139	44
79528	139	45
79529	139	46
79530	139	47
79531	139	48
79532	139	49
79533	139	50
79534	139	51
79535	139	52
79536	139	53
79537	139	54
79538	139	55
79539	139	56
79540	139	57
79541	139	58
79542	139	59
79543	139	60
79544	139	61
79545	139	62
79546	139	63
79547	139	64
79548	139	65
79549	139	66
79550	139	68
79551	139	69
79552	139	70
79553	139	71
79554	139	72
79555	139	73
79556	139	74
79557	139	75
79558	139	76
79559	139	77
79560	140	1
79561	140	2
79562	140	3
79563	140	4
79564	140	5
79565	140	6
79566	140	7
79567	140	8
79568	140	9
79569	140	10
79570	140	11
79571	140	12
79572	140	13
79573	140	14
79574	140	15
79575	140	16
79576	140	17
79577	140	18
79578	140	19
79579	140	20
79580	140	21
79581	140	22
79582	140	23
79583	140	24
79584	140	25
79585	140	26
79586	140	27
79587	140	28
79588	140	29
79589	140	30
79590	140	31
79591	140	32
79592	140	33
79593	140	34
79594	140	35
79595	140	36
79596	140	37
79597	140	38
79598	140	39
79599	140	40
79600	140	41
79601	140	42
79602	140	43
79603	140	44
79604	140	45
79605	140	46
79606	140	47
79607	140	48
79608	140	49
79609	140	50
79610	140	51
79611	140	52
79612	140	53
79613	140	54
79614	140	55
79615	140	56
79616	140	57
79617	140	58
79618	140	59
79619	140	60
79620	140	61
79621	140	62
79622	140	63
79623	140	64
79624	140	65
79625	140	66
79626	140	68
79627	140	69
79628	140	70
79629	140	71
79630	140	72
79631	140	73
79632	140	74
79633	140	75
79634	140	76
79635	140	77
79636	141	1
79637	141	2
79638	141	3
79639	141	4
79640	141	5
79641	141	6
79642	141	7
79643	141	8
79644	141	9
79645	141	10
79646	141	11
79647	141	12
79648	141	13
79649	141	14
79650	141	15
79651	141	16
79652	141	17
79653	141	18
79654	141	19
79655	141	20
79656	141	21
79657	141	22
79658	141	23
79659	141	24
79660	141	25
79661	141	26
79662	141	27
79663	141	28
79664	141	29
79665	141	30
79666	141	31
79667	141	32
79668	141	33
79669	141	34
79670	141	35
79671	141	36
79672	141	37
79673	141	38
79674	141	39
79675	141	40
79676	141	41
79677	141	42
79678	141	43
79679	141	44
79680	141	45
79681	141	46
79682	141	47
79683	141	48
79684	141	49
79685	141	50
79686	141	51
79687	141	52
79688	141	53
79689	141	54
79690	141	55
79691	141	56
79692	141	57
79693	141	58
79694	141	59
79695	141	60
79696	141	61
79697	141	62
79698	141	63
79699	141	64
79700	141	65
79701	141	66
79702	141	68
79703	141	69
79704	141	70
79705	141	71
79706	141	72
79707	141	73
79708	141	74
79709	141	75
79710	141	76
79711	141	77
79712	142	1
79713	142	2
79714	142	3
79715	142	4
79716	142	5
79717	142	6
79718	142	7
79719	142	8
79720	142	9
79721	142	10
79722	142	11
79723	142	12
79724	142	13
79725	142	14
79726	142	15
79727	142	16
79728	142	17
79729	142	18
79730	142	19
79731	142	20
79732	142	21
79733	142	22
79734	142	23
79735	142	24
79736	142	25
79737	142	26
79738	142	27
79739	142	28
79740	142	29
79741	142	30
79742	142	31
79743	142	32
79744	142	33
79745	142	34
79746	142	35
79747	142	36
79748	142	37
79749	142	38
79750	142	39
79751	142	40
79752	142	41
79753	142	42
79754	142	43
79755	142	44
79756	142	45
79757	142	46
79758	142	47
79759	142	48
79760	142	49
79761	142	50
79762	142	51
79763	142	52
79764	142	53
79765	142	54
79766	142	55
79767	142	56
79768	142	57
79769	142	58
79770	142	59
79771	142	60
79772	142	61
79773	142	62
79774	142	63
79775	142	64
79776	142	65
79777	142	66
79778	142	68
79779	142	69
79780	142	70
79781	142	71
79782	142	72
79783	142	73
79784	142	74
79785	142	75
79786	142	76
79787	142	77
79788	143	1
79789	143	2
79790	143	3
79791	143	4
79792	143	5
79793	143	6
79794	143	7
79795	143	8
79796	143	9
79797	143	10
79798	143	11
79799	143	12
79800	143	13
79801	143	14
79802	143	15
79803	143	16
79804	143	17
79805	143	18
79806	143	19
79807	143	20
79808	143	21
79809	143	22
79810	143	23
79811	143	24
79812	143	25
79813	143	26
79814	143	27
79815	143	28
79816	143	29
79817	143	30
79818	143	31
79819	143	32
79820	143	33
79821	143	34
79822	143	35
79823	143	36
79824	143	37
79825	143	38
79826	143	39
79827	143	40
79828	143	41
79829	143	42
79830	143	43
79831	143	44
79832	143	45
79833	143	46
79834	143	47
79835	143	48
79836	143	49
79837	143	50
79838	143	51
79839	143	52
79840	143	53
79841	143	54
79842	143	55
79843	143	56
79844	143	57
79845	143	58
79846	143	59
79847	143	60
79848	143	61
79849	143	62
79850	143	63
79851	143	64
79852	143	65
79853	143	66
79854	143	68
79855	143	69
79856	143	70
79857	143	71
79858	143	72
79859	143	73
79860	143	74
79861	143	75
79862	143	76
79863	143	77
79864	144	1
79865	144	2
79866	144	3
79867	144	4
79868	144	5
79869	144	6
79870	144	7
79871	144	8
79872	144	9
79873	144	10
79874	144	11
79875	144	12
79876	144	13
79877	144	14
79878	144	15
79879	144	16
79880	144	17
79881	144	18
79882	144	19
79883	144	20
79884	144	21
79885	144	22
79886	144	23
79887	144	24
79888	144	25
79889	144	26
79890	144	27
79891	144	28
79892	144	29
79893	144	30
79894	144	31
79895	144	32
79896	144	33
79897	144	34
79898	144	35
79899	144	36
79900	144	37
79901	144	38
79902	144	39
79903	144	40
79904	144	41
79905	144	42
79906	144	43
79907	144	44
79908	144	45
79909	144	46
79910	144	47
79911	144	48
79912	144	49
79913	144	50
79914	144	51
79915	144	52
79916	144	53
79917	144	54
79918	144	55
79919	144	56
79920	144	57
79921	144	58
79922	144	59
79923	144	60
79924	144	61
79925	144	62
79926	144	63
79927	144	64
79928	144	65
79929	144	66
79930	144	68
79931	144	69
79932	144	70
79933	144	71
79934	144	72
79935	144	73
79936	144	74
79937	144	75
79938	144	76
79939	144	77
79940	145	1
79941	145	2
79942	145	3
79943	145	4
79944	145	5
79945	145	6
79946	145	7
79947	145	8
79948	145	9
79949	145	10
79950	145	11
79951	145	12
79952	145	13
79953	145	14
79954	145	15
79955	145	16
79956	145	17
79957	145	18
79958	145	19
79959	145	20
79960	145	21
79961	145	22
79962	145	23
79963	145	24
79964	145	25
79965	145	26
79966	145	27
79967	145	28
79968	145	29
79969	145	30
79970	145	31
79971	145	32
79972	145	33
79973	145	34
79974	145	35
79975	145	36
79976	145	37
79977	145	38
79978	145	39
79979	145	40
79980	145	41
79981	145	42
79982	145	43
79983	145	44
79984	145	45
79985	145	46
79986	145	47
79987	145	48
79988	145	49
79989	145	50
79990	145	51
79991	145	52
79992	145	53
79993	145	54
79994	145	55
79995	145	56
79996	145	57
79997	145	58
79998	145	59
79999	145	60
80000	145	61
80001	145	62
80002	145	63
80003	145	64
80004	145	65
80005	145	66
80006	145	68
80007	145	69
80008	145	70
80009	145	71
80010	145	72
80011	145	73
80012	145	74
80013	145	75
80014	145	76
80015	145	77
80016	146	1
80017	146	2
80018	146	3
80019	146	4
80020	146	5
80021	146	6
80022	146	7
80023	146	8
80024	146	9
80025	146	10
80026	146	11
80027	146	12
80028	146	13
80029	146	14
80030	146	15
80031	146	16
80032	146	17
80033	146	18
80034	146	19
80035	146	20
80036	146	21
80037	146	22
80038	146	23
80039	146	24
80040	146	25
80041	146	26
80042	146	27
80043	146	28
80044	146	29
80045	146	30
80046	146	31
80047	146	32
80048	146	33
80049	146	34
80050	146	35
80051	146	36
80052	146	37
80053	146	38
80054	146	39
80055	146	40
80056	146	41
80057	146	42
80058	146	43
80059	146	44
80060	146	45
80061	146	46
80062	146	47
80063	146	48
80064	146	49
80065	146	50
80066	146	51
80067	146	52
80068	146	53
80069	146	54
80070	146	55
80071	146	56
80072	146	57
80073	146	58
80074	146	59
80075	146	60
80076	146	61
80077	146	62
80078	146	63
80079	146	64
80080	146	65
80081	146	66
80082	146	68
80083	146	69
80084	146	70
80085	146	71
80086	146	72
80087	146	73
80088	146	74
80089	146	75
80090	146	76
80091	146	77
80092	147	1
80093	147	2
80094	147	3
80095	147	4
80096	147	5
80097	147	6
80098	147	7
80099	147	8
80100	147	9
80101	147	10
80102	147	11
80103	147	12
80104	147	13
80105	147	14
80106	147	15
80107	147	16
80108	147	17
80109	147	18
80110	147	19
80111	147	20
80112	147	21
80113	147	22
80114	147	23
80115	147	24
80116	147	25
80117	147	26
80118	147	27
80119	147	28
80120	147	29
80121	147	30
80122	147	31
80123	147	32
80124	147	33
80125	147	34
80126	147	35
80127	147	36
80128	147	37
80129	147	38
80130	147	39
80131	147	40
80132	147	41
80133	147	42
80134	147	43
80135	147	44
80136	147	45
80137	147	46
80138	147	47
80139	147	48
80140	147	49
80141	147	50
80142	147	51
80143	147	52
80144	147	53
80145	147	54
80146	147	55
80147	147	56
80148	147	57
80149	147	58
80150	147	59
80151	147	60
80152	147	61
80153	147	62
80154	147	63
80155	147	64
80156	147	65
80157	147	66
80158	147	68
80159	147	69
80160	147	70
80161	147	71
80162	147	72
80163	147	73
80164	147	74
80165	147	75
80166	147	76
80167	147	77
80168	148	1
80169	148	2
80170	148	3
80171	148	4
80172	148	5
80173	148	6
80174	148	7
80175	148	8
80176	148	9
80177	148	10
80178	148	11
80179	148	12
80180	148	13
80181	148	14
80182	148	15
80183	148	16
80184	148	17
80185	148	18
80186	148	19
80187	148	20
80188	148	21
80189	148	22
80190	148	23
80191	148	24
80192	148	25
80193	148	26
80194	148	27
80195	148	28
80196	148	29
80197	148	30
80198	148	31
80199	148	32
80200	148	33
80201	148	34
80202	148	35
80203	148	36
80204	148	37
80205	148	38
80206	148	39
80207	148	40
80208	148	41
80209	148	42
80210	148	43
80211	148	44
80212	148	45
80213	148	46
80214	148	47
80215	148	48
80216	148	49
80217	148	50
80218	148	51
80219	148	52
80220	148	53
80221	148	54
80222	148	55
80223	148	56
80224	148	57
80225	148	58
80226	148	59
80227	148	60
80228	148	61
80229	148	62
80230	148	63
80231	148	64
80232	148	65
80233	148	66
80234	148	68
80235	148	69
80236	148	70
80237	148	71
80238	148	72
80239	148	73
80240	148	74
80241	148	75
80242	148	76
80243	148	77
80244	149	1
80245	149	2
80246	149	3
80247	149	4
80248	149	5
80249	149	6
80250	149	7
80251	149	8
80252	149	9
80253	149	10
80254	149	11
80255	149	12
80256	149	13
80257	149	14
80258	149	15
80259	149	16
80260	149	17
80261	149	18
80262	149	19
80263	149	20
80264	149	21
80265	149	22
80266	149	23
80267	149	24
80268	149	25
80269	149	26
80270	149	27
80271	149	28
80272	149	29
80273	149	30
80274	149	31
80275	149	32
80276	149	33
80277	149	34
80278	149	35
80279	149	36
80280	149	37
80281	149	38
80282	149	39
80283	149	40
80284	149	41
80285	149	42
80286	149	43
80287	149	44
80288	149	45
80289	149	46
80290	149	47
80291	149	48
80292	149	49
80293	149	50
80294	149	51
80295	149	52
80296	149	53
80297	149	54
80298	149	55
80299	149	56
80300	149	57
80301	149	58
80302	149	59
80303	149	60
80304	149	61
80305	149	62
80306	149	63
80307	149	64
80308	149	65
80309	149	66
80310	149	68
80311	149	69
80312	149	70
80313	149	71
80314	149	72
80315	149	73
80316	149	74
80317	149	75
80318	149	76
80319	149	77
80320	150	1
80321	150	2
80322	150	3
80323	150	4
80324	150	5
80325	150	6
80326	150	7
80327	150	8
80328	150	9
80329	150	10
80330	150	11
80331	150	12
80332	150	13
80333	150	14
80334	150	15
80335	150	16
80336	150	17
80337	150	18
80338	150	19
80339	150	20
80340	150	21
80341	150	22
80342	150	23
80343	150	24
80344	150	25
80345	150	26
80346	150	27
80347	150	28
80348	150	29
80349	150	30
80350	150	31
80351	150	32
80352	150	33
80353	150	34
80354	150	35
80355	150	36
80356	150	37
80357	150	38
80358	150	39
80359	150	40
80360	150	41
80361	150	42
80362	150	43
80363	150	44
80364	150	45
80365	150	46
80366	150	47
80367	150	48
80368	150	49
80369	150	50
80370	150	51
80371	150	52
80372	150	53
80373	150	54
80374	150	55
80375	150	56
80376	150	57
80377	150	58
80378	150	59
80379	150	60
80380	150	61
80381	150	62
80382	150	63
80383	150	64
80384	150	65
80385	150	66
80386	150	68
80387	150	69
80388	150	70
80389	150	71
80390	150	72
80391	150	73
80392	150	74
80393	150	75
80394	150	76
80395	150	77
80396	151	1
80397	151	2
80398	151	3
80399	151	4
80400	151	5
80401	151	6
80402	151	7
80403	151	8
80404	151	9
80405	151	10
80406	151	11
80407	151	12
80408	151	13
80409	151	14
80410	151	15
80411	151	16
80412	151	17
80413	151	18
80414	151	19
80415	151	20
80416	151	21
80417	151	22
80418	151	23
80419	151	24
80420	151	25
80421	151	26
80422	151	27
80423	151	28
80424	151	29
80425	151	30
80426	151	31
80427	151	32
80428	151	33
80429	151	34
80430	151	35
80431	151	36
80432	151	37
80433	151	38
80434	151	39
80435	151	40
80436	151	41
80437	151	42
80438	151	43
80439	151	44
80440	151	45
80441	151	46
80442	151	47
80443	151	48
80444	151	49
80445	151	50
80446	151	51
80447	151	52
80448	151	53
80449	151	54
80450	151	55
80451	151	56
80452	151	57
80453	151	58
80454	151	59
80455	151	60
80456	151	61
80457	151	62
80458	151	63
80459	151	64
80460	151	65
80461	151	66
80462	151	68
80463	151	69
80464	151	70
80465	151	71
80466	151	72
80467	151	73
80468	151	74
80469	151	75
80470	151	76
80471	151	77
80472	152	1
80473	152	2
80474	152	3
80475	152	4
80476	152	5
80477	152	6
80478	152	7
80479	152	8
80480	152	9
80481	152	10
80482	152	11
80483	152	12
80484	152	13
80485	152	14
80486	152	15
80487	152	16
80488	152	17
80489	152	18
80490	152	19
80491	152	20
80492	152	21
80493	152	22
80494	152	23
80495	152	24
80496	152	25
80497	152	26
80498	152	27
80499	152	28
80500	152	29
80501	152	30
80502	152	31
80503	152	32
80504	152	33
80505	152	34
80506	152	35
80507	152	36
80508	152	37
80509	152	38
80510	152	39
80511	152	40
80512	152	41
80513	152	42
80514	152	43
80515	152	44
80516	152	45
80517	152	46
80518	152	47
80519	152	48
80520	152	49
80521	152	50
80522	152	51
80523	152	52
80524	152	53
80525	152	54
80526	152	55
80527	152	56
80528	152	57
80529	152	58
80530	152	59
80531	152	60
80532	152	61
80533	152	62
80534	152	63
80535	152	64
80536	152	65
80537	152	66
80538	152	68
80539	152	69
80540	152	70
80541	152	71
80542	152	72
80543	152	73
80544	152	74
80545	152	75
80546	152	76
80547	152	77
80548	153	1
80549	153	2
80550	153	3
80551	153	4
80552	153	5
80553	153	6
80554	153	7
80555	153	8
80556	153	9
80557	153	10
80558	153	11
80559	153	12
80560	153	13
80561	153	14
80562	153	15
80563	153	16
80564	153	17
80565	153	18
80566	153	19
80567	153	20
80568	153	21
80569	153	22
80570	153	23
80571	153	24
80572	153	25
80573	153	26
80574	153	27
80575	153	28
80576	153	29
80577	153	30
80578	153	31
80579	153	32
80580	153	33
80581	153	34
80582	153	35
80583	153	36
80584	153	37
80585	153	38
80586	153	39
80587	153	40
80588	153	41
80589	153	42
80590	153	43
80591	153	44
80592	153	45
80593	153	46
80594	153	47
80595	153	48
80596	153	49
80597	153	50
80598	153	51
80599	153	52
80600	153	53
80601	153	54
80602	153	55
80603	153	56
80604	153	57
80605	153	58
80606	153	59
80607	153	60
80608	153	61
80609	153	62
80610	153	63
80611	153	64
80612	153	65
80613	153	66
80614	153	68
80615	153	69
80616	153	70
80617	153	71
80618	153	72
80619	153	73
80620	153	74
80621	153	75
80622	153	76
80623	153	77
80624	154	1
80625	154	2
80626	154	3
80627	154	4
80628	154	5
80629	154	6
80630	154	7
80631	154	8
80632	154	9
80633	154	10
80634	154	11
80635	154	12
80636	154	13
80637	154	14
80638	154	15
80639	154	16
80640	154	17
80641	154	18
80642	154	19
80643	154	20
80644	154	21
80645	154	22
80646	154	23
80647	154	24
80648	154	25
80649	154	26
80650	154	27
80651	154	28
80652	154	29
80653	154	30
80654	154	31
80655	154	32
80656	154	33
80657	154	34
80658	154	35
80659	154	36
80660	154	37
80661	154	38
80662	154	39
80663	154	40
80664	154	41
80665	154	42
80666	154	43
80667	154	44
80668	154	45
80669	154	46
80670	154	47
80671	154	48
80672	154	49
80673	154	50
80674	154	51
80675	154	52
80676	154	53
80677	154	54
80678	154	55
80679	154	56
80680	154	57
80681	154	58
80682	154	59
80683	154	60
80684	154	61
80685	154	62
80686	154	63
80687	154	64
80688	154	65
80689	154	66
80690	154	68
80691	154	69
80692	154	70
80693	154	71
80694	154	72
80695	154	73
80696	154	74
80697	154	75
80698	154	76
80699	154	77
80700	155	1
80701	155	2
80702	155	3
80703	155	4
80704	155	5
80705	155	6
80706	155	7
80707	155	8
80708	155	9
80709	155	10
80710	155	11
80711	155	12
80712	155	13
80713	155	14
80714	155	15
80715	155	16
80716	155	17
80717	155	18
80718	155	19
80719	155	20
80720	155	21
80721	155	22
80722	155	23
80723	155	24
80724	155	25
80725	155	26
80726	155	27
80727	155	28
80728	155	29
80729	155	30
80730	155	31
80731	155	32
80732	155	33
80733	155	34
80734	155	35
80735	155	36
80736	155	37
80737	155	38
80738	155	39
80739	155	40
80740	155	41
80741	155	42
80742	155	43
80743	155	44
80744	155	45
80745	155	46
80746	155	47
80747	155	48
80748	155	49
80749	155	50
80750	155	51
80751	155	52
80752	155	53
80753	155	54
80754	155	55
80755	155	56
80756	155	57
80757	155	58
80758	155	59
80759	155	60
80760	155	61
80761	155	62
80762	155	63
80763	155	64
80764	155	65
80765	155	66
80766	155	68
80767	155	69
80768	155	70
80769	155	71
80770	155	72
80771	155	73
80772	155	74
80773	155	75
80774	155	76
80775	155	77
80776	156	1
80777	156	2
80778	156	3
80779	156	4
80780	156	5
80781	156	6
80782	156	7
80783	156	8
80784	156	9
80785	156	10
80786	156	11
80787	156	12
80788	156	13
80789	156	14
80790	156	15
80791	156	16
80792	156	17
80793	156	18
80794	156	19
80795	156	20
80796	156	21
80797	156	22
80798	156	23
80799	156	24
80800	156	25
80801	156	26
80802	156	27
80803	156	28
80804	156	29
80805	156	30
80806	156	31
80807	156	32
80808	156	33
80809	156	34
80810	156	35
80811	156	36
80812	156	37
80813	156	38
80814	156	39
80815	156	40
80816	156	41
80817	156	42
80818	156	43
80819	156	44
80820	156	45
80821	156	46
80822	156	47
80823	156	48
80824	156	49
80825	156	50
80826	156	51
80827	156	52
80828	156	53
80829	156	54
80830	156	55
80831	156	56
80832	156	57
80833	156	58
80834	156	59
80835	156	60
80836	156	61
80837	156	62
80838	156	63
80839	156	64
80840	156	65
80841	156	66
80842	156	68
80843	156	69
80844	156	70
80845	156	71
80846	156	72
80847	156	73
80848	156	74
80849	156	75
80850	156	76
80851	156	77
80852	157	1
80853	157	2
80854	157	3
80855	157	4
80856	157	5
80857	157	6
80858	157	7
80859	157	8
80860	157	9
80861	157	10
80862	157	11
80863	157	12
80864	157	13
80865	157	14
80866	157	15
80867	157	16
80868	157	17
80869	157	18
80870	157	19
80871	157	20
80872	157	21
80873	157	22
80874	157	23
80875	157	24
80876	157	25
80877	157	26
80878	157	27
80879	157	28
80880	157	29
80881	157	30
80882	157	31
80883	157	32
80884	157	33
80885	157	34
80886	157	35
80887	157	36
80888	157	37
80889	157	38
80890	157	39
80891	157	40
80892	157	41
80893	157	42
80894	157	43
80895	157	44
80896	157	45
80897	157	46
80898	157	47
80899	157	48
80900	157	49
80901	157	50
80902	157	51
80903	157	52
80904	157	53
80905	157	54
80906	157	55
80907	157	56
80908	157	57
80909	157	58
80910	157	59
80911	157	60
80912	157	61
80913	157	62
80914	157	63
80915	157	64
80916	157	65
80917	157	66
80918	157	68
80919	157	69
80920	157	70
80921	157	71
80922	157	72
80923	157	73
80924	157	74
80925	157	75
80926	157	76
80927	157	77
80928	158	1
80929	158	2
80930	158	3
80931	158	4
80932	158	5
80933	158	6
80934	158	7
80935	158	8
80936	158	9
80937	158	10
80938	158	11
80939	158	12
80940	158	13
80941	158	14
80942	158	15
80943	158	16
80944	158	17
80945	158	18
80946	158	19
80947	158	20
80948	158	21
80949	158	22
80950	158	23
80951	158	24
80952	158	25
80953	158	26
80954	158	27
80955	158	28
80956	158	29
80957	158	30
80958	158	31
80959	158	32
80960	158	33
80961	158	34
80962	158	35
80963	158	36
80964	158	37
80965	158	38
80966	158	39
80967	158	40
80968	158	41
80969	158	42
80970	158	43
80971	158	44
80972	158	45
80973	158	46
80974	158	47
80975	158	48
80976	158	49
80977	158	50
80978	158	51
80979	158	52
80980	158	53
80981	158	54
80982	158	55
80983	158	56
80984	158	57
80985	158	58
80986	158	59
80987	158	60
80988	158	61
80989	158	62
80990	158	63
80991	158	64
80992	158	65
80993	158	66
80994	158	68
80995	158	69
80996	158	70
80997	158	71
80998	158	72
80999	158	73
81000	158	74
81001	158	75
81002	158	76
81003	158	77
81004	159	1
81005	159	2
81006	159	3
81007	159	4
81008	159	5
81009	159	6
81010	159	7
81011	159	8
81012	159	9
81013	159	10
81014	159	11
81015	159	12
81016	159	13
81017	159	14
81018	159	15
81019	159	16
81020	159	17
81021	159	18
81022	159	19
81023	159	20
81024	159	21
81025	159	22
81026	159	23
81027	159	24
81028	159	25
81029	159	26
81030	159	27
81031	159	28
81032	159	29
81033	159	30
81034	159	31
81035	159	32
81036	159	33
81037	159	34
81038	159	35
81039	159	36
81040	159	37
81041	159	38
81042	159	39
81043	159	40
81044	159	41
81045	159	42
81046	159	43
81047	159	44
81048	159	45
81049	159	46
81050	159	47
81051	159	48
81052	159	49
81053	159	50
81054	159	51
81055	159	52
81056	159	53
81057	159	54
81058	159	55
81059	159	56
81060	159	57
81061	159	58
81062	159	59
81063	159	60
81064	159	61
81065	159	62
81066	159	63
81067	159	64
81068	159	65
81069	159	66
81070	159	68
81071	159	69
81072	159	70
81073	159	71
81074	159	72
81075	159	73
81076	159	74
81077	159	75
81078	159	76
81079	159	77
81080	160	1
81081	160	2
81082	160	3
81083	160	4
81084	160	5
81085	160	6
81086	160	7
81087	160	8
81088	160	9
81089	160	10
81090	160	11
81091	160	12
81092	160	13
81093	160	14
81094	160	15
81095	160	16
81096	160	17
81097	160	18
81098	160	19
81099	160	20
81100	160	21
81101	160	22
81102	160	23
81103	160	24
81104	160	25
81105	160	26
81106	160	27
81107	160	28
81108	160	29
81109	160	30
81110	160	31
81111	160	32
81112	160	33
81113	160	34
81114	160	35
81115	160	36
81116	160	37
81117	160	38
81118	160	39
81119	160	40
81120	160	41
81121	160	42
81122	160	43
81123	160	44
81124	160	45
81125	160	46
81126	160	47
81127	160	48
81128	160	49
81129	160	50
81130	160	51
81131	160	52
81132	160	53
81133	160	54
81134	160	55
81135	160	56
81136	160	57
81137	160	58
81138	160	59
81139	160	60
81140	160	61
81141	160	62
81142	160	63
81143	160	64
81144	160	65
81145	160	66
81146	160	68
81147	160	69
81148	160	70
81149	160	71
81150	160	72
81151	160	73
81152	160	74
81153	160	75
81154	160	76
81155	160	77
81156	161	1
81157	161	2
81158	161	3
81159	161	4
81160	161	5
81161	161	6
81162	161	7
81163	161	8
81164	161	9
81165	161	10
81166	161	11
81167	161	12
81168	161	13
81169	161	14
81170	161	15
81171	161	16
81172	161	17
81173	161	18
81174	161	19
81175	161	20
81176	161	21
81177	161	22
81178	161	23
81179	161	24
81180	161	25
81181	161	26
81182	161	27
81183	161	28
81184	161	29
81185	161	30
81186	161	31
81187	161	32
81188	161	33
81189	161	34
81190	161	35
81191	161	36
81192	161	37
81193	161	38
81194	161	39
81195	161	40
81196	161	41
81197	161	42
81198	161	43
81199	161	44
81200	161	45
81201	161	46
81202	161	47
81203	161	48
81204	161	49
81205	161	50
81206	161	51
81207	161	52
81208	161	53
81209	161	54
81210	161	55
81211	161	56
81212	161	57
81213	161	58
81214	161	59
81215	161	60
81216	161	61
81217	161	62
81218	161	63
81219	161	64
81220	161	65
81221	161	66
81222	161	68
81223	161	69
81224	161	70
81225	161	71
81226	161	72
81227	161	73
81228	161	74
81229	161	75
81230	161	76
81231	161	77
81232	162	1
81233	162	2
81234	162	3
81235	162	4
81236	162	5
81237	162	6
81238	162	7
81239	162	8
81240	162	9
81241	162	10
81242	162	11
81243	162	12
81244	162	13
81245	162	14
81246	162	15
81247	162	16
81248	162	17
81249	162	18
81250	162	19
81251	162	20
81252	162	21
81253	162	22
81254	162	23
81255	162	24
81256	162	25
81257	162	26
81258	162	27
81259	162	28
81260	162	29
81261	162	30
81262	162	31
81263	162	32
81264	162	33
81265	162	34
81266	162	35
81267	162	36
81268	162	37
81269	162	38
81270	162	39
81271	162	40
81272	162	41
81273	162	42
81274	162	43
81275	162	44
81276	162	45
81277	162	46
81278	162	47
81279	162	48
81280	162	49
81281	162	50
81282	162	51
81283	162	52
81284	162	53
81285	162	54
81286	162	55
81287	162	56
81288	162	57
81289	162	58
81290	162	59
81291	162	60
81292	162	61
81293	162	62
81294	162	63
81295	162	64
81296	162	65
81297	162	66
81298	162	68
81299	162	69
81300	162	70
81301	162	71
81302	162	72
81303	162	73
81304	162	74
81305	162	75
81306	162	76
81307	162	77
81308	163	1
81309	163	2
81310	163	3
81311	163	4
81312	163	5
81313	163	6
81314	163	7
81315	163	8
81316	163	9
81317	163	10
81318	163	11
81319	163	12
81320	163	13
81321	163	14
81322	163	15
81323	163	16
81324	163	17
81325	163	18
81326	163	19
81327	163	20
81328	163	21
81329	163	22
81330	163	23
81331	163	24
81332	163	25
81333	163	26
81334	163	27
81335	163	28
81336	163	29
81337	163	30
81338	163	31
81339	163	32
81340	163	33
81341	163	34
81342	163	35
81343	163	36
81344	163	37
81345	163	38
81346	163	39
81347	163	40
81348	163	41
81349	163	42
81350	163	43
81351	163	44
81352	163	45
81353	163	46
81354	163	47
81355	163	48
81356	163	49
81357	163	50
81358	163	51
81359	163	52
81360	163	53
81361	163	54
81362	163	55
81363	163	56
81364	163	57
81365	163	58
81366	163	59
81367	163	60
81368	163	61
81369	163	62
81370	163	63
81371	163	64
81372	163	65
81373	163	66
81374	163	68
81375	163	69
81376	163	70
81377	163	71
81378	163	72
81379	163	73
81380	163	74
81381	163	75
81382	163	76
81383	163	77
81384	164	1
81385	164	2
81386	164	3
81387	164	4
81388	164	5
81389	164	6
81390	164	7
81391	164	8
81392	164	9
81393	164	10
81394	164	11
81395	164	12
81396	164	13
81397	164	14
81398	164	15
81399	164	16
81400	164	17
81401	164	18
81402	164	19
81403	164	20
81404	164	21
81405	164	22
81406	164	23
81407	164	24
81408	164	25
81409	164	26
81410	164	27
81411	164	28
81412	164	29
81413	164	30
81414	164	31
81415	164	32
81416	164	33
81417	164	34
81418	164	35
81419	164	36
81420	164	37
81421	164	38
81422	164	39
81423	164	40
81424	164	41
81425	164	42
81426	164	43
81427	164	44
81428	164	45
81429	164	46
81430	164	47
81431	164	48
81432	164	49
81433	164	50
81434	164	51
81435	164	52
81436	164	53
81437	164	54
81438	164	55
81439	164	56
81440	164	57
81441	164	58
81442	164	59
81443	164	60
81444	164	61
81445	164	62
81446	164	63
81447	164	64
81448	164	65
81449	164	66
81450	164	68
81451	164	69
81452	164	70
81453	164	71
81454	164	72
81455	164	73
81456	164	74
81457	164	75
81458	164	76
81459	164	77
81460	165	1
81461	165	2
81462	165	3
81463	165	4
81464	165	5
81465	165	6
81466	165	7
81467	165	8
81468	165	9
81469	165	10
81470	165	11
81471	165	12
81472	165	13
81473	165	14
81474	165	15
81475	165	16
81476	165	17
81477	165	18
81478	165	19
81479	165	20
81480	165	21
81481	165	22
81482	165	23
81483	165	24
81484	165	25
81485	165	26
81486	165	27
81487	165	28
81488	165	29
81489	165	30
81490	165	31
81491	165	32
81492	165	33
81493	165	34
81494	165	35
81495	165	36
81496	165	37
81497	165	38
81498	165	39
81499	165	40
81500	165	41
81501	165	42
81502	165	43
81503	165	44
81504	165	45
81505	165	46
81506	165	47
81507	165	48
81508	165	49
81509	165	50
81510	165	51
81511	165	52
81512	165	53
81513	165	54
81514	165	55
81515	165	56
81516	165	57
81517	165	58
81518	165	59
81519	165	60
81520	165	61
81521	165	62
81522	165	63
81523	165	64
81524	165	65
81525	165	66
81526	165	68
81527	165	69
81528	165	70
81529	165	71
81530	165	72
81531	165	73
81532	165	74
81533	165	75
81534	165	76
81535	165	77
81536	166	1
81537	166	2
81538	166	3
81539	166	4
81540	166	5
81541	166	6
81542	166	7
81543	166	8
81544	166	9
81545	166	10
81546	166	11
81547	166	12
81548	166	13
81549	166	14
81550	166	15
81551	166	16
81552	166	17
81553	166	18
81554	166	19
81555	166	20
81556	166	21
81557	166	22
81558	166	23
81559	166	24
81560	166	25
81561	166	26
81562	166	27
81563	166	28
81564	166	29
81565	166	30
81566	166	31
81567	166	32
81568	166	33
81569	166	34
81570	166	35
81571	166	36
81572	166	37
81573	166	38
81574	166	39
81575	166	40
81576	166	41
81577	166	42
81578	166	43
81579	166	44
81580	166	45
81581	166	46
81582	166	47
81583	166	48
81584	166	49
81585	166	50
81586	166	51
81587	166	52
81588	166	53
81589	166	54
81590	166	55
81591	166	56
81592	166	57
81593	166	58
81594	166	59
81595	166	60
81596	166	61
81597	166	62
81598	166	63
81599	166	64
81600	166	65
81601	166	66
81602	166	68
81603	166	69
81604	166	70
81605	166	71
81606	166	72
81607	166	73
81608	166	74
81609	166	75
81610	166	76
81611	166	77
81612	167	1
81613	167	2
81614	167	3
81615	167	4
81616	167	5
81617	167	6
81618	167	7
81619	167	8
81620	167	9
81621	167	10
81622	167	11
81623	167	12
81624	167	13
81625	167	14
81626	167	15
81627	167	16
81628	167	17
81629	167	18
81630	167	19
81631	167	20
81632	167	21
81633	167	22
81634	167	23
81635	167	24
81636	167	25
81637	167	26
81638	167	27
81639	167	28
81640	167	29
81641	167	30
81642	167	31
81643	167	32
81644	167	33
81645	167	34
81646	167	35
81647	167	36
81648	167	37
81649	167	38
81650	167	39
81651	167	40
81652	167	41
81653	167	42
81654	167	43
81655	167	44
81656	167	45
81657	167	46
81658	167	47
81659	167	48
81660	167	49
81661	167	50
81662	167	51
81663	167	52
81664	167	53
81665	167	54
81666	167	55
81667	167	56
81668	167	57
81669	167	58
81670	167	59
81671	167	60
81672	167	61
81673	167	62
81674	167	63
81675	167	64
81676	167	65
81677	167	66
81678	167	68
81679	167	69
81680	167	70
81681	167	71
81682	167	72
81683	167	73
81684	167	74
81685	167	75
81686	167	76
81687	167	77
81688	168	1
81689	168	2
81690	168	3
81691	168	4
81692	168	5
81693	168	6
81694	168	7
81695	168	8
81696	168	9
81697	168	10
81698	168	11
81699	168	12
81700	168	13
81701	168	14
81702	168	15
81703	168	16
81704	168	17
81705	168	18
81706	168	19
81707	168	20
81708	168	21
81709	168	22
81710	168	23
81711	168	24
81712	168	25
81713	168	26
81714	168	27
81715	168	28
81716	168	29
81717	168	30
81718	168	31
81719	168	32
81720	168	33
81721	168	34
81722	168	35
81723	168	36
81724	168	37
81725	168	38
81726	168	39
81727	168	40
81728	168	41
81729	168	42
81730	168	43
81731	168	44
81732	168	45
81733	168	46
81734	168	47
81735	168	48
81736	168	49
81737	168	50
81738	168	51
81739	168	52
81740	168	53
81741	168	54
81742	168	55
81743	168	56
81744	168	57
81745	168	58
81746	168	59
81747	168	60
81748	168	61
81749	168	62
81750	168	63
81751	168	64
81752	168	65
81753	168	66
81754	168	68
81755	168	69
81756	168	70
81757	168	71
81758	168	72
81759	168	73
81760	168	74
81761	168	75
81762	168	76
81763	168	77
81764	169	1
81765	169	2
81766	169	3
81767	169	4
81768	169	5
81769	169	6
81770	169	7
81771	169	8
81772	169	9
81773	169	10
81774	169	11
81775	169	12
81776	169	13
81777	169	14
81778	169	15
81779	169	16
81780	169	17
81781	169	18
81782	169	19
81783	169	20
81784	169	21
81785	169	22
81786	169	23
81787	169	24
81788	169	25
81789	169	26
81790	169	27
81791	169	28
81792	169	29
81793	169	30
81794	169	31
81795	169	32
81796	169	33
81797	169	34
81798	169	35
81799	169	36
81800	169	37
81801	169	38
81802	169	39
81803	169	40
81804	169	41
81805	169	42
81806	169	43
81807	169	44
81808	169	45
81809	169	46
81810	169	47
81811	169	48
81812	169	49
81813	169	50
81814	169	51
81815	169	52
81816	169	53
81817	169	54
81818	169	55
81819	169	56
81820	169	57
81821	169	58
81822	169	59
81823	169	60
81824	169	61
81825	169	62
81826	169	63
81827	169	64
81828	169	65
81829	169	66
81830	169	68
81831	169	69
81832	169	70
81833	169	71
81834	169	72
81835	169	73
81836	169	74
81837	169	75
81838	169	76
81839	169	77
81840	170	1
81841	170	2
81842	170	3
81843	170	4
81844	170	5
81845	170	6
81846	170	7
81847	170	8
81848	170	9
81849	170	10
81850	170	11
81851	170	12
81852	170	13
81853	170	14
81854	170	15
81855	170	16
81856	170	17
81857	170	18
81858	170	19
81859	170	20
81860	170	21
81861	170	22
81862	170	23
81863	170	24
81864	170	25
81865	170	26
81866	170	27
81867	170	28
81868	170	29
81869	170	30
81870	170	31
81871	170	32
81872	170	33
81873	170	34
81874	170	35
81875	170	36
81876	170	37
81877	170	38
81878	170	39
81879	170	40
81880	170	41
81881	170	42
81882	170	43
81883	170	44
81884	170	45
81885	170	46
81886	170	47
81887	170	48
81888	170	49
81889	170	50
81890	170	51
81891	170	52
81892	170	53
81893	170	54
81894	170	55
81895	170	56
81896	170	57
81897	170	58
81898	170	59
81899	170	60
81900	170	61
81901	170	62
81902	170	63
81903	170	64
81904	170	65
81905	170	66
81906	170	68
81907	170	69
81908	170	70
81909	170	71
81910	170	72
81911	170	73
81912	170	74
81913	170	75
81914	170	76
81915	170	77
81916	171	1
81917	171	2
81918	171	3
81919	171	4
81920	171	5
81921	171	6
81922	171	7
81923	171	8
81924	171	9
81925	171	10
81926	171	11
81927	171	12
81928	171	13
81929	171	14
81930	171	15
81931	171	16
81932	171	17
81933	171	18
81934	171	19
81935	171	20
81936	171	21
81937	171	22
81938	171	23
81939	171	24
81940	171	25
81941	171	26
81942	171	27
81943	171	28
81944	171	29
81945	171	30
81946	171	31
81947	171	32
81948	171	33
81949	171	34
81950	171	35
81951	171	36
81952	171	37
81953	171	38
81954	171	39
81955	171	40
81956	171	41
81957	171	42
81958	171	43
81959	171	44
81960	171	45
81961	171	46
81962	171	47
81963	171	48
81964	171	49
81965	171	50
81966	171	51
81967	171	52
81968	171	53
81969	171	54
81970	171	55
81971	171	56
81972	171	57
81973	171	58
81974	171	59
81975	171	60
81976	171	61
81977	171	62
81978	171	63
81979	171	64
81980	171	65
81981	171	66
81982	171	68
81983	171	69
81984	171	70
81985	171	71
81986	171	72
81987	171	73
81988	171	74
81989	171	75
81990	171	76
81991	171	77
81992	172	1
81993	172	2
81994	172	3
81995	172	4
81996	172	5
81997	172	6
81998	172	7
81999	172	8
82000	172	9
82001	172	10
82002	172	11
82003	172	12
82004	172	13
82005	172	14
82006	172	15
82007	172	16
82008	172	17
82009	172	18
82010	172	19
82011	172	20
82012	172	21
82013	172	22
82014	172	23
82015	172	24
82016	172	25
82017	172	26
82018	172	27
82019	172	28
82020	172	29
82021	172	30
82022	172	31
82023	172	32
82024	172	33
82025	172	34
82026	172	35
82027	172	36
82028	172	37
82029	172	38
82030	172	39
82031	172	40
82032	172	41
82033	172	42
82034	172	43
82035	172	44
82036	172	45
82037	172	46
82038	172	47
82039	172	48
82040	172	49
82041	172	50
82042	172	51
82043	172	52
82044	172	53
82045	172	54
82046	172	55
82047	172	56
82048	172	57
82049	172	58
82050	172	59
82051	172	60
82052	172	61
82053	172	62
82054	172	63
82055	172	64
82056	172	65
82057	172	66
82058	172	68
82059	172	69
82060	172	70
82061	172	71
82062	172	72
82063	172	73
82064	172	74
82065	172	75
82066	172	76
82067	172	77
82068	173	1
82069	173	2
82070	173	3
82071	173	4
82072	173	5
82073	173	6
82074	173	7
82075	173	8
82076	173	9
82077	173	10
82078	173	11
82079	173	12
82080	173	13
82081	173	14
82082	173	15
82083	173	16
82084	173	17
82085	173	18
82086	173	19
82087	173	20
82088	173	21
82089	173	22
82090	173	23
82091	173	24
82092	173	25
82093	173	26
82094	173	27
82095	173	28
82096	173	29
82097	173	30
82098	173	31
82099	173	32
82100	173	33
82101	173	34
82102	173	35
82103	173	36
82104	173	37
82105	173	38
82106	173	39
82107	173	40
82108	173	41
82109	173	42
82110	173	43
82111	173	44
82112	173	45
82113	173	46
82114	173	47
82115	173	48
82116	173	49
82117	173	50
82118	173	51
82119	173	52
82120	173	53
82121	173	54
82122	173	55
82123	173	56
82124	173	57
82125	173	58
82126	173	59
82127	173	60
82128	173	61
82129	173	62
82130	173	63
82131	173	64
82132	173	65
82133	173	66
82134	173	68
82135	173	69
82136	173	70
82137	173	71
82138	173	72
82139	173	73
82140	173	74
82141	173	75
82142	173	76
82143	173	77
82144	174	1
82145	174	2
82146	174	3
82147	174	4
82148	174	5
82149	174	6
82150	174	7
82151	174	8
82152	174	9
82153	174	10
82154	174	11
82155	174	12
82156	174	13
82157	174	14
82158	174	15
82159	174	16
82160	174	17
82161	174	18
82162	174	19
82163	174	20
82164	174	21
82165	174	22
82166	174	23
82167	174	24
82168	174	25
82169	174	26
82170	174	27
82171	174	28
82172	174	29
82173	174	30
82174	174	31
82175	174	32
82176	174	33
82177	174	34
82178	174	35
82179	174	36
82180	174	37
82181	174	38
82182	174	39
82183	174	40
82184	174	41
82185	174	42
82186	174	43
82187	174	44
82188	174	45
82189	174	46
82190	174	47
82191	174	48
82192	174	49
82193	174	50
82194	174	51
82195	174	52
82196	174	53
82197	174	54
82198	174	55
82199	174	56
82200	174	57
82201	174	58
82202	174	59
82203	174	60
82204	174	61
82205	174	62
82206	174	63
82207	174	64
82208	174	65
82209	174	66
82210	174	68
82211	174	69
82212	174	70
82213	174	71
82214	174	72
82215	174	73
82216	174	74
82217	174	75
82218	174	76
82219	174	77
82220	175	1
82221	175	2
82222	175	3
82223	175	4
82224	175	5
82225	175	6
82226	175	7
82227	175	8
82228	175	9
82229	175	10
82230	175	11
82231	175	12
82232	175	13
82233	175	14
82234	175	15
82235	175	16
82236	175	17
82237	175	18
82238	175	19
82239	175	20
82240	175	21
82241	175	22
82242	175	23
82243	175	24
82244	175	25
82245	175	26
82246	175	27
82247	175	28
82248	175	29
82249	175	30
82250	175	31
82251	175	32
82252	175	33
82253	175	34
82254	175	35
82255	175	36
82256	175	37
82257	175	38
82258	175	39
82259	175	40
82260	175	41
82261	175	42
82262	175	43
82263	175	44
82264	175	45
82265	175	46
82266	175	47
82267	175	48
82268	175	49
82269	175	50
82270	175	51
82271	175	52
82272	175	53
82273	175	54
82274	175	55
82275	175	56
82276	175	57
82277	175	58
82278	175	59
82279	175	60
82280	175	61
82281	175	62
82282	175	63
82283	175	64
82284	175	65
82285	175	66
82286	175	68
82287	175	69
82288	175	70
82289	175	71
82290	175	72
82291	175	73
82292	175	74
82293	175	75
82294	175	76
82295	175	77
82296	176	1
82297	176	2
82298	176	3
82299	176	4
82300	176	5
82301	176	6
82302	176	7
82303	176	8
82304	176	9
82305	176	10
82306	176	11
82307	176	12
82308	176	13
82309	176	14
82310	176	15
82311	176	16
82312	176	17
82313	176	18
82314	176	19
82315	176	20
82316	176	21
82317	176	22
82318	176	23
82319	176	24
82320	176	25
82321	176	26
82322	176	27
82323	176	28
82324	176	29
82325	176	30
82326	176	31
82327	176	32
82328	176	33
82329	176	34
82330	176	35
82331	176	36
82332	176	37
82333	176	38
82334	176	39
82335	176	40
82336	176	41
82337	176	42
82338	176	43
82339	176	44
82340	176	45
82341	176	46
82342	176	47
82343	176	48
82344	176	49
82345	176	50
82346	176	51
82347	176	52
82348	176	53
82349	176	54
82350	176	55
82351	176	56
82352	176	57
82353	176	58
82354	176	59
82355	176	60
82356	176	61
82357	176	62
82358	176	63
82359	176	64
82360	176	65
82361	176	66
82362	176	68
82363	176	69
82364	176	70
82365	176	71
82366	176	72
82367	176	73
82368	176	74
82369	176	75
82370	176	76
82371	176	77
82372	177	1
82373	177	2
82374	177	3
82375	177	4
82376	177	5
82377	177	6
82378	177	7
82379	177	8
82380	177	9
82381	177	10
82382	177	11
82383	177	12
82384	177	13
82385	177	14
82386	177	15
82387	177	16
82388	177	17
82389	177	18
82390	177	19
82391	177	20
82392	177	21
82393	177	22
82394	177	23
82395	177	24
82396	177	25
82397	177	26
82398	177	27
82399	177	28
82400	177	29
82401	177	30
82402	177	31
82403	177	32
82404	177	33
82405	177	34
82406	177	35
82407	177	36
82408	177	37
82409	177	38
82410	177	39
82411	177	40
82412	177	41
82413	177	42
82414	177	43
82415	177	44
82416	177	45
82417	177	46
82418	177	47
82419	177	48
82420	177	49
82421	177	50
82422	177	51
82423	177	52
82424	177	53
82425	177	54
82426	177	55
82427	177	56
82428	177	57
82429	177	58
82430	177	59
82431	177	60
82432	177	61
82433	177	62
82434	177	63
82435	177	64
82436	177	65
82437	177	66
82438	177	68
82439	177	69
82440	177	70
82441	177	71
82442	177	72
82443	177	73
82444	177	74
82445	177	75
82446	177	76
82447	177	77
82448	178	1
82449	178	2
82450	178	3
82451	178	4
82452	178	5
82453	178	6
82454	178	7
82455	178	8
82456	178	9
82457	178	10
82458	178	11
82459	178	12
82460	178	13
82461	178	14
82462	178	15
82463	178	16
82464	178	17
82465	178	18
82466	178	19
82467	178	20
82468	178	21
82469	178	22
82470	178	23
82471	178	24
82472	178	25
82473	178	26
82474	178	27
82475	178	28
82476	178	29
82477	178	30
82478	178	31
82479	178	32
82480	178	33
82481	178	34
82482	178	35
82483	178	36
82484	178	37
82485	178	38
82486	178	39
82487	178	40
82488	178	41
82489	178	42
82490	178	43
82491	178	44
82492	178	45
82493	178	46
82494	178	47
82495	178	48
82496	178	49
82497	178	50
82498	178	51
82499	178	52
82500	178	53
82501	178	54
82502	178	55
82503	178	56
82504	178	57
82505	178	58
82506	178	59
82507	178	60
82508	178	61
82509	178	62
82510	178	63
82511	178	64
82512	178	65
82513	178	66
82514	178	68
82515	178	69
82516	178	70
82517	178	71
82518	178	72
82519	178	73
82520	178	74
82521	178	75
82522	178	76
82523	178	77
82524	179	1
82525	179	2
82526	179	3
82527	179	4
82528	179	5
82529	179	6
82530	179	7
82531	179	8
82532	179	9
82533	179	10
82534	179	11
82535	179	12
82536	179	13
82537	179	14
82538	179	15
82539	179	16
82540	179	17
82541	179	18
82542	179	19
82543	179	20
82544	179	21
82545	179	22
82546	179	23
82547	179	24
82548	179	25
82549	179	26
82550	179	27
82551	179	28
82552	179	29
82553	179	30
82554	179	31
82555	179	32
82556	179	33
82557	179	34
82558	179	35
82559	179	36
82560	179	37
82561	179	38
82562	179	39
82563	179	40
82564	179	41
82565	179	42
82566	179	43
82567	179	44
82568	179	45
82569	179	46
82570	179	47
82571	179	48
82572	179	49
82573	179	50
82574	179	51
82575	179	52
82576	179	53
82577	179	54
82578	179	55
82579	179	56
82580	179	57
82581	179	58
82582	179	59
82583	179	60
82584	179	61
82585	179	62
82586	179	63
82587	179	64
82588	179	65
82589	179	66
82590	179	68
82591	179	69
82592	179	70
82593	179	71
82594	179	72
82595	179	73
82596	179	74
82597	179	75
82598	179	76
82599	179	77
82600	180	1
82601	180	2
82602	180	3
82603	180	4
82604	180	5
82605	180	6
82606	180	7
82607	180	8
82608	180	9
82609	180	10
82610	180	11
82611	180	12
82612	180	13
82613	180	14
82614	180	15
82615	180	16
82616	180	17
82617	180	18
82618	180	19
82619	180	20
82620	180	21
82621	180	22
82622	180	23
82623	180	24
82624	180	25
82625	180	26
82626	180	27
82627	180	28
82628	180	29
82629	180	30
82630	180	31
82631	180	32
82632	180	33
82633	180	34
82634	180	35
82635	180	36
82636	180	37
82637	180	38
82638	180	39
82639	180	40
82640	180	41
82641	180	42
82642	180	43
82643	180	44
82644	180	45
82645	180	46
82646	180	47
82647	180	48
82648	180	49
82649	180	50
82650	180	51
82651	180	52
82652	180	53
82653	180	54
82654	180	55
82655	180	56
82656	180	57
82657	180	58
82658	180	59
82659	180	60
82660	180	61
82661	180	62
82662	180	63
82663	180	64
82664	180	65
82665	180	66
82666	180	68
82667	180	69
82668	180	70
82669	180	71
82670	180	72
82671	180	73
82672	180	74
82673	180	75
82674	180	76
82675	180	77
82676	181	1
82677	181	2
82678	181	3
82679	181	4
82680	181	5
82681	181	6
82682	181	7
82683	181	8
82684	181	9
82685	181	10
82686	181	11
82687	181	12
82688	181	13
82689	181	14
82690	181	15
82691	181	16
82692	181	17
82693	181	18
82694	181	19
82695	181	20
82696	181	21
82697	181	22
82698	181	23
82699	181	24
82700	181	25
82701	181	26
82702	181	27
82703	181	28
82704	181	29
82705	181	30
82706	181	31
82707	181	32
82708	181	33
82709	181	34
82710	181	35
82711	181	36
82712	181	37
82713	181	38
82714	181	39
82715	181	40
82716	181	41
82717	181	42
82718	181	43
82719	181	44
82720	181	45
82721	181	46
82722	181	47
82723	181	48
82724	181	49
82725	181	50
82726	181	51
82727	181	52
82728	181	53
82729	181	54
82730	181	55
82731	181	56
82732	181	57
82733	181	58
82734	181	59
82735	181	60
82736	181	61
82737	181	62
82738	181	63
82739	181	64
82740	181	65
82741	181	66
82742	181	68
82743	181	69
82744	181	70
82745	181	71
82746	181	72
82747	181	73
82748	181	74
82749	181	75
82750	181	76
82751	181	77
82752	182	1
82753	182	2
82754	182	3
82755	182	4
82756	182	5
82757	182	6
82758	182	7
82759	182	8
82760	182	9
82761	182	10
82762	182	11
82763	182	12
82764	182	13
82765	182	14
82766	182	15
82767	182	16
82768	182	17
82769	182	18
82770	182	19
82771	182	20
82772	182	21
82773	182	22
82774	182	23
82775	182	24
82776	182	25
82777	182	26
82778	182	27
82779	182	28
82780	182	29
82781	182	30
82782	182	31
82783	182	32
82784	182	33
82785	182	34
82786	182	35
82787	182	36
82788	182	37
82789	182	38
82790	182	39
82791	182	40
82792	182	41
82793	182	42
82794	182	43
82795	182	44
82796	182	45
82797	182	46
82798	182	47
82799	182	48
82800	182	49
82801	182	50
82802	182	51
82803	182	52
82804	182	53
82805	182	54
82806	182	55
82807	182	56
82808	182	57
82809	182	58
82810	182	59
82811	182	60
82812	182	61
82813	182	62
82814	182	63
82815	182	64
82816	182	65
82817	182	66
82818	182	68
82819	182	69
82820	182	70
82821	182	71
82822	182	72
82823	182	73
82824	182	74
82825	182	75
82826	182	76
82827	182	77
82828	183	1
82829	183	2
82830	183	3
82831	183	4
82832	183	5
82833	183	6
82834	183	7
82835	183	8
82836	183	9
82837	183	10
82838	183	11
82839	183	12
82840	183	13
82841	183	14
82842	183	15
82843	183	16
82844	183	17
82845	183	18
82846	183	19
82847	183	20
82848	183	21
82849	183	22
82850	183	23
82851	183	24
82852	183	25
82853	183	26
82854	183	27
82855	183	28
82856	183	29
82857	183	30
82858	183	31
82859	183	32
82860	183	33
82861	183	34
82862	183	35
82863	183	36
82864	183	37
82865	183	38
82866	183	39
82867	183	40
82868	183	41
82869	183	42
82870	183	43
82871	183	44
82872	183	45
82873	183	46
82874	183	47
82875	183	48
82876	183	49
82877	183	50
82878	183	51
82879	183	52
82880	183	53
82881	183	54
82882	183	55
82883	183	56
82884	183	57
82885	183	58
82886	183	59
82887	183	60
82888	183	61
82889	183	62
82890	183	63
82891	183	64
82892	183	65
82893	183	66
82894	183	68
82895	183	69
82896	183	70
82897	183	71
82898	183	72
82899	183	73
82900	183	74
82901	183	75
82902	183	76
82903	183	77
82904	184	1
82905	184	2
82906	184	3
82907	184	4
82908	184	5
82909	184	6
82910	184	7
82911	184	8
82912	184	9
82913	184	10
82914	184	11
82915	184	12
82916	184	13
82917	184	14
82918	184	15
82919	184	16
82920	184	17
82921	184	18
82922	184	19
82923	184	20
82924	184	21
82925	184	22
82926	184	23
82927	184	24
82928	184	25
82929	184	26
82930	184	27
82931	184	28
82932	184	29
82933	184	30
82934	184	31
82935	184	32
82936	184	33
82937	184	34
82938	184	35
82939	184	36
82940	184	37
82941	184	38
82942	184	39
82943	184	40
82944	184	41
82945	184	42
82946	184	43
82947	184	44
82948	184	45
82949	184	46
82950	184	47
82951	184	48
82952	184	49
82953	184	50
82954	184	51
82955	184	52
82956	184	53
82957	184	54
82958	184	55
82959	184	56
82960	184	57
82961	184	58
82962	184	59
82963	184	60
82964	184	61
82965	184	62
82966	184	63
82967	184	64
82968	184	65
82969	184	66
82970	184	68
82971	184	69
82972	184	70
82973	184	71
82974	184	72
82975	184	73
82976	184	74
82977	184	75
82978	184	76
82979	184	77
82980	185	1
82981	185	2
82982	185	3
82983	185	4
82984	185	5
82985	185	6
82986	185	7
82987	185	8
82988	185	9
82989	185	10
82990	185	11
82991	185	12
82992	185	13
82993	185	14
82994	185	15
82995	185	16
82996	185	17
82997	185	18
82998	185	19
82999	185	20
83000	185	21
83001	185	22
83002	185	23
83003	185	24
83004	185	25
83005	185	26
83006	185	27
83007	185	28
83008	185	29
83009	185	30
83010	185	31
83011	185	32
83012	185	33
83013	185	34
83014	185	35
83015	185	36
83016	185	37
83017	185	38
83018	185	39
83019	185	40
83020	185	41
83021	185	42
83022	185	43
83023	185	44
83024	185	45
83025	185	46
83026	185	47
83027	185	48
83028	185	49
83029	185	50
83030	185	51
83031	185	52
83032	185	53
83033	185	54
83034	185	55
83035	185	56
83036	185	57
83037	185	58
83038	185	59
83039	185	60
83040	185	61
83041	185	62
83042	185	63
83043	185	64
83044	185	65
83045	185	66
83046	185	68
83047	185	69
83048	185	70
83049	185	71
83050	185	72
83051	185	73
83052	185	74
83053	185	75
83054	185	76
83055	185	77
83056	186	1
83057	186	2
83058	186	3
83059	186	4
83060	186	5
83061	186	6
83062	186	7
83063	186	8
83064	186	9
83065	186	10
83066	186	11
83067	186	12
83068	186	13
83069	186	14
83070	186	15
83071	186	16
83072	186	17
83073	186	18
83074	186	19
83075	186	20
83076	186	21
83077	186	22
83078	186	23
83079	186	24
83080	186	25
83081	186	26
83082	186	27
83083	186	28
83084	186	29
83085	186	30
83086	186	31
83087	186	32
83088	186	33
83089	186	34
83090	186	35
83091	186	36
83092	186	37
83093	186	38
83094	186	39
83095	186	40
83096	186	41
83097	186	42
83098	186	43
83099	186	44
83100	186	45
83101	186	46
83102	186	47
83103	186	48
83104	186	49
83105	186	50
83106	186	51
83107	186	52
83108	186	53
83109	186	54
83110	186	55
83111	186	56
83112	186	57
83113	186	58
83114	186	59
83115	186	60
83116	186	61
83117	186	62
83118	186	63
83119	186	64
83120	186	65
83121	186	66
83122	186	68
83123	186	69
83124	186	70
83125	186	71
83126	186	72
83127	186	73
83128	186	74
83129	186	75
83130	186	76
83131	186	77
83132	187	1
83133	187	2
83134	187	3
83135	187	4
83136	187	5
83137	187	6
83138	187	7
83139	187	8
83140	187	9
83141	187	10
83142	187	11
83143	187	12
83144	187	13
83145	187	14
83146	187	15
83147	187	16
83148	187	17
83149	187	18
83150	187	19
83151	187	20
83152	187	21
83153	187	22
83154	187	23
83155	187	24
83156	187	25
83157	187	26
83158	187	27
83159	187	28
83160	187	29
83161	187	30
83162	187	31
83163	187	32
83164	187	33
83165	187	34
83166	187	35
83167	187	36
83168	187	37
83169	187	38
83170	187	39
83171	187	40
83172	187	41
83173	187	42
83174	187	43
83175	187	44
83176	187	45
83177	187	46
83178	187	47
83179	187	48
83180	187	49
83181	187	50
83182	187	51
83183	187	52
83184	187	53
83185	187	54
83186	187	55
83187	187	56
83188	187	57
83189	187	58
83190	187	59
83191	187	60
83192	187	61
83193	187	62
83194	187	63
83195	187	64
83196	187	65
83197	187	66
83198	187	68
83199	187	69
83200	187	70
83201	187	71
83202	187	72
83203	187	73
83204	187	74
83205	187	75
83206	187	76
83207	187	77
83208	188	1
83209	188	2
83210	188	3
83211	188	4
83212	188	5
83213	188	6
83214	188	7
83215	188	8
83216	188	9
83217	188	10
83218	188	11
83219	188	12
83220	188	13
83221	188	14
83222	188	15
83223	188	16
83224	188	17
83225	188	18
83226	188	19
83227	188	20
83228	188	21
83229	188	22
83230	188	23
83231	188	24
83232	188	25
83233	188	26
83234	188	27
83235	188	28
83236	188	29
83237	188	30
83238	188	31
83239	188	32
83240	188	33
83241	188	34
83242	188	35
83243	188	36
83244	188	37
83245	188	38
83246	188	39
83247	188	40
83248	188	41
83249	188	42
83250	188	43
83251	188	44
83252	188	45
83253	188	46
83254	188	47
83255	188	48
83256	188	49
83257	188	50
83258	188	51
83259	188	52
83260	188	53
83261	188	54
83262	188	55
83263	188	56
83264	188	57
83265	188	58
83266	188	59
83267	188	60
83268	188	61
83269	188	62
83270	188	63
83271	188	64
83272	188	65
83273	188	66
83274	188	68
83275	188	69
83276	188	70
83277	188	71
83278	188	72
83279	188	73
83280	188	74
83281	188	75
83282	188	76
83283	188	77
83284	189	1
83285	189	2
83286	189	3
83287	189	4
83288	189	5
83289	189	6
83290	189	7
83291	189	8
83292	189	9
83293	189	10
83294	189	11
83295	189	12
83296	189	13
83297	189	14
83298	189	15
83299	189	16
83300	189	17
83301	189	18
83302	189	19
83303	189	20
83304	189	21
83305	189	22
83306	189	23
83307	189	24
83308	189	25
83309	189	26
83310	189	27
83311	189	28
83312	189	29
83313	189	30
83314	189	31
83315	189	32
83316	189	33
83317	189	34
83318	189	35
83319	189	36
83320	189	37
83321	189	38
83322	189	39
83323	189	40
83324	189	41
83325	189	42
83326	189	43
83327	189	44
83328	189	45
83329	189	46
83330	189	47
83331	189	48
83332	189	49
83333	189	50
83334	189	51
83335	189	52
83336	189	53
83337	189	54
83338	189	55
83339	189	56
83340	189	57
83341	189	58
83342	189	59
83343	189	60
83344	189	61
83345	189	62
83346	189	63
83347	189	64
83348	189	65
83349	189	66
83350	189	68
83351	189	69
83352	189	70
83353	189	71
83354	189	72
83355	189	73
83356	189	74
83357	189	75
83358	189	76
83359	189	77
83360	190	1
83361	190	2
83362	190	3
83363	190	4
83364	190	5
83365	190	6
83366	190	7
83367	190	8
83368	190	9
83369	190	10
83370	190	11
83371	190	12
83372	190	13
83373	190	14
83374	190	15
83375	190	16
83376	190	17
83377	190	18
83378	190	19
83379	190	20
83380	190	21
83381	190	22
83382	190	23
83383	190	24
83384	190	25
83385	190	26
83386	190	27
83387	190	28
83388	190	29
83389	190	30
83390	190	31
83391	190	32
83392	190	33
83393	190	34
83394	190	35
83395	190	36
83396	190	37
83397	190	38
83398	190	39
83399	190	40
83400	190	41
83401	190	42
83402	190	43
83403	190	44
83404	190	45
83405	190	46
83406	190	47
83407	190	48
83408	190	49
83409	190	50
83410	190	51
83411	190	52
83412	190	53
83413	190	54
83414	190	55
83415	190	56
83416	190	57
83417	190	58
83418	190	59
83419	190	60
83420	190	61
83421	190	62
83422	190	63
83423	190	64
83424	190	65
83425	190	66
83426	190	68
83427	190	69
83428	190	70
83429	190	71
83430	190	72
83431	190	73
83432	190	74
83433	190	75
83434	190	76
83435	190	77
83436	191	1
83437	191	2
83438	191	3
83439	191	4
83440	191	5
83441	191	6
83442	191	7
83443	191	8
83444	191	9
83445	191	10
83446	191	11
83447	191	12
83448	191	13
83449	191	14
83450	191	15
83451	191	16
83452	191	17
83453	191	18
83454	191	19
83455	191	20
83456	191	21
83457	191	22
83458	191	23
83459	191	24
83460	191	25
83461	191	26
83462	191	27
83463	191	28
83464	191	29
83465	191	30
83466	191	31
83467	191	32
83468	191	33
83469	191	34
83470	191	35
83471	191	36
83472	191	37
83473	191	38
83474	191	39
83475	191	40
83476	191	41
83477	191	42
83478	191	43
83479	191	44
83480	191	45
83481	191	46
83482	191	47
83483	191	48
83484	191	49
83485	191	50
83486	191	51
83487	191	52
83488	191	53
83489	191	54
83490	191	55
83491	191	56
83492	191	57
83493	191	58
83494	191	59
83495	191	60
83496	191	61
83497	191	62
83498	191	63
83499	191	64
83500	191	65
83501	191	66
83502	191	68
83503	191	69
83504	191	70
83505	191	71
83506	191	72
83507	191	73
83508	191	74
83509	191	75
83510	191	76
83511	191	77
83512	192	1
83513	192	2
83514	192	3
83515	192	4
83516	192	5
83517	192	6
83518	192	7
83519	192	8
83520	192	9
83521	192	10
83522	192	11
83523	192	12
83524	192	13
83525	192	14
83526	192	15
83527	192	16
83528	192	17
83529	192	18
83530	192	19
83531	192	20
83532	192	21
83533	192	22
83534	192	23
83535	192	24
83536	192	25
83537	192	26
83538	192	27
83539	192	28
83540	192	29
83541	192	30
83542	192	31
83543	192	32
83544	192	33
83545	192	34
83546	192	35
83547	192	36
83548	192	37
83549	192	38
83550	192	39
83551	192	40
83552	192	41
83553	192	42
83554	192	43
83555	192	44
83556	192	45
83557	192	46
83558	192	47
83559	192	48
83560	192	49
83561	192	50
83562	192	51
83563	192	52
83564	192	53
83565	192	54
83566	192	55
83567	192	56
83568	192	57
83569	192	58
83570	192	59
83571	192	60
83572	192	61
83573	192	62
83574	192	63
83575	192	64
83576	192	65
83577	192	66
83578	192	68
83579	192	69
83580	192	70
83581	192	71
83582	192	72
83583	192	73
83584	192	74
83585	192	75
83586	192	76
83587	192	77
83588	193	1
83589	193	2
83590	193	3
83591	193	4
83592	193	5
83593	193	6
83594	193	7
83595	193	8
83596	193	9
83597	193	10
83598	193	11
83599	193	12
83600	193	13
83601	193	14
83602	193	15
83603	193	16
83604	193	17
83605	193	18
83606	193	19
83607	193	20
83608	193	21
83609	193	22
83610	193	23
83611	193	24
83612	193	25
83613	193	26
83614	193	27
83615	193	28
83616	193	29
83617	193	30
83618	193	31
83619	193	32
83620	193	33
83621	193	34
83622	193	35
83623	193	36
83624	193	37
83625	193	38
83626	193	39
83627	193	40
83628	193	41
83629	193	42
83630	193	43
83631	193	44
83632	193	45
83633	193	46
83634	193	47
83635	193	48
83636	193	49
83637	193	50
83638	193	51
83639	193	52
83640	193	53
83641	193	54
83642	193	55
83643	193	56
83644	193	57
83645	193	58
83646	193	59
83647	193	60
83648	193	61
83649	193	62
83650	193	63
83651	193	64
83652	193	65
83653	193	66
83654	193	68
83655	193	69
83656	193	70
83657	193	71
83658	193	72
83659	193	73
83660	193	74
83661	193	75
83662	193	76
83663	193	77
83664	194	1
83665	194	2
83666	194	3
83667	194	4
83668	194	5
83669	194	6
83670	194	7
83671	194	8
83672	194	9
83673	194	10
83674	194	11
83675	194	12
83676	194	13
83677	194	14
83678	194	15
83679	194	16
83680	194	17
83681	194	18
83682	194	19
83683	194	20
83684	194	21
83685	194	22
83686	194	23
83687	194	24
83688	194	25
83689	194	26
83690	194	27
83691	194	28
83692	194	29
83693	194	30
83694	194	31
83695	194	32
83696	194	33
83697	194	34
83698	194	35
83699	194	36
83700	194	37
83701	194	38
83702	194	39
83703	194	40
83704	194	41
83705	194	42
83706	194	43
83707	194	44
83708	194	45
83709	194	46
83710	194	47
83711	194	48
83712	194	49
83713	194	50
83714	194	51
83715	194	52
83716	194	53
83717	194	54
83718	194	55
83719	194	56
83720	194	57
83721	194	58
83722	194	59
83723	194	60
83724	194	61
83725	194	62
83726	194	63
83727	194	64
83728	194	65
83729	194	66
83730	194	68
83731	194	69
83732	194	70
83733	194	71
83734	194	72
83735	194	73
83736	194	74
83737	194	75
83738	194	76
83739	194	77
83740	195	1
83741	195	2
83742	195	3
83743	195	4
83744	195	5
83745	195	6
83746	195	7
83747	195	8
83748	195	9
83749	195	10
83750	195	11
83751	195	12
83752	195	13
83753	195	14
83754	195	15
83755	195	16
83756	195	17
83757	195	18
83758	195	19
83759	195	20
83760	195	21
83761	195	22
83762	195	23
83763	195	24
83764	195	25
83765	195	26
83766	195	27
83767	195	28
83768	195	29
83769	195	30
83770	195	31
83771	195	32
83772	195	33
83773	195	34
83774	195	35
83775	195	36
83776	195	37
83777	195	38
83778	195	39
83779	195	40
83780	195	41
83781	195	42
83782	195	43
83783	195	44
83784	195	45
83785	195	46
83786	195	47
83787	195	48
83788	195	49
83789	195	50
83790	195	51
83791	195	52
83792	195	53
83793	195	54
83794	195	55
83795	195	56
83796	195	57
83797	195	58
83798	195	59
83799	195	60
83800	195	61
83801	195	62
83802	195	63
83803	195	64
83804	195	65
83805	195	66
83806	195	68
83807	195	69
83808	195	70
83809	195	71
83810	195	72
83811	195	73
83812	195	74
83813	195	75
83814	195	76
83815	195	77
83816	196	1
83817	196	2
83818	196	3
83819	196	4
83820	196	5
83821	196	6
83822	196	7
83823	196	8
83824	196	9
83825	196	10
83826	196	11
83827	196	12
83828	196	13
83829	196	14
83830	196	15
83831	196	16
83832	196	17
83833	196	18
83834	196	19
83835	196	20
83836	196	21
83837	196	22
83838	196	23
83839	196	24
83840	196	25
83841	196	26
83842	196	27
83843	196	28
83844	196	29
83845	196	30
83846	196	31
83847	196	32
83848	196	33
83849	196	34
83850	196	35
83851	196	36
83852	196	37
83853	196	38
83854	196	39
83855	196	40
83856	196	41
83857	196	42
83858	196	43
83859	196	44
83860	196	45
83861	196	46
83862	196	47
83863	196	48
83864	196	49
83865	196	50
83866	196	51
83867	196	52
83868	196	53
83869	196	54
83870	196	55
83871	196	56
83872	196	57
83873	196	58
83874	196	59
83875	196	60
83876	196	61
83877	196	62
83878	196	63
83879	196	64
83880	196	65
83881	196	66
83882	196	68
83883	196	69
83884	196	70
83885	196	71
83886	196	72
83887	196	73
83888	196	74
83889	196	75
83890	196	76
83891	196	77
83892	197	1
83893	197	2
83894	197	3
83895	197	4
83896	197	5
83897	197	6
83898	197	7
83899	197	8
83900	197	9
83901	197	10
83902	197	11
83903	197	12
83904	197	13
83905	197	14
83906	197	15
83907	197	16
83908	197	17
83909	197	18
83910	197	19
83911	197	20
83912	197	21
83913	197	22
83914	197	23
83915	197	24
83916	197	25
83917	197	26
83918	197	27
83919	197	28
83920	197	29
83921	197	30
83922	197	31
83923	197	32
83924	197	33
83925	197	34
83926	197	35
83927	197	36
83928	197	37
83929	197	38
83930	197	39
83931	197	40
83932	197	41
83933	197	42
83934	197	43
83935	197	44
83936	197	45
83937	197	46
83938	197	47
83939	197	48
83940	197	49
83941	197	50
83942	197	51
83943	197	52
83944	197	53
83945	197	54
83946	197	55
83947	197	56
83948	197	57
83949	197	58
83950	197	59
83951	197	60
83952	197	61
83953	197	62
83954	197	63
83955	197	64
83956	197	65
83957	197	66
83958	197	68
83959	197	69
83960	197	70
83961	197	71
83962	197	72
83963	197	73
83964	197	74
83965	197	75
83966	197	76
83967	197	77
83968	198	1
83969	198	2
83970	198	3
83971	198	4
83972	198	5
83973	198	6
83974	198	7
83975	198	8
83976	198	9
83977	198	10
83978	198	11
83979	198	12
83980	198	13
83981	198	14
83982	198	15
83983	198	16
83984	198	17
83985	198	18
83986	198	19
83987	198	20
83988	198	21
83989	198	22
83990	198	23
83991	198	24
83992	198	25
83993	198	26
83994	198	27
83995	198	28
83996	198	29
83997	198	30
83998	198	31
83999	198	32
84000	198	33
84001	198	34
84002	198	35
84003	198	36
84004	198	37
84005	198	38
84006	198	39
84007	198	40
84008	198	41
84009	198	42
84010	198	43
84011	198	44
84012	198	45
84013	198	46
84014	198	47
84015	198	48
84016	198	49
84017	198	50
84018	198	51
84019	198	52
84020	198	53
84021	198	54
84022	198	55
84023	198	56
84024	198	57
84025	198	58
84026	198	59
84027	198	60
84028	198	61
84029	198	62
84030	198	63
84031	198	64
84032	198	65
84033	198	66
84034	198	68
84035	198	69
84036	198	70
84037	198	71
84038	198	72
84039	198	73
84040	198	74
84041	198	75
84042	198	76
84043	198	77
84044	199	1
84045	199	2
84046	199	3
84047	199	4
84048	199	5
84049	199	6
84050	199	7
84051	199	8
84052	199	9
84053	199	10
84054	199	11
84055	199	12
84056	199	13
84057	199	14
84058	199	15
84059	199	16
84060	199	17
84061	199	18
84062	199	19
84063	199	20
84064	199	21
84065	199	22
84066	199	23
84067	199	24
84068	199	25
84069	199	26
84070	199	27
84071	199	28
84072	199	29
84073	199	30
84074	199	31
84075	199	32
84076	199	33
84077	199	34
84078	199	35
84079	199	36
84080	199	37
84081	199	38
84082	199	39
84083	199	40
84084	199	41
84085	199	42
84086	199	43
84087	199	44
84088	199	45
84089	199	46
84090	199	47
84091	199	48
84092	199	49
84093	199	50
84094	199	51
84095	199	52
84096	199	53
84097	199	54
84098	199	55
84099	199	56
84100	199	57
84101	199	58
84102	199	59
84103	199	60
84104	199	61
84105	199	62
84106	199	63
84107	199	64
84108	199	65
84109	199	66
84110	199	68
84111	199	69
84112	199	70
84113	199	71
84114	199	72
84115	199	73
84116	199	74
84117	199	75
84118	199	76
84119	199	77
84120	200	1
84121	200	2
84122	200	3
84123	200	4
84124	200	5
84125	200	6
84126	200	7
84127	200	8
84128	200	9
84129	200	10
84130	200	11
84131	200	12
84132	200	13
84133	200	14
84134	200	15
84135	200	16
84136	200	17
84137	200	18
84138	200	19
84139	200	20
84140	200	21
84141	200	22
84142	200	23
84143	200	24
84144	200	25
84145	200	26
84146	200	27
84147	200	28
84148	200	29
84149	200	30
84150	200	31
84151	200	32
84152	200	33
84153	200	34
84154	200	35
84155	200	36
84156	200	37
84157	200	38
84158	200	39
84159	200	40
84160	200	41
84161	200	42
84162	200	43
84163	200	44
84164	200	45
84165	200	46
84166	200	47
84167	200	48
84168	200	49
84169	200	50
84170	200	51
84171	200	52
84172	200	53
84173	200	54
84174	200	55
84175	200	56
84176	200	57
84177	200	58
84178	200	59
84179	200	60
84180	200	61
84181	200	62
84182	200	63
84183	200	64
84184	200	65
84185	200	66
84186	200	68
84187	200	69
84188	200	70
84189	200	71
84190	200	72
84191	200	73
84192	200	74
84193	200	75
84194	200	76
84195	200	77
84196	201	1
84197	201	2
84198	201	3
84199	201	4
84200	201	5
84201	201	6
84202	201	7
84203	201	8
84204	201	9
84205	201	10
84206	201	11
84207	201	12
84208	201	13
84209	201	14
84210	201	15
84211	201	16
84212	201	17
84213	201	18
84214	201	19
84215	201	20
84216	201	21
84217	201	22
84218	201	23
84219	201	24
84220	201	25
84221	201	26
84222	201	27
84223	201	28
84224	201	29
84225	201	30
84226	201	31
84227	201	32
84228	201	33
84229	201	34
84230	201	35
84231	201	36
84232	201	37
84233	201	38
84234	201	39
84235	201	40
84236	201	41
84237	201	42
84238	201	43
84239	201	44
84240	201	45
84241	201	46
84242	201	47
84243	201	48
84244	201	49
84245	201	50
84246	201	51
84247	201	52
84248	201	53
84249	201	54
84250	201	55
84251	201	56
84252	201	57
84253	201	58
84254	201	59
84255	201	60
84256	201	61
84257	201	62
84258	201	63
84259	201	64
84260	201	65
84261	201	66
84262	201	68
84263	201	69
84264	201	70
84265	201	71
84266	201	72
84267	201	73
84268	201	74
84269	201	75
84270	201	76
84271	201	77
84272	202	1
84273	202	2
84274	202	3
84275	202	4
84276	202	5
84277	202	6
84278	202	7
84279	202	8
84280	202	9
84281	202	10
84282	202	11
84283	202	12
84284	202	13
84285	202	14
84286	202	15
84287	202	16
84288	202	17
84289	202	18
84290	202	19
84291	202	20
84292	202	21
84293	202	22
84294	202	23
84295	202	24
84296	202	25
84297	202	26
84298	202	27
84299	202	28
84300	202	29
84301	202	30
84302	202	31
84303	202	32
84304	202	33
84305	202	34
84306	202	35
84307	202	36
84308	202	37
84309	202	38
84310	202	39
84311	202	40
84312	202	41
84313	202	42
84314	202	43
84315	202	44
84316	202	45
84317	202	46
84318	202	47
84319	202	48
84320	202	49
84321	202	50
84322	202	51
84323	202	52
84324	202	53
84325	202	54
84326	202	55
84327	202	56
84328	202	57
84329	202	58
84330	202	59
84331	202	60
84332	202	61
84333	202	62
84334	202	63
84335	202	64
84336	202	65
84337	202	66
84338	202	68
84339	202	69
84340	202	70
84341	202	71
84342	202	72
84343	202	73
84344	202	74
84345	202	75
84346	202	76
84347	202	77
84348	203	1
84349	203	2
84350	203	3
84351	203	4
84352	203	5
84353	203	6
84354	203	7
84355	203	8
84356	203	9
84357	203	10
84358	203	11
84359	203	12
84360	203	13
84361	203	14
84362	203	15
84363	203	16
84364	203	17
84365	203	18
84366	203	19
84367	203	20
84368	203	21
84369	203	22
84370	203	23
84371	203	24
84372	203	25
84373	203	26
84374	203	27
84375	203	28
84376	203	29
84377	203	30
84378	203	31
84379	203	32
84380	203	33
84381	203	34
84382	203	35
84383	203	36
84384	203	37
84385	203	38
84386	203	39
84387	203	40
84388	203	41
84389	203	42
84390	203	43
84391	203	44
84392	203	45
84393	203	46
84394	203	47
84395	203	48
84396	203	49
84397	203	50
84398	203	51
84399	203	52
84400	203	53
84401	203	54
84402	203	55
84403	203	56
84404	203	57
84405	203	58
84406	203	59
84407	203	60
84408	203	61
84409	203	62
84410	203	63
84411	203	64
84412	203	65
84413	203	66
84414	203	68
84415	203	69
84416	203	70
84417	203	71
84418	203	72
84419	203	73
84420	203	74
84421	203	75
84422	203	76
84423	203	77
84424	204	1
84425	204	2
84426	204	3
84427	204	4
84428	204	5
84429	204	6
84430	204	7
84431	204	8
84432	204	9
84433	204	10
84434	204	11
84435	204	12
84436	204	13
84437	204	14
84438	204	15
84439	204	16
84440	204	17
84441	204	18
84442	204	19
84443	204	20
84444	204	21
84445	204	22
84446	204	23
84447	204	24
84448	204	25
84449	204	26
84450	204	27
84451	204	28
84452	204	29
84453	204	30
84454	204	31
84455	204	32
84456	204	33
84457	204	34
84458	204	35
84459	204	36
84460	204	37
84461	204	38
84462	204	39
84463	204	40
84464	204	41
84465	204	42
84466	204	43
84467	204	44
84468	204	45
84469	204	46
84470	204	47
84471	204	48
84472	204	49
84473	204	50
84474	204	51
84475	204	52
84476	204	53
84477	204	54
84478	204	55
84479	204	56
84480	204	57
84481	204	58
84482	204	59
84483	204	60
84484	204	61
84485	204	62
84486	204	63
84487	204	64
84488	204	65
84489	204	66
84490	204	68
84491	204	69
84492	204	70
84493	204	71
84494	204	72
84495	204	73
84496	204	74
84497	204	75
84498	204	76
84499	204	77
84500	205	1
84501	205	2
84502	205	3
84503	205	4
84504	205	5
84505	205	6
84506	205	7
84507	205	8
84508	205	9
84509	205	10
84510	205	11
84511	205	12
84512	205	13
84513	205	14
84514	205	15
84515	205	16
84516	205	17
84517	205	18
84518	205	19
84519	205	20
84520	205	21
84521	205	22
84522	205	23
84523	205	24
84524	205	25
84525	205	26
84526	205	27
84527	205	28
84528	205	29
84529	205	30
84530	205	31
84531	205	32
84532	205	33
84533	205	34
84534	205	35
84535	205	36
84536	205	37
84537	205	38
84538	205	39
84539	205	40
84540	205	41
84541	205	42
84542	205	43
84543	205	44
84544	205	45
84545	205	46
84546	205	47
84547	205	48
84548	205	49
84549	205	50
84550	205	51
84551	205	52
84552	205	53
84553	205	54
84554	205	55
84555	205	56
84556	205	57
84557	205	58
84558	205	59
84559	205	60
84560	205	61
84561	205	62
84562	205	63
84563	205	64
84564	205	65
84565	205	66
84566	205	68
84567	205	69
84568	205	70
84569	205	71
84570	205	72
84571	205	73
84572	205	74
84573	205	75
84574	205	76
84575	205	77
84576	206	1
84577	206	2
84578	206	3
84579	206	4
84580	206	5
84581	206	6
84582	206	7
84583	206	8
84584	206	9
84585	206	10
84586	206	11
84587	206	12
84588	206	13
84589	206	14
84590	206	15
84591	206	16
84592	206	17
84593	206	18
84594	206	19
84595	206	20
84596	206	21
84597	206	22
84598	206	23
84599	206	24
84600	206	25
84601	206	26
84602	206	27
84603	206	28
84604	206	29
84605	206	30
84606	206	31
84607	206	32
84608	206	33
84609	206	34
84610	206	35
84611	206	36
84612	206	37
84613	206	38
84614	206	39
84615	206	40
84616	206	41
84617	206	42
84618	206	43
84619	206	44
84620	206	45
84621	206	46
84622	206	47
84623	206	48
84624	206	49
84625	206	50
84626	206	51
84627	206	52
84628	206	53
84629	206	54
84630	206	55
84631	206	56
84632	206	57
84633	206	58
84634	206	59
84635	206	60
84636	206	61
84637	206	62
84638	206	63
84639	206	64
84640	206	65
84641	206	66
84642	206	68
84643	206	69
84644	206	70
84645	206	71
84646	206	72
84647	206	73
84648	206	74
84649	206	75
84650	206	76
84651	206	77
84652	207	1
84653	207	2
84654	207	3
84655	207	4
84656	207	5
84657	207	6
84658	207	7
84659	207	8
84660	207	9
84661	207	10
84662	207	11
84663	207	12
84664	207	13
84665	207	14
84666	207	15
84667	207	16
84668	207	17
84669	207	18
84670	207	19
84671	207	20
84672	207	21
84673	207	22
84674	207	23
84675	207	24
84676	207	25
84677	207	26
84678	207	27
84679	207	28
84680	207	29
84681	207	30
84682	207	31
84683	207	32
84684	207	33
84685	207	34
84686	207	35
84687	207	36
84688	207	37
84689	207	38
84690	207	39
84691	207	40
84692	207	41
84693	207	42
84694	207	43
84695	207	44
84696	207	45
84697	207	46
84698	207	47
84699	207	48
84700	207	49
84701	207	50
84702	207	51
84703	207	52
84704	207	53
84705	207	54
84706	207	55
84707	207	56
84708	207	57
84709	207	58
84710	207	59
84711	207	60
84712	207	61
84713	207	62
84714	207	63
84715	207	64
84716	207	65
84717	207	66
84718	207	68
84719	207	69
84720	207	70
84721	207	71
84722	207	72
84723	207	73
84724	207	74
84725	207	75
84726	207	76
84727	207	77
84728	208	1
84729	208	2
84730	208	3
84731	208	4
84732	208	5
84733	208	6
84734	208	7
84735	208	8
84736	208	9
84737	208	10
84738	208	11
84739	208	12
84740	208	13
84741	208	14
84742	208	15
84743	208	16
84744	208	17
84745	208	18
84746	208	19
84747	208	20
84748	208	21
84749	208	22
84750	208	23
84751	208	24
84752	208	25
84753	208	26
84754	208	27
84755	208	28
84756	208	29
84757	208	30
84758	208	31
84759	208	32
84760	208	33
84761	208	34
84762	208	35
84763	208	36
84764	208	37
84765	208	38
84766	208	39
84767	208	40
84768	208	41
84769	208	42
84770	208	43
84771	208	44
84772	208	45
84773	208	46
84774	208	47
84775	208	48
84776	208	49
84777	208	50
84778	208	51
84779	208	52
84780	208	53
84781	208	54
84782	208	55
84783	208	56
84784	208	57
84785	208	58
84786	208	59
84787	208	60
84788	208	61
84789	208	62
84790	208	63
84791	208	64
84792	208	65
84793	208	66
84794	208	68
84795	208	69
84796	208	70
84797	208	71
84798	208	72
84799	208	73
84800	208	74
84801	208	75
84802	208	76
84803	208	77
84804	209	1
84805	209	2
84806	209	3
84807	209	4
84808	209	5
84809	209	6
84810	209	7
84811	209	8
84812	209	9
84813	209	10
84814	209	11
84815	209	12
84816	209	13
84817	209	14
84818	209	15
84819	209	16
84820	209	17
84821	209	18
84822	209	19
84823	209	20
84824	209	21
84825	209	22
84826	209	23
84827	209	24
84828	209	25
84829	209	26
84830	209	27
84831	209	28
84832	209	29
84833	209	30
84834	209	31
84835	209	32
84836	209	33
84837	209	34
84838	209	35
84839	209	36
84840	209	37
84841	209	38
84842	209	39
84843	209	40
84844	209	41
84845	209	42
84846	209	43
84847	209	44
84848	209	45
84849	209	46
84850	209	47
84851	209	48
84852	209	49
84853	209	50
84854	209	51
84855	209	52
84856	209	53
84857	209	54
84858	209	55
84859	209	56
84860	209	57
84861	209	58
84862	209	59
84863	209	60
84864	209	61
84865	209	62
84866	209	63
84867	209	64
84868	209	65
84869	209	66
84870	209	68
84871	209	69
84872	209	70
84873	209	71
84874	209	72
84875	209	73
84876	209	74
84877	209	75
84878	209	76
84879	209	77
84880	210	1
84881	210	2
84882	210	3
84883	210	4
84884	210	5
84885	210	6
84886	210	7
84887	210	8
84888	210	9
84889	210	10
84890	210	11
84891	210	12
84892	210	13
84893	210	14
84894	210	15
84895	210	16
84896	210	17
84897	210	18
84898	210	19
84899	210	20
84900	210	21
84901	210	22
84902	210	23
84903	210	24
84904	210	25
84905	210	26
84906	210	27
84907	210	28
84908	210	29
84909	210	30
84910	210	31
84911	210	32
84912	210	33
84913	210	34
84914	210	35
84915	210	36
84916	210	37
84917	210	38
84918	210	39
84919	210	40
84920	210	41
84921	210	42
84922	210	43
84923	210	44
84924	210	45
84925	210	46
84926	210	47
84927	210	48
84928	210	49
84929	210	50
84930	210	51
84931	210	52
84932	210	53
84933	210	54
84934	210	55
84935	210	56
84936	210	57
84937	210	58
84938	210	59
84939	210	60
84940	210	61
84941	210	62
84942	210	63
84943	210	64
84944	210	65
84945	210	66
84946	210	68
84947	210	69
84948	210	70
84949	210	71
84950	210	72
84951	210	73
84952	210	74
84953	210	75
84954	210	76
84955	210	77
84956	211	1
84957	211	2
84958	211	3
84959	211	4
84960	211	5
84961	211	6
84962	211	7
84963	211	8
84964	211	9
84965	211	10
84966	211	11
84967	211	12
84968	211	13
84969	211	14
84970	211	15
84971	211	16
84972	211	17
84973	211	18
84974	211	19
84975	211	20
84976	211	21
84977	211	22
84978	211	23
84979	211	24
84980	211	25
84981	211	26
84982	211	27
84983	211	28
84984	211	29
84985	211	30
84986	211	31
84987	211	32
84988	211	33
84989	211	34
84990	211	35
84991	211	36
84992	211	37
84993	211	38
84994	211	39
84995	211	40
84996	211	41
84997	211	42
84998	211	43
84999	211	44
85000	211	45
85001	211	46
85002	211	47
85003	211	48
85004	211	49
85005	211	50
85006	211	51
85007	211	52
85008	211	53
85009	211	54
85010	211	55
85011	211	56
85012	211	57
85013	211	58
85014	211	59
85015	211	60
85016	211	61
85017	211	62
85018	211	63
85019	211	64
85020	211	65
85021	211	66
85022	211	68
85023	211	69
85024	211	70
85025	211	71
85026	211	72
85027	211	73
85028	211	74
85029	211	75
85030	211	76
85031	211	77
85032	212	1
85033	212	2
85034	212	3
85035	212	4
85036	212	5
85037	212	6
85038	212	7
85039	212	8
85040	212	9
85041	212	10
85042	212	11
85043	212	12
85044	212	13
85045	212	14
85046	212	15
85047	212	16
85048	212	17
85049	212	18
85050	212	19
85051	212	20
85052	212	21
85053	212	22
85054	212	23
85055	212	24
85056	212	25
85057	212	26
85058	212	27
85059	212	28
85060	212	29
85061	212	30
85062	212	31
85063	212	32
85064	212	33
85065	212	34
85066	212	35
85067	212	36
85068	212	37
85069	212	38
85070	212	39
85071	212	40
85072	212	41
85073	212	42
85074	212	43
85075	212	44
85076	212	45
85077	212	46
85078	212	47
85079	212	48
85080	212	49
85081	212	50
85082	212	51
85083	212	52
85084	212	53
85085	212	54
85086	212	55
85087	212	56
85088	212	57
85089	212	58
85090	212	59
85091	212	60
85092	212	61
85093	212	62
85094	212	63
85095	212	64
85096	212	65
85097	212	66
85098	212	68
85099	212	69
85100	212	70
85101	212	71
85102	212	72
85103	212	73
85104	212	74
85105	212	75
85106	212	76
85107	212	77
85108	213	1
85109	213	2
85110	213	3
85111	213	4
85112	213	5
85113	213	6
85114	213	7
85115	213	8
85116	213	9
85117	213	10
85118	213	11
85119	213	12
85120	213	13
85121	213	14
85122	213	15
85123	213	16
85124	213	17
85125	213	18
85126	213	19
85127	213	20
85128	213	21
85129	213	22
85130	213	23
85131	213	24
85132	213	25
85133	213	26
85134	213	27
85135	213	28
85136	213	29
85137	213	30
85138	213	31
85139	213	32
85140	213	33
85141	213	34
85142	213	35
85143	213	36
85144	213	37
85145	213	38
85146	213	39
85147	213	40
85148	213	41
85149	213	42
85150	213	43
85151	213	44
85152	213	45
85153	213	46
85154	213	47
85155	213	48
85156	213	49
85157	213	50
85158	213	51
85159	213	52
85160	213	53
85161	213	54
85162	213	55
85163	213	56
85164	213	57
85165	213	58
85166	213	59
85167	213	60
85168	213	61
85169	213	62
85170	213	63
85171	213	64
85172	213	65
85173	213	66
85174	213	68
85175	213	69
85176	213	70
85177	213	71
85178	213	72
85179	213	73
85180	213	74
85181	213	75
85182	213	76
85183	213	77
85184	214	1
85185	214	2
85186	214	3
85187	214	4
85188	214	5
85189	214	6
85190	214	7
85191	214	8
85192	214	9
85193	214	10
85194	214	11
85195	214	12
85196	214	13
85197	214	14
85198	214	15
85199	214	16
85200	214	17
85201	214	18
85202	214	19
85203	214	20
85204	214	21
85205	214	22
85206	214	23
85207	214	24
85208	214	25
85209	214	26
85210	214	27
85211	214	28
85212	214	29
85213	214	30
85214	214	31
85215	214	32
85216	214	33
85217	214	34
85218	214	35
85219	214	36
85220	214	37
85221	214	38
85222	214	39
85223	214	40
85224	214	41
85225	214	42
85226	214	43
85227	214	44
85228	214	45
85229	214	46
85230	214	47
85231	214	48
85232	214	49
85233	214	50
85234	214	51
85235	214	52
85236	214	53
85237	214	54
85238	214	55
85239	214	56
85240	214	57
85241	214	58
85242	214	59
85243	214	60
85244	214	61
85245	214	62
85246	214	63
85247	214	64
85248	214	65
85249	214	66
85250	214	68
85251	214	69
85252	214	70
85253	214	71
85254	214	72
85255	214	73
85256	214	74
85257	214	75
85258	214	76
85259	214	77
85260	215	1
85261	215	2
85262	215	3
85263	215	4
85264	215	5
85265	215	6
85266	215	7
85267	215	8
85268	215	9
85269	215	10
85270	215	11
85271	215	12
85272	215	13
85273	215	14
85274	215	15
85275	215	16
85276	215	17
85277	215	18
85278	215	19
85279	215	20
85280	215	21
85281	215	22
85282	215	23
85283	215	24
85284	215	25
85285	215	26
85286	215	27
85287	215	28
85288	215	29
85289	215	30
85290	215	31
85291	215	32
85292	215	33
85293	215	34
85294	215	35
85295	215	36
85296	215	37
85297	215	38
85298	215	39
85299	215	40
85300	215	41
85301	215	42
85302	215	43
85303	215	44
85304	215	45
85305	215	46
85306	215	47
85307	215	48
85308	215	49
85309	215	50
85310	215	51
85311	215	52
85312	215	53
85313	215	54
85314	215	55
85315	215	56
85316	215	57
85317	215	58
85318	215	59
85319	215	60
85320	215	61
85321	215	62
85322	215	63
85323	215	64
85324	215	65
85325	215	66
85326	215	68
85327	215	69
85328	215	70
85329	215	71
85330	215	72
85331	215	73
85332	215	74
85333	215	75
85334	215	76
85335	215	77
85336	216	1
85337	216	2
85338	216	3
85339	216	4
85340	216	5
85341	216	6
85342	216	7
85343	216	8
85344	216	9
85345	216	10
85346	216	11
85347	216	12
85348	216	13
85349	216	14
85350	216	15
85351	216	16
85352	216	17
85353	216	18
85354	216	19
85355	216	20
85356	216	21
85357	216	22
85358	216	23
85359	216	24
85360	216	25
85361	216	26
85362	216	27
85363	216	28
85364	216	29
85365	216	30
85366	216	31
85367	216	32
85368	216	33
85369	216	34
85370	216	35
85371	216	36
85372	216	37
85373	216	38
85374	216	39
85375	216	40
85376	216	41
85377	216	42
85378	216	43
85379	216	44
85380	216	45
85381	216	46
85382	216	47
85383	216	48
85384	216	49
85385	216	50
85386	216	51
85387	216	52
85388	216	53
85389	216	54
85390	216	55
85391	216	56
85392	216	57
85393	216	58
85394	216	59
85395	216	60
85396	216	61
85397	216	62
85398	216	63
85399	216	64
85400	216	65
85401	216	66
85402	216	68
85403	216	69
85404	216	70
85405	216	71
85406	216	72
85407	216	73
85408	216	74
85409	216	75
85410	216	76
85411	216	77
85412	217	1
85413	217	2
85414	217	3
85415	217	4
85416	217	5
85417	217	6
85418	217	7
85419	217	8
85420	217	9
85421	217	10
85422	217	11
85423	217	12
85424	217	13
85425	217	14
85426	217	15
85427	217	16
85428	217	17
85429	217	18
85430	217	19
85431	217	20
85432	217	21
85433	217	22
85434	217	23
85435	217	24
85436	217	25
85437	217	26
85438	217	27
85439	217	28
85440	217	29
85441	217	30
85442	217	31
85443	217	32
85444	217	33
85445	217	34
85446	217	35
85447	217	36
85448	217	37
85449	217	38
85450	217	39
85451	217	40
85452	217	41
85453	217	42
85454	217	43
85455	217	44
85456	217	45
85457	217	46
85458	217	47
85459	217	48
85460	217	49
85461	217	50
85462	217	51
85463	217	52
85464	217	53
85465	217	54
85466	217	55
85467	217	56
85468	217	57
85469	217	58
85470	217	59
85471	217	60
85472	217	61
85473	217	62
85474	217	63
85475	217	64
85476	217	65
85477	217	66
85478	217	68
85479	217	69
85480	217	70
85481	217	71
85482	217	72
85483	217	73
85484	217	74
85485	217	75
85486	217	76
85487	217	77
85488	218	1
85489	218	2
85490	218	3
85491	218	4
85492	218	5
85493	218	6
85494	218	7
85495	218	8
85496	218	9
85497	218	10
85498	218	11
85499	218	12
85500	218	13
85501	218	14
85502	218	15
85503	218	16
85504	218	17
85505	218	18
85506	218	19
85507	218	20
85508	218	21
85509	218	22
85510	218	23
85511	218	24
85512	218	25
85513	218	26
85514	218	27
85515	218	28
85516	218	29
85517	218	30
85518	218	31
85519	218	32
85520	218	33
85521	218	34
85522	218	35
85523	218	36
85524	218	37
85525	218	38
85526	218	39
85527	218	40
85528	218	41
85529	218	42
85530	218	43
85531	218	44
85532	218	45
85533	218	46
85534	218	47
85535	218	48
85536	218	49
85537	218	50
85538	218	51
85539	218	52
85540	218	53
85541	218	54
85542	218	55
85543	218	56
85544	218	57
85545	218	58
85546	218	59
85547	218	60
85548	218	61
85549	218	62
85550	218	63
85551	218	64
85552	218	65
85553	218	66
85554	218	68
85555	218	69
85556	218	70
85557	218	71
85558	218	72
85559	218	73
85560	218	74
85561	218	75
85562	218	76
85563	218	77
85564	219	1
85565	219	2
85566	219	3
85567	219	4
85568	219	5
85569	219	6
85570	219	7
85571	219	8
85572	219	9
85573	219	10
85574	219	11
85575	219	12
85576	219	13
85577	219	14
85578	219	15
85579	219	16
85580	219	17
85581	219	18
85582	219	19
85583	219	20
85584	219	21
85585	219	22
85586	219	23
85587	219	24
85588	219	25
85589	219	26
85590	219	27
85591	219	28
85592	219	29
85593	219	30
85594	219	31
85595	219	32
85596	219	33
85597	219	34
85598	219	35
85599	219	36
85600	219	37
85601	219	38
85602	219	39
85603	219	40
85604	219	41
85605	219	42
85606	219	43
85607	219	44
85608	219	45
85609	219	46
85610	219	47
85611	219	48
85612	219	49
85613	219	50
85614	219	51
85615	219	52
85616	219	53
85617	219	54
85618	219	55
85619	219	56
85620	219	57
85621	219	58
85622	219	59
85623	219	61
85624	219	62
85625	219	63
85626	219	64
85627	219	65
85628	219	66
85629	219	68
85630	220	1
85631	220	2
85632	220	3
85633	220	4
85634	220	5
85635	220	6
85636	220	7
85637	220	8
85638	220	9
85639	220	10
85640	220	11
85641	220	12
85642	220	13
85643	220	14
85644	220	15
85645	220	16
85646	220	17
85647	220	18
85648	220	19
85649	220	20
85650	220	21
85651	220	22
85652	220	23
85653	220	24
85654	220	25
85655	220	26
85656	220	27
85657	220	28
85658	220	29
85659	220	30
85660	220	31
85661	220	32
85662	220	33
85663	220	34
85664	220	35
85665	220	36
85666	220	37
85667	220	38
85668	220	39
85669	220	40
85670	220	41
85671	220	42
85672	220	43
85673	220	44
85674	220	45
85675	220	46
85676	220	47
85677	220	48
85678	220	49
85679	220	50
85680	220	51
85681	220	52
85682	220	53
85683	220	54
85684	220	55
85685	220	56
85686	220	57
85687	220	58
85688	220	59
85689	220	60
85690	220	61
85691	220	62
85692	220	63
85693	220	64
85694	220	65
85695	220	66
85696	220	68
85697	221	1
85698	221	2
85699	221	3
85700	221	4
85701	221	5
85702	221	6
85703	221	7
85704	221	8
85705	221	9
85706	221	10
85707	221	11
85708	221	12
85709	221	13
85710	221	14
85711	221	15
85712	221	16
85713	221	17
85714	221	18
85715	221	19
85716	221	20
85717	221	21
85718	221	22
85719	221	23
85720	221	24
85721	221	25
85722	221	26
85723	221	27
85724	221	28
85725	221	29
85726	221	30
85727	221	31
85728	221	32
85729	221	33
85730	221	34
85731	221	35
85732	221	36
85733	221	37
85734	221	38
85735	221	39
85736	221	40
85737	221	41
85738	221	42
85739	221	43
85740	221	44
85741	221	45
85742	221	46
85743	221	47
85744	221	48
85745	221	49
85746	221	50
85747	221	51
85748	221	52
85749	221	53
85750	221	54
85751	221	55
85752	221	56
85753	221	57
85754	221	58
85755	221	59
85756	221	60
85757	221	61
85758	221	62
85759	221	63
85760	221	64
85761	221	65
85762	221	66
85763	221	68
85764	221	69
85765	221	70
85766	221	71
85767	221	72
85768	221	73
85769	221	74
85770	221	75
85771	221	76
85772	221	77
85773	222	1
85774	222	2
85775	222	3
85776	222	4
85777	222	5
85778	222	6
85779	222	7
85780	222	8
85781	222	9
85782	222	10
85783	222	11
85784	222	12
85785	222	13
85786	222	14
85787	222	15
85788	222	16
85789	222	17
85790	222	18
85791	222	19
85792	222	20
85793	222	21
85794	222	22
85795	222	23
85796	222	24
85797	222	25
85798	222	26
85799	222	27
85800	222	28
85801	222	29
85802	222	30
85803	222	31
85804	222	32
85805	222	33
85806	222	34
85807	222	35
85808	222	36
85809	222	37
85810	222	38
85811	222	39
85812	222	40
85813	222	41
85814	222	42
85815	222	43
85816	222	44
85817	222	45
85818	222	46
85819	222	47
85820	222	48
85821	222	49
85822	222	50
85823	222	51
85824	222	52
85825	222	53
85826	222	54
85827	222	55
85828	222	56
85829	222	57
85830	222	58
85831	222	59
85832	222	60
85833	222	61
85834	222	62
85835	222	63
85836	222	64
85837	222	65
85838	222	66
85839	222	68
85840	223	1
85841	223	2
85842	223	3
85843	223	4
85844	223	5
85845	223	6
85846	223	7
85847	223	8
85848	223	9
85849	223	10
85850	223	11
85851	223	12
85852	223	13
85853	223	14
85854	223	15
85855	223	16
85856	223	17
85857	223	18
85858	223	19
85859	223	20
85860	223	21
85861	223	22
85862	223	23
85863	223	24
85864	223	25
85865	223	26
85866	223	27
85867	223	28
85868	223	29
85869	223	30
85870	223	31
85871	223	32
85872	223	33
85873	223	34
85874	223	35
85875	223	36
85876	223	37
85877	223	38
85878	223	39
85879	223	40
85880	223	41
85881	223	42
85882	223	43
85883	223	44
85884	223	45
85885	223	46
85886	223	47
85887	223	48
85888	223	49
85889	223	50
85890	223	51
85891	223	52
85892	223	53
85893	223	54
85894	223	55
85895	223	56
85896	223	57
85897	223	58
85898	223	59
85899	223	60
85900	223	61
85901	223	62
85902	223	63
85903	223	64
85904	223	65
85905	223	66
85906	223	68
85907	223	69
85908	223	70
85909	223	71
85910	223	72
85911	223	73
85912	223	74
85913	223	75
85914	223	76
85915	223	77
85916	224	1
85917	224	2
85918	224	3
85919	224	4
85920	224	5
85921	224	6
85922	224	7
85923	224	8
85924	224	9
85925	224	10
85926	224	11
85927	224	12
85928	224	13
85929	224	14
85930	224	15
85931	224	16
85932	224	17
85933	224	18
85934	224	19
85935	224	20
85936	224	21
85937	224	22
85938	224	23
85939	224	24
85940	224	25
85941	224	26
85942	224	27
85943	224	28
85944	224	29
85945	224	30
85946	224	31
85947	224	32
85948	224	33
85949	224	34
85950	224	35
85951	224	36
85952	224	37
85953	224	38
85954	224	39
85955	224	40
85956	224	41
85957	224	42
85958	224	43
85959	224	44
85960	224	45
85961	224	46
85962	224	47
85963	224	48
85964	224	49
85965	224	50
85966	224	51
85967	224	52
85968	224	53
85969	224	54
85970	224	55
85971	224	56
85972	224	57
85973	224	58
85974	224	59
85975	224	60
85976	224	61
85977	224	62
85978	224	63
85979	224	64
85980	224	65
85981	224	66
85982	224	68
85983	224	69
85984	224	70
85985	224	71
85986	224	72
85987	224	73
85988	224	74
85989	224	75
85990	224	76
85991	224	77
85992	225	1
85993	225	2
85994	225	3
85995	225	4
85996	225	5
85997	225	6
85998	225	7
85999	225	8
86000	225	9
86001	225	10
86002	225	11
86003	225	12
86004	225	13
86005	225	14
86006	225	15
86007	225	16
86008	225	17
86009	225	18
86010	225	19
86011	225	20
86012	225	21
86013	225	22
86014	225	23
86015	225	24
86016	225	25
86017	225	26
86018	225	27
86019	225	28
86020	225	29
86021	225	30
86022	225	31
86023	225	32
86024	225	33
86025	225	34
86026	225	35
86027	225	36
86028	225	37
86029	225	38
86030	225	39
86031	225	40
86032	225	41
86033	225	42
86034	225	43
86035	225	44
86036	225	45
86037	225	46
86038	225	47
86039	225	48
86040	225	49
86041	225	50
86042	225	51
86043	225	52
86044	225	53
86045	225	54
86046	225	55
86047	225	56
86048	225	57
86049	225	58
86050	225	59
86051	225	60
86052	225	61
86053	225	62
86054	225	63
86055	225	64
86056	225	65
86057	225	66
86058	225	68
86059	225	69
86060	225	70
86061	225	71
86062	225	72
86063	225	73
86064	225	74
86065	225	75
86066	225	76
86067	225	77
86068	226	1
86069	226	2
86070	226	3
86071	226	4
86072	226	5
86073	226	6
86074	226	7
86075	226	8
86076	226	9
86077	226	10
86078	226	11
86079	226	12
86080	226	13
86081	226	14
86082	226	15
86083	226	16
86084	226	17
86085	226	18
86086	226	19
86087	226	20
86088	226	21
86089	226	22
86090	226	23
86091	226	24
86092	226	25
86093	226	26
86094	226	27
86095	226	28
86096	226	29
86097	226	30
86098	226	31
86099	226	32
86100	226	33
86101	226	34
86102	226	35
86103	226	36
86104	226	37
86105	226	38
86106	226	39
86107	226	40
86108	226	41
86109	226	42
86110	226	43
86111	226	44
86112	226	45
86113	226	46
86114	226	47
86115	226	48
86116	226	49
86117	226	50
86118	226	51
86119	226	52
86120	226	53
86121	226	54
86122	226	55
86123	226	56
86124	226	57
86125	226	58
86126	226	59
86127	226	60
86128	226	61
86129	226	62
86130	226	63
86131	226	64
86132	226	65
86133	226	66
86134	226	68
86135	226	69
86136	226	70
86137	226	71
86138	226	72
86139	226	73
86140	226	74
86141	226	75
86142	226	76
86143	226	77
86144	227	1
86145	227	2
86146	227	3
86147	227	4
86148	227	5
86149	227	6
86150	227	7
86151	227	8
86152	227	9
86153	227	10
86154	227	11
86155	227	12
86156	227	13
86157	227	14
86158	227	15
86159	227	16
86160	227	17
86161	227	18
86162	227	19
86163	227	20
86164	227	21
86165	227	22
86166	227	23
86167	227	24
86168	227	25
86169	227	26
86170	227	27
86171	227	28
86172	227	29
86173	227	30
86174	227	31
86175	227	32
86176	227	33
86177	227	34
86178	227	35
86179	227	36
86180	227	37
86181	227	38
86182	227	39
86183	227	40
86184	227	41
86185	227	42
86186	227	43
86187	227	44
86188	227	45
86189	227	46
86190	227	47
86191	227	48
86192	227	49
86193	227	50
86194	227	51
86195	227	52
86196	227	53
86197	227	54
86198	227	55
86199	227	56
86200	227	57
86201	227	58
86202	227	59
86203	227	60
86204	227	61
86205	227	62
86206	227	63
86207	227	64
86208	227	65
86209	227	66
86210	227	68
86211	227	69
86212	227	70
86213	227	71
86214	227	72
86215	227	73
86216	227	74
86217	227	75
86218	227	76
86219	227	77
86220	228	1
86221	228	2
86222	228	3
86223	228	4
86224	228	5
86225	228	6
86226	228	7
86227	228	8
86228	228	9
86229	228	10
86230	228	11
86231	228	12
86232	228	13
86233	228	14
86234	228	15
86235	228	16
86236	228	17
86237	228	18
86238	228	19
86239	228	20
86240	228	21
86241	228	22
86242	228	23
86243	228	24
86244	228	25
86245	228	26
86246	228	27
86247	228	28
86248	228	29
86249	228	30
86250	228	31
86251	228	32
86252	228	33
86253	228	34
86254	228	35
86255	228	36
86256	228	37
86257	228	38
86258	228	39
86259	228	40
86260	228	41
86261	228	42
86262	228	43
86263	228	44
86264	228	45
86265	228	46
86266	228	47
86267	228	48
86268	228	49
86269	228	50
86270	228	51
86271	228	52
86272	228	53
86273	228	54
86274	228	55
86275	228	56
86276	228	57
86277	228	58
86278	228	59
86279	228	60
86280	228	61
86281	228	62
86282	228	63
86283	228	64
86284	228	65
86285	228	66
86286	228	68
86287	228	69
86288	228	70
86289	228	71
86290	228	72
86291	228	73
86292	228	74
86293	228	75
86294	228	76
86295	228	77
86296	229	1
86297	229	2
86298	229	3
86299	229	4
86300	229	5
86301	229	6
86302	229	7
86303	229	8
86304	229	9
86305	229	10
86306	229	11
86307	229	12
86308	229	13
86309	229	14
86310	229	15
86311	229	16
86312	229	17
86313	229	18
86314	229	19
86315	229	20
86316	229	21
86317	229	22
86318	229	23
86319	229	24
86320	229	25
86321	229	26
86322	229	27
86323	229	28
86324	229	29
86325	229	30
86326	229	31
86327	229	32
86328	229	33
86329	229	34
86330	229	35
86331	229	36
86332	229	37
86333	229	38
86334	229	39
86335	229	40
86336	229	41
86337	229	42
86338	229	43
86339	229	44
86340	229	45
86341	229	46
86342	229	47
86343	229	48
86344	229	49
86345	229	50
86346	229	51
86347	229	52
86348	229	53
86349	229	54
86350	229	55
86351	229	56
86352	229	57
86353	229	58
86354	229	59
86355	229	60
86356	229	61
86357	229	62
86358	229	63
86359	229	64
86360	229	65
86361	229	66
86362	229	68
86363	229	69
86364	229	70
86365	229	71
86366	229	72
86367	229	73
86368	229	74
86369	229	75
86370	229	76
86371	229	77
86372	230	1
86373	230	2
86374	230	3
86375	230	4
86376	230	5
86377	230	6
86378	230	7
86379	230	8
86380	230	9
86381	230	10
86382	230	11
86383	230	12
86384	230	13
86385	230	14
86386	230	15
86387	230	16
86388	230	17
86389	230	18
86390	230	19
86391	230	20
86392	230	21
86393	230	22
86394	230	23
86395	230	24
86396	230	25
86397	230	26
86398	230	27
86399	230	28
86400	230	29
86401	230	30
86402	230	31
86403	230	32
86404	230	33
86405	230	34
86406	230	35
86407	230	36
86408	230	37
86409	230	38
86410	230	39
86411	230	40
86412	230	41
86413	230	42
86414	230	43
86415	230	44
86416	230	45
86417	230	46
86418	230	47
86419	230	48
86420	230	49
86421	230	50
86422	230	51
86423	230	52
86424	230	53
86425	230	54
86426	230	55
86427	230	56
86428	230	57
86429	230	58
86430	230	59
86431	230	60
86432	230	61
86433	230	62
86434	230	63
86435	230	64
86436	230	65
86437	230	66
86438	230	68
86439	230	69
86440	230	70
86441	230	71
86442	230	72
86443	230	73
86444	230	74
86445	230	75
86446	230	76
86447	230	77
86448	231	1
86449	231	2
86450	231	3
86451	231	4
86452	231	5
86453	231	6
86454	231	7
86455	231	8
86456	231	9
86457	231	10
86458	231	11
86459	231	12
86460	231	13
86461	231	14
86462	231	15
86463	231	16
86464	231	17
86465	231	18
86466	231	19
86467	231	20
86468	231	21
86469	231	22
86470	231	23
86471	231	24
86472	231	25
86473	231	26
86474	231	27
86475	231	28
86476	231	29
86477	231	30
86478	231	31
86479	231	32
86480	231	33
86481	231	34
86482	231	35
86483	231	36
86484	231	37
86485	231	38
86486	231	39
86487	231	40
86488	231	41
86489	231	42
86490	231	43
86491	231	44
86492	231	45
86493	231	46
86494	231	47
86495	231	48
86496	231	49
86497	231	50
86498	231	51
86499	231	52
86500	231	53
86501	231	54
86502	231	55
86503	231	56
86504	231	57
86505	231	58
86506	231	59
86507	231	60
86508	231	61
86509	231	62
86510	231	63
86511	231	64
86512	231	65
86513	231	66
86514	231	68
86515	231	69
86516	231	70
86517	231	71
86518	231	72
86519	231	73
86520	231	74
86521	231	75
86522	231	76
86523	231	77
86524	232	1
86525	232	2
86526	232	3
86527	232	4
86528	232	5
86529	232	6
86530	232	7
86531	232	8
86532	232	9
86533	232	10
86534	232	11
86535	232	12
86536	232	13
86537	232	14
86538	232	15
86539	232	16
86540	232	17
86541	232	18
86542	232	19
86543	232	20
86544	232	21
86545	232	22
86546	232	23
86547	232	24
86548	232	25
86549	232	26
86550	232	27
86551	232	28
86552	232	29
86553	232	30
86554	232	31
86555	232	32
86556	232	33
86557	232	34
86558	232	35
86559	232	36
86560	232	37
86561	232	38
86562	232	39
86563	232	40
86564	232	41
86565	232	42
86566	232	43
86567	232	44
86568	232	45
86569	232	46
86570	232	47
86571	232	48
86572	232	49
86573	232	50
86574	232	51
86575	232	52
86576	232	53
86577	232	54
86578	232	55
86579	232	56
86580	232	57
86581	232	58
86582	232	59
86583	232	60
86584	232	61
86585	232	62
86586	232	63
86587	232	64
86588	232	65
86589	232	66
86590	232	68
86591	232	69
86592	232	70
86593	232	71
86594	232	72
86595	232	73
86596	232	74
86597	232	75
86598	232	76
86599	232	77
86600	233	1
86601	233	2
86602	233	3
86603	233	4
86604	233	5
86605	233	6
86606	233	7
86607	233	8
86608	233	9
86609	233	10
86610	233	11
86611	233	12
86612	233	13
86613	233	14
86614	233	15
86615	233	16
86616	233	17
86617	233	18
86618	233	19
86619	233	20
86620	233	21
86621	233	22
86622	233	23
86623	233	24
86624	233	25
86625	233	26
86626	233	27
86627	233	28
86628	233	29
86629	233	30
86630	233	31
86631	233	32
86632	233	33
86633	233	34
86634	233	35
86635	233	36
86636	233	37
86637	233	38
86638	233	39
86639	233	40
86640	233	41
86641	233	42
86642	233	43
86643	233	44
86644	233	45
86645	233	46
86646	233	47
86647	233	48
86648	233	49
86649	233	50
86650	233	51
86651	233	52
86652	233	53
86653	233	54
86654	233	55
86655	233	56
86656	233	57
86657	233	58
86658	233	59
86659	233	60
86660	233	61
86661	233	62
86662	233	63
86663	233	64
86664	233	65
86665	233	66
86666	233	68
86667	233	69
86668	233	70
86669	233	71
86670	233	72
86671	233	73
86672	233	74
86673	233	75
86674	233	76
86675	233	77
86676	234	1
86677	234	2
86678	234	3
86679	234	4
86680	234	5
86681	234	6
86682	234	7
86683	234	8
86684	234	9
86685	234	10
86686	234	11
86687	234	12
86688	234	13
86689	234	14
86690	234	15
86691	234	16
86692	234	17
86693	234	18
86694	234	19
86695	234	20
86696	234	21
86697	234	22
86698	234	23
86699	234	24
86700	234	25
86701	234	26
86702	234	27
86703	234	28
86704	234	29
86705	234	30
86706	234	31
86707	234	32
86708	234	33
86709	234	34
86710	234	35
86711	234	36
86712	234	37
86713	234	38
86714	234	39
86715	234	40
86716	234	41
86717	234	42
86718	234	43
86719	234	44
86720	234	45
86721	234	46
86722	234	47
86723	234	48
86724	234	49
86725	234	50
86726	234	51
86727	234	52
86728	234	53
86729	234	54
86730	234	55
86731	234	56
86732	234	57
86733	234	58
86734	234	59
86735	234	60
86736	234	61
86737	234	62
86738	234	63
86739	234	64
86740	234	65
86741	234	66
86742	234	68
86743	234	69
86744	234	70
86745	234	71
86746	234	72
86747	234	73
86748	234	74
86749	234	75
86750	234	76
86751	234	77
86752	235	1
86753	235	2
86754	235	3
86755	235	4
86756	235	5
86757	235	6
86758	235	7
86759	235	8
86760	235	9
86761	235	10
86762	235	11
86763	235	12
86764	235	13
86765	235	14
86766	235	15
86767	235	16
86768	235	17
86769	235	18
86770	235	19
86771	235	20
86772	235	21
86773	235	22
86774	235	23
86775	235	24
86776	235	25
86777	235	26
86778	235	27
86779	235	28
86780	235	29
86781	235	30
86782	235	31
86783	235	32
86784	235	33
86785	235	34
86786	235	35
86787	235	36
86788	235	37
86789	235	38
86790	235	39
86791	235	40
86792	235	41
86793	235	42
86794	235	43
86795	235	44
86796	235	45
86797	235	46
86798	235	47
86799	235	48
86800	235	49
86801	235	50
86802	235	51
86803	235	52
86804	235	53
86805	235	54
86806	235	55
86807	235	56
86808	235	57
86809	235	58
86810	235	59
86811	235	60
86812	235	61
86813	235	62
86814	235	63
86815	235	64
86816	235	65
86817	235	66
86818	235	68
86819	235	69
86820	235	70
86821	235	71
86822	235	72
86823	235	73
86824	235	74
86825	235	75
86826	235	76
86827	235	77
86828	236	1
86829	236	2
86830	236	3
86831	236	4
86832	236	5
86833	236	6
86834	236	7
86835	236	8
86836	236	9
86837	236	10
86838	236	11
86839	236	12
86840	236	13
86841	236	14
86842	236	15
86843	236	16
86844	236	17
86845	236	18
86846	236	19
86847	236	20
86848	236	21
86849	236	22
86850	236	23
86851	236	24
86852	236	25
86853	236	26
86854	236	27
86855	236	28
86856	236	29
86857	236	30
86858	236	31
86859	236	32
86860	236	33
86861	236	34
86862	236	35
86863	236	36
86864	236	37
86865	236	38
86866	236	39
86867	236	40
86868	236	41
86869	236	42
86870	236	43
86871	236	44
86872	236	45
86873	236	46
86874	236	47
86875	236	48
86876	236	49
86877	236	50
86878	236	51
86879	236	52
86880	236	53
86881	236	54
86882	236	55
86883	236	56
86884	236	57
86885	236	58
86886	236	59
86887	236	60
86888	236	61
86889	236	62
86890	236	63
86891	236	64
86892	236	65
86893	236	66
86894	236	68
86895	236	69
86896	236	70
86897	236	71
86898	236	72
86899	236	73
86900	236	74
86901	236	75
86902	236	76
86903	236	77
86904	237	1
86905	237	2
86906	237	3
86907	237	4
86908	237	5
86909	237	6
86910	237	7
86911	237	8
86912	237	9
86913	237	10
86914	237	11
86915	237	12
86916	237	13
86917	237	14
86918	237	15
86919	237	16
86920	237	17
86921	237	18
86922	237	19
86923	237	20
86924	237	21
86925	237	22
86926	237	23
86927	237	24
86928	237	25
86929	237	26
86930	237	27
86931	237	28
86932	237	29
86933	237	30
86934	237	31
86935	237	32
86936	237	33
86937	237	34
86938	237	35
86939	237	36
86940	237	37
86941	237	38
86942	237	39
86943	237	40
86944	237	41
86945	237	42
86946	237	43
86947	237	44
86948	237	45
86949	237	46
86950	237	47
86951	237	48
86952	237	49
86953	237	50
86954	237	51
86955	237	52
86956	237	53
86957	237	54
86958	237	55
86959	237	56
86960	237	57
86961	237	58
86962	237	59
86963	237	60
86964	237	61
86965	237	62
86966	237	63
86967	237	64
86968	237	65
86969	237	66
86970	237	68
86971	237	69
86972	237	70
86973	237	71
86974	237	72
86975	237	73
86976	237	74
86977	237	75
86978	237	76
86979	237	77
86980	238	1
86981	238	2
86982	238	3
86983	238	4
86984	238	5
86985	238	6
86986	238	7
86987	238	8
86988	238	9
86989	238	10
86990	238	11
86991	238	12
86992	238	13
86993	238	14
86994	238	15
86995	238	16
86996	238	17
86997	238	18
86998	238	19
86999	238	20
87000	238	21
87001	238	22
87002	238	23
87003	238	24
87004	238	25
87005	238	26
87006	238	27
87007	238	28
87008	238	29
87009	238	30
87010	238	31
87011	238	32
87012	238	33
87013	238	34
87014	238	35
87015	238	36
87016	238	37
87017	238	38
87018	238	39
87019	238	40
87020	238	41
87021	238	42
87022	238	43
87023	238	44
87024	238	45
87025	238	46
87026	238	47
87027	238	48
87028	238	49
87029	238	50
87030	238	51
87031	238	52
87032	238	53
87033	238	54
87034	238	55
87035	238	56
87036	238	57
87037	238	58
87038	238	59
87039	238	60
87040	238	61
87041	238	62
87042	238	63
87043	238	64
87044	238	65
87045	238	66
87046	238	68
87047	238	69
87048	238	70
87049	238	71
87050	238	72
87051	238	73
87052	238	74
87053	238	75
87054	238	76
87055	238	77
87056	239	1
87057	239	2
87058	239	3
87059	239	4
87060	239	5
87061	239	6
87062	239	7
87063	239	8
87064	239	9
87065	239	10
87066	239	11
87067	239	12
87068	239	13
87069	239	14
87070	239	15
87071	239	16
87072	239	17
87073	239	18
87074	239	19
87075	239	20
87076	239	21
87077	239	22
87078	239	23
87079	239	24
87080	239	25
87081	239	26
87082	239	27
87083	239	28
87084	239	29
87085	239	30
87086	239	31
87087	239	32
87088	239	33
87089	239	34
87090	239	35
87091	239	36
87092	239	37
87093	239	38
87094	239	39
87095	239	40
87096	239	41
87097	239	42
87098	239	43
87099	239	44
87100	239	45
87101	239	46
87102	239	47
87103	239	48
87104	239	49
87105	239	50
87106	239	51
87107	239	52
87108	239	53
87109	239	54
87110	239	55
87111	239	56
87112	239	57
87113	239	58
87114	239	59
87115	239	60
87116	239	61
87117	239	62
87118	239	63
87119	239	64
87120	239	65
87121	239	66
87122	239	68
87123	239	69
87124	239	70
87125	239	71
87126	239	72
87127	239	73
87128	239	74
87129	239	75
87130	239	76
87131	239	77
87132	240	1
87133	240	2
87134	240	3
87135	240	4
87136	240	5
87137	240	6
87138	240	7
87139	240	8
87140	240	9
87141	240	10
87142	240	11
87143	240	12
87144	240	13
87145	240	14
87146	240	15
87147	240	16
87148	240	17
87149	240	18
87150	240	19
87151	240	20
87152	240	21
87153	240	22
87154	240	23
87155	240	24
87156	240	25
87157	240	26
87158	240	27
87159	240	28
87160	240	29
87161	240	30
87162	240	31
87163	240	32
87164	240	33
87165	240	34
87166	240	35
87167	240	36
87168	240	37
87169	240	38
87170	240	39
87171	240	40
87172	240	41
87173	240	42
87174	240	43
87175	240	44
87176	240	45
87177	240	46
87178	240	47
87179	240	48
87180	240	49
87181	240	50
87182	240	51
87183	240	52
87184	240	53
87185	240	54
87186	240	55
87187	240	56
87188	240	57
87189	240	58
87190	240	59
87191	240	60
87192	240	61
87193	240	62
87194	240	63
87195	240	64
87196	240	65
87197	240	66
87198	240	68
87199	240	69
87200	240	70
87201	240	71
87202	240	72
87203	240	73
87204	240	74
87205	240	75
87206	240	76
87207	240	77
87208	241	1
87209	241	2
87210	241	3
87211	241	4
87212	241	5
87213	241	6
87214	241	7
87215	241	8
87216	241	9
87217	241	10
87218	241	11
87219	241	12
87220	241	13
87221	241	14
87222	241	15
87223	241	16
87224	241	17
87225	241	18
87226	241	19
87227	241	20
87228	241	21
87229	241	22
87230	241	23
87231	241	24
87232	241	25
87233	241	26
87234	241	27
87235	241	28
87236	241	29
87237	241	30
87238	241	31
87239	241	32
87240	241	33
87241	241	34
87242	241	35
87243	241	36
87244	241	37
87245	241	38
87246	241	39
87247	241	40
87248	241	41
87249	241	42
87250	241	43
87251	241	44
87252	241	45
87253	241	46
87254	241	47
87255	241	48
87256	241	49
87257	241	50
87258	241	51
87259	241	52
87260	241	53
87261	241	54
87262	241	55
87263	241	56
87264	241	57
87265	241	58
87266	241	59
87267	241	60
87268	241	61
87269	241	62
87270	241	63
87271	241	64
87272	241	65
87273	241	66
87274	241	68
87275	241	69
87276	241	70
87277	241	71
87278	241	72
87279	241	73
87280	241	74
87281	241	75
87282	241	76
87283	241	77
87284	242	1
87285	242	2
87286	242	3
87287	242	4
87288	242	5
87289	242	6
87290	242	7
87291	242	8
87292	242	9
87293	242	10
87294	242	11
87295	242	12
87296	242	13
87297	242	14
87298	242	15
87299	242	16
87300	242	17
87301	242	18
87302	242	19
87303	242	20
87304	242	21
87305	242	22
87306	242	23
87307	242	24
87308	242	25
87309	242	26
87310	242	27
87311	242	28
87312	242	29
87313	242	30
87314	242	31
87315	242	32
87316	242	33
87317	242	34
87318	242	35
87319	242	36
87320	242	37
87321	242	38
87322	242	39
87323	242	40
87324	242	41
87325	242	42
87326	242	43
87327	242	44
87328	242	45
87329	242	46
87330	242	47
87331	242	48
87332	242	49
87333	242	50
87334	242	51
87335	242	52
87336	242	53
87337	242	54
87338	242	55
87339	242	56
87340	242	57
87341	242	58
87342	242	59
87343	242	60
87344	242	61
87345	242	62
87346	242	63
87347	242	64
87348	242	65
87349	242	66
87350	242	68
87351	242	69
87352	242	70
87353	242	71
87354	242	72
87355	242	73
87356	242	74
87357	242	75
87358	242	76
87359	242	77
87360	243	1
87361	243	2
87362	243	3
87363	243	4
87364	243	5
87365	243	6
87366	243	7
87367	243	8
87368	243	9
87369	243	10
87370	243	11
87371	243	12
87372	243	13
87373	243	14
87374	243	15
87375	243	16
87376	243	17
87377	243	18
87378	243	19
87379	243	20
87380	243	21
87381	243	22
87382	243	23
87383	243	24
87384	243	25
87385	243	26
87386	243	27
87387	243	28
87388	243	29
87389	243	30
87390	243	31
87391	243	32
87392	243	33
87393	243	34
87394	243	35
87395	243	36
87396	243	37
87397	243	38
87398	243	39
87399	243	40
87400	243	41
87401	243	42
87402	243	43
87403	243	44
87404	243	45
87405	243	46
87406	243	47
87407	243	48
87408	243	49
87409	243	50
87410	243	51
87411	243	52
87412	243	53
87413	243	54
87414	243	55
87415	243	56
87416	243	57
87417	243	58
87418	243	59
87419	243	60
87420	243	61
87421	243	62
87422	243	63
87423	243	64
87424	243	65
87425	243	66
87426	243	68
87427	243	69
87428	243	70
87429	243	71
87430	243	72
87431	243	73
87432	243	74
87433	243	75
87434	243	76
87435	243	77
87436	244	1
87437	244	2
87438	244	3
87439	244	4
87440	244	5
87441	244	6
87442	244	7
87443	244	8
87444	244	9
87445	244	10
87446	244	11
87447	244	12
87448	244	13
87449	244	14
87450	244	15
87451	244	16
87452	244	17
87453	244	18
87454	244	19
87455	244	20
87456	244	21
87457	244	22
87458	244	23
87459	244	24
87460	244	25
87461	244	26
87462	244	27
87463	244	28
87464	244	29
87465	244	30
87466	244	31
87467	244	32
87468	244	33
87469	244	34
87470	244	35
87471	244	36
87472	244	37
87473	244	38
87474	244	39
87475	244	40
87476	244	41
87477	244	42
87478	244	43
87479	244	44
87480	244	45
87481	244	46
87482	244	47
87483	244	48
87484	244	49
87485	244	50
87486	244	51
87487	244	52
87488	244	53
87489	244	54
87490	244	55
87491	244	56
87492	244	57
87493	244	58
87494	244	59
87495	244	60
87496	244	61
87497	244	62
87498	244	63
87499	244	64
87500	244	65
87501	244	66
87502	244	68
87503	244	69
87504	244	70
87505	244	71
87506	244	72
87507	244	73
87508	244	74
87509	244	75
87510	244	76
87511	244	77
87512	245	1
87513	245	2
87514	245	3
87515	245	4
87516	245	5
87517	245	6
87518	245	7
87519	245	8
87520	245	9
87521	245	10
87522	245	11
87523	245	12
87524	245	13
87525	245	14
87526	245	15
87527	245	16
87528	245	17
87529	245	18
87530	245	19
87531	245	20
87532	245	21
87533	245	22
87534	245	23
87535	245	24
87536	245	25
87537	245	26
87538	245	27
87539	245	28
87540	245	29
87541	245	30
87542	245	31
87543	245	32
87544	245	33
87545	245	34
87546	245	35
87547	245	36
87548	245	37
87549	245	38
87550	245	39
87551	245	40
87552	245	41
87553	245	42
87554	245	43
87555	245	44
87556	245	45
87557	245	46
87558	245	47
87559	245	48
87560	245	49
87561	245	50
87562	245	51
87563	245	52
87564	245	53
87565	245	54
87566	245	55
87567	245	56
87568	245	57
87569	245	58
87570	245	59
87571	245	60
87572	245	61
87573	245	62
87574	245	63
87575	245	64
87576	245	65
87577	245	66
87578	245	68
87579	245	73
87580	245	74
87581	245	75
87582	245	76
87583	245	77
87584	246	1
87585	246	2
87586	246	3
87587	246	4
87588	246	5
87589	246	6
87590	246	7
87591	246	8
87592	246	9
87593	246	10
87594	246	11
87595	246	12
87596	246	13
87597	246	14
87598	246	15
87599	246	16
87600	246	17
87601	246	18
87602	246	19
87603	246	20
87604	246	21
87605	246	22
87606	246	23
87607	246	24
87608	246	25
87609	246	26
87610	246	27
87611	246	28
87612	246	29
87613	246	30
87614	246	31
87615	246	32
87616	246	33
87617	246	34
87618	246	35
87619	246	36
87620	246	37
87621	246	38
87622	246	39
87623	246	40
87624	246	41
87625	246	42
87626	246	43
87627	246	44
87628	246	45
87629	246	46
87630	246	47
87631	246	48
87632	246	49
87633	246	50
87634	246	51
87635	246	52
87636	246	53
87637	246	54
87638	246	55
87639	246	56
87640	246	57
87641	246	59
87642	246	62
87643	246	63
87644	246	64
87645	246	65
87646	246	66
87647	246	73
87648	246	74
87649	246	75
87650	246	76
87651	246	77
19498	219	73
19499	219	74
19500	219	75
19501	219	76
19502	219	77
19503	220	73
19504	220	74
19505	220	75
19506	220	76
19507	220	77
19508	222	73
19509	222	74
19510	222	75
19511	222	76
19512	222	77
\.

COPY public.user_farmer (id, birthday, parent_name, is_unknown, created_by_id, user_id, smartphone, country, user_code) FROM stdin;
\.

COPY public.user_farmer_companies (id, farmer_id, company_id) FROM stdin;
\.

COPY public.user_farmer_cooling_units (id, farmer_id, coolingunit_id) FROM stdin;
\.

COPY public.user_farmersurvey (id, user_type, experience, experience_duration, farmer_id, date_filled_in, date_last_modified) FROM stdin;
\.

COPY public.user_farmersurveycommodity (id, average_price, crop_id, farmer_survey_id, unit, average_season_in_months, quantity_below_market_price, quantity_self_consumed, quantity_sold, quantity_total, currency, date_filled_in, date_last_modified, kg_in_unit, reason_for_loss) FROM stdin;
\.

COPY public.user_genericusercode (id, type, code, expiration_date, user_id) FROM stdin;
\.

COPY public.user_invitationuser (id, user_type, phone, expiration_date, code, sender_id, date_invitation_sent) FROM stdin;
\.

COPY public.user_invitationuser_cooling_units (id, invitationuser_id, coolingunit_id) FROM stdin;
\.

COPY public.user_notification (id, seen, date, specific_id, event_type, user_id) FROM stdin;
\.

COPY public.user_operator (id, company_id, user_id) FROM stdin;
\.

COPY public.user_serviceprovider (id, company_id, user_id) FROM stdin;
\.

COPY public.user_user (id, password, is_superuser, is_staff, is_active, date_joined, username, first_name, last_name, email, phone, gender, last_login, language, is_email_public, is_phone_public) FROM stdin;
\.

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 9, true);

SELECT pg_catalog.setval('public.auth_permission_id_seq', 235, true);

SELECT pg_catalog.setval('public.cooling_unit_metrics_id_seq', 1, false);

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 46, true);

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, true);

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 75, true);

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);

SELECT pg_catalog.setval('public.django_content_type_id_seq', 57, true);

SELECT pg_catalog.setval('public.django_migrations_id_seq', 168, true);

SELECT pg_catalog.setval('public.farmer_metrics_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_companydeliverycontact_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_coupon_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_marketlistedcrate_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_marketlistedcrateprice_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_order_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_ordercrateitem_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_ordercrateitem_resulting_crates_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_orderpickupdetails_id_seq', 1, false);

SELECT pg_catalog.setval('public.marketplace_paystackaccount_id_seq', 1, false);

SELECT pg_catalog.setval('public.operation_checkin_id_seq', 1, false);

SELECT pg_catalog.setval('public.operation_checkout_id_seq', 1, false);

SELECT pg_catalog.setval('public.operation_marketsurvey_id_seq', 1, false);

SELECT pg_catalog.setval('public.operation_marketsurveycheckout_id_seq', 1, false);

SELECT pg_catalog.setval('public.operation_marketsurveypreprocessing_id_seq', 1, false);

SELECT pg_catalog.setval('public.operation_movement_id_seq', 1, false);

SELECT pg_catalog.setval('public.prediction_market_id_seq', 4023, true);

SELECT pg_catalog.setval('public.prediction_mlmarketdataindia_id_seq', 3844412, true);

SELECT pg_catalog.setval('public.prediction_mlmarketdatanigeria_id_seq', 18026, true);

SELECT pg_catalog.setval('public.prediction_mlpredictiondata_id_seq', 337641, true);

SELECT pg_catalog.setval('public.prediction_mlpredictiondatang_id_seq', 62824, true);

SELECT pg_catalog.setval('public.prediction_state_id_seq', 36, true);

SELECT pg_catalog.setval('public.prediction_stateng_id_seq', 36, true);

SELECT pg_catalog.setval('public.storage_coolingunit_date_operator_assigned_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_coolingunit_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_coolingunit_operators_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_coolingunitcrop_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_coolingunitpower_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_coolingunitspecifications_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_crate_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_cratepartialcheckout_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_crop_id_seq', 77, true);

SELECT pg_catalog.setval('public.storage_croptype_id_seq', 4, true);

SELECT pg_catalog.setval('public.storage_location_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_operatorassignedcoolingunit_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_pricing_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_produce_id_seq', 1, false);

SELECT pg_catalog.setval('public.storage_sensorusermodel_id_seq', 7, true);

SELECT pg_catalog.setval('public.user_bankaccount_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_company_crop_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_company_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_country_crop_id_seq', 19512, true);

SELECT pg_catalog.setval('public.user_country_id_seq', 246, true);

SELECT pg_catalog.setval('public.user_farmer_companies_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_farmer_cooling_units_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_farmer_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_farmersurvey_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_farmersurveycommodity_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_genericusercode_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_invitationuser_cooling_units_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_invitationuser_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_notification_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_operator_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_serviceprovider_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_user_id_seq', 1, false);

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.company_metrics
    ADD CONSTRAINT company_metrics_pkey PRIMARY KEY (company_id);

ALTER TABLE ONLY public.cooling_unit_metrics
    ADD CONSTRAINT cooling_unit_metrics_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);

ALTER TABLE ONLY public.farmer_metrics
    ADD CONSTRAINT farmer_metrics_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_companydeliverycontact
    ADD CONSTRAINT marketplace_companydeliverycontact_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_coupon
    ADD CONSTRAINT marketplace_coupon_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_marketlistedcrate
    ADD CONSTRAINT marketplace_marketlistedcrate_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_marketlistedcrateprice
    ADD CONSTRAINT marketplace_marketlistedcrateprice_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_order
    ADD CONSTRAINT marketplace_order_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_ordercrateitem_resulting_crates
    ADD CONSTRAINT marketplace_ordercrateit_ordercrateitem_id_crate__27313d59_uniq UNIQUE (ordercrateitem_id, crate_id);

ALTER TABLE ONLY public.marketplace_ordercrateitem
    ADD CONSTRAINT marketplace_ordercrateitem_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_ordercrateitem_resulting_crates
    ADD CONSTRAINT marketplace_ordercrateitem_resulting_crates_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_orderpickupdetails
    ADD CONSTRAINT marketplace_orderpickupdetails_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_paystackaccount
    ADD CONSTRAINT marketplace_paystackaccount_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.marketplace_orderpickupdetails
    ADD CONSTRAINT only_one_per_cooling_unit_and_order UNIQUE (order_id, cooling_unit_id);

ALTER TABLE ONLY public.operation_checkin
    ADD CONSTRAINT operation_checkin_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.operation_checkout
    ADD CONSTRAINT operation_checkout_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.operation_marketsurvey
    ADD CONSTRAINT operation_marketsurvey_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.operation_marketsurvey_checkout
    ADD CONSTRAINT operation_marketsurveych_checkout_id_marketsurvey_a43043d5_uniq UNIQUE (checkout_id, marketsurvey_id);

ALTER TABLE ONLY public.operation_marketsurvey_checkout
    ADD CONSTRAINT operation_marketsurveycheckout_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.operation_marketsurveypreprocessing
    ADD CONSTRAINT operation_marketsurveypreprocessing_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.operation_movement
    ADD CONSTRAINT operation_movement_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.prediction_market
    ADD CONSTRAINT prediction_market_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.prediction_mlmarketdataindia
    ADD CONSTRAINT prediction_mlmarketdataindia_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.prediction_mlmarketdatanigeria
    ADD CONSTRAINT prediction_mlmarketdatanigeria_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.prediction_mlpredictiondata
    ADD CONSTRAINT prediction_mlpredictiondata_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.prediction_mlpredictiondatang
    ADD CONSTRAINT prediction_mlpredictiondatang_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.prediction_state
    ADD CONSTRAINT prediction_state_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.prediction_stateng
    ADD CONSTRAINT prediction_stateng_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_coolingunit_date_operator_assigned
    ADD CONSTRAINT storage_coolingunit_date_coolingunit_id_operatora_04481c4b_uniq UNIQUE (coolingunit_id, operatorassignedcoolingunit_id);

ALTER TABLE ONLY public.storage_coolingunit_date_operator_assigned
    ADD CONSTRAINT storage_coolingunit_date_operator_assigned_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_coolingunit_operators
    ADD CONSTRAINT storage_coolingunit_oper_coolingunit_id_user_id_0ea5ad80_uniq UNIQUE (coolingunit_id, user_id);

ALTER TABLE ONLY public.storage_coolingunit_operators
    ADD CONSTRAINT storage_coolingunit_operators_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_coolingunit
    ADD CONSTRAINT storage_coolingunit_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_coolingunitcrop
    ADD CONSTRAINT storage_coolingunitcrop_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_coolingunitcrop
    ADD CONSTRAINT storage_coolingunitcrop_pricing_id_increment UNIQUE (pricing_id);

ALTER TABLE ONLY public.storage_coolingunitcrop
    ADD CONSTRAINT storage_coolingunitcrop_unique UNIQUE (pricing_id);

ALTER TABLE ONLY public.storage_coolingunitpower
    ADD CONSTRAINT storage_coolingunitpower_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_coolingunitspecifications
    ADD CONSTRAINT storage_coolingunitspecifications_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_crate
    ADD CONSTRAINT storage_crate_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_cratepartialcheckout
    ADD CONSTRAINT storage_cratepartialcheckout_checkout_id_crate_id_09e875f1_uniq UNIQUE (checkout_id, crate_id);

ALTER TABLE ONLY public.storage_cratepartialcheckout
    ADD CONSTRAINT storage_cratepartialcheckout_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_crop
    ADD CONSTRAINT storage_crop_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_croptype
    ADD CONSTRAINT storage_croptype_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_location
    ADD CONSTRAINT storage_location_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_operatorassignedcoolingunit
    ADD CONSTRAINT storage_operatorassignedcoolingunit_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_pricing
    ADD CONSTRAINT storage_pricing_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_produce
    ADD CONSTRAINT storage_produce_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.storage_sensorusermodel
    ADD CONSTRAINT storage_sensorusermodel_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_bankaccount
    ADD CONSTRAINT user_bankaccount_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_company_crop
    ADD CONSTRAINT user_company_crop_company_id_crop_id_ea448d0f_uniq UNIQUE (company_id, crop_id);

ALTER TABLE ONLY public.user_company_crop
    ADD CONSTRAINT user_company_crop_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_company
    ADD CONSTRAINT user_company_name_key UNIQUE (name);

ALTER TABLE ONLY public.user_company
    ADD CONSTRAINT user_company_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_country_crop
    ADD CONSTRAINT user_country_crop_country_id_crop_id_92ac779f_uniq UNIQUE (country_id, crop_id);

ALTER TABLE ONLY public.user_country_crop
    ADD CONSTRAINT user_country_crop_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_country
    ADD CONSTRAINT user_country_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_farmer_companies
    ADD CONSTRAINT user_farmer_companies_farmer_id_company_id_bb19ff6d_uniq UNIQUE (farmer_id, company_id);

ALTER TABLE ONLY public.user_farmer_companies
    ADD CONSTRAINT user_farmer_companies_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_farmer_cooling_units
    ADD CONSTRAINT user_farmer_cooling_unit_farmer_id_coolingunit_id_6235b518_uniq UNIQUE (farmer_id, coolingunit_id);

ALTER TABLE ONLY public.user_farmer_cooling_units
    ADD CONSTRAINT user_farmer_cooling_units_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_farmer
    ADD CONSTRAINT user_farmer_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_farmer
    ADD CONSTRAINT user_farmer_user_code_key UNIQUE (user_code);

ALTER TABLE ONLY public.user_farmer
    ADD CONSTRAINT user_farmer_user_id_key UNIQUE (user_id);

ALTER TABLE ONLY public.user_farmersurvey
    ADD CONSTRAINT user_farmersurvey_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_farmersurveycommodity
    ADD CONSTRAINT user_farmersurveycommodity_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_genericusercode
    ADD CONSTRAINT user_genericusercode_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_genericusercode
    ADD CONSTRAINT user_genericusercode_user_id_key UNIQUE (user_id);

ALTER TABLE ONLY public.user_invitationuser_cooling_units
    ADD CONSTRAINT user_invitationuser_cool_invitationuser_id_coolin_d77d8218_uniq UNIQUE (invitationuser_id, coolingunit_id);

ALTER TABLE ONLY public.user_invitationuser_cooling_units
    ADD CONSTRAINT user_invitationuser_cooling_units_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_invitationuser
    ADD CONSTRAINT user_invitationuser_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_operator
    ADD CONSTRAINT user_operator_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_operator
    ADD CONSTRAINT user_operator_user_id_key UNIQUE (user_id);

ALTER TABLE ONLY public.user_serviceprovider
    ADD CONSTRAINT user_serviceprovider_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_serviceprovider
    ADD CONSTRAINT user_serviceprovider_user_id_key UNIQUE (user_id);

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_username_key UNIQUE (username);

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);

CREATE INDEX marketplace_companydeliverycontact_company_id_6d4cdf2e ON public.marketplace_companydeliverycontact USING btree (company_id);

CREATE INDEX marketplace_companydeliverycontact_created_by_user_id_e5a4e291 ON public.marketplace_companydeliverycontact USING btree (created_by_user_id);

CREATE INDEX marketplace_coupon_created_by_user_id_3a54f124 ON public.marketplace_coupon USING btree (created_by_user_id);

CREATE INDEX marketplace_coupon_owned_by_user_id_a38b95ce ON public.marketplace_coupon USING btree (owned_by_user_id);

CREATE INDEX marketplace_coupon_owned_on_behalf_of_company_id_4e446896 ON public.marketplace_coupon USING btree (owned_on_behalf_of_company_id);

CREATE INDEX marketplace_marketlistedcr_market_listed_crate_id_696a7b2b ON public.marketplace_marketlistedcrateprice USING btree (market_listed_crate_id);

CREATE INDEX marketplace_marketlistedcrate_crate_id_f55f2e32 ON public.marketplace_marketlistedcrate USING btree (crate_id);

CREATE INDEX marketplace_marketlistedcrateprice_created_by_user_id_b93e8a1f ON public.marketplace_marketlistedcrateprice USING btree (created_by_user_id);

CREATE INDEX marketplace_order_created_by_user_id_2e110d5d ON public.marketplace_order USING btree (created_by_user_id);

CREATE INDEX marketplace_order_on_behalf_of_company_id_99b7b8c3 ON public.marketplace_order USING btree (owned_on_behalf_of_company_id);

CREATE INDEX marketplace_ordercrateitem_coupon_id_7cedd386 ON public.marketplace_ordercrateitem USING btree (coupon_id);

CREATE INDEX marketplace_ordercrateitem_market_listed_crate_id_1277405f ON public.marketplace_ordercrateitem USING btree (market_listed_crate_id);

CREATE INDEX marketplace_ordercrateitem_order_id_f5fe824e ON public.marketplace_ordercrateitem USING btree (order_id);

CREATE INDEX marketplace_ordercrateitem_ordercrateitem_id_2109765e ON public.marketplace_ordercrateitem_resulting_crates USING btree (ordercrateitem_id);

CREATE INDEX marketplace_ordercrateitem_resulting_crates_crate_id_0a89fe5e ON public.marketplace_ordercrateitem_resulting_crates USING btree (crate_id);

CREATE INDEX marketplace_orderpickupdetails_cooling_unit_id_15d4c52e ON public.marketplace_orderpickupdetails USING btree (cooling_unit_id);

CREATE INDEX marketplace_orderpickupdetails_order_id_7e33bee1 ON public.marketplace_orderpickupdetails USING btree (order_id);

CREATE INDEX marketplace_paystackaccount_company_id_71620f44 ON public.marketplace_paystackaccount USING btree (owned_on_behalf_of_company_id);

CREATE INDEX marketplace_paystackaccount_created_by_user_id_f42f6a38 ON public.marketplace_paystackaccount USING btree (created_by_user_id);

CREATE INDEX marketplace_paystackaccount_owned_by_user_id_d088f98b ON public.marketplace_paystackaccount USING btree (owned_by_user_id);

CREATE INDEX mlmarketdataindia_date_desc ON public.prediction_mlmarketdataindia USING btree (date DESC);

CREATE INDEX mlmarketdatanigeria_date_desc ON public.prediction_mlmarketdatanigeria USING btree (date DESC);

CREATE INDEX operation_checkin_movement_id_bb203ece ON public.operation_checkin USING btree (movement_id);

CREATE INDEX operation_checkin_owner_on_behalf_of_company_id_1f5e6064 ON public.operation_checkin USING btree (owned_on_behalf_of_company_id);

CREATE INDEX operation_checkin_owner_user_id_fbca748a ON public.operation_checkin USING btree (owned_by_user_id);

CREATE INDEX operation_checkout_movement_id_de76fa46 ON public.operation_checkout USING btree (movement_id);

CREATE INDEX operation_marketsurvey_checkout_id_e8e77c06 ON public.operation_marketsurvey USING btree (checkout_id);

CREATE INDEX operation_marketsurvey_crop_id_a0843a7b ON public.operation_marketsurvey USING btree (crop_id);

CREATE INDEX operation_marketsurvey_market_link_id_83807b74 ON public.operation_marketsurvey USING btree (market_id);

CREATE INDEX operation_marketsurveycheckout_checkout_id_de8cdc81 ON public.operation_marketsurvey_checkout USING btree (checkout_id);

CREATE INDEX operation_marketsurveycheckout_marketsurvey_id_8d6f58fd ON public.operation_marketsurvey_checkout USING btree (marketsurvey_id);

CREATE INDEX operation_marketsurveypreprocessing_checkout_id_add5cc1f ON public.operation_marketsurveypreprocessing USING btree (checkout_id);

CREATE INDEX operation_marketsurveypreprocessing_crop_id_15608c0a ON public.operation_marketsurveypreprocessing USING btree (crop_id);

CREATE INDEX operation_marketsurveypreprocessing_farmer_id_70521adc ON public.operation_marketsurveypreprocessing USING btree (farmer_id);

CREATE INDEX operation_marketsurveypreprocessing_operator_id_f755aa9d ON public.operation_marketsurveypreprocessing USING btree (operator_id);

CREATE INDEX operation_movement_operator_id_5018f16b ON public.operation_movement USING btree (operator_id);

CREATE INDEX operation_movement_order_id_ee673e90 ON public.operation_movement USING btree (order_id);

CREATE INDEX prediction_market_state_id_176660e6 ON public.prediction_market USING btree (state_id);

CREATE INDEX prediction_mlmarketdataindia_crop_id_0335b5ea ON public.prediction_mlmarketdataindia USING btree (crop_id);

CREATE INDEX prediction_mlmarketdataindia_market_id_f059fb65 ON public.prediction_mlmarketdataindia USING btree (market_id);

CREATE INDEX prediction_mlmarketdatanigeria_crop_id_71f61dae ON public.prediction_mlmarketdatanigeria USING btree (crop_id);

CREATE INDEX prediction_mlmarketdatanigeria_state_id_43f4c7d0 ON public.prediction_mlmarketdatanigeria USING btree (state_id);

CREATE INDEX prediction_mlpredictiondata_crop_id_a803384e ON public.prediction_mlpredictiondata USING btree (crop_id);

CREATE INDEX prediction_mlpredictiondata_market_id_d75e68f9 ON public.prediction_mlpredictiondata USING btree (market_id);

CREATE INDEX prediction_mlpredictiondatang_crop_id_4ac9da01 ON public.prediction_mlpredictiondatang USING btree (crop_id);

CREATE INDEX prediction_mlpredictiondatang_state_id_11178ee8 ON public.prediction_mlpredictiondatang USING btree (state_id);

CREATE INDEX prediction_state_country_id_2422624e ON public.prediction_state USING btree (country_id);

CREATE INDEX prediction_stateng_country_id_2eecef1b ON public.prediction_stateng USING btree (country_id);

CREATE INDEX quicker_coupon_lookup ON public.marketplace_ordercrateitem USING btree (coupon_id);

CREATE INDEX quicker_order_items_lookup ON public.marketplace_ordercrateitem USING btree (order_id);

CREATE INDEX quicker_order_pickup_lookup ON public.marketplace_orderpickupdetails USING btree (order_id);

CREATE INDEX quicker_user_order_lookup ON public.marketplace_order USING btree (created_by_user_id, status);

CREATE INDEX storage_coolingunit_date_o_coolingunit_id_0462410a ON public.storage_coolingunit_date_operator_assigned USING btree (coolingunit_id);

CREATE INDEX storage_coolingunit_date_o_operatorassignedcoolinguni_41e7d5e9 ON public.storage_coolingunit_date_operator_assigned USING btree (operatorassignedcoolingunit_id);

CREATE INDEX storage_coolingunit_location_id_d8bbecbd ON public.storage_coolingunit USING btree (location_id);

CREATE INDEX storage_coolingunit_operators_coolingunit_id_74b69fff ON public.storage_coolingunit_operators USING btree (coolingunit_id);

CREATE INDEX storage_coolingunit_operators_user_id_fe9d45b1 ON public.storage_coolingunit_operators USING btree (user_id);

CREATE INDEX storage_coolingunitcrop_cooling_unit_id_220b67a7 ON public.storage_coolingunitcrop USING btree (cooling_unit_id);

CREATE INDEX storage_coolingunitcrop_crop_id_5e1b23a4 ON public.storage_coolingunitcrop USING btree (crop_id);

CREATE INDEX storage_coolingunitcrop_pricing_id_c0037809 ON public.storage_coolingunitcrop USING btree (pricing_id);

CREATE INDEX storage_coolingunitpower_cooling_unit_id_bc3dd830 ON public.storage_coolingunitpower USING btree (cooling_unit_id);

CREATE INDEX storage_coolingunitspecifications_cooling_unit_id_533f492a ON public.storage_coolingunitspecifications USING btree (cooling_unit_id);

CREATE INDEX storage_crate_cooling_unit_id_aa4136b8 ON public.storage_crate USING btree (cooling_unit_id);

CREATE INDEX storage_crate_produce_id_0cc811ea ON public.storage_crate USING btree (produce_id);

CREATE INDEX storage_cratepartialcheckout_checkout_id_7ca0d568 ON public.storage_cratepartialcheckout USING btree (checkout_id);

CREATE INDEX storage_cratepartialcheckout_crate_id_2ff8297a ON public.storage_cratepartialcheckout USING btree (crate_id);

CREATE INDEX storage_crop_crop_type_id_d33138ca ON public.storage_crop USING btree (crop_type_id);

CREATE INDEX storage_location_company_id_793fbfd9 ON public.storage_location USING btree (company_id);

CREATE INDEX storage_operatorassignedcoolingunit_operator_id_ed54b3f1 ON public.storage_operatorassignedcoolingunit USING btree (operator_id);

CREATE INDEX storage_produce_check_in_id_c3d00813 ON public.storage_produce USING btree (checkin_id);

CREATE INDEX storage_produce_crop_id_cbf9d8b8 ON public.storage_produce USING btree (crop_id);

CREATE UNIQUE INDEX storage_sensorusermodel_id_idx ON public.storage_sensorusermodel USING btree (id);

CREATE UNIQUE INDEX unique_active_listing_per_crate ON public.marketplace_marketlistedcrate USING btree (crate_id) WHERE (delisted_at IS NULL);

CREATE UNIQUE INDEX unique_default_owned_on_behalf_of_company_account ON public.marketplace_paystackaccount USING btree (owned_on_behalf_of_company_id, is_default_account) WHERE (is_default_account AND (owned_on_behalf_of_company_id IS NOT NULL));

CREATE UNIQUE INDEX unique_default_user_account ON public.marketplace_paystackaccount USING btree (owned_by_user_id, is_default_account) WHERE (is_default_account AND (owned_on_behalf_of_company_id IS NULL));

CREATE UNIQUE INDEX unique_valid_coupon_per_user ON public.marketplace_coupon USING btree (created_by_user_id, code) WHERE (revoked_at IS NULL);

CREATE INDEX user_company_bank_account_id_9067c771 ON public.user_company USING btree (bank_account_id);

CREATE INDEX user_company_crop_company_id_ee978d5f ON public.user_company_crop USING btree (company_id);

CREATE INDEX user_company_crop_crop_id_2e4b0723 ON public.user_company_crop USING btree (crop_id);

CREATE INDEX user_company_name_8c5b5791_like ON public.user_company USING btree (name varchar_pattern_ops);

CREATE INDEX user_country_crop_country_id_f6931fb4 ON public.user_country_crop USING btree (country_id);

CREATE INDEX user_country_crop_crop_id_4d0b375c ON public.user_country_crop USING btree (crop_id);

CREATE INDEX user_farmer_companies_company_id_dd540361 ON public.user_farmer_companies USING btree (company_id);

CREATE INDEX user_farmer_companies_farmer_id_f07efca9 ON public.user_farmer_companies USING btree (farmer_id);

CREATE INDEX user_farmer_cooling_units_coolingunit_id_4903e2d0 ON public.user_farmer_cooling_units USING btree (coolingunit_id);

CREATE INDEX user_farmer_cooling_units_farmer_id_eff707ad ON public.user_farmer_cooling_units USING btree (farmer_id);

CREATE INDEX user_farmer_created_by_id_fcb611a0 ON public.user_farmer USING btree (created_by_id);

CREATE INDEX user_farmer_user_code_8d39bfcb_like ON public.user_farmer USING btree (user_code varchar_pattern_ops);

CREATE INDEX user_farmersurvey_farmer_id_499ceff8 ON public.user_farmersurvey USING btree (farmer_id);

CREATE INDEX user_farmersurveycommodity_crop_id_b7293b41 ON public.user_farmersurveycommodity USING btree (crop_id);

CREATE INDEX user_farmersurveycommodity_farmer_survey_id_0b2a71f2 ON public.user_farmersurveycommodity USING btree (farmer_survey_id);

CREATE INDEX user_invitationuser_cooling_units_coolingunit_id_b353da17 ON public.user_invitationuser_cooling_units USING btree (coolingunit_id);

CREATE INDEX user_invitationuser_cooling_units_invitationuser_id_dc8bc6b1 ON public.user_invitationuser_cooling_units USING btree (invitationuser_id);

CREATE INDEX user_invitationuser_sender_id_5c3ba06d ON public.user_invitationuser USING btree (sender_id);

CREATE INDEX user_notification_user_id_66a31b4a ON public.user_notification USING btree (user_id);

CREATE INDEX user_operator_company_id_6f6c63a9 ON public.user_operator USING btree (company_id);

CREATE INDEX user_serviceprovider_company_id_4400bbac ON public.user_serviceprovider USING btree (company_id);

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);

CREATE INDEX user_user_username_e2bdfe0c_like ON public.user_user USING btree (username varchar_pattern_ops);

CREATE OR REPLACE VIEW public.analytics_crate_movements AS
 WITH avg_market_survey AS (
         SELECT scp.checkout_id,
            sp_1.crop_id,
            (sum(ms.loss) / NULLIF(count(sc_1.id), 0)) AS average_checkout_loss_in_kg,
            (sum(ms.price) / (NULLIF(count(sc_1.id), 0))::double precision) AS average_checkout_survey_price
           FROM (((public.storage_crate sc_1
             LEFT JOIN public.storage_cratepartialcheckout scp ON ((sc_1.id = scp.crate_id)))
             JOIN public.storage_produce sp_1 ON ((sc_1.produce_id = sp_1.id)))
             LEFT JOIN public.operation_marketsurvey ms ON ((scp.checkout_id = ms.checkout_id)))
          GROUP BY scp.checkout_id, sp_1.crop_id
        ), avg_price_per_crate AS (
         SELECT cko_1.id AS checkout_id,
            (cko_1.cmp_total_amount / (NULLIF(count(sc_1.id), 0))::double precision) AS avg_price_per_crate
           FROM ((public.operation_checkout cko_1
             LEFT JOIN public.storage_cratepartialcheckout scp ON ((scp.checkout_id = cko_1.id)))
             LEFT JOIN public.storage_crate sc_1 ON ((sc_1.id = scp.crate_id)))
          GROUP BY cko_1.id
        ), cte_scp_name AS (
         SELECT scp.id AS crop_id,
            max(sc_1.id) AS crate_id,
            max(sp_1.id) AS produce_id,
            max((scp.name)::text) AS crop_name
           FROM ((public.storage_crate sc_1
             LEFT JOIN public.storage_produce sp_1 ON ((sp_1.id = sc_1.produce_id)))
             LEFT JOIN public.storage_crop scp ON ((scp.id = sp_1.crop_id)))
          GROUP BY scp.id
        ), maximum_checkout AS (
         SELECT sc_1.id AS crate_id,
            max(om_1.date) AS max_checkout_date
           FROM (((public.storage_crate sc_1
             LEFT JOIN public.storage_cratepartialcheckout scp ON ((sc_1.id = scp.crate_id)))
             LEFT JOIN public.operation_checkout cko_1 ON ((cko_1.id = scp.checkout_id)))
             LEFT JOIN public.operation_movement om_1 ON ((cko_1.movement_id = om_1.id)))
          WHERE (sc_1.cmp_fully_checked_out = true)
          GROUP BY sc_1.id
        ), checkout_info AS (
         SELECT sc_1.id,
            scp.checkout_id,
            sp_1.crop_id,
            om_1.date AS checkout_date,
            cko_1.cmp_total_amount AS checkout_price,
            cko_1.movement_id,
            om_1.operator_id AS checkout_operator,
            ms.average_checkout_loss_in_kg AS checkout_loss_in_kg,
            ms.average_checkout_survey_price AS checkout_survey_price
           FROM ((((((public.storage_crate sc_1
             LEFT JOIN public.storage_cratepartialcheckout scp ON ((sc_1.id = scp.crate_id)))
             LEFT JOIN public.operation_checkout cko_1 ON ((cko_1.id = scp.checkout_id)))
             LEFT JOIN public.operation_movement om_1 ON ((cko_1.movement_id = om_1.id)))
             LEFT JOIN public.storage_produce sp_1 ON ((sc_1.produce_id = sp_1.id)))
             LEFT JOIN avg_market_survey ms ON (((scp.checkout_id = ms.checkout_id) AND (sp_1.crop_id = ms.crop_id))))
             JOIN maximum_checkout mc ON (((mc.crate_id = sc_1.id) AND (mc.max_checkout_date = om_1.date))))
        )
 SELECT sc.id AS storage_crate_id,
    sc.cooling_unit_id,
    sc.currency,
    sc.weight,
    sp.crop_id,
    cin.id AS checkin_id,
    om.date AS checkin_date,
    om.operator_id AS checkin_operator,
    uu.id AS checkin_user,
    uf.id AS checkin_farmer,
    fs.farmer_id AS survey_farmer,
    cko.checkout_id,
    cko.checkout_date,
    cko.checkout_price,
    cko.checkout_operator,
    cko.checkout_loss_in_kg,
    cko.checkout_survey_price,
    apc.avg_price_per_crate,
    csn.crop_name
   FROM (((((((((public.storage_crate sc
     LEFT JOIN checkout_info cko ON ((sc.id = cko.id)))
     LEFT JOIN public.storage_produce sp ON ((sc.produce_id = sp.id)))
     LEFT JOIN public.operation_checkin cin ON ((sp.checkin_id = cin.id)))
     LEFT JOIN public.operation_movement om ON ((cin.movement_id = om.id)))
     LEFT JOIN public.user_user uu ON ((cin.owned_by_user_id = uu.id)))
     LEFT JOIN public.user_farmer uf ON ((uf.user_id = uu.id)))
     LEFT JOIN public.user_farmersurvey fs ON ((fs.farmer_id = uf.id)))
     LEFT JOIN avg_price_per_crate apc ON ((apc.checkout_id = cko.checkout_id)))
     LEFT JOIN cte_scp_name csn ON ((csn.crop_id = sp.crop_id)));

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_companydeliverycontact
    ADD CONSTRAINT marketplace_companyd_company_id_6d4cdf2e_fk_user_comp FOREIGN KEY (company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_companydeliverycontact
    ADD CONSTRAINT marketplace_companyd_created_by_user_id_e5a4e291_fk_user_user FOREIGN KEY (created_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_coupon
    ADD CONSTRAINT marketplace_coupon_created_by_user_id_3a54f124_fk_user_user_id FOREIGN KEY (created_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_coupon
    ADD CONSTRAINT marketplace_coupon_owned_by_user_id_a38b95ce_fk_user_user_id FOREIGN KEY (owned_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_coupon
    ADD CONSTRAINT marketplace_coupon_owned_on_behalf_of_c_4e446896_fk_user_comp FOREIGN KEY (owned_on_behalf_of_company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_marketlistedcrate
    ADD CONSTRAINT marketplace_marketli_crate_id_f55f2e32_fk_storage_c FOREIGN KEY (crate_id) REFERENCES public.storage_crate(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_marketlistedcrateprice
    ADD CONSTRAINT marketplace_marketli_created_by_user_id_b93e8a1f_fk_user_user FOREIGN KEY (created_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_marketlistedcrateprice
    ADD CONSTRAINT marketplace_marketli_market_listed_crate__696a7b2b_fk_marketpla FOREIGN KEY (market_listed_crate_id) REFERENCES public.marketplace_marketlistedcrate(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_order
    ADD CONSTRAINT marketplace_order_created_by_user_id_2e110d5d_fk_user_user_id FOREIGN KEY (created_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_order
    ADD CONSTRAINT marketplace_order_owned_on_behalf_of_c_722f2d9e_fk_user_comp FOREIGN KEY (owned_on_behalf_of_company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_ordercrateitem
    ADD CONSTRAINT marketplace_ordercra_coupon_id_7cedd386_fk_marketpla FOREIGN KEY (coupon_id) REFERENCES public.marketplace_coupon(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_ordercrateitem_resulting_crates
    ADD CONSTRAINT marketplace_ordercra_crate_id_0a89fe5e_fk_storage_c FOREIGN KEY (crate_id) REFERENCES public.storage_crate(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_ordercrateitem
    ADD CONSTRAINT marketplace_ordercra_market_listed_crate__1277405f_fk_marketpla FOREIGN KEY (market_listed_crate_id) REFERENCES public.marketplace_marketlistedcrate(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_ordercrateitem
    ADD CONSTRAINT marketplace_ordercra_order_id_f5fe824e_fk_marketpla FOREIGN KEY (order_id) REFERENCES public.marketplace_order(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_ordercrateitem_resulting_crates
    ADD CONSTRAINT marketplace_ordercra_ordercrateitem_id_2109765e_fk_marketpla FOREIGN KEY (ordercrateitem_id) REFERENCES public.marketplace_ordercrateitem(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_orderpickupdetails
    ADD CONSTRAINT marketplace_orderpic_cooling_unit_id_15d4c52e_fk_storage_c FOREIGN KEY (cooling_unit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_orderpickupdetails
    ADD CONSTRAINT marketplace_orderpic_order_id_7e33bee1_fk_marketpla FOREIGN KEY (order_id) REFERENCES public.marketplace_order(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_paystackaccount
    ADD CONSTRAINT marketplace_paystack_created_by_user_id_f42f6a38_fk_user_user FOREIGN KEY (created_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_paystackaccount
    ADD CONSTRAINT marketplace_paystack_owned_by_user_id_d088f98b_fk_user_user FOREIGN KEY (owned_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.marketplace_paystackaccount
    ADD CONSTRAINT marketplace_paystack_owned_on_behalf_of_c_0dcb790e_fk_user_comp FOREIGN KEY (owned_on_behalf_of_company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_checkin
    ADD CONSTRAINT operation_checkin_movement_id_bb203ece_fk_operation_movement_id FOREIGN KEY (movement_id) REFERENCES public.operation_movement(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_checkin
    ADD CONSTRAINT operation_checkin_owned_by_user_id_d9a60852_fk_user_user_id FOREIGN KEY (owned_by_user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_checkin
    ADD CONSTRAINT operation_checkin_owned_on_behalf_of_c_70fbed07_fk_user_comp FOREIGN KEY (owned_on_behalf_of_company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_checkout
    ADD CONSTRAINT operation_checkout_movement_id_de76fa46_fk_operation FOREIGN KEY (movement_id) REFERENCES public.operation_movement(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurveypreprocessing
    ADD CONSTRAINT operation_marketsurv_checkout_id_add5cc1f_fk_operation FOREIGN KEY (checkout_id) REFERENCES public.operation_checkout(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurvey_checkout
    ADD CONSTRAINT operation_marketsurv_checkout_id_de8cdc81_fk_operation FOREIGN KEY (checkout_id) REFERENCES public.operation_checkout(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurvey
    ADD CONSTRAINT operation_marketsurv_checkout_id_e8e77c06_fk_operation FOREIGN KEY (checkout_id) REFERENCES public.operation_checkout(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurveypreprocessing
    ADD CONSTRAINT operation_marketsurv_crop_id_15608c0a_fk_storage_c FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurveypreprocessing
    ADD CONSTRAINT operation_marketsurv_farmer_id_70521adc_fk_user_farm FOREIGN KEY (farmer_id) REFERENCES public.user_farmer(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurvey
    ADD CONSTRAINT operation_marketsurv_market_id_99e9c305_fk_predictio FOREIGN KEY (market_id) REFERENCES public.prediction_market(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurvey_checkout
    ADD CONSTRAINT operation_marketsurv_marketsurvey_id_8d6f58fd_fk_operation FOREIGN KEY (marketsurvey_id) REFERENCES public.operation_marketsurvey(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurveypreprocessing
    ADD CONSTRAINT operation_marketsurv_operator_id_f755aa9d_fk_user_oper FOREIGN KEY (operator_id) REFERENCES public.user_operator(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_marketsurvey
    ADD CONSTRAINT operation_marketsurvey_crop_id_a0843a7b_fk_storage_crop_id FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_movement
    ADD CONSTRAINT operation_movement_operator_id_5018f16b_fk_user_operator_id FOREIGN KEY (operator_id) REFERENCES public.user_operator(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.operation_movement
    ADD CONSTRAINT operation_movement_order_id_ee673e90_fk_marketplace_order_id FOREIGN KEY (order_id) REFERENCES public.marketplace_order(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_market
    ADD CONSTRAINT prediction_market_state_id_176660e6_fk_prediction_state_id FOREIGN KEY (state_id) REFERENCES public.prediction_state(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlmarketdataindia
    ADD CONSTRAINT prediction_mlmarketd_crop_id_0335b5ea_fk_storage_c FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlmarketdatanigeria
    ADD CONSTRAINT prediction_mlmarketd_crop_id_71f61dae_fk_storage_c FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlmarketdataindia
    ADD CONSTRAINT prediction_mlmarketd_market_id_f059fb65_fk_predictio FOREIGN KEY (market_id) REFERENCES public.prediction_market(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlmarketdatanigeria
    ADD CONSTRAINT prediction_mlmarketd_state_id_43f4c7d0_fk_predictio FOREIGN KEY (state_id) REFERENCES public.prediction_stateng(id) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlpredictiondatang
    ADD CONSTRAINT prediction_mlpredict_crop_id_4ac9da01_fk_storage_c FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlpredictiondata
    ADD CONSTRAINT prediction_mlpredict_market_id_d75e68f9_fk_predictio FOREIGN KEY (market_id) REFERENCES public.prediction_market(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlpredictiondatang
    ADD CONSTRAINT prediction_mlpredict_state_id_11178ee8_fk_predictio FOREIGN KEY (state_id) REFERENCES public.prediction_stateng(id) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_mlpredictiondata
    ADD CONSTRAINT prediction_mlpredictiondata_crop_id_a803384e_fk_storage_crop_id FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_state
    ADD CONSTRAINT prediction_state_country_id_2422624e_fk_user_country_id FOREIGN KEY (country_id) REFERENCES public.user_country(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.prediction_stateng
    ADD CONSTRAINT prediction_stateng_country_id_2eecef1b_fk_user_country_id FOREIGN KEY (country_id) REFERENCES public.user_country(id) ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunit_date_operator_assigned
    ADD CONSTRAINT storage_coolingunit__coolingunit_id_0462410a_fk_storage_c FOREIGN KEY (coolingunit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunit_operators
    ADD CONSTRAINT storage_coolingunit__coolingunit_id_74b69fff_fk_storage_c FOREIGN KEY (coolingunit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunit_date_operator_assigned
    ADD CONSTRAINT storage_coolingunit__operatorassignedcool_41e7d5e9_fk_storage_o FOREIGN KEY (operatorassignedcoolingunit_id) REFERENCES public.storage_operatorassignedcoolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunit
    ADD CONSTRAINT storage_coolingunit_location_id_d8bbecbd_fk_storage_location_id FOREIGN KEY (location_id) REFERENCES public.storage_location(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunit_operators
    ADD CONSTRAINT storage_coolingunit_operators_user_id_fe9d45b1_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunitcrop
    ADD CONSTRAINT storage_coolingunitc_cooling_unit_id_220b67a7_fk_storage_c FOREIGN KEY (cooling_unit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunitcrop
    ADD CONSTRAINT storage_coolingunitc_pricing_id_c0037809_fk_storage_p FOREIGN KEY (pricing_id) REFERENCES public.storage_pricing(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunitcrop
    ADD CONSTRAINT storage_coolingunitcrop_crop_id_5e1b23a4_fk_storage_crop_id FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunitpower
    ADD CONSTRAINT storage_coolingunitp_cooling_unit_id_bc3dd830_fk_storage_c FOREIGN KEY (cooling_unit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_coolingunitspecifications
    ADD CONSTRAINT storage_coolingunits_cooling_unit_id_533f492a_fk_storage_c FOREIGN KEY (cooling_unit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_crate
    ADD CONSTRAINT storage_crate_cooling_unit_id_aa4136b8_fk_storage_c FOREIGN KEY (cooling_unit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_crate
    ADD CONSTRAINT storage_crate_produce_id_0cc811ea_fk_storage_produce_id FOREIGN KEY (produce_id) REFERENCES public.storage_produce(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_cratepartialcheckout
    ADD CONSTRAINT storage_cratepartial_checkout_id_7ca0d568_fk_operation FOREIGN KEY (checkout_id) REFERENCES public.operation_checkout(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_cratepartialcheckout
    ADD CONSTRAINT storage_cratepartial_crate_id_2ff8297a_fk_storage_c FOREIGN KEY (crate_id) REFERENCES public.storage_crate(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_crop
    ADD CONSTRAINT storage_crop_crop_type_id_d33138ca_fk_storage_croptype_id FOREIGN KEY (crop_type_id) REFERENCES public.storage_croptype(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_location
    ADD CONSTRAINT storage_location_company_id_793fbfd9_fk_user_company_id FOREIGN KEY (company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_operatorassignedcoolingunit
    ADD CONSTRAINT storage_operatorassi_operator_id_ed54b3f1_fk_user_user FOREIGN KEY (operator_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_produce
    ADD CONSTRAINT storage_produce_checkin_id_d3e60480_fk_operation_checkin_id FOREIGN KEY (checkin_id) REFERENCES public.operation_checkin(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.storage_produce
    ADD CONSTRAINT storage_produce_crop_id_cbf9d8b8_fk_storage_crop_id FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_company
    ADD CONSTRAINT user_company_bank_account_id_9067c771_fk_user_bankaccount_id FOREIGN KEY (bank_account_id) REFERENCES public.user_bankaccount(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_company_crop
    ADD CONSTRAINT user_company_crop_company_id_ee978d5f_fk_user_company_id FOREIGN KEY (company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_company_crop
    ADD CONSTRAINT user_company_crop_crop_id_2e4b0723_fk_storage_crop_id FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_country_crop
    ADD CONSTRAINT user_country_crop_country_id_f6931fb4_fk_user_country_id FOREIGN KEY (country_id) REFERENCES public.user_country(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_country_crop
    ADD CONSTRAINT user_country_crop_crop_id_4d0b375c_fk_storage_crop_id FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmer_companies
    ADD CONSTRAINT user_farmer_companies_company_id_dd540361_fk_user_company_id FOREIGN KEY (company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmer_companies
    ADD CONSTRAINT user_farmer_companies_farmer_id_f07efca9_fk_user_farmer_id FOREIGN KEY (farmer_id) REFERENCES public.user_farmer(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmer_cooling_units
    ADD CONSTRAINT user_farmer_cooling__coolingunit_id_4903e2d0_fk_storage_c FOREIGN KEY (coolingunit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmer_cooling_units
    ADD CONSTRAINT user_farmer_cooling_units_farmer_id_eff707ad_fk_user_farmer_id FOREIGN KEY (farmer_id) REFERENCES public.user_farmer(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmer
    ADD CONSTRAINT user_farmer_created_by_id_fcb611a0_fk_user_operator_id FOREIGN KEY (created_by_id) REFERENCES public.user_operator(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmer
    ADD CONSTRAINT user_farmer_user_id_572398c4_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmersurvey
    ADD CONSTRAINT user_farmersurvey_farmer_id_499ceff8_fk_user_farmer_id FOREIGN KEY (farmer_id) REFERENCES public.user_farmer(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmersurveycommodity
    ADD CONSTRAINT user_farmersurveycom_farmer_survey_id_0b2a71f2_fk_user_farm FOREIGN KEY (farmer_survey_id) REFERENCES public.user_farmersurvey(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_farmersurveycommodity
    ADD CONSTRAINT user_farmersurveycommodity_crop_id_b7293b41_fk_storage_crop_id FOREIGN KEY (crop_id) REFERENCES public.storage_crop(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_genericusercode
    ADD CONSTRAINT user_genericusercode_user_id_b13d6062_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_invitationuser_cooling_units
    ADD CONSTRAINT user_invitationuser__coolingunit_id_b353da17_fk_storage_c FOREIGN KEY (coolingunit_id) REFERENCES public.storage_coolingunit(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_invitationuser_cooling_units
    ADD CONSTRAINT user_invitationuser__invitationuser_id_dc8bc6b1_fk_user_invi FOREIGN KEY (invitationuser_id) REFERENCES public.user_invitationuser(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_invitationuser
    ADD CONSTRAINT user_invitationuser_sender_id_5c3ba06d_fk_user_user_id FOREIGN KEY (sender_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_notification
    ADD CONSTRAINT user_notification_user_id_66a31b4a_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_operator
    ADD CONSTRAINT user_operator_company_id_6f6c63a9_fk_user_company_id FOREIGN KEY (company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_operator
    ADD CONSTRAINT user_operator_user_id_5f245911_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_serviceprovider
    ADD CONSTRAINT user_serviceprovider_company_id_4400bbac_fk_user_company_id FOREIGN KEY (company_id) REFERENCES public.user_company(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_serviceprovider
    ADD CONSTRAINT user_serviceprovider_user_id_f42ec671_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;

