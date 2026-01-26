DROP DATABASE IF EXISTS amine_airbnb;
CREATE DATABASE amine_airbnb;
USE amine_airbnb;

-- ======================================================================
-- USERS (Base entity for both guests and hosts)
-- ======================================================================
CREATE TABLE users (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    email           VARCHAR(255) UNIQUE NOT NULL,
    password        VARCHAR(255) NOT NULL,
    phone           VARCHAR(30),
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE INDEX idx_users_email ON users(email);


-- ======================================================================
-- HOSTS (extends users)
-- ======================================================================
CREATE TABLE hosts (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    host_since      DATE,
    overall_rating  DECIMAL(3,2),
    is_superhost    BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_hosts_user_id ON hosts(user_id);



-- ======================================================================
-- GUESTS (extends users)
-- ======================================================================
CREATE TABLE guests (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    user_id             INT NOT NULL,
    preferred_language  VARCHAR(50),
    default_currency    VARCHAR(10),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_guests_user_id ON guests(user_id);



-- ======================================================================
-- PROPERTIES (listings)
-- ======================================================================
CREATE TABLE properties (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    host_id         INT NOT NULL,
    title           VARCHAR(255) NOT NULL,
    description     TEXT,
    type            VARCHAR(50),        -- instead of ENUM
    address         TEXT,
    city            VARCHAR(100),
    country         VARCHAR(100),
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES hosts(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(city, country);


-- ======================================================================
-- AMENITIES
-- ======================================================================
CREATE TABLE amenities (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;



-- ======================================================================
-- PROPERTY_AMENITIES (many-to-many)
-- ======================================================================
CREATE TABLE property_amenities (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    property_id     INT NOT NULL,
    amenity_id      INT NOT NULL,
    FOREIGN KEY (property_id) REFERENCES properties(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES amenities(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(property_id, amenity_id)
) ENGINE=InnoDB;



-- ======================================================================
-- CALENDARS (availability)
-- ======================================================================
CREATE TABLE calendars (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    property_id     INT NOT NULL,
    available_date  DATE NOT NULL,
    is_available    BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (property_id) REFERENCES properties(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_calendars_property_date ON calendars(property_id, available_date);





-- ======================================================================
-- BOOKINGS
-- ======================================================================
CREATE TABLE bookings (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    guest_id        INT NOT NULL,
    property_id     INT NOT NULL,
    checkin_date    DATE NOT NULL,
    checkout_date   DATE NOT NULL,
    total_price     DECIMAL(10,2) NOT NULL,
    status          VARCHAR(50),   -- e.g. booked, cancelled, completed
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES guests(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_bookings_guest ON bookings(guest_id);
CREATE INDEX idx_bookings_property ON bookings(property_id);




-- ======================================================================
-- PAYMENTS (customer -> platform)
-- ======================================================================
CREATE TABLE payments (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    booking_id      INT NOT NULL,
    amount          DECIMAL(10,2) NOT NULL,
    payment_method  VARCHAR(50), -- card, paypal, crypto, etc.
    paid_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;




-- ======================================================================
-- PLATFORM COMMISSIONS (platform earnings)
-- ======================================================================
CREATE TABLE platform_commissions (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    booking_id  INT NOT NULL,
    guest_fee   DECIMAL(10,2),
    host_fee    DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;



-- ======================================================================
-- INCOMES (host earnings)
-- ======================================================================
CREATE TABLE incomes (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    host_id     INT NOT NULL,
    year        INT NOT NULL,
    month       VARCHAR(20),
    income      DECIMAL(10,2),
    FOREIGN KEY (host_id) REFERENCES hosts(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;



-- ======================================================================
-- REVIEWS
-- ======================================================================
CREATE TABLE reviews (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    reviewer_id     INT NOT NULL,  -- guest
    reviewed_id     INT NOT NULL,  -- host
    property_id     INT NOT NULL,
    rating          INT CHECK (rating BETWEEN 1 AND 5),
    comment         TEXT,
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reviewer_id) REFERENCES guests(id),
    FOREIGN KEY (reviewed_id) REFERENCES hosts(id),
    FOREIGN KEY (property_id) REFERENCES properties(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;




-- ======================================================================
-- FAVORITES (guest <-> property)
-- ======================================================================
CREATE TABLE favorites (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    guest_id    INT NOT NULL,
    property_id INT NOT NULL,
    favorited_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES guests(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(guest_id, property_id)
) ENGINE=InnoDB;



-- ======================================================================
-- WISHLISTS (container)
-- ======================================================================
CREATE TABLE wishlists (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    guest_id    INT NOT NULL,
    name        VARCHAR(200),
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES guests(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;





-- ======================================================================
-- WISHLIST ITEMS
-- ======================================================================
CREATE TABLE wishlist_items (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    wishlist_id     INT NOT NULL,
    property_id     INT NOT NULL,
    FOREIGN KEY (wishlist_id) REFERENCES wishlists(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(wishlist_id, property_id)
) ENGINE=InnoDB;




-- ======================================================================
-- MESSAGES (guest ↔ host)
-- ======================================================================
CREATE TABLE messages (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    sender_id       INT NOT NULL,
    receiver_id     INT NOT NULL,
    message         TEXT,
    sent_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;





-- ======================================================================
-- COMPLAINTS
-- ======================================================================
CREATE TABLE complaints (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    booking_id      INT NOT NULL,
    user_id         INT NOT NULL,
    complaint_text  TEXT,
    resolved        BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;





-- ======================================================================
-- HOST VERIFICATIONS
-- ======================================================================
CREATE TABLE host_verifications (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    host_id         INT NOT NULL,
    id_document_url VARCHAR(500),
    verified        BOOLEAN DEFAULT FALSE,
    verified_at     DATETIME,
    FOREIGN KEY (host_id) REFERENCES hosts(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;




-- ======================================================================
-- SOCIAL PROFILES
-- ======================================================================
CREATE TABLE social_profiles (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NOT NULL,
    platform        VARCHAR(100),   -- facebook, google, linkedin etc.
    profile_url     TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;





-- ======================================================================
-- REFERRALS
-- ======================================================================
CREATE TABLE referrals (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    referrer_id     INT NOT NULL,
    referred_email  VARCHAR(255),
    referral_code   VARCHAR(100),
    joined          BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (referrer_id) REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
