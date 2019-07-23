UPDATE listenguideline SET image = 'java-framework.jpg' where listenguidelineid > 0;
ALTER TABLE listenguideline MODIFY COLUMN title VARCHAR(512) NOT NULL;
ALTER TABLE listenguideline MODIFY COLUMN content TEXT NOT NULL;
ALTER TABLE listenguideline MODIFY COLUMN image VARCHAR(255) NOT NULL;
ALTER TABLE listenguideline MODIFY COLUMN createddate TIMESTAMP NOT NULL;
ALTER TABLE listenguideline ADD UNIQUE (title);