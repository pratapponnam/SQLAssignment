-- Customer Table
CREATE TABLE Customer (
    row_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    phone_number TEXT,
    email_id TEXT,
    pass_type TEXT CHECK (pass_type IN ('Monthly', 'Weekly', 'Day')),
    pass_valid_from DATE,
    pass_valid_to DATE,
    gender TEXT CHECK (gender IN ('Male', 'Female')),
    age INTEGER CHECK (age >= 0 AND age <= 120)
);

-- Driver Table
CREATE TABLE Driver (
    row_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    email_id TEXT NOT NULL,
    dob DATE NOT NULL,
    experience INTEGER CHECK (experience >= 0),
    age INTEGER CHECK (age >= 18 AND age <= 75)
);

-- BusRoute Table
CREATE TABLE BusRoute (
    row_id INTEGER PRIMARY KEY,
    route_num INTEGER NOT NULL,
    start_stop TEXT NOT NULL,
    destination_stop TEXT NOT NULL
);

-- TimeTable Table
CREATE TABLE TimeTable (
    row_id INTEGER PRIMARY KEY,
    route_num INTEGER NOT NULL,
    stop_name TEXT NOT NULL,
    time TEXT NOT NULL
);

-- Price Table
CREATE TABLE Price (
    row_id INTEGER PRIMARY KEY,
    route_num INTEGER NOT NULL,
    from_stop TEXT NOT NULL,
    to_stop TEXT NOT NULL,
    price_adult REAL NOT NULL CHECK (price_adult >= 0),
    price_child REAL NOT NULL CHECK (price_child >= 0)
);

-- Ticket Table
-- Ticket Table
CREATE TABLE Ticket (
    row_id INTEGER PRIMARY KEY,                -- Unique identifier for each ticket
    customer_id INTEGER,                       -- Foreign key referencing Customer table
    driver_id INTEGER NOT NULL,                -- Foreign key referencing Driver table
    bus_id INTEGER NOT NULL,                   -- Foreign key referencing BusRoute table
    route_num INTEGER NOT NULL,                -- Route number of the bus
    departure_stop TEXT NOT NULL,              -- Stop where the journey begins
    arrival_stop TEXT NOT NULL,                -- Stop where the journey ends
    price_adult REAL NOT NULL CHECK (price_adult >= 0),  -- Price for adult tickets
    price_child REAL NOT NULL CHECK (price_child >= 0),  -- Price for child tickets
    no_of_adults INTEGER NOT NULL CHECK (no_of_adults >= 0),  -- Number of adults traveling
    no_of_children INTEGER NOT NULL CHECK (no_of_children >= 0),  -- Number of children traveling
    pass TEXT CHECK (pass IN ('yes', 'no')),   -- Whether a pass was used
    ticket_date_time TEXT NOT NULL,            -- Date and time of the ticket purchase
    total_price REAL NOT NULL CHECK (total_price >= 0),  -- Total price of the ticket
    FOREIGN KEY (customer_id) REFERENCES Customer(row_id),   -- Reference to Customer table
    FOREIGN KEY (driver_id) REFERENCES Driver(row_id),       -- Reference to Driver table
    FOREIGN KEY (bus_id) REFERENCES BusRoute(row_id),        -- Reference to BusRoute table
    UNIQUE (customer_id, ticket_date_time, route_num)        -- Composite key for uniqueness
);

CREATE TABLE Ticket_stage (
    row_id INTEGER PRIMARY KEY,                -- Unique identifier for each ticket
    customer_id INTEGER,                       -- Foreign key referencing Customer table
    driver_id INTEGER NOT NULL,                -- Foreign key referencing Driver table
    bus_id INTEGER NOT NULL,                   -- Foreign key referencing BusRoute table
    route_num INTEGER NOT NULL,                -- Route number of the bus
    departure_stop TEXT NOT NULL,              -- Stop where the journey begins
    arrival_stop TEXT NOT NULL,                -- Stop where the journey ends
    price_adult REAL NOT NULL CHECK (price_adult >= 0),  -- Price for adult tickets
    price_child REAL NOT NULL CHECK (price_child >= 0),  -- Price for child tickets
    no_of_adults INTEGER NOT NULL CHECK (no_of_adults >= 0),  -- Number of adults traveling
    no_of_children INTEGER NOT NULL CHECK (no_of_children >= 0),  -- Number of children traveling
    pass TEXT CHECK (pass IN ('yes', 'no')),   -- Whether a pass was used
    ticket_date_time TEXT NOT NULL,            -- Date and time of the ticket purchase
    total_price REAL NOT NULL CHECK (total_price >= 0),  -- Total price of the ticket
    FOREIGN KEY (customer_id) REFERENCES Customer(row_id),   -- Reference to Customer table
    FOREIGN KEY (driver_id) REFERENCES Driver(row_id),       -- Reference to Driver table
    FOREIGN KEY (bus_id) REFERENCES BusRoute(row_id)        -- Reference to BusRoute table

);
