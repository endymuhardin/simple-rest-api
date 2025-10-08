-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create produk table
CREATE TABLE IF NOT EXISTS produk (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nama VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    harga DECIMAL(10,2) NOT NULL,
    stok INTEGER DEFAULT 0,
    kategori VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO produk (id, nama, deskripsi, harga, stok, kategori) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'Laptop ASUS ROG', 'Gaming laptop dengan RTX 4060', 15999000, 10, 'Elektronik'),
('550e8400-e29b-41d4-a716-446655440002', 'Mouse Logitech MX Master 3', 'Wireless mouse untuk produktivitas', 1299000, 25, 'Aksesoris'),
('550e8400-e29b-41d4-a716-446655440003', 'Keyboard Mechanical RK84', 'Hotswap mechanical keyboard', 899000, 15, 'Aksesoris'),
('550e8400-e29b-41d4-a716-446655440004', 'Monitor LG 27UP850', '4K IPS monitor dengan USB-C', 7999000, 8, 'Elektronik'),
('550e8400-e29b-41d4-a716-446655440005', 'Webcam Logitech C920', 'HD webcam 1080p', 899000, 30, 'Aksesoris'),
('550e8400-e29b-41d4-a716-446655440006', 'Samsung SSD 980 Pro 1TB', 'NVMe Gen4 SSD', 2199000, 20, 'Storage'),
('550e8400-e29b-41d4-a716-446655440007', 'HP Spectre x360', '2-in-1 laptop dengan touchscreen', 18999000, 5, 'Elektronik'),
('550e8400-e29b-41d4-a716-446655440008', 'iPad Air 5', 'Tablet dengan M1 chip', 8999000, 12, 'Elektronik'),
('550e8400-e29b-41d4-a716-446655440009', 'Sony WH-1000XM4', 'Noise cancelling headphones', 3999000, 18, 'Audio'),
('550e8400-e29b-41d4-a716-446655440010', 'Standing Desk IKEA', 'Adjustable height standing desk', 2499000, 7, 'Furniture');