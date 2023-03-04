BEGIN;

DROP TABLE IF EXISTS users,catigory,subcatigory, products, orders,brands,ordersdetails, reviews , admins, payment ,productreviews,Cart;
CREATE TABLE users(
   id SERIAL PRIMARY KEY,
   userName VARCHAR(255) NOT NULL,
   userPassword VARCHAR(255) NOT NULL,
   email VARCHAR(255) UNIQUE NOT NULL
);
CREATE TABLE  brands (
   id INTEGER PRIMARY KEY,
   brandName VARCHAR(255)
);
CREATE TABLE catigory(
   id INTEGER PRIMARY KEY,
   catigoryName VARCHAR(255),
   catigoryCode VARCHAR(255)
);
CREATE TABLE subCatigory(
   id INTEGER PRIMARY KEY,
   subcatigoryName VARCHAR(255),
   catigoryId INTEGER REFERENCES catigory(id)
);
CREATE TABLE products(
   id SERIAL PRIMARY KEY,
   productName VARCHAR(255) NOT NULL,
   productCode VARCHAR(255) NOT NULL,
   productUrl TEXT NOT NULL,
   brandId INTEGER REFERENCES brands(id),
   catigoryId INTEGER REFERENCES catigory(id),
   img TEXT NOT NULL,
   price INTEGER
);
CREATE TABLE orders(
   id SERIAL PRIMARY KEY,
   orderdate TEXT ,
   id_user INTEGER REFERENCES users(id),
   price VARCHAR(255)
);
CREATE TABLE ordersDetails(
   productId INTEGER REFERENCES products(id),
   orderId INTEGER REFERENCES orders(id),
   quantity INTEGER ,
   PRIMARY KEY(orderId,productId)
);
CREATE TABLE reviews(
   id SERIAL PRIMARY KEY,
   user_id INTEGER REFERENCES users(id),
   review TEXT,
   postTime VARCHAR(255)
);
CREATE TABLE admins(
    id SERIAL PRIMARY KEY,
    userName VARCHAR(255) NOT NULL,
    adminPassword VARCHAR(255) NOT NULL,
    adminKey VARCHAR(255) UNIQUE
);
CREATE TABLE payment(
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    cardNumber VARCHAR(255) NOT NULL,
    expDate VARCHAR(255) NOT NULL,
    userId  INTEGER REFERENCES users(id)
);
CREATE TABLE productReviews(
   id INTEGER PRIMARY KEY,
   userId INTEGER REFERENCES users(id),
   productId INTEGER REFERENCES products(id),
   review TEXT NOT NULL,
   postTime timestamp 
);
CREATE TABLE Cart(
   user_id INTEGER REFERENCES users(id),
   productId  INTEGER REFERENCES products(id) ,
   quantity INTEGER ,
   PRIMARY KEY (user_id,productId)
);


-- //insert data to database tabels:

INSERT INTO catigory (id,catigoryname,catigorycode) VALUES (1,'Makeup','cat140006'),(2,'Clean at Sephora','cat3780034'),(3,'Skincare','cat150006'),(4,'Tools & Brushes','cat130042'),(5,'Fragrance','cat160006'),(6,'Bath & Body','cat140014'),(7,'Hair',NULL);

INSERT INTO admins(id,userName,adminPassword,adminKey) VALUES (123,'Yosrada','Y1234','K444'),(456,'muha','M456','K111'),(789,'astbrq','A159','K888');

INSERT INTO brands (id,brandName)VALUES 
(1,'The Ordinary'),(2,'Dior'),(3,'Lancôme'),(4,'tarte'),(5,'Charlotte Tilbury'),(6,'TOM FORD'),(7,'Benefit Cosmetics'),(8,'Benefit Cosmetics'),(9,'NARS'),(10,'Curlsmith'),(11,'Briogeo'),(12,'Olaplex'),(13,'kayali'),(14,'SEPHORA COLLECTION'),(15,'FOREO'),(16,'goop'),(17,'FaceGym'),(18,'Dyson
'),(19,'amika'),(20,'OUAI'),(21,'CHANEL'),(22,'BURBERRY'),(23,'Prada'),(24,'Versace'),(25,'DOLCE & GABBANA'),(26,'Chloé'),(27,'Fenty Beauty by Rihanna'),(28,'Wander Beauty'),(29,'Elie Saab'),(30,'Biossance');


 
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('BACKSTAGE Eyeshadow Palette','P432504', 'https://www.sephora.com/product/backstage-eyeshadow-palette-P432504?skuId=2191435&icid2=products%20grid:p432504:product', 2,1,'https://www.sephora.com/productimages/sku/s2191435-main-zoom.jpg?imwidth=612',49);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Mini Voyageur Eyeshadow Palette','P441810','https://www.sephora.com/product/voyageur-eyeshadow-palette-mini-P441810?skuId=2191880&icid2=products%20grid:p441810:product',9,1,'https://www.sephora.com/productimages/sku/s2191880-main-zoom.jpg?imwidth=612',32);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('5 Couleurs Couture Eyeshadow Palette','P463032','https://www.sephora.com/product/dior-5-couleurs-couture-eyeshadow-palette-P463032?skuId=2365211&icid2=products%20grid:p463032:product',2,1,'https://www.sephora.com/productimages/sku/s2365211-main-zoom.jpg?imwidth=612',62);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Eye Color Quad Eyeshadow Palette','P422568','https://www.sephora.com/product/eye-color-quad-P422568?skuId=2335719&icid2=products%20grid:p422568:product',6,1,'https://www.sephora.com/productimages/sku/s2335719-main-zoom.jpg?imwidth=612',90);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Soleil Neige Eye Color Quad','P503100','https://www.sephora.com/product/tom-ford-soleil-neige-eye-quad-P503100?skuId=2629327&icid2=products%20grid:p503100:product',6,1,'https://www.sephora.com/productimages/sku/s2629327-main-zoom.jpg?imwidth=612',90);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Color Shifter Mini Eyeshadow Palette','P503921','https://www.sephora.com/product/sephora-collection-sc-color-shifter-mini-eyeshadow-palette-P503921?skuId=2606630&icid2=products%20grid:p503921:product',14,1,'https://www.sephora.com/productimages/sku/s2606630-main-zoom.jpg?imwidth=612',10);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Eye Love Bloom Eyeshadow Palette','P471080','https://www.sephora.com/product/sephora-collection-eye-love-bloom-eyeshadow-palette-P471080?skuId=2395325&icid2=products%20grid:p471080:product',14,1,'https://www.sephora.com/productimages/sku/s2395325-main-zoom.jpg?imwidth=612',9);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Luxury Eyeshadow Palette', 'P433523','https://www.sephora.com/product/luxury-eyeshadow-palette-P433523?skuId=2102614&icid2=products%20grid:p433523:product', 5,1, 'https://www.sephora.com/productimages/sku/s2102614-main-zoom.jpg?imwidth=612',53);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Luxury Eyeshadow Palette - Walk of No Shame Collection','P462845','https://www.sephora.com/product/charlotte-tilbury-luxury-eyeshadow-palette-walk-no-shame-collection-P462845?skuId=2368470&icid2=products%20grid:p462845:product',5,1,'https://www.sephora.com/productimages/sku/s2368470-main-zoom.jpg?imwidth=612',53);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Clean Glitter Eyeshadow Palette','P484070','https://www.sephora.com/product/sephora-collection-clean-glitter-eyeshadow-palette-P484070?skuId=2420974&icid2=products%20grid:p484070:product',14,1,'https://www.sephora.com/productimages/sku/s2420974-main-zoom.jpg?imwidth=612',18);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Lash Idôle Lash-Lifting & Volumizing Mascara','P467208','https://www.sephora.com/product/lancome-lash-idole-lash-lifting-volumizing-mascara-P467208?skuId=2417145&icid2=products%20grid:p467208:product',3,1,'https://www.sephora.com/productimages/sku/s2417145-main-zoom.jpg?imwidth=612',30);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('BADgal BANG! Volumizing Mascara','P427517','https://www.sephora.com/product/bad-gal-bang-mascara-P427517?skuId=2031649&icid2=products%20grid:p427517:product',7,1,'https://www.sephora.com/productimages/sku/s2031649-main-zoom.jpg?imwidth=612',28);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('They are Real! Lengthening Mascara','P289307','https://www.sephora.com/product/they-re-real-lengthening-volumizing-mascara-P289307?skuId=1343938&icid2=products%20grid:p289307:product',7,1,'https://www.sephora.com/productimages/sku/s1343938-main-zoom.jpg?imwidth=612',28);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Monsieur Big Volumizing Mascara','P419848','https://www.sephora.com/product/monsieur-big-mascara-P419848?skuId=1956176&icid2=products%20grid:p419848:product',3,1,'https://www.sephora.com/productimages/sku/s1956176-main-zoom.jpg?imwidth=612',30);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Mini Mascara Fest Value Set','P482251','https://www.sephora.com/product/benefit-cosmetics-mascara-mini-fest-mascara-value-set-P482251?skuId=2544187&icid2=products%20grid:p482251:product',7,1,'https://www.sephora.com/productimages/sku/s2544187-main-zoom.jpg?imwidth=612',25);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Multi-Peptide Lash and Brow Serum','P500423','https://www.sephora.com/product/multi-peptide-lash-brow-serum-P500423?skuId=2532588&icid2=products%20grid:p500423:product',1,1,'https://www.sephora.com/productimages/sku/s2532588-main-zoom.jpg?imwidth=612',14);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Full Frontal Volume, Lift & Curl Mascara','P45432919','https://www.sephora.com/product/fenty-beauty-rihanna-full-frontal-volume-lift-curl-mascara-P45432919?skuId=2294312&icid2=products%20grid:p45432919:product',27,1,'https://www.sephora.com/productimages/sku/s2294312-main-zoom.jpg?imwidth=612',24);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('tartelette tubing mascara', 'P500182','https://www.sephora.com/product/tartelette-tubing-mascara-P500182?skuId=2585628&icid2=products%20grid:p500182:product',4,1,'https://www.sephora.com/productimages/sku/s2585628-main-zoom.jpg?imwidth=612',24);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Climax Mascara','P434385','https://www.sephora.com/product/climax-mascara-P434385?skuId=2090090&icid2=products%20grid:p434385:product',9,1,'https://www.sephora.com/productimages/sku/s2090090-main-zoom.jpg?imwidth=612',25);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('LashCraft Big Volume Volumizing Mascara','P420612','https://www.sephora.com/product/lashcraft-big-volume-mascara-P420612?skuId=1921709&icid2=products%20grid:p420612:product',14,1,'https://www.sephora.com/productimages/sku/s1921709-main-zoom.jpg?imwidth=612',14);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Matte Revolution Lipstick','P433530','https://www.sephora.com/product/matte-revolution-lipstick-P433530?skuId=2116879&icid2=products%20grid:p433530:product',5,1,'https://www.sephora.com/productimages/sku/s2116879-main-zoom.jpg?imwidth=612',34);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Dior Addict Refillable Shine Lipstick','P481969','https://www.sephora.com/product/dior-dior-addict-refillable-shine-lipstick-P481969?skuId=2509263&icid2=products%20grid:p481969:product',2,1,'https://www.sephora.com/productimages/sku/s2509263-main-zoom.jpg?imwidth=612',42);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Lip Color Lipstick','P416057','https://www.sephora.com/product/lip-color-P416057?skuId=1917244&icid2=products%20grid:p416057:product',6,1,'https://www.sephora.com/productimages/sku/s1917244-main-zoom.jpg?imwidth=612',58);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Powermatte Long-Lasting Lipstick','P501583','https://www.sephora.com/product/nars-powermatte-lipstick-P501583?skuId=2599108&icid2=products%20grid:p501583:product',9,1,'https://www.sephora.com/productimages/sku/s2599108-main-zoom.jpg?imwidth=612',34);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Lipstick','P448502','https://www.sephora.com/product/lipstick-P448502?skuId=2245751&icid2=products%20grid:p448502:product',9,1,'https://www.sephora.com/productimages/sku/s2245751-main-zoom.jpg?imwidth=612',26);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Hyaluronic Happikiss Lipstick Balm','P468347','https://www.sephora.com/product/charlotte-tilbury-hyaluronic-happi-kiss-color-lip-balm-P468347?skuId=2420503&icid2=products%20grid:p468347:product',5,1,'https://www.sephora.com/productimages/sku/s2420503-main-zoom.jpg?imwidth=612',34);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Lip Liner To Go','P395532','https://www.sephora.com/product/lip-liner-to-go-P395532?skuId=1656032&icid2=products%20grid:p395532:product',14,1,'https://www.sephora.com/productimages/sku/s1656032-main-zoom.jpg?imwidth=612',6);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('maracuja juicy lip liner','P504210','https://www.sephora.com/product/tarte-maracuja-juicy-lip-liner-P504210?skuId=2641256&icid2=products%20grid:p504210:product',4,1,'https://www.sephora.com/productimages/sku/s2641256-main-zoom.jpg?imwidth=612',20);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Velvet Matte Lipstick Pencil','P78834','https://www.sephora.com/product/velvet-matte-lip-pencil-P78834?skuId=1900083&icid2=products%20grid:p78834:product',9,1,'https://www.sephora.com/productimages/sku/s1900083-main-zoom.jpg?imwidth=612',27);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Le Lip Liner','P54433','https://www.sephora.com/product/le-lipstique-lipcolouring-stick-with-brush-P54433?skuId=785162&icid2=products%20grid:p54433:product',3,1,'https://www.sephora.com/productimages/sku/s785162-main-zoom.jpg?imwidth=612',28);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Natural Moisturizing Factors + HA', 'P427414','https://www.sephora.com/product/the-ordinary-deciem-natural-moisturizing-factors-ha-P427414?skuId=2210581&icid2=products%20grid:p427414:product',1,3,'https://www.sephora.com/productimages/sku/s2210581-main-zoom.jpg?imwidth=612',13);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Magic Cream Moisturizer with Hyaluronic Acid','P433520','https://www.sephora.com/product/charlotte-s-magic-cream-P433520?skuId=2486272&icid2=products%20grid:p433520:product',5,3,'https://www.sephora.com/productimages/sku/s2486272-main-zoom.jpg?imwidth=612',100);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Mini Charlottes Magic Cream','P435975','https://www.sephora.com/product/charlotte-s-magic-cream-mini-P435975?skuId=2142065&icid2=products%20grid:p435975:product',5,3,'https://www.sephora.com/productimages/sku/s2142065-main-zoom.jpg?imwidth=612',29);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('100% Organic Cold-Pressed Rose Hip Seed Oil','P427415','https://www.sephora.com/product/the-ordinary-deciem-100-organic-cold-pressed-rose-hip-seed-oil-P427415?skuId=2031417&icid2=products%20grid:p427415:product',1,3,'https://www.sephora.com/productimages/sku/s2031417-main-zoom.jpg?imwidth=612',11);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('La Mousse OFF/ON Foaming Face Cleanser','P481972','https://www.sephora.com/product/dior-foaming-cleanser-la-mousse-reform-P481972?skuId=2552693&icid2=products%20grid:p481972:product',2,3,'https://www.sephora.com/productimages/sku/s2552693-main-zoom.jpg?imwidth=612',47);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('knockout daily exfoliating cleanser','P454376','https://www.sephora.com/product/tarte-knockout-daily-exfoliating-cleanser-P454376?skuId=2315885&icid2=products%20grid:p454376:product',4,3,'https://www.sephora.com/productimages/sku/s2315885-main-zoom.jpg?imwidth=612',12);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Serum Serum Serum','P461937','https://www.sephora.com/product/foreo-serum-serum-serum-P461937?skuId=2384725&icid2=products%20grid:p461937:product',15,3,'https://www.sephora.com/productimages/sku/s2384725-main-zoom.jpg?imwidth=612',59);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Marine Hyaluronics','P455899','https://www.sephora.com/product/the-ordinary-marine-hyaluronics-P455899?skuId=2336493&icid2=products%20grid:p455899:product',1,3,'https://www.sephora.com/productimages/sku/s2336493-main-zoom.jpg?imwidth=612',9);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Vitamin Face Masks','P500743','https://www.sephora.com/product/vitamin-face-masks-P500743?skuId=2568707&icid2=products%20grid:p500743:product',14,3,'https://www.sephora.com/productimages/sku/s2568707-main-zoom.jpg?imwidth=612',5);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Clean Foot Mask','P461520','https://www.sephora.com/product/sephora-collection-clean-foot-mask-P461520?skuId=2560431&icid2=products%20grid:p461520:product',14,3,'https://www.sephora.com/productimages/sku/s2560431-main-zoom.jpg?imwidth=612',5);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Chloé Perfumed Deodorant Spray','P380545','https://www.sephora.com/product/chloe-perfumed-deodorant-spray-P380545?skuId=1425453&icid2=products%20grid:p380545:product',26,6,'https://www.sephora.com/productimages/sku/s1425453-main-zoom.jpg?imwidth=612',32);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Dean Street Gentle Body Wash','P449773','https://www.sephora.com/product/body-cleanser-P449773?skuId=2269462&icid2=products%20grid:p449773:product',20,6,'https://www.sephora.com/productimages/sku/s2269462-main-zoom.jpg?imwidth=612',28);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Cleansing Scalp & Body Sugar Scrub','P434221','https://www.sephora.com/product/scalp-body-scrub-P434221?skuId=2124121&icid2=products%20grid:p434221:product',20,6,'https://www.sephora.com/productimages/sku/s2124121-main-zoom.jpg?imwidth=612',38);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Sugar Body Scrub','P455221','https://www.sephora.com/product/sephora-collection-sugar-body-scrub-P455221?skuId=2271062&icid2=products%20grid:p455221:product',14,6,'https://www.sephora.com/productimages/sku/s2271062-main-zoom.jpg?imwidth=612',18);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Body Lava Body Luminizer','P04546871','https://www.sephora.com/product/body-lava-P04546871?skuId=2340438&icid2=products%20grid:p04546871:product',27,6,'https://www.sephora.com/productimages/sku/s2340438-main-zoom.jpg?imwidth=612',29);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Jadore Soap','P380620','https://www.sephora.com/product/j-adore-soap-P380620?skuId=1078823&icid2=products%20grid:p3806',2,6,'https://www.sephora.com/productimages/sku/s1078823-main-zoom.jpg?imwidth=612',30);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('SEA Set & Protect Mineral Sunscreen Powder Broad Spectrum SPF 30','P456603','https://www.sephora.com/product/tarte-sea-set-protect-mineral-sunscreen-powder-broad-spectrum-spf-30-P456603?skuId=2309342&icid2=products%20grid:p456603:product',4,6,'https://www.sephora.com/productimages/sku/s2309342-main-zoom.jpg?imwidth=612',14);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Mini Soleil Neige Shimmering Body Oil','P477827','https://www.sephora.com/product/tom-ford-soleil-neige-mini-shimmering-body-oil-P477827?skuId=2475341&icid2=products%20grid:p477827:product',6,6,'https://www.sephora.com/productimages/sku/s2475341-main-zoom.jpg?imwidth=612',34);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Supplement Case','P469196','https://www.sephora.com/product/sephora-collection-supplement-case-P469196?skuId=2398287&icid2=products%20grid:p469196:product',14,6,'https://www.sephora.com/productimages/sku/s2398287-main-zoom.jpg?imwidth=612',10);
INSERT INTO products(productName, productCode, productUrl, brandId, catigoryId,img,price) VALUES ('Rose Hair & Body Oil','P419005','https://www.sephora.com/product/rose-hair-body-oil-P419005?skuId=1837194&icid2=products%20grid:p419005:product',20,6,'https://www.sephora.com/productimages/sku/s1837194-main-zoom.jpg?imwidth=612',32);
INSERT INTO products(productName,productCode,productUrl,brandId,catigoryId,img,price) 
 VALUES
 ('Chloé Eau de Parfum','P256308','https://www.sephora.com/product/chloe-eau-de-parfum-P256308?skuId=1239813&icid2=products%20grid:p256308:product',26,5,'https://www.sephora.com/productimages/sku/s1239813-main-zoom.jpg?imwidth=375',143),
 ('Chloé Naturelle Eau de Parfum','P477723','https://www.sephora.com/product/chloe-chloe-naturelle-eau-de-parfum-P477723?skuId=2471415&icid2=products%20grid:p477723:product',26,5,'https://www.sephora.com/productimages/sku/s2471415-main-zoom.jpg?imwidth=1500',118),
 ('Nomade Eau de Parfum
','P428451','https://www.sephora.com/product/nomade-eau-de-parfum-P428451?skuId=2037471&icid2=products%20grid:p428451:product',26,5,'https://www.sephora.com/productimages/sku/s2037471-main-zoom.jpg?imwidth=1500',143)
,('COCO MADEMOISELLE Eau de Parfum','P12495','https://www.sephora.com/product/coco-mademoiselle-P12495?skuId=513168&icid2=products%20grid:p12495:product',21,5,'https://www.sephora.com/productimages/sku/s513168-main-zoom.jpg?imwidth=1500',116),
('CHANCE EAU FRAÎCHE Eau de Toilette','P257900','https://www.sephora.com/product/chance-P257900?skuId=1001098&icid2=products%20grid:p257900:product',21,5,'https://www.sephora.com/product/chance-P257900?skuId=1001098&icid2=products%20grid:p257900:product',125),
('AHA 30% + BHA 2% Exfoliating Peeling Solution
','p442563','https://www.sephora.com/product/aha-30-bha-2-peeling-solution-P442563?skuId=2210607&icid2=products%20grid:p442563:product',1,3,'https://www.sephora.com/productimages/sku/s2210607-main-zoom.jpg?imwidth=612',9.50),
('Hyaluronic Acid 2% + B5 Hydrating Serum','p427419','https://www.sephora.com/product/the-ordinary-deciem-hyaluronic-acid-2-b5-P427419?skuId=2031375&icid2=products%20grid:p427419:product',1,3,'https://www.sephora.com/productimages/sku/s2031375-main-zoom.jpg?imwidth=612',8.90),
('Azelaic Acid 10% Suspension Brightening Cream','P427411','https://www.sephora.com/product/the-ordinary-deciem-azelaic-acid-suspension-10-P427411?skuId=2031458&icid2=products%20grid:p427411:product',1,3,'https://www.sephora.com/product/the-ordinary-deciem-azelaic-acid-suspension-10-P427411?skuId=2031458&icid2=products%20grid:p427411:product',11.10),
('Multi-Peptide Serum for Hair Density
','P442831','https://www.sephora.com/product/multi-peptide-serum-for-hair-density-P442831?skuId=2210722&icid2=products%20grid:p442831:product',1,3,'https://www.sephora.com/productimages/sku/s2210722-main-zoom.jpg?imwidth=1500',21.70),
('100% L-Ascorbic Acid Powder','P455338','https://www.sephora.com/product/the-ordinary-100-l-ascorbic-acid-powder-P455338?skuId=2336451&icid2=products%20grid:p455338:product',1,3,'https://www.sephora.com/productimages/sku/s2336451-main-zoom.jpg?imwidth=315',6.40),
('BACKSTAGE Eyeshadow Palette','P432504', 'https://www.sephora.com/product/backstage-eyeshadow-palette-P432504?skuId=2191435&icid2=products%20grid:p432504:product', 2,1,'https://www.sephora.com/productimages/sku/s2191435-main-zoom.jpg?imwidth=612',49),('Mini Voyageur Eyeshadow Palette','P441810','https://www.sephora.com/product/voyageur-eyeshadow-palette-mini-P441810?skuId=2191880&icid2=products%20grid:p441810:product',9,1,'https://www.sephora.com/productimages/sku/s2191880-main-zoom.jpg?imwidth=612',32)
;
-- INSERT INTO users(id,userName,userPassword,email) VALUES (1,'yosra','darawsha','yosra@gmail.com');
-- INSERT INTO Cart(user_id,productId,quantity) VALUES (1,1, 3);
-- INSERT INTO Cart(user_id,productId,quantity) VALUES (1,2, 4);
-- INSERT INTO Cart(user_id,productId,quantity) VALUES (1,3, 5);

COMMIT;