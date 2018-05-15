--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2018-05-08 20:16:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2817 (class 1262 OID 16866)
-- Name: rec_sys_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE rec_sys_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE rec_sys_db OWNER TO postgres;

\connect rec_sys_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16940)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE alembic_version OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16945)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE products (
    id character varying(300) NOT NULL,
    name character varying(200),
    description character varying(600),
    category character varying(20),
    price double precision,
    image character varying(500),
    top_1 character varying(300),
    top_2 character varying(300),
    top_3 character varying(300)
);


ALTER TABLE products OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25291)
-- Name: similar_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE similar_products (
    id character varying(300) NOT NULL,
    name character varying(200),
    description character varying(600),
    category character varying(20),
    price double precision,
    image character varying(500)
);


ALTER TABLE similar_products OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16955)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    username character varying(20),
    password character varying(25)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2809 (class 0 OID 16940)
-- Dependencies: 196
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO alembic_version (version_num) VALUES ('13b464e9c01c');


--
-- TOC entry 2810 (class 0 OID 16945)
-- Dependencies: 197
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('samsung___galaxy_s9_64gb__unlocked____midnight_black_smart_phone', 'Samsung - Galaxy S9 64GB (Unlocked) - Midnight Black', 'Choose a carrier on your own time and take breathtaking high-quality shots with this unlocked Samsung Galaxy S9 in black. Pro Mode manual adjustments deliver professional photos frame by frame, while the dual aperture lens shoots clear in any lighting. Easy access from Iris Scanner and Facial Recognition opens your phone with a look. With included Augmented Reality that does everything from translating text to turning users into emojis, this unlocked Samsung Galaxy S9 brings imagination to life.
', 'Smart Phone', 2800, '6191423_sd.jpg', 'samsung___galaxy_note8_64gb__unlocked____orchid_gray_smart_phone', 'samsung___galaxy_s8_64gb__unlocked____midnight_black_smart_phone', 'samsung___certified_pre_owned_galaxy_s7_4g_lte_with_32gb_memory_cell_phone__unlocked____black_onyx_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('hp___envy_17.3"_touch_screen_laptop___intel_core_i7___16gb_memory___nvidia_geforce_mx150___1tb_hard_drive___natural_silver_computer', 'HP - ENVY 17.3" Touch-Screen Laptop - Intel Core i7 - 16GB Memory - NVIDIA GeForce MX150 - 1TB Hard Drive - Natural Silver', 'Get ready to be amazed with this HP business laptop. It starts with an Intel Core i7 processor and 16GB of RAM and handles almost any task you throw at it, and a DVD writer makes it easy to produce backups. An NVIDIA GeForce MX150 graphics card lets you use extra screens with this HP business laptop.', 'Computer', 1600, '6082154_sd.jpg', 'lenovo___14"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___black_computer', 'hp___2_in_1_11.6"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___hp_finish_in_natural_silver_computer', 'huawei___honor_6x_4g_lte_with_32gb_memory_cell_phone__unlocked____gray_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('pc_portable_asus_vivobook_d540ya_dual-core_2go_500go_rouge_computer', 'PC Portable ASUS VivoBook D540YA Dual-Core 2Go 500Go Rouge', 'Screen 15.6 "HD LED (1366 x 768 px) -CPU Processor: AMD E1-7010 Dual-Core APU (1.5 GHz, 2 MB Cache) - Operating System: FreeDOS - RAM Memory: 2 GB DDR3L - Hard Disk: 500 GB HDD - Graphics card: AMD Radeon R2, with USB-C, HDMI, VGA, Wifi - Color: Red - Warranty: 1 year', 'Computer', 500, 'pc-portable-asus-d540ya-2-go-500-go-rouge.jpg', 'pc_portable_asus_vivobook_d540ya-_dual-core_2go_500go_silver_computer', 'pc_portable_hp_15-bs004nk_dual_core_4go_500go_(1vp17ea)_computer', 'hp___envy_17.3"_touch_screen_laptop___intel_core_i7___16gb_memory___nvidia_geforce_mx150___1tb_hard_drive___natural_silver_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('apple___macbook_pro®___13"_display___intel_core_i5___8_gb_memory___128gb_flash_storage__latest_model____space_gray_computer', 'Apple - MacBook Pro® - 13" Display - Intel Core i5 - 8 GB Memory - 128GB Flash Storage (Latest Model) - Space Gray', 'The new MacBook Pro is razor-thin, featherlight, and now even faster and more powerful than before. It has the brightest, most colorful Mac notebook display. And it features up to 10 hours of battery life.* It’s a notebook built for the work you do every day. Ready to go anywhere a great idea takes you.', 'Computer', 3000, '5721723cv11d.jpg', 'apple___macbook_air®___13.3"_display___intel_core_i5___8gb_memory___128gb_flash_storage__latest_model____silver_computer', 'huawei___mate_9_4g_lte_with_64gb_memory_cell_phone__unlocked____space_gray_smart_phone', 'samsung___galaxy_note8_64gb__unlocked____orchid_gray_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('samsung___galaxy_note8_64gb__unlocked____orchid_gray_smart_phone', 'Samsung - Galaxy Note8 64GB (Unlocked) - Orchid Gray', 'Photos are clear with less blur on the world''s first Dual Camera with Optical Image Stabilization on both lenses of the Samsung Galaxy Note8. With the powerful built-in S Pen, take notes without unlocking your screen, handwrite messages and make GIFs. This Samsung Galaxy Note8 comes with a long-lasting 3300mAh battery.
', 'Smart Phone', 2700, '6002607_sd.jpg', 'samsung___galaxy_s9_64gb__unlocked____midnight_black_smart_phone', 'huawei___mate_10_pro_4g_lte_with_128gb_memory_cell_phone__unlocked____titanium_gray_smart_phone', 'apple___macbook_pro®___13"_display___intel_core_i5___8_gb_memory___128gb_flash_storage__latest_model____space_gray_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('huawei___mate_10_pro_4g_lte_with_128gb_memory_cell_phone__unlocked____titanium_gray_smart_phone', 'Huawei - Mate 10 Pro 4G LTE with 128GB Memory Cell Phone (Unlocked) - Titanium Gray', 'Scroll through social media feeds and respond to texts with this unlocked Huawei Mate 10 Pro smartphone. Its powerful processor and 6GB of RAM let you multitask effortlessly, and its 128GB of internal memory offers plenty of room for photos and games. This Huawei Mate 10 Pro smartphone has a large 6-inch touch screen that shows a clear, colorful picture.
', 'Smart Phone', 1800, '6174918_bd.jpg', 'huawei___honor_6x_4g_lte_with_32gb_memory_cell_phone__unlocked____gray_smart_phone', 'huawei___mate_se_4g_lte_with_64gb_memory_cell_phone__unlocked____gray_smart_phone', 'dell___inspiron_11.6"_laptop___amd_a6___4gb_memory___32gb_emmc_flash_memory___gray_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('huawei___mate_9_4g_lte_with_64gb_memory_cell_phone__unlocked____space_gray_smart_phone', 'Huawei - Mate 9 4G LTE with 64GB Memory Cell Phone (Unlocked) - Space Gray', 'Keep connected on the go with this unlocked Huawei Mate9 smartphone. Its Kirin 960 processor delivers blazing performance, while the 4000 mAh battery and power-saving technology provide up to 2 days of usage. The glamorous 5.9-inch Full HD display delivers immersive visuals, while 3D fingerprint recognition technology keeps this 64GB Huawei Mate9 smartphone secure and safe.
', 'Smart Phone', 1500, '5709704_sd.jpg', 'huawei___mate_se_4g_lte_with_64gb_memory_cell_phone__unlocked____gray_smart_phone', 'apple___macbook_air®___13.3"_display___intel_core_i5___8gb_memory___128gb_flash_storage__latest_model____silver_computer', 'huawei___honor_6x_4g_lte_with_32gb_memory_cell_phone__unlocked____gray_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('pc_portable_asus_vivobook_d540ya-_dual-core_2go_500go_silver_computer', 'PC Portable ASUS VivoBook D540YA- Dual-Core 2Go 500Go Silver', 'Screen 15.6 "HD LED (1366 x 768 px) - Processor: AMD E1-7010 APU Dual-Core (1.5 GHz, 2 MB Cache), Operating System: FreeDos - RAM Memory: 2 GB DDR3L - Disk Hard: 500 GB HDD - Graphics card: AMD Radeon R2, with USB-C, HDMI, VGA, Wifi - Color: silver - Warranty: 1 year
', 'Computer', 888, 'pc-portable-asus-vivobook-x540ya-dual-core-2go-500go-silver.jpg', 'pc_portable_asus_vivobook_d540ya_dual-core_2go_500go_rouge_computer', 'pc_portable_hp_15-bs004nk_dual_core_4go_500go_(1vp17ea)_computer', 'hp___envy_17.3"_touch_screen_laptop___intel_core_i7___16gb_memory___nvidia_geforce_mx150___1tb_hard_drive___natural_silver_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('samsung___certified_pre_owned_galaxy_s7_4g_lte_with_32gb_memory_cell_phone__unlocked____black_onyx_smart_phone', 'Samsung - Certified Pre-Owned Galaxy S7 4G LTE with 32GB Memory Cell Phone (Unlocked) - Black Onyx', 'Stay in touch with family and friends with this unlocked 32GB Samsung Galaxy S7 smartphone. The quad-core processor streams videos and supports multitasking, and the device is water-resistant to safeguard against accidents. This Samsung Galaxy S7 smartphone has a talk time of up to 28 hours to help you maintain connectivity on busy days.
', 'Smart Phone', 1500, '6134307_sd.jpg', 'huawei___honor_6x_4g_lte_with_32gb_memory_cell_phone__unlocked____gray_smart_phone', 'huawei___mate_9_4g_lte_with_64gb_memory_cell_phone__unlocked____space_gray_smart_phone', 'huawei___mate_10_pro_4g_lte_with_128gb_memory_cell_phone__unlocked____titanium_gray_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('pc_portable_hp_15-bs004nk_dual_core_4go_500go_(1vp17ea)_computer', 'Pc Portable HP 15-bs004nk Dual Core 4Go 500Go (1VP17EA)', '15.6 "HD display, Intel Celeron N3060 processor (1.60 GHz, up to 2.48 GHz, 2 MB cache, dual core), Operating system: FreeDOS, 4 GB RAM, 500 GB SATA hard drive, 5400 rpm / min, Graphics Card: Intel® HD 400 with WiFi, USB 2.0, Bluetooth® 4.2, HDMI, Color: White, 1 Year Warranty', 'Computer', 650, 'pc-portable-hp-15-bs003nk-dual-core-4go-500go-1vp16ea-.jpg', 'pc_portable_asus_vivobook_d540ya-_dual-core_2go_500go_silver_computer', 'pc_portable_asus_vivobook_d540ya_dual-core_2go_500go_rouge_computer', 'lenovo___14"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___black_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('hp___15.6"_touch_screen_laptop___intel_core_i3___8gb_memory___1tb_hard_drive___jet_black,_woven_texture_pattern_computer', 'HP - 15.6" Touch-Screen Laptop - Intel Core i3 - 8GB Memory - 1TB Hard Drive - Jet black, woven texture pattern', '8GB of RAM handle the demands of intensive programs and games, and the CoolSense feature automatically adjusts its temperature to prevent overheating. The 1TB hard drive integrated in this HP laptop has plenty of room to store large files.', 'Computer', 750, '6090904cv3d.jpg', 'dell___inspiron_11.6"_laptop___amd_a6___4gb_memory___32gb_emmc_flash_memory___gray_computer', 'hp___2_in_1_11.6"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___hp_finish_in_natural_silver_computer', 'lenovo___14"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___black_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('lenovo___15.6"_laptop___intel_core_i5___8gb_memory___1tb_hard_drive___platinum_gray_computer', 'Lenovo - 15.6" Laptop - Intel Core i5 - 8GB Memory - 1TB Hard Drive - Platinum gray', 'Enhance your productivity with powerful laptops built for performance and durability. Many models come with advanced security features to protect your data. Look for features like…

Sturdy, yet lightweight design for secure portability
Hardware-level encryption, fingerprint readers, BIOS security options and secure remote IT access
Expanded connectivity, memory and battery options
Want more commercial-grade products with business-focused features?', 'Computer', 1000, '5799310cv11d.jpg', 'apple___macbook_air®___13.3"_display___intel_core_i5___8gb_memory___128gb_flash_storage__latest_model____silver_computer', 'huawei___mate_9_4g_lte_with_64gb_memory_cell_phone__unlocked____space_gray_smart_phone', 'apple___macbook_pro®___13"_display___intel_core_i5___8_gb_memory___128gb_flash_storage__latest_model____space_gray_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('huawei___mate_se_4g_lte_with_64gb_memory_cell_phone__unlocked____gray_smart_phone', 'Huawei - Mate SE 4G LTE with 64GB Memory Cell Phone (Unlocked) - Gray', 'Keep in touch with this unlocked Huawei Mate SE smartphone. Its 5.93-inch touch screen is highly responsive while providing a colorful display, and its fingerprint reader prevents access by unauthorized users. This gray Huawei Mate SE smartphone has 64GB of internal storage that holds plenty of apps, music and games.
', 'Smart Phone', 600, '6174920_sd.jpg', 'huawei___mate_10_pro_4g_lte_with_128gb_memory_cell_phone__unlocked____titanium_gray_smart_phone', 'huawei___mate_9_4g_lte_with_64gb_memory_cell_phone__unlocked____space_gray_smart_phone', 'samsung___galaxy_s8_64gb__unlocked____midnight_black_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('samsung___galaxy_s8_64gb__unlocked____midnight_black_smart_phone', 'Samsung - Galaxy S8 64GB (Unlocked) - Midnight Black', 'Call, text and capture your world with this Samsung Galaxy S8 smartphone. Keep personal data secure with the phone''s security features, which include facial recognition and a fingerprint sensor on the rear panel. Equipped with a Super AMOLED screen and Corning Gorilla Glass 5, this Samsung Galaxy S8 smartphone wraps elegance and durability into one chic electronic package.
', 'Smart Phone', 1800, '5803741_bd.jpg', 'huawei___mate_se_4g_lte_with_64gb_memory_cell_phone__unlocked____gray_smart_phone', 'huawei___mate_9_4g_lte_with_64gb_memory_cell_phone__unlocked____space_gray_smart_phone', 'samsung___galaxy_s9_64gb__unlocked____midnight_black_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('apple___macbook_air®___13.3"_display___intel_core_i5___8gb_memory___128gb_flash_storage__latest_model____silver_computer', 'Apple - MacBook Air® - 13.3" Display - Intel Core i5 - 8GB Memory - 128GB Flash Storage (Latest Model) - Silver', 'The 13-inch MacBook Air features 8GB of memory, a fifth-generation Intel Core processor, Thunderbolt 2, great built-in apps, and all-day battery life.* It’s thin, light, and durable enough to take everywhere you go—and powerful enough to do everything once you get there.', 'Computer', 2200, '5465502ld.jpg', 'apple___macbook_pro®___13"_display___intel_core_i5___8_gb_memory___128gb_flash_storage__latest_model____space_gray_computer', 'huawei___mate_9_4g_lte_with_64gb_memory_cell_phone__unlocked____space_gray_smart_phone', 'lenovo___15.6"_laptop___intel_core_i5___8gb_memory___1tb_hard_drive___platinum_gray_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('apple_iphone_6_unlocked_smartphone,_16_gb__gold___certified_refurbished__smart_phone', 'Apple iPhone 6 Unlocked Smartphone, 16 GB (Gold) (Certified Refurbished)', 'This Certified Refurbished product is tested and certified to look and work like new, with limited to no wear. The refurbishing process includes functionality testing, inspection, and repackaging. The product is backed by a minimum 90-day warranty, and may arrive in a generic box. The product ships with a charger and cable, but does not include headphone, manual or SIM card.
', 'Smart Phone', 1200, '51BbI-8wpTL.jpg', 'test_computer', 'samsung___galaxy_s9_64gb__unlocked____midnight_black_smart_phone', 'apple___macbook_pro®___13"_display___intel_core_i5___8_gb_memory___128gb_flash_storage__latest_model____space_gray_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('test_computer', 'test', 'test', 'Computer', 1200, 'baim-hanif-89800-unsplash.jpg', 'apple_iphone_6_unlocked_smartphone,_16_gb__gold___certified_refurbished__smart_phone', 'samsung___galaxy_s9_64gb__unlocked____midnight_black_smart_phone', 'samsung___galaxy_s8_64gb__unlocked____midnight_black_smart_phone');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('hp___2_in_1_11.6"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___hp_finish_in_natural_silver_computer', 'HP - 2-in-1 11.6" Touch-Screen Laptop - Intel Pentium - 4GB Memory - 500GB Hard Drive - HP finish in natural silver', 'Experience 8.5 hours of battery life with this 11.6-inch HP convertible laptop. Its 360-degree hinge lets you use it as a tablet for versatile operation, and its Intel Pentium Processor and 4GB of RAM keep multiple programs running smoothly. This HP convertible laptop has a 500GB hard drive for storing photos and documents.
', 'Computer', 750, '5868707_sd.jpg', 'dell___inspiron_11.6"_laptop___amd_a6___4gb_memory___32gb_emmc_flash_memory___gray_computer', 'lenovo___14"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___black_computer', 'hp___15.6"_touch_screen_laptop___intel_core_i3___8gb_memory___1tb_hard_drive___jet_black,_woven_texture_pattern_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('lenovo___14"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___black_computer', 'Lenovo - 14" Touch-Screen Laptop - Intel Pentium - 4GB Memory - 500GB Hard Drive - Black', 'IdeaPad 2-in-1 laptop. Its Intel Pentium processor and 4GB of RAM let you run multiple software programs at once, and the 500GB hard drive offers secure file storage. This Lenovo IdeaPad 2-in-1 laptop has Windows 10 for an intuitive user interface. The wide-angle touch-screen display of this Lenovo IdeaPad laptop has ultra-thin bezels to let you see more of your videos.
', 'Computer', 800, '6062100cv3d.jpg', 'hp___2_in_1_11.6"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___hp_finish_in_natural_silver_computer', 'dell___inspiron_11.6"_laptop___amd_a6___4gb_memory___32gb_emmc_flash_memory___gray_computer', 'hp___envy_17.3"_touch_screen_laptop___intel_core_i7___16gb_memory___nvidia_geforce_mx150___1tb_hard_drive___natural_silver_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('huawei___honor_6x_4g_lte_with_32gb_memory_cell_phone__unlocked____gray_smart_phone', 'Huawei - Honor 6x 4G LTE with 32GB Memory Cell Phone (Unlocked) - Gray', 'Choose this unlocked Huawei Honor 6X smartphone for its powerful capabilities. It includes an octa-core Kirin processor and 3GB of RAM to run apps quickly, and it has 32GB of internal storage that can be expanded to 128GB by adding a microSD card. 
', 'Smart Phone', 400, '5712450ld.jpg', 'huawei___mate_10_pro_4g_lte_with_128gb_memory_cell_phone__unlocked____titanium_gray_smart_phone', 'samsung___certified_pre_owned_galaxy_s7_4g_lte_with_32gb_memory_cell_phone__unlocked____black_onyx_smart_phone', 'hp___envy_17.3"_touch_screen_laptop___intel_core_i7___16gb_memory___nvidia_geforce_mx150___1tb_hard_drive___natural_silver_computer');
INSERT INTO products (id, name, description, category, price, image, top_1, top_2, top_3) VALUES ('dell___inspiron_11.6"_laptop___amd_a6___4gb_memory___32gb_emmc_flash_memory___gray_computer', 'Dell - Inspiron 11.6" Laptop - AMD A6 - 4GB Memory - 32GB eMMC Flash Memory - Gray', 'Prepare presentations for school or work with this 11.6-inch Dell laptop. It has a seventh-generation AMD processor and 4GB of DDR4 RAM for smooth handling of multiple programs, and its 32GB hard drive lets you store documents, photos and other types of files. This Dell laptop has Bluetooth capability, so you can connect wirelessly to compatible devices.', 'Computer', 400, '6188326cv1d.jpg', 'hp___2_in_1_11.6"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___hp_finish_in_natural_silver_computer', 'lenovo___14"_touch_screen_laptop___intel_pentium___4gb_memory___500gb_hard_drive___black_computer', 'hp___15.6"_touch_screen_laptop___intel_core_i3___8gb_memory___1tb_hard_drive___jet_black,_woven_texture_pattern_computer');


--
-- TOC entry 2812 (class 0 OID 25291)
-- Dependencies: 199
-- Data for Name: similar_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO similar_products (id, name, description, category, price, image) VALUES ('pc_portable_asus_vivobook_d540ya-_dual-core_2go_500go_silver_computer', 'PC Portable ASUS VivoBook D540YA- Dual-Core 2Go 500Go Silver', 'Screen 15.6 "HD LED (1366 x 768 px) - Processor: AMD E1-7010 APU Dual-Core (1.5 GHz, 2 MB Cache), Operating System: FreeDos - RAM Memory: 2 GB DDR3L - Disk Hard: 500 GB HDD - Graphics card: AMD Radeon R2, with USB-C, HDMI, VGA, Wifi - Color: silver - Warranty: 1 year
', 'Computer', 888, 'pc-portable-asus-vivobook-x540ya-dual-core-2go-500go-silver.jpg');
INSERT INTO similar_products (id, name, description, category, price, image) VALUES ('pc_portable_asus_vivobook_d540ya_dual-core_2go_500go_rouge_computer', 'PC Portable ASUS VivoBook D540YA Dual-Core 2Go 500Go Rouge', 'Screen 15.6 "HD LED (1366 x 768 px) -CPU Processor: AMD E1-7010 Dual-Core APU (1.5 GHz, 2 MB Cache) - Operating System: FreeDOS - RAM Memory: 2 GB DDR3L - Hard Disk: 500 GB HDD - Graphics card: AMD Radeon R2, with USB-C, HDMI, VGA, Wifi - Color: Red - Warranty: 1 year', 'Computer', 500, 'pc-portable-asus-d540ya-2-go-500-go-rouge.jpg');
INSERT INTO similar_products (id, name, description, category, price, image) VALUES ('pc_portable_hp_15-bs004nk_dual_core_4go_500go_(1vp17ea)_computer', 'Pc Portable HP 15-bs004nk Dual Core 4Go 500Go (1VP17EA)', '15.6 "HD display, Intel Celeron N3060 processor (1.60 GHz, up to 2.48 GHz, 2 MB cache, dual core), Operating system: FreeDOS, 4 GB RAM, 500 GB SATA hard drive, 5400 rpm / min, Graphics Card: Intel® HD 400 with WiFi, USB 2.0, Bluetooth® 4.2, HDMI, Color: White, 1 Year Warranty', 'Computer', 650, 'pc-portable-hp-15-bs003nk-dual-core-4go-500go-1vp16ea-.jpg');


--
-- TOC entry 2811 (class 0 OID 16955)
-- Dependencies: 198
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (username, password) VALUES ('achrefothmeni', '123');
INSERT INTO users (username, password) VALUES ('kj', 'kj');
INSERT INTO users (username, password) VALUES ('test', 'test');
INSERT INTO users (username, password) VALUES ('syrine', 'sysy26');


--
-- TOC entry 2683 (class 2606 OID 16944)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2685 (class 2606 OID 16952)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 25298)
-- Name: similar_products similar_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY similar_products
    ADD CONSTRAINT similar_products_pkey PRIMARY KEY (id);


-- Completed on 2018-05-08 20:16:24

--
-- PostgreSQL database dump complete
--

