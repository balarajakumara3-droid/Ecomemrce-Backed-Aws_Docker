-- Ooru Specials (Special product categories)
CREATE TABLE IF NOT EXISTS ooru_specials (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    description TEXT,
    image TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_ooru_specials_slug ON ooru_specials(slug);

-- Ooru Specials Products
CREATE TABLE IF NOT EXISTS ooru_specials_products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ooru_special_id UUID NOT NULL,
    product_name TEXT NOT NULL,
    weight TEXT,
    price TEXT,  -- Store as text for flexibility (e.g., "₹100-150")
    discounted_price TEXT,
    description TEXT,
    image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT ooru_specials_products_ooru_special_id_fkey 
        FOREIGN KEY (ooru_special_id) REFERENCES ooru_specials(id) ON DELETE CASCADE
);

CREATE INDEX idx_ooru_specials_products_special ON ooru_specials_products(ooru_special_id);

-- Tamil Nadu Sweet Classics
CREATE TABLE IF NOT EXISTS tamilnadu_sweet_classics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_name TEXT NOT NULL,
    weight TEXT,
    price NUMERIC NOT NULL,
    discounted_price NUMERIC,
    description TEXT,
    image_url TEXT
);

-- Tamil Nadu Savoury Classics
CREATE TABLE IF NOT EXISTS tamilnadu_savoury_classics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_name TEXT NOT NULL,
    weight TEXT,
    price NUMERIC NOT NULL,
    discounted_price NUMERIC,
    description TEXT,
    image_url TEXT
);

-- Tamil Nadu Karupatti Classics
CREATE TABLE IF NOT EXISTS tamilnadu_karupatti_classics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_name TEXT NOT NULL,
    weight TEXT,
    price NUMERIC NOT NULL,
    discounted_price NUMERIC,
    description TEXT,
    image_url TEXT
);