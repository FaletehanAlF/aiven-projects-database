
CREATE TABLE IF NOT EXISTS categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE products
  ADD COLUMN category_id INT NULL;

ALTER TABLE products
  ADD CONSTRAINT fk_products_category
    FOREIGN KEY (category_id) REFERENCES categories(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

CREATE INDEX idx_products_category_id ON products(category_id);

INSERT INTO categories (name) VALUES
  ('Makanan'),
  ('Minuman'),
  ('Elektronik'),
  ('Lainnya')
ON DUPLICATE KEY UPDATE name = VALUES(name);
