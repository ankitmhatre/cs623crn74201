CREATE TABLE Product(prod_id VARCHAR(10), pname VARCHAR(30), price  DECIMAL);
ALTER TABLE Product ADD CONSTRAINT pk_product PRIMARY KEY (prod_id);
ALTER TABLE Product ADD CONSTRAINT ck_product_price CHECK (price > 0);



CREATE TABLE Depot( dep_id  VARCHAR(10), addr     VARCHAR(30), price NUMERIC);

ALTER TABLE Depot ADD CONSTRAINT pk_depot PRIMARY KEY (dep_id);

CREATE TABLE Stock(prod_id VARCHAR(10), dep_id VARCHAR(10),  price NUMERIC);







ALTER TABLE Stock ADD CONSTRAINT fk_stock_prod_id FOREIGN KEY(prod_id) REFERENCES Product(prod_id);

ALTER TABLE Stock ADD CONSTRAINT fk_stock_dep_id FOREIGN KEY(dep_id) REFERENCES Depot(dep_id);




INSERT INTO Product(prod_id, pname, price) VALUES('p1', 'tape', 2.5);
INSERT INTO Product(prod_id, pname, price) VALUES('p2', 'tv', 250);
INSERT INTO Product(prod_id, pname, price) VALUES('p3', 'vcr', 80);

INSERT INTO Depot(dep_id, addr, price) VALUES('d1', 'New York', 9000);
INSERT INTO Depot(dep_id, addr, price) VALUES('d2', 'Syracuse', 6000);
INSERT INTO Depot(dep_id, addr, price) VALUES('d4', 'New York', 2000);


INSERT INTO Stock(prod_id, dep_id, price) VALUES('p1', 'd1', 1000);
INSERT INTO Stock(prod_id, dep_id, price) VALUES('p1', 'd2', -100);
INSERT INTO Stock(prod_id, dep_id, price) VALUES('p1', 'd4', 1200);
INSERT INTO Stock(prod_id, dep_id, price) VALUES('p3', 'd1', 3000);
INSERT INTO Stock(prod_id, dep_id, price) VALUES('p3', 'd4', 2000);
INSERT INTO Stock(prod_id, dep_id, price) VALUES('p2', 'd4', 1500);
INSERT INTO Stock(prod_id, dep_id, price) VALUES('p2', 'd1', -400);
INSERT INTO Stock(prod_id, dep_id, price) VALUES('p2', 'd2', 2000);





BEGIN;

ALTER TABLE Stock DROP CONSTRAINT fk_stock_prod_id;
ALTER TABLE Stock DROP CONSTRAINT fk_stock_dep_id;


ALTER TABLE Stock ADD CONSTRAINT fk_stock_prod_id FOREIGN KEY(prod_id) REFERENCES Product(prod_id) ON UPDATE CASCADE;
ALTER TABLE Stock ADD CONSTRAINT fk_stock_dep_id FOREIGN KEY(dep_id) REFERENCES Depot(dep_id) ON UPDATE CASCADE;

UPDATE Depot
SET dep_id = 'dd1'
WHERE dep_id ='d1';
COMMIT;
