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

--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accus (
    id bigint NOT NULL,
    central_device_id bigint,
    application_date timestamp without time zone,
    livetime timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: accus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accus_id_seq OWNED BY public.accus.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    address_details public.hstore,
    address_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: alarm_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alarm_settings (
    id bigint NOT NULL,
    central_device_id bigint,
    outputs public.hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: alarm_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.alarm_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alarm_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.alarm_settings_id_seq OWNED BY public.alarm_settings.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: central_devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.central_devices (
    id bigint NOT NULL,
    device_number character varying,
    serial_number character varying,
    device_type character varying,
    location character varying,
    montage_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: central_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.central_devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: central_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.central_devices_id_seq OWNED BY public.central_devices.id;


--
-- Name: contact_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact_addresses (
    id bigint NOT NULL,
    address_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contact_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contact_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contact_addresses_id_seq OWNED BY public.contact_addresses.id;


--
-- Name: customer_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer_addresses (
    id bigint NOT NULL,
    address_id bigint,
    customer_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: customer_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_addresses_id_seq OWNED BY public.customer_addresses.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    customer_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: gas_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gas_types (
    id bigint NOT NULL,
    name character varying,
    chemical_formula character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: gas_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gas_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gas_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gas_types_id_seq OWNED BY public.gas_types.id;


--
-- Name: object_maintenances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.object_maintenances (
    id bigint NOT NULL,
    contact_address_id bigint,
    service_object_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: object_maintenances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.object_maintenances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: object_maintenances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.object_maintenances_id_seq OWNED BY public.object_maintenances.id;


--
-- Name: pg_search_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pg_search_documents (
    id bigint NOT NULL,
    content text,
    searchable_type character varying,
    searchable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pg_search_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pg_search_documents_id_seq OWNED BY public.pg_search_documents.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sensor_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sensor_types (
    id bigint NOT NULL,
    name character varying,
    default_min_value numeric,
    default_max_value numeric,
    default_livetime timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sensor_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sensor_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sensor_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sensor_types_id_seq OWNED BY public.sensor_types.id;


--
-- Name: sensors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sensors (
    id bigint NOT NULL,
    central_device_id bigint,
    gas_type_id bigint,
    sensor_type_id bigint,
    si_unit_id bigint,
    zero_point numeric,
    min_value numeric,
    max_value numeric,
    application_date timestamp without time zone,
    livetime timestamp without time zone,
    alarm_point_1 numeric,
    alarm_point_2 numeric,
    alarm_point_3 numeric,
    alarm_point_4 numeric,
    location character varying,
    number integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sensors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sensors_id_seq OWNED BY public.sensors.id;


--
-- Name: service_object_central_devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_object_central_devices (
    id bigint NOT NULL,
    central_device_id bigint,
    service_object_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: service_object_central_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_object_central_devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_object_central_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_object_central_devices_id_seq OWNED BY public.service_object_central_devices.id;


--
-- Name: service_objects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_objects (
    id bigint NOT NULL,
    address_id bigint,
    customer_id bigint,
    has_service_contract boolean,
    service_contract_begin timestamp without time zone,
    service_contract_length timestamp without time zone,
    service_contract_auto_resume_interval timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: service_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_objects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_objects_id_seq OWNED BY public.service_objects.id;


--
-- Name: service_protocols; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_protocols (
    id bigint NOT NULL,
    central_device_id bigint,
    service_object_id bigint,
    is_function_check boolean,
    is_montage boolean,
    is_systemcheck boolean,
    is_repair boolean,
    is_commisioning boolean,
    is_service_contract boolean,
    is_expenditure boolean,
    is_order boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: service_protocols_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_protocols_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_protocols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_protocols_id_seq OWNED BY public.service_protocols.id;


--
-- Name: si_units; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.si_units (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: si_units_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.si_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: si_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.si_units_id_seq OWNED BY public.si_units.id;


--
-- Name: accus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accus ALTER COLUMN id SET DEFAULT nextval('public.accus_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: alarm_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alarm_settings ALTER COLUMN id SET DEFAULT nextval('public.alarm_settings_id_seq'::regclass);


--
-- Name: central_devices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.central_devices ALTER COLUMN id SET DEFAULT nextval('public.central_devices_id_seq'::regclass);


--
-- Name: contact_addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_addresses ALTER COLUMN id SET DEFAULT nextval('public.contact_addresses_id_seq'::regclass);


--
-- Name: customer_addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_addresses ALTER COLUMN id SET DEFAULT nextval('public.customer_addresses_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: gas_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gas_types ALTER COLUMN id SET DEFAULT nextval('public.gas_types_id_seq'::regclass);


--
-- Name: object_maintenances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.object_maintenances ALTER COLUMN id SET DEFAULT nextval('public.object_maintenances_id_seq'::regclass);


--
-- Name: pg_search_documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pg_search_documents ALTER COLUMN id SET DEFAULT nextval('public.pg_search_documents_id_seq'::regclass);


--
-- Name: sensor_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensor_types ALTER COLUMN id SET DEFAULT nextval('public.sensor_types_id_seq'::regclass);


--
-- Name: sensors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensors ALTER COLUMN id SET DEFAULT nextval('public.sensors_id_seq'::regclass);


--
-- Name: service_object_central_devices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_object_central_devices ALTER COLUMN id SET DEFAULT nextval('public.service_object_central_devices_id_seq'::regclass);


--
-- Name: service_objects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_objects ALTER COLUMN id SET DEFAULT nextval('public.service_objects_id_seq'::regclass);


--
-- Name: service_protocols id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_protocols ALTER COLUMN id SET DEFAULT nextval('public.service_protocols_id_seq'::regclass);


--
-- Name: si_units id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.si_units ALTER COLUMN id SET DEFAULT nextval('public.si_units_id_seq'::regclass);


--
-- Name: accus accus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accus
    ADD CONSTRAINT accus_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: alarm_settings alarm_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alarm_settings
    ADD CONSTRAINT alarm_settings_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: central_devices central_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.central_devices
    ADD CONSTRAINT central_devices_pkey PRIMARY KEY (id);


--
-- Name: contact_addresses contact_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact_addresses
    ADD CONSTRAINT contact_addresses_pkey PRIMARY KEY (id);


--
-- Name: customer_addresses customer_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer_addresses
    ADD CONSTRAINT customer_addresses_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: gas_types gas_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gas_types
    ADD CONSTRAINT gas_types_pkey PRIMARY KEY (id);


--
-- Name: object_maintenances object_maintenances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.object_maintenances
    ADD CONSTRAINT object_maintenances_pkey PRIMARY KEY (id);


--
-- Name: pg_search_documents pg_search_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pg_search_documents
    ADD CONSTRAINT pg_search_documents_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sensor_types sensor_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensor_types
    ADD CONSTRAINT sensor_types_pkey PRIMARY KEY (id);


--
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- Name: service_object_central_devices service_object_central_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_object_central_devices
    ADD CONSTRAINT service_object_central_devices_pkey PRIMARY KEY (id);


--
-- Name: service_objects service_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_objects
    ADD CONSTRAINT service_objects_pkey PRIMARY KEY (id);


--
-- Name: service_protocols service_protocols_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_protocols
    ADD CONSTRAINT service_protocols_pkey PRIMARY KEY (id);


--
-- Name: si_units si_units_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.si_units
    ADD CONSTRAINT si_units_pkey PRIMARY KEY (id);


--
-- Name: index_accus_on_central_device_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_accus_on_central_device_id ON public.accus USING btree (central_device_id);


--
-- Name: index_alarm_settings_on_central_device_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_alarm_settings_on_central_device_id ON public.alarm_settings USING btree (central_device_id);


--
-- Name: index_contact_addresses_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_contact_addresses_on_address_id ON public.contact_addresses USING btree (address_id);


--
-- Name: index_customer_addresses_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customer_addresses_on_address_id ON public.customer_addresses USING btree (address_id);


--
-- Name: index_customer_addresses_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customer_addresses_on_customer_id ON public.customer_addresses USING btree (customer_id);


--
-- Name: index_object_maintenances_on_contact_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_object_maintenances_on_contact_address_id ON public.object_maintenances USING btree (contact_address_id);


--
-- Name: index_object_maintenances_on_service_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_object_maintenances_on_service_object_id ON public.object_maintenances USING btree (service_object_id);


--
-- Name: index_pg_search_documents_on_searchable_type_and_searchable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pg_search_documents_on_searchable_type_and_searchable_id ON public.pg_search_documents USING btree (searchable_type, searchable_id);


--
-- Name: index_sensors_on_central_device_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sensors_on_central_device_id ON public.sensors USING btree (central_device_id);


--
-- Name: index_sensors_on_gas_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sensors_on_gas_type_id ON public.sensors USING btree (gas_type_id);


--
-- Name: index_sensors_on_sensor_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sensors_on_sensor_type_id ON public.sensors USING btree (sensor_type_id);


--
-- Name: index_sensors_on_si_unit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sensors_on_si_unit_id ON public.sensors USING btree (si_unit_id);


--
-- Name: index_service_object_central_devices_on_central_device_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_object_central_devices_on_central_device_id ON public.service_object_central_devices USING btree (central_device_id);


--
-- Name: index_service_object_central_devices_on_service_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_object_central_devices_on_service_object_id ON public.service_object_central_devices USING btree (service_object_id);


--
-- Name: index_service_objects_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_objects_on_address_id ON public.service_objects USING btree (address_id);


--
-- Name: index_service_objects_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_objects_on_customer_id ON public.service_objects USING btree (customer_id);


--
-- Name: index_service_protocols_on_central_device_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_protocols_on_central_device_id ON public.service_protocols USING btree (central_device_id);


--
-- Name: index_service_protocols_on_service_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_service_protocols_on_service_object_id ON public.service_protocols USING btree (service_object_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190527071357'),
('20190528080242'),
('20190603084631'),
('20190603121946'),
('20190604084829'),
('20190604084851'),
('20190604084909'),
('20190604084917'),
('20190604084923'),
('20190604085235'),
('20190604085541'),
('20190604085549'),
('20190604085555'),
('20190604100829'),
('20190604110829'),
('20190604110830'),
('20190619091633');


