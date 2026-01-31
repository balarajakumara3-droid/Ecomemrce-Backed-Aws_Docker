-- Create cart_items table
CREATE TABLE IF NOT EXISTS cart_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID,
    product_id UUID,
    variant_id UUID,
    quantity INTEGER DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    CONSTRAINT cart_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES profiles(id),
    CONSTRAINT cart_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id),
    CONSTRAINT cart_items_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES product_variants(id)
);

CREATE INDEX idx_cart_items_user ON cart_items(user_id);
CREATE INDEX idx_cart_items_product ON cart_items(product_id);

-- Modify carts table
ALTER TABLE carts DROP COLUMN IF EXISTS items;
ALTER TABLE carts DROP COLUMN IF EXISTS item_count;
ALTER TABLE carts DROP COLUMN IF EXISTS total_price;
ALTER TABLE carts 
    ADD COLUMN subtotal NUMERIC NOT NULL DEFAULT 0,
    ADD COLUMN shipping NUMERIC NOT NULL DEFAULT 0,
    ADD COLUMN discount NUMERIC NOT NULL DEFAULT 0,
    ADD COLUMN total NUMERIC NOT NULL DEFAULT 0;
