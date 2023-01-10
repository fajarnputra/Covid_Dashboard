create table CovidPopulation (
iso_code varchar(255) not null,
continent varchar(255) default null,
location varchar(255) not null,
dates date not null,
population  bigint default null);