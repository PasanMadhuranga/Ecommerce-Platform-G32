-- add product

call `group32_v1.0`.add_product(
	'iPhone 14', 
    'Electronics, Smartphones', 
    'iPhone 14: The iPhone 14 is the epitome of Apple\'s commitment to innovation and excellence in the world of smartphones. With its sleek design and powerful performance, it''s a true game-changer. The Super Retina XDR display delivers stunning visuals, while the A16 chip ensures lightning-fast speed and efficiency. The camera system is a marvel, capturing breathtaking photos and videos. With 5G connectivity and an array of exciting features, the iPhone 14 is the ultimate device for those who demand the best.', 
    0.22, 
    'IP14', 
    'https://drive.google.com/file/d/1JvgLUWiq-0dHII3lRW44S6Q4Aug0qnuE/view?usp=sharing');

call `group32_v1.0`.add_product(
	'Samsung Galaxy S22', 
    'Electronics, Smartphones', 
    'Samsung Galaxy S22: The Samsung Galaxy S22 is a flagship Android smartphone that redefines mobile technology. Its stunning Dynamic AMOLED display provides vibrant colors and crisp clarity. Powered by the Exynos 990 processor, it handles tasks with ease. The camera system is a photography enthusiast\'s dream, offering versatility and stunning results. With a sleek design and an array of features, the Galaxy S25 is a symbol of Samsung\'s commitment to excellence.', 
    0.24, 
    'SGS22', 
    'https://drive.google.com/file/d/1nRxreqjfaBKqC4yW2GhJcP3QfR7DBJNg/view?usp=sharing');

call `group32_v1.0`.add_product(
	'Dell XPS 15', 
    'Electronics, Laptops', 
    'Dell XPS 15: The Dell XPS 15 is a cutting-edge laptop that combines powerful performance with premium design. It features a stunning InfinityEdge display for vivid visuals, high-performance components for seamless multitasking, and an elegant aluminum chassis. Whether you\'re a professional or creative enthusiast, the XPS 15 is the ideal computing companion, offering style and excellence in modern technology.', 
    1.81, 
    'DXPS15', 
    'https://drive.google.com/file/d/1XQ597X9Ur0K-UClDLR78i5jXuT8ngzQf/view?usp=sharing');
    
call `group32_v1.0`.add_product(
	'Sony WH-1000XM5', 
    'Electronics, Audio & Headphones', 
    'Sony WH-1000XM5: The Sony WH-1000XM5 headphones are a triumph of audio engineering and noise-canceling technology. Immerse yourself in your favorite music with industry-leading sound quality. The noise-canceling capabilities transport you to a world of pure sound, free from distractions. Comfortable and stylish, these headphones are the ultimate choice for audiophiles and travelers.', 
    0.25, 
    'SWH5', 
    'https://drive.google.com/file/d/1NhIAxxqvgixIfHJfC2hIaK03_0F97BzR/view?usp=sharing');
    
call `group32_v1.0`.add_product(
	'Batman Action Figure', 
    'Toys, Action Figures', 
    'The Batman action figure is a collector\'s dream. With meticulous craftsmanship and intricate detailing, it captures the essence of Gotham\'s Dark Knight. Pose it in dynamic stances and let your imagination run wild with epic battles in the world of DC Comics.', 
    0.15, 
    'BAF', 
    'https://drive.google.com/file/d/1waw9Mt7n3jCKSbPARFX3u0eNIhy_Vi-p/view?usp=sharing');

-- ---------------------------------------------------------------------

-- add items

-- iphone 14 blue 128
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    699, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1s-Bss3cELewiLy5gBL11UmmlhmpQjM2m/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 128' -- Attribute comma separated
);
-- iphone 14 blue 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    799, -- Price
    7, -- Quantity
    'https://drive.google.com/file/d/1s-Bss3cELewiLy5gBL11UmmlhmpQjM2m/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 256' -- Attribute comma separated
);
-- iphone 14 blue 512
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    999, -- Price
    2, -- Quantity
    'https://drive.google.com/file/d/1s-Bss3cELewiLy5gBL11UmmlhmpQjM2m/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 512' -- Attribute comma separated
);
-- iphone 14 purple 128
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    699, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1A0jVvnDJxNaKBFlw6ALDN7wpun_GEVIs/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 128' -- Attribute comma separated
);
-- iphone 14 purple 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    799, -- Price
    7, -- Quantity
    'https://drive.google.com/file/d/1A0jVvnDJxNaKBFlw6ALDN7wpun_GEVIs/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 256' -- Attribute comma separated
);
-- iphone 14 midnight 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    799, -- Price
    10, -- Quantity
    'https://drive.google.com/file/d/1hEavQtDZKdcEvS1vNqTM4dbjtQ1me3-L/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Midnight, 256' -- Attribute comma separated
);
-- iphone 14 red 128
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    849, -- Price
    7, -- Quantity
    'https://drive.google.com/file/d/1Bl_3p1Bilk9FKhClrrNX1tH2rT0NwJyS/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Red, 256' -- Attribute comma separated
);
-- iphone 14 red 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    949, -- Price
    12, -- Quantity
    'https://drive.google.com/file/d/1Bl_3p1Bilk9FKhClrrNX1tH2rT0NwJyS/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Red, 256' -- Attribute comma separated
);








-- Samsung Galaxy S22 white 128
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    799, -- Price
    2, -- Quantity
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'White, 128' -- Attribute comma separated
);
-- Samsung Galaxy S22 white 256
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    899, -- Price
    8, -- Quantity
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'White, 256' -- Attribute comma separated
);
-- Samsung Galaxy S22 black 128
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    799, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 256' -- Attribute comma separated
);
-- Samsung Galaxy S22 black 256
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    899, -- Price
    10, -- Quantity
    'https://drive.google.com/file/d/1D8AKqgazSQ5fZMfIiBCn01UynkdfWv5-/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 256' -- Attribute comma separated
);
-- Samsung Galaxy S22 purple 256
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    899, -- Price
    1, -- Quantity
    'https://drive.google.com/file/d/1L4Ygd14nvJDc148TPLG3AVYlSCHkRT1e/view?usp=sharing', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 256' -- Attribute comma separated
);






-- Dell XPS 15 variant 1
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1199, -- Price
    6, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core™ i7, Windows 11 Home, Intel Arc™ A370M Graphics-4GB, 16GB DDR5, 512GB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 2
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1249, -- Price
    2, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core™ i7, Windows 11 Pro, Intel Arc™ A370M Graphics-4GB, 16GB DDR5, 512GB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 3
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1649, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core™ i7, Windows 11 Pro, NVIDIA GeForce RTX™ 4050-6GB, 16GB DDR5, 1TB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 4
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1849, -- Price
    7, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core™ i9, Windows 11 Home, NVIDIA GeForce RTX™ 4060-8GB, 16GB DDR5, 1TB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 5
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    2349, -- Price
    7, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display Size', -- Variants comma separated
    '13th Gen Intel Core™ i9, Windows 11 Pro, NVIDIA GeForce RTX™ 4060-8GB, 32GB DDR5, 1TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 6
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    2499, -- Price
    6, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display Size', -- Variants comma separated
    '13th Gen Intel Core™ i9, Windows 11 Pro, NVIDIA GeForce RTX™ 4060-8GB, 32GB DDR5, 2TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 7
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    2849, -- Price
    3, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display Size', -- Variants comma separated
    '13th Gen Intel Core™ i9, Windows 11 Pro, NVIDIA GeForce RTX™ 4070-8GB, 32GB DDR5, 4TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 8
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    3749, -- Price
    1, -- Quantity
    'https://drive.google.com/file/d/11Dgqae1vsMExPUQeKx_h__GWdrWmuDsZ/view?usp=sharing', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display Size', -- Variants comma separated
    '13th Gen Intel Core™ i9, Windows 11 Pro, NVIDIA GeForce RTX™ 4070-8GB, 64GB DDR5, 8TB, 3.5K OLED' -- Attribute comma separated
);






-- Sony WH-1000XM5 Black
call `group32_v1.0`.add_item
(
	'SWH5', -- SKU
    399, -- Price
    11, -- Quantity
    'https://drive.google.com/file/d/15a4U3DQVUTKoLCAR_MVhereOV-4Q3GR3/view?usp=sharing', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
-- Sony WH-1000XM5 Blue
call `group32_v1.0`.add_item
(
	'SWH5', -- SKU
    399, -- Price
    10, -- Quantity
    'https://drive.google.com/file/d/1GzBs9-a0uclM1J75XTzB6-st9tvxakKO/view?usp=sharing', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Blue' -- Attribute comma separated
);
-- Sony WH-1000XM5 white
call `group32_v1.0`.add_item
(
	'SWH5', -- SKU
    399, -- Price
    15, -- Quantity
    'https://drive.google.com/file/d/1lgTSKmDQm9vQCDD3hXXsgKZRQ4SaEeOq/view?usp=sharing', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
);






-- Batman Action Figure small
call `group32_v1.0`.add_item
(
	'BAF', -- SKU
    84, -- Price
    4, -- Quantity
    'https://drive.google.com/file/d/1Wv56-fXkEpGmiG0hFghGEaIQFCoA9Yat/view?usp=sharing', -- Image
    1, -- No. of variants
    'Size', -- Variants comma separated
    'Small' -- Attribute comma separated
);
-- Batman Action Figure medium
call `group32_v1.0`.add_item
(
	'BAF', -- SKU
    99, -- Price
    2, -- Quantity
    'https://drive.google.com/file/d/1EQRnohJgE2qW5Tk3HEOBSIdu-PQnyfUd/view?usp=sharing', -- Image
    1, -- No. of variants
    'Size', -- Variants comma separated
    'Medium' -- Attribute comma separated
);
-- Batman Action Figure small
call `group32_v1.0`.add_item
(
	'BAF', -- SKU
    109, -- Price
    6, -- Quantity
    'https://drive.google.com/file/d/1EQRnohJgE2qW5Tk3HEOBSIdu-PQnyfUd/view?usp=sharing', -- Image
    1, -- No. of variants
    'Size', -- Variants comma separated
    'Large' -- Attribute comma separated
);