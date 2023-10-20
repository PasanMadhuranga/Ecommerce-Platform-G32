USE `group32_v1.0`;

-- add product
-- product_id = 1
call add_product(
	'iPhone 14', 
    'Electronics, Smartphones', 
    'iPhone 14: The iPhone 14 is the epitome of Apple\'s commitment to innovation and excellence in the world of smartphones. With its sleek design and powerful performance, it''s a true game-changer. The Super Retina XDR display delivers stunning visuals, while the A16 chip ensures lightning-fast speed and efficiency. The camera system is a marvel, capturing breathtaking photos and videos. With 5G connectivity and an array of exciting features, the iPhone 14 is the ultimate device for those who demand the best.', 
    0.22, 
    'IP14', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_iPhone-14.jpg?alt=media&token=a9fbcb17-c31f-4a6f-b271-e6b471d03086&_gl=1*z0hz8w*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTMzMy40NS4wLjA.');
-- product_id = 2
call add_product(
	'Samsung Galaxy S22', 
    'Electronics, Smartphones', 
    'Samsung Galaxy S22: The Samsung Galaxy S22 is a flagship Android smartphone that redefines mobile technology. Its stunning Dynamic AMOLED display provides vibrant colors and crisp clarity. Powered by the Exynos 990 processor, it handles tasks with ease. The camera system is a photography enthusiast\'s dream, offering versatility and stunning results. With a sleek design and an array of features, the Galaxy S25 is a symbol of Samsung\'s commitment to excellence.', 
    0.24, 
    'SGS22', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_galaxy-s22.png?alt=media&token=20e363e0-4841-482a-9787-313f49fcc145&_gl=1*1yt6hjr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTMxOC42MC4wLjA.');
-- product_id = 3
call add_product(
	'Dell XPS 15', 
    'Electronics, Laptops', 
    'Dell XPS 15: The Dell XPS 15 is a cutting-edge laptop that combines powerful performance with premium design. It features a stunning InfinityEdge display for vivid visuals, high-performance components for seamless multitasking, and an elegant aluminum chassis. Whether you\'re a professional or creative enthusiast, the XPS 15 is the ideal computing companion, offering style and excellence in modern technology.', 
    1.81, 
    'DXPS15', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_DellXPS15.jpg?alt=media&token=cf684579-a4b1-436c-ad56-3918618eada8&_gl=1*ue2uvg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTEyNC42MC4wLjA.');
-- product_id = 4    
call add_product(
	'Sony WH-1000XM5', 
    'Electronics, Audio & Headphones', 
    'Sony WH-1000XM5: The Sony WH-1000XM5 headphones are a triumph of audio engineering and noise-canceling technology. Immerse yourself in your favorite music with industry-leading sound quality. The noise-canceling capabilities transport you to a world of pure sound, free from distractions. Comfortable and stylish, these headphones are the ultimate choice for audiophiles and travelers.', 
    0.25, 
    'SWH5', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Sony_WH_1000XM5.png?alt=media&token=c844be0c-3377-40d6-a322-75d5039a9ca4&_gl=1*14o7sei*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTIzNS4xNS4wLjA.');
-- product_id = 5   
call add_product(
	'Batman Action Figure', 
    'Toys, Action Figures', 
    'The Batman action figure is a collector\'s dream. With meticulous craftsmanship and intricate detailing, it captures the essence of Gotham\'s Dark Knight. Pose it in dynamic stances and let your imagination run wild with epic battles in the world of DC Comics.', 
    0.15, 
    'BAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Batman_Action_Figure.jpg?alt=media&token=c2d78ba4-b73b-4ee0-a16f-180c219c60a4&_gl=1*892mtm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTAxOS40MS4wLjA.');
-- product_id = 6
call add_product(
	'Bose QC45', 
    'Electronics, Audio & Headphones', 
    'Bose QC45: The Bose QC45 headphones redefine your audio experience. With world-class noise cancellation, you can enjoy your music with newfound clarity. The balanced sound profile ensures every note is crisp and clear. Lightweight and comfortable, these headphones are perfect for long journeys or peaceful moments of reflection.', 
    0.23, 
    'BQC45', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Bose_QC45.jpg?alt=media&token=8a33dbd4-334e-4b0a-86aa-e097977f2762&_gl=1*pbph8q*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTA2MS42MC4wLjA.');
-- product_id = 7
call add_product(
	'Google Pixel 8 pro', 
    'Electronics, Smartphones', 
    'Google Pixel 8 Pro: 24+ hour battery charges faster than ever. Powerful performance with 12 GB RAM. Pixel helps keep you and your info safe. 7 years of security updates and new Feature Drops. The updated Pixel 8 Pro camera system makes selfies sharper, close-ups closer, and photos and videos more stunning than ever.', 
    0.18, 
    'GP8P', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Google_pixel_8_Pro.jpg?alt=media&token=648d4d98-54e1-45c7-be87-a24012f93e36&_gl=1*19h1wof*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE0My40MS4wLjA.');
-- product_id = 8
call add_product(
	'OnePlus 11', 
    'Electronics, Smartphones', 
    'OnePlus 11: 50 MP (wide) + 32 MP (telephoto) + 48 MP (ultrawide) while on the front, there is a 16 MP (wide) sensor. The display size is 6.7 inches LTPO2 AMOLED. The resolution of the screen is 1440 x 3216 pixels.', 
    0.20, 
    '1P11', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_OnePlus_11_5G.jpg?alt=media&token=a0403d58-a54c-43f7-852c-233e503df460&_gl=1*pvyyw5*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTIxNy4zMy4wLjA.');
-- product_id = 9
call add_product(
	'Asus ZenBook Pro', 
    'Electronics, Laptops', 
    'Asus ZenBook Pro: The Asus ZenBook Pro is a masterpiece of modern laptop design. With its stunning 4K OLED touchscreen display, it offers vivid visuals and precise touch control. Inside, the laptop is powered by high-performance processors, making it a powerhouse for creative professionals. The sleek aluminum body and compact form factor make it a stylish and portable companion. Whether you\'re a designer, video editor, or simply someone who appreciates top-tier technology, the ZenBook Pro is a testament to Asus\'s commitment to innovation.', 
    1.75, 
    'AZBP', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_ASUS_Zenbook_pro_14.png?alt=media&token=f78424cd-6e54-4fe4-9f03-18119808924f&_gl=1*5ndzh9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczODY3Mi42MC4wLjA.');
-- product_id = 10
call add_product(
	'MacBook Air M2', 
    'Electronics, Laptops', 
    'MacBook Air M2: The MacBook Air M2 is Apple\'s answer to the need for a lightweight, ultra-portable laptop without compromising on performance. Powered by the M2 chip, it provides snappy responsiveness and excellent energy efficiency. The Retina display offers vibrant visuals, and the compact form factor makes it ideal for on-the-go professionals and students. With a sleek aluminum chassis, all-day battery life, and the signature MacBook keyboard and trackpad, the MacBook Air M2 is a modern classic for those who value mobility and style.', 
    1.25, 
    'MBA2', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_macbook_air_M2.webp?alt=media&token=4bd313e3-02b2-4a9d-985b-64def4a4fa49&_gl=1*1b2r2tw*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTM2Ny4xMS4wLjA.');
-- product_id = 11
call add_product(
	'Beats Studio Buds Plus', 
    'Electronics, Audio & Headphones', 
    'Beats Studio Buds Plus: The Beats Studio Buds Plus are the perfect audio companion for music lovers and active individuals. With their dynamic sound quality, these true wireless earbuds deliver immersive audio experiences. They\'re designed for comfort and durability, ensuring they stay in place during workouts and daily activities. The active noise cancellation feature lets you enjoy your music in peace, and the long battery life keeps the tunes flowing all day long. Connect seamlessly to your device and elevate your audio experience with these stylish earbuds.', 
    0.05, 
    'BSBP', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Beats_StudioBuds_plus_black.jpg?alt=media&token=1bc53026-adfc-4d32-a609-f7d21d4a7af8&_gl=1*4dz09p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTAzOS4yMS4wLjA.');
-- product_id = 12
call add_product(
	'Jabra Elite 85t', 
    'Electronics, Audio & Headphones', 
    'Jabra Elite 85t: The Jabra Elite 85t true wireless earbuds redefine what\'s possible in terms of audio quality and noise cancellation. These earbuds offer crystal-clear sound and advanced noise-canceling technology, allowing you to immerse yourself in your music or make clear calls, even in noisy environments. With a comfortable fit and long battery life, they are perfect for extended listening sessions or all-day productivity. Stay connected and enjoy an audio experience like never before with the Jabra Elite 85t.', 
    0.06, 
    'JE85', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Jabra_Elite_85t.jpg?alt=media&token=59a3cf8e-e465-44a2-832a-898526a49577&_gl=1*1x9wzv0*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE3NS45LjAuMA..');
-- product_id = 13
call add_product(
	'Ironman Action Figure', 
    'Toys, Action Figures', 
    'Ironman Action Figure: The Ironman action figure is a tribute to the genius, billionaire, playboy, philanthropist, Tony Stark. With exquisite detailing and a range of articulation points, it brings Ironman\'s armored suit to life. Whether you\'re a Marvel fan or simply appreciate fine craftsmanship, this action figure allows you to display one of Earth\'s mightiest heroes with pride.', 
    0.15, 
    'IAF', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Ironman_AF.jpg?alt=media&token=8f4b58f3-d29e-4286-aeb5-121023722b27&_gl=1*1805pdj*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE1Ny4yNy4wLjA.');
-- product_id = 14
call add_product(
	'Lego Star Wars Kit', 
    'Toys, Board Games', 
    'Lego Star Wars Kit: The Lego Star Wars Kit is an adventure in creativity and imagination. With a vast collection of Lego bricks and minifigures inspired by the iconic Star Wars universe, it offers endless possibilities for building your favorite spacecraft, characters, and scenes. Whether you\'re a Star Wars enthusiast or a Lego aficionado, this kit provides hours of entertainment and storytelling. Join the Rebel Alliance or embrace the dark side with this epic Lego set.', 
    0.9, 
    'LSWK', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Star_Wars_Lego_kit.jpg?alt=media&token=a644c98d-36a4-48b6-9d58-27de06b7ddab&_gl=1*difac9*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTI1Mi42MC4wLjA.');
-- product_id = 15
call add_product(
	'Canon EOS 7D', 
    'Electronics, Cameras & Photography', 
    'Canon EOS 7D: The Canon EOS 7D is a professional DSLR camera designed for photographers who demand precision and speed. With its fast autofocus system and high-resolution sensor, it captures stunning images with exceptional clarity. Whether you\'re capturing fast-action sports or intricate landscapes, the EOS 7D excels in every scenario. Its robust build and advanced features make it a versatile tool for photographers who push the boundaries of creativity.', 
    0.8, 
    'CE7D', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Canon_EOS_7D.jpg?alt=media&token=1a920382-46ea-49a8-8884-4d4005e60b35&_gl=1*gd4214*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTA3NS40Ni4wLjA.');
-- product_id = 16
call add_product(
	'Apple Watch Series 8', 
    'Electronics, Wearable Technology', 
    'Apple Watch Series 8: The Apple Watch Series 8 represents the pinnacle of smartwatch technology. With its elegant design and advanced health and fitness tracking features, it\'s more than just a watch—it\'s your personal wellness companion. The Series 8 offers precise tracking of your heart rate, sleep, activity, and more, helping you stay on top of your health and fitness goals. With an always-on display and seamless integration with your iPhone, it\'s the ultimate accessory for a connected and active lifestyle. Experience the future of wearables with the Apple Watch Series 8.', 
    0.07, 
    'AWS8', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Apple_Watch_Series_8.jpg?alt=media&token=e5b60a6e-dab6-4f5b-b3e2-7570775cf486&_gl=1*dn13c3*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTAwMC42MC4wLjA.');
-- product_id = 17
call add_product(
	'Logitech G Pro Mouse', 
    'Electronics, Computer Accessories', 
    'Logitech G Pro Mouse: The Logitech G Pro Mouse is a gaming mouse that sets the standard for precision and performance. Designed with input from esports professionals, it offers lightning-fast response and customizable features. The Hero sensor provides flawless tracking, while the lightweight design ensures comfort during long gaming sessions. With programmable buttons and customizable RGB lighting, it\'s tailored to your gaming preferences. Dominate the competition with the Logitech G Pro Mouse.', 
    0.17, 
    'LGPM', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Logitech_G_Pro_Mouse.webp?alt=media&token=a2c87e0d-8463-41e8-b794-2fd8e25d2467&_gl=1*oq2ldi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTE5MC42MC4wLjA.');
-- product_id = 18
call add_product(
	'Corsair K70 Keyboard', 
    'Electronics, Computer Accessories', 
    'Corsair K70 Keyboard: The Corsair K70 Keyboard is a mechanical gaming keyboard that stands at the forefront of gaming peripherals. With its tactile and responsive Cherry MX switches, it provides a satisfying typing and gaming experience. The customizable RGB backlighting lets you create stunning lighting effects, and the durable aluminum frame ensures long-lasting performance. Whether you\'re a competitive gamer or a casual typist, the Corsair K70 delivers the precision and style you need.', 
    0.9, 
    'CK70', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Corsair_K70_Keyboard.jpg?alt=media&token=c497b139-e323-41d3-a20b-8030b7c66036&_gl=1*iq86od*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTA5MS4zMC4wLjA.');
-- product_id = 19
call add_product(
	'Barbie Dreamhouse', 
    'Toys, Dolls & Accessories', 
    'Barbie Dreamhouse: The Barbie Dreamhouse is a dream come true for young and young-at-heart Barbie enthusiasts. This fully furnished, interactive playset features multiple rooms, including a kitchen, living room, bedroom, and more. It\'s equipped with interactive accessories, such as a working elevator and a swimming pool with a slide. The Dreamhouse allows for endless imaginative play and storytelling, letting kids create their own Barbie adventures in style and comfort.', 
    2.51, 
    'BDH', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_barbie_dreamhouse.webp?alt=media&token=d605e299-4cf9-4721-8fa0-58dad1a17110&_gl=1*1w301jr*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTI5OS4xMy4wLjA.');
-- product_id = 20
call add_product(
	'Transformers Optimus Prime', 
    'Toys, Action Figures', 
    'Transformers Optimus Prime: The Transformers Optimus Prime figure brings the iconic Autobot leader to life. It seamlessly transforms from a powerful robot into a formidable truck, offering hours of exciting play for Transformers fans of all ages. With intricate details and articulation, Optimus Prime is ready to roll out and defend the universe against the Decepticons. This collectible figure is a must-have for fans of the legendary Transformers franchise.', 
    0.55, 
    'TOP', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Transformers_optimus_prime.jpg?alt=media&token=6c722f54-6db5-4664-9961-f0e8862d55b6&_gl=1*93uvwu*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTI4NC4yOC4wLjA.');
-- product_id = 21
call add_product(
	'Dell Inspiron 14', 
    'Electronics, Laptops', 
    'Dell Inspiron 14: The Dell Inspiron 14 is a versatile laptop designed to meet your everyday computing needs. With its sleek design and reliable performance, it\'s ideal for work, school, or entertainment. The crisp display offers clear visuals, and the responsive keyboard ensures comfortable typing. Powered by efficient processors, it handles tasks with ease. The Inspiron 14 is a dependable and affordable choice for those seeking a balance of performance and portability.', 
    1.55, 
    'DI14', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_DELL_inspiron_14.avif?alt=media&token=dadc9cf5-08b7-4a47-913a-1fa6492aeba4&_gl=1*gewynl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczOTEwNS4xNi4wLjA.');
-- product_id = 22
call add_product(
	'Apple AirPods Pro', 
    'Electronics, Audio & Headphones', 
    'Apple AirPods Pro: The Apple AirPods Pro redefine the wireless earbud experience. With active noise cancellation, they immerse you in pure, high-fidelity sound. The customizable fit ensures comfort and stability, making them perfect for workouts, commutes, or long flights. The H1 chip enables seamless pairing with your Apple devices, and the intuitive controls allow you to adjust settings with a touch. Whether you\'re listening to music, taking calls, or enjoying podcasts, the AirPods Pro deliver an exceptional audio experience.', 
    0.08, 
    'AAP3', 
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Product%2FProduct_Airpod_pro.jpg?alt=media&token=9cfa6fca-8f1f-416e-b3ef-0e3c4bdf960e&_gl=1*vmrzcy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5NzczNzk3Mi4yLjEuMTY5NzczODkyNi42MC4wLjA.');
    
-- ---------------------------------------------------------------------

-- add items

-- iphone 14 blue 128
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    699, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_blue.jpg?alt=media&token=0b8f4675-a4eb-43a5-a0b0-3f70ef2d4096&_gl=1*5pfv95*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDIyMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 128GB' -- Attribute comma separated
);
-- iphone 14 blue 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    799, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_blue.jpg?alt=media&token=0b8f4675-a4eb-43a5-a0b0-3f70ef2d4096&_gl=1*5pfv95*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDIyMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 256GB' -- Attribute comma separated
);
-- iphone 14 blue 512
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    999, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_blue.jpg?alt=media&token=0b8f4675-a4eb-43a5-a0b0-3f70ef2d4096&_gl=1*5pfv95*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDIyMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Blue, 512GB' -- Attribute comma separated
);
-- iphone 14 purple 128
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    699, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_purple.jpg?alt=media&token=a62ed64b-7631-4615-810b-ed681d717704&_gl=1*1mqnpjn*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDMzNS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 128GB' -- Attribute comma separated
);
-- iphone 14 purple 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    799, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_purple.jpg?alt=media&token=a62ed64b-7631-4615-810b-ed681d717704&_gl=1*1mqnpjn*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDMzNS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 256GB' -- Attribute comma separated
);
-- iphone 14 midnight 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    799, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_midnight.jpg?alt=media&token=b38b23e4-be87-44db-b578-095d3f6ca0cb&_gl=1*kjpg7z*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDQxNC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Midnight, 256GB' -- Attribute comma separated
);
-- iphone 14 red 128
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    849, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_product_red.jpg?alt=media&token=ab01af96-2f72-4549-8532-af072758f039&_gl=1*xpu2k1*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDQ1Ni4xOC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Red, 256GB' -- Attribute comma separated
);
-- iphone 14 red 256
call `group32_v1.0`.add_item
(
	'IP14', -- SKU
    949, -- Price
    12, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fiphone_14_product_red.jpg?alt=media&token=ab01af96-2f72-4549-8532-af072758f039&_gl=1*xpu2k1*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDQ1Ni4xOC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Red, 256GB' -- Attribute comma separated
);








-- Samsung Galaxy S22 white 128
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    799, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_White.png?alt=media&token=a9bb263f-8df8-4fff-997e-04687ef4b23c&_gl=1*12nhxac*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDUwOC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'White, 128GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 white 256
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    899, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_White.png?alt=media&token=a9bb263f-8df8-4fff-997e-04687ef4b23c&_gl=1*12nhxac*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDUwOC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'White, 256GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 black 128
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    799, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_Black.png?alt=media&token=1fc56c58-fd12-447c-b08f-f55a86713191&_gl=1*k4zg1p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDU1NS4xMy4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 256GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 black 256
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    899, -- Price
    10, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_Black.png?alt=media&token=1fc56c58-fd12-447c-b08f-f55a86713191&_gl=1*k4zg1p*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDU1NS4xMy4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Black, 256GB' -- Attribute comma separated
);
-- Samsung Galaxy S22 purple 256
call `group32_v1.0`.add_item
(
	'SGS22', -- SKU
    899, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fgalaxy_s22_purple.png?alt=media&token=12ccfc78-b7b1-4b47-aa01-5ff0e2019dc2&_gl=1*lz13ru*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDYwMy42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Purple, 256GB' -- Attribute comma separated
);






-- Dell XPS 15 variant 1
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1199, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Home, Intel Arc A370M Graphics-4GB, DDR5-16GB, 512GB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 2
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1249, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Pro, Intel Arc A370M Graphics-4GB, DDR5-16GB, 512GB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 3
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1649, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i7, Windows 11 Pro, NVIDIA GeForce RTX 4050-6GB, DDR5-16GB, 1TB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 4
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    1849, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Home, NVIDIA GeForce RTX 4060-8GB, DDR5-16GB, 1TB, FHD+' -- Attribute comma separated
);
-- Dell XPS 15 variant 5
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    2349, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4060-8GB, DDR5-32GB, 1TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 6
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    2499, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4060-8GB, DDR5-32GB, 2TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 7
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    2849, -- Price
    3, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4070-8GB, DDR5-32GB, 4TB, 3.5K OLED' -- Attribute comma separated
);
-- Dell XPS 15 variant 8
call `group32_v1.0`.add_item
(
	'DXPS15', -- SKU
    3749, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell_XPS_15.jpg?alt=media&token=da709b1e-759c-41ed-8a64-56c78d56a8f1&_gl=1*1asdapk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDY4My42MC4wLjA.', -- Image
    6, -- No. of variants
    'Processor, Operating System, GPU, RAM, Storage, Display', -- Variants comma separated
    '13th Gen Intel Core i9, Windows 11 Pro, NVIDIA GeForce RTX 4070-8GB, DDR5-64GB, 8TB, 3.5K OLED' -- Attribute comma separated
);






-- Sony WH-1000XM5 Black
call `group32_v1.0`.add_item
(
	'SWH5', -- SKU
    399, -- Price
    11, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony_WH-1000XM5_Black.png?alt=media&token=24b66bea-64f9-4851-bb47-7e858d1e25f3&_gl=1*1im6sex*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDg1NC42MC4wLjA.', -- Image
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
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony_WH-1000XM5_Blue.png?alt=media&token=cb07f3f2-9415-4074-913e-4e38a11d955c&_gl=1*juhdvw*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDgxOS4zNS4wLjA.', -- Image
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
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FSony_WH-1000XM5_White.png?alt=media&token=336bdea7-e535-45ad-8d43-91215f9397ca&_gl=1*xuca32*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDc5NC42MC4wLjA.', -- Image
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
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBatman_AF_small.jpg?alt=media&token=d33c83bf-cab3-4cb4-b69e-48c283ff8fa0&_gl=1*es2qtv*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDg4MC4zNC4wLjA.', -- Image
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
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBatman_AF_M_L.jpg?alt=media&token=e7db0146-490e-4199-9383-8d9274b0259d&_gl=1*dlh865*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDkwMC4xNC4wLjA.', -- Image
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
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBatman_AF_M_L.jpg?alt=media&token=e7db0146-490e-4199-9383-8d9274b0259d&_gl=1*dlh865*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDkwMC4xNC4wLjA.', -- Image
    1, -- No. of variants
    'Size', -- Variants comma separated
    'Large' -- Attribute comma separated
);






-- Bose QC45 Black
call `group32_v1.0`.add_item
(
	'BQC45', -- SKU
    329, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBose_QC45_black.jpg?alt=media&token=f5740ee2-5905-4a21-ba69-b3a13209379f&_gl=1*m3uqfm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk1OC40MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
-- Bose QC45 White
call `group32_v1.0`.add_item
(
	'BQC45', -- SKU
    329, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBose_QC45_White.jpg?alt=media&token=84751aca-786e-4275-905f-096f9cdd5f83&_gl=1*gejduk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDkzOC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'White' -- Attribute comma separated
);







-- Google Pixel 8 pro Blue 128
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    999, -- Price
    13, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_blue.jpg?alt=media&token=b157244a-fd6c-46c9-b9d8-e121e02eb53f&_gl=1*1wx7rlg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk4My4xNS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Bay, 128GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Blue 256
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    1059, -- Price
    1, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_blue.jpg?alt=media&token=b157244a-fd6c-46c9-b9d8-e121e02eb53f&_gl=1*1wx7rlg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk4My4xNS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Bay, 256GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Blue 512
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    1179, -- Price
    9, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_blue.jpg?alt=media&token=b157244a-fd6c-46c9-b9d8-e121e02eb53f&_gl=1*1wx7rlg*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NDk4My4xNS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Bay, 512GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 128
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    999, -- Price
    8, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 128GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 256
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    1059, -- Price
    14, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 256GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 512
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    1179, -- Price
    7, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 512GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Black 1TB
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    1399, -- Price
    2, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_black.jpg?alt=media&token=0a9b39f0-2edc-4f7e-9d44-8c3f729dffdd&_gl=1*1812tpi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA0MC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Obsidian, 1TB' -- Attribute comma separated
);
-- Google Pixel 8 pro Porcelain 128
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    999, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_Porcelain.jpg?alt=media&token=772b8418-83e4-4cb9-9a10-508ca76f76d7&_gl=1*1r3drgb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA5My43LjAuMA..', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Porcelain, 128GB' -- Attribute comma separated
);
-- Google Pixel 8 pro Porcelain 512
call `group32_v1.0`.add_item
(
	'GP8P', -- SKU
    1179, -- Price
    6, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FGoogle_pixel_8_Pro_Porcelain.jpg?alt=media&token=772b8418-83e4-4cb9-9a10-508ca76f76d7&_gl=1*1r3drgb*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTA5My43LjAuMA..', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Porcelain, 512GB' -- Attribute comma separated
);





-- OnePlus 11 128GB 8GB green
call `group32_v1.0`.add_item
(
	'1P11', -- SKU
    699, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Green.jpg?alt=media&token=f0d4be93-0698-48ae-9ef1-1d71708b12c5&_gl=1*1tgw6it*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTE4MC42MC4wLjA.', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Green, 128GB, 8GB' -- Attribute comma separated
);
-- OnePlus 11 256GB 12GB green
call `group32_v1.0`.add_item
(
	'1P11', -- SKU
    759, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Green.jpg?alt=media&token=f0d4be93-0698-48ae-9ef1-1d71708b12c5&_gl=1*1tgw6it*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTE4MC42MC4wLjA.', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Green, 256GB, 12GB' -- Attribute comma separated
);
-- OnePlus 11 128GB 8GB black
call `group32_v1.0`.add_item
(
	'1P11', -- SKU
    649, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Black.jpg?alt=media&token=59b026e0-cde6-46f6-8e63-6a589907960f&_gl=1*oh7o79*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTIzNS41LjAuMA..', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Black, 256GB, 16GB' -- Attribute comma separated
);





-- Asus ZenBook Pro
call `group32_v1.0`.add_item
(
	'AZBP', -- SKU
    1819, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Black.jpg?alt=media&token=59b026e0-cde6-46f6-8e63-6a589907960f&_gl=1*oh7o79*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTIzNS41LjAuMA..', -- Image
    1, -- No. of variants
    'Display Type', -- Variants comma separated
    'Single' -- Attribute comma separated
);
-- Asus ZenBook Pro DUO
call `group32_v1.0`.add_item
(
	'AZBP', -- SKU
    2099, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FOnePlus_11_5G_Black.jpg?alt=media&token=59b026e0-cde6-46f6-8e63-6a589907960f&_gl=1*oh7o79*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc0NDE1OC4zLjEuMTY5Nzc0NTIzNS41LjAuMA..', -- Image
    1, -- No. of variants
    'Display Type', -- Variants comma separated
    'Duo' -- Attribute comma separated
);




-- MacBook Air M2 Starlight 256GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1199, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Starlight.webp?alt=media&token=60cfb376-f6e3-43af-b104-da91a995077b&_gl=1*ueafcc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjAuMTY5Nzc3MzkwNC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Starlight, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Starlight 512GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1599, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Starlight.webp?alt=media&token=60cfb376-f6e3-43af-b104-da91a995077b&_gl=1*ueafcc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjAuMTY5Nzc3MzkwNC42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Starlight, 512GB' -- Attribute comma separated
);
-- MacBook Air M2 Midnight 256GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1199, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_midnight.webp?alt=media&token=77d262ce-e593-4f79-9f3b-c7c0e6616f86&_gl=1*sl3s2d*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3Mzk1My4xMS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Midnight, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Midnight 512GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1599, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_midnight.webp?alt=media&token=77d262ce-e593-4f79-9f3b-c7c0e6616f86&_gl=1*sl3s2d*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3Mzk1My4xMS4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Midnight, 512GB' -- Attribute comma separated
);
-- MacBook Air M2 Silver 256GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1199, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Silver.webp?alt=media&token=b5a154cb-07bc-49d6-95f6-ffbb49b880f0&_gl=1*sd4fod*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDAxMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Silver, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Silver 512GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1599, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Silver.webp?alt=media&token=b5a154cb-07bc-49d6-95f6-ffbb49b880f0&_gl=1*sd4fod*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDAxMS42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Silver, 512GB' -- Attribute comma separated
);
-- MacBook Air M2 Space Grey 256GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1199, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Spacegrey.webp?alt=media&token=01c55a2f-156c-4d7b-897e-579c072c28fb&_gl=1*tzyor6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDA4Mi42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Space Grey, 256GB' -- Attribute comma separated
);
-- MacBook Air M2 Space Grey 512GB
call `group32_v1.0`.add_item
(
	'MBA2', -- SKU
    1599, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2Fmacbook_air_M2_Spacegrey.webp?alt=media&token=01c55a2f-156c-4d7b-897e-579c072c28fb&_gl=1*tzyor6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDA4Mi42MC4wLjA.', -- Image
    2, -- No. of variants
    'Color, Storage', -- Variants comma separated
    'Space Grey, 512GB' -- Attribute comma separated
);







-- Beats Studio Buds Plus Black
call `group32_v1.0`.add_item
(
	'BSBP', -- SKU
    169, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_black.jpg?alt=media&token=f1b952b9-994e-46c4-9a94-11daede06dd0&_gl=1*1qk1ejl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDExMy4yOS4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);
-- Beats Studio Buds Plus Cosmic Silver
call `group32_v1.0`.add_item
(
	'BSBP', -- SKU
    169, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_cosmic_silver.jpg?alt=media&token=d16cf8e1-5a31-45ce-8cbc-e040529e3668&_gl=1*1m1l30l*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDE0Mi42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Cosmic Silver' -- Attribute comma separated
);
-- Beats Studio Buds Plus Ivory
call `group32_v1.0`.add_item
(
	'BSBP', -- SKU
    169, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_ivory.jpg?alt=media&token=6c33b6de-eac0-4034-acc7-f3670138c054&_gl=1*edrvhi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDE2Mi40MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Ivory' -- Attribute comma separated
);
-- Beats Studio Buds Plus Pink
call `group32_v1.0`.add_item
(
	'BSBP', -- SKU
    169, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_ivory.jpg?alt=media&token=6c33b6de-eac0-4034-acc7-f3670138c054&_gl=1*edrvhi*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDE2Mi40MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Pink' -- Attribute comma separated
);
-- Beats Studio Buds Plus Transparent
call `group32_v1.0`.add_item
(
	'BSBP', -- SKU
    169, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBeats_StudioBuds_plus_transparent.jpg?alt=media&token=9a342c5b-21d5-4b3e-bb43-8678fcd1cfd9&_gl=1*1d9f9ki*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDIwOS42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Transparent' -- Attribute comma separated
);






-- Jabra Elite 85t Black
call `group32_v1.0`.add_item
(
	'JE85', -- SKU
    164, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FJabra_Elite_85t.jpg?alt=media&token=6f4861c6-7acd-499c-b378-8eb3e19fb91c&_gl=1*hh7q18*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDIzOC4zMS4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);






-- Ironman Action Figure mark 2
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    41.88, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark2.jpg?alt=media&token=4919a783-25bc-483f-a0ae-7cb31499e154&_gl=1*169rss7*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDI2Ni4zLjAuMA..', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 2' -- Attribute comma separated
);
-- Ironman Action Figure mark 3
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    41.88, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark3.jpg?alt=media&token=6f7f14b8-624e-4bee-8289-4a1adf0d8fc1&_gl=1*1txdxqp*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDMwNi42MC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 3' -- Attribute comma separated
);
-- Ironman Action Figure mark 4
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    43.95, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark4.jpg?alt=media&token=7a611ce9-a38f-4752-98be-6276894fbe9e&_gl=1*11iyvlc*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDM1Ny45LjAuMA..', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 4' -- Attribute comma separated
);
-- Ironman Action Figure mark 42
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    41.88, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark42.jpg?alt=media&token=6b353920-3ad9-4170-b030-73ac5a566e52&_gl=1*16t7yfh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDM4MC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 42' -- Attribute comma separated
);
-- Ironman Action Figure mark 5
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    41.88, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark5.jpg?alt=media&token=c22567d5-2846-48dd-8d49-767bd8f97ab7&_gl=1*145swo5*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDQxMi4yOC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 5' -- Attribute comma separated
);
-- Ironman Action Figure mark 50
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    66.83, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark50.jpg?alt=media&token=924654a1-1131-47f5-bfa1-d834119b169b&_gl=1*13nmsi6*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDQzMy43LjAuMA..', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 50' -- Attribute comma separated
);
-- Ironman Action Figure mark 6
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    41.88, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark6.jpg?alt=media&token=b3c09573-c1ba-4b1f-9f3d-7e3b29ce3d6c&_gl=1*16ed7gh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDQ5OC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 6' -- Attribute comma separated
);
-- Ironman Action Figure mark 7
call `group32_v1.0`.add_item
(
	'IAF', -- SKU
    41.88, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FIronman_AF_Mark7.jpg?alt=media&token=56e0124f-1eb3-4a86-8362-ffb2215335ae&_gl=1*xzf7p3*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDUyNC4zNC4wLjA.', -- Image
    1, -- No. of variants
    'Suit Version', -- Variants comma separated
    'Mark 7' -- Attribute comma separated
);






-- Lego Star Wars Kit style 13134
call `group32_v1.0`.add_item
(
	'LSWK', -- SKU
    299, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_13134.jpg?alt=media&token=301d9e7d-86b1-4526-ac92-316d00589b9e&_gl=1*wwxt7v*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDU2My42MC4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '13134' -- Attribute comma separated
);
-- Lego Star Wars Kit style 13135
call `group32_v1.0`.add_item
(
	'LSWK', -- SKU
    399, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_13135.jpg?alt=media&token=a92e98cc-0bd1-45fd-a8bd-1f7e14332d82&_gl=1*131ym7r*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDU4Ni4zNy4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '13135' -- Attribute comma separated
);
-- Lego Star Wars Kit style 21005
call `group32_v1.0`.add_item
(
	'LSWK', -- SKU
    279, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_21005.jpg?alt=media&token=e1fd46fc-b69e-438a-a368-a33310b4bb32&_gl=1*4see0e*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDYxNy42LjAuMA..', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '21005' -- Attribute comma separated
);
-- Lego Star Wars Kit style 21023
call `group32_v1.0`.add_item
(
	'LSWK', -- SKU
    169, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_21023.jpg?alt=media&token=7a165a97-3fb6-4154-96f6-3529f6caef2a&_gl=1*1at7i6l*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDY1MC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '21023' -- Attribute comma separated
);
-- Lego Star Wars Kit style 21036
call `group32_v1.0`.add_item
(
	'LSWK', -- SKU
    169, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FStar_Wars_Lego_kit_Style_21036.jpg?alt=media&token=4c56db63-f945-4abc-9f91-560f2ce605ab&_gl=1*hm5jdk*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDY3NC4zNi4wLjA.', -- Image
    1, -- No. of variants
    'Style', -- Variants comma separated
    '21036' -- Attribute comma separated
);






-- Canon EOS 7D no lens 
call `group32_v1.0`.add_item
(
	'CE7D', -- SKU
    199.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCanon_EOS_7D_Without_lens.jpg?alt=media&token=7f0fab13-61ee-4ccd-972d-942b923ea6b6&_gl=1*l5mi04*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDcwNi40LjAuMA..', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    'No Lens' -- Attribute comma separated
);
-- Canon EOS 7D With 18-135mm Lens
call `group32_v1.0`.add_item
(
	'CE7D', -- SKU
    549, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCanon_EOS_7D_With_18-135mm_lens.jpg?alt=media&token=04528484-6e2c-40c0-98a7-b0b048f948c3&_gl=1*1ucxquo*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDczMC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '18-135mm Lens' -- Attribute comma separated
);
-- Canon EOS 7D With 28-135mm Lens
call `group32_v1.0`.add_item
(
	'CE7D', -- SKU
    658, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCanon_EOS_7D_With_28-135mm_lens.jpg?alt=media&token=d5402345-6d4a-4add-8939-59e42dbc8b93&_gl=1*ri30kh*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDc0OS40MS4wLjA.', -- Image
    1, -- No. of variants
    'Lens', -- Variants comma separated
    '28-135mm Lens' -- Attribute comma separated
);





-- Apple Watch Series 8 
call `group32_v1.0`.add_item
(
	'AWS8', -- SKU
    839, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FApple_Watch_Series_8_Red.jpg?alt=media&token=cb3f5b57-ade7-4141-9429-69be0c204a0c&_gl=1*uegogf*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDc4OC4yLjAuMA..', -- Image
    3, -- No. of variants
    'Color, Storage, RAM', -- Variants comma separated
    'Red, 32GB, 1GB' -- Attribute comma separated
);





-- Logitech G Pro Mouse Shroud
call `group32_v1.0`.add_item
(
	'LGPM', -- SKU
    129.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLogitech_G_Pro_Mouse_shroud.webp?alt=media&token=46d2588f-3d38-449c-b924-d218a225da7a&_gl=1*1uoi7x2*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDgxMy42MC4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Shroud' -- Attribute comma separated
);
-- Logitech G Pro Mouse Black
call `group32_v1.0`.add_item
(
	'LGPM', -- SKU
    129.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FLogitech_G_Pro_Mouse_Black.webp?alt=media&token=38f3cbd9-bd6c-4729-a76b-7ce71110cea0&_gl=1*10b6jd*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDgzNy4zNi4wLjA.', -- Image
    1, -- No. of variants
    'Color', -- Variants comma separated
    'Black' -- Attribute comma separated
);





-- Corsair K70 Keyboard wired
call `group32_v1.0`.add_item
(
	'LGPM', -- SKU
    129.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCorsair_K70_Keyboard_wired.jpg?alt=media&token=2b753c98-a3ac-42d4-9e94-e2f538030e25&_gl=1*1jv2x0h*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDg3Ny42MC4wLjA.', -- Image
    1, -- No. of variants
    'Connection Type', -- Variants comma separated
    'Wired' -- Attribute comma separated
);
-- Corsair K70 Keyboard wireless
call `group32_v1.0`.add_item
(
	'LGPM', -- SKU
    159.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FCorsair_K70_Keyboard_wireless.jpg?alt=media&token=d2248571-27c0-4e87-97dc-1fc9ed6ab5c3&_gl=1*jrxtdm*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDg5Ny40MC4wLjA.', -- Image
    1, -- No. of variants
    'Connection Type', -- Variants comma separated
    'Wireless' -- Attribute comma separated
);





-- Barbie Dreamhouse
call `group32_v1.0`.add_item
(
	'BDH', -- SKU
    179, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FBarbie_dreamhouse.webp?alt=media&token=ea5fc302-39e8-4542-8230-22e8e333b4f1&_gl=1*1o8umfe*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDkyMS4xNi4wLjA.', -- Image
    1, -- No. of variants
    'Material', -- Variants comma separated
    'Plastic' -- Attribute comma separated
);





-- Transformers Optimus Prime
call `group32_v1.0`.add_item
(
	'TOP', -- SKU
    34, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FTransformers_optimus_prime.jpg?alt=media&token=04068a33-2a8e-4f96-afe3-a202699c8c7e&_gl=1*1ur48ao*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3MzkwNC40LjEuMTY5Nzc3NDk0NC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Material', -- Variants comma separated
    'Plastic' -- Attribute comma separated
);





-- Dell Inspiron 14 Intel variant 1
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    649.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i3, Windows 11 Home, Intel UHD Graphics, DDR5-8GB, 256GB' -- Attribute comma separated
);
-- Dell Inspiron 14 Intel variant 
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    729.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i5, Windows 11 Home, Intel Iris Xe Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 Intel variant 
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    789.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i5, Windows 11 Pro, Intel Iris Xe Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 Intel variant 
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    34, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDELL_inspiron_14.jpg?alt=media&token=9e28f82b-2495-438f-ade1-b6b3b15420e2&_gl=1*brd8kl*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzIxNC4zNS4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'Intel, 13th Gen Intel Core i7, Windows 11 Pro, Intel Iris Xe Graphics, DDR5-16GB, 1TB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    699.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 5, Windows 11 Home, AMD Radeon Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    759.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 5, Windows 11 Pro, AMD Radeon Graphics, DDR5-8GB, 512GB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    899.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 7, Windows 11 Home, AMD Radeon Graphics, DDR5-16GB, 1TB' -- Attribute comma separated
);
-- Dell Inspiron 14 AMD variant 
call `group32_v1.0`.add_item
(
	'DI14', -- SKU
    959.99, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FDell-inspiron-14-AMD.jpg?alt=media&token=69d0d2e9-47ac-47db-9384-55a52892990e&_gl=1*nx44iy*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzI2MC42MC4wLjA.', -- Image
    6, -- No. of variants
    'Base configuration, Processor, Operating System, GPU, RAM, Storage', -- Variants comma separated
    'AMD, 7th Gen AMD Ryzen 7, Windows 11 Pro, AMD Radeon Graphics, DDR5-16GB, 1TB' -- Attribute comma separated
);






-- Apple AirPods Pro
call `group32_v1.0`.add_item
(
	'AAP3', -- SKU
    249, -- Price
    4, -- Quantity
    'https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/item%2FAirpod_pro.jpg?alt=media&token=8f9063f4-6cce-4a0f-81ab-2ef09d4e74ca&_gl=1*xcggev*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5Nzc3NjgwMy41LjEuMTY5Nzc3NzUxMC42MC4wLjA.', -- Image
    1, -- No. of variants
    'Generation', -- Variants comma separated
    '2nd genaration' -- Attribute comma separated
);