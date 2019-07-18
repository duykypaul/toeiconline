use toeiconline;

alter table user modify column name VARCHAR(255) not null;
alter table user modify column password VARCHAR(255) not null;
alter table user modify column roleid BIGINT(20) not null;