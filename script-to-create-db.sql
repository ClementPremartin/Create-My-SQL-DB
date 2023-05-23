SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS recruiter;
DROP TABLE IF EXISTS candidate;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS offer;
DROP TABLE IF EXISTS offer_application;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `recruiter` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`company_id` INT NOT NULL UNIQUE,
	`email` varchar(250) NOT NULL UNIQUE,
	`hashedPassword` varchar(250) NOT NULL
);

CREATE TABLE `candidate` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`email` varchar(250) NOT NULL UNIQUE,
	`hashed_password` varchar(250) NOT NULL UNIQUE,
	`lastname` varchar(250) NOT NULL,
	`firstname` varchar(250) NOT NULL,
	`phone` varchar(30) NOT NULL UNIQUE,
	`presentation` varchar(250) NOT NULL
);

CREATE TABLE `company` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`name` varchar(250) NOT NULL,
	`description` varchar(250) NOT NULL
);

CREATE TABLE `offer` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`company_id` INT NOT NULL,
	`title` varchar(250) NOT NULL,
	`description` varchar(250) NOT NULL,
	`city` varchar(250) NOT NULL
);

CREATE TABLE `offer_application` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`candidate_id` INT NOT NULL,
	`offer_id` INT NOT NULL,
	UNIQUE KEY `candidate_offer_unique_constraint` (`candidate_id`, `offer_id`)
);

ALTER TABLE `recruiter` ADD CONSTRAINT `recruiter_fk0` FOREIGN KEY (`company_id`) REFERENCES `company`(`id`);

ALTER TABLE `offer` ADD CONSTRAINT `offer_fk0` FOREIGN KEY (`company_id`) REFERENCES `company`(`id`);

ALTER TABLE `offer_application` ADD CONSTRAINT `offer_application_fk0` FOREIGN KEY (`candidate_id`) REFERENCES `candidate`(`id`) ON DELETE CASCADE;

ALTER TABLE `offer_application` ADD CONSTRAINT `offer_application_fk1` FOREIGN KEY (`offer_id`) REFERENCES `offer`(`id`) ON DELETE CASCADE;


insert into company (id, name, description) values (1, 'Feedfish', 'Saga of Gosta Berling, The (Gösta Berlings saga)');
insert into company (id, name, description) values (2, 'Photofeed', 'Spanish Fly');
insert into company (id, name, description) values (3, 'Zooxo', 'Somewhere in the Night');
insert into company (id, name, description) values (4, 'Thoughtsphere', 'On the Riviera');
insert into company (id, name, description) values (5, 'Voonte', 'Innocent Sleep, The');
insert into company (id, name, description) values (6, 'Brainsphere', 'Wu Tang Master (Tian shi zhuang xie)');
insert into company (id, name, description) values (7, 'Katz', 'Night of the Living Dead');
insert into company (id, name, description) values (8, 'Latz', 'Viva Zapata!');
insert into company (id, name, description) values (9, 'Realpoint', 'Grand Theft Parsons');
insert into company (id, name, description) values (10, 'Cogibox', 'Trance');

insert into recruiter (id, email, hashedPassword, company_id) values (1, 'tkobiera0@acquirethisname.com', 'hXK6XfI8YuV', 1);
insert into recruiter (id, email, hashedPassword, company_id) values (2, 'mspurge1@ycombinator.com', 'JFZXEx3I8uGH', 2);
insert into recruiter (id, email, hashedPassword, company_id) values (3, 'apersitt2@berkeley.edu', 'OvTEv6LV0SU', 3);
insert into recruiter (id, email, hashedPassword, company_id) values (4, 'pmityashev3@aboutads.info', 'K45Kht', 4);
insert into recruiter (id, email, hashedPassword, company_id) values (5, 'dklosges4@51.la', 'MydKxtny2', 5);
insert into recruiter (id, email, hashedPassword, company_id) values (6, 'mmogra5@sohu.com', 'eUgeskQ', 6);
insert into recruiter (id, email, hashedPassword, company_id) values (7, 'mdesseine6@shutterfly.com', 'vGmplgb4', 7);
insert into recruiter (id, email, hashedPassword, company_id) values (8, 'dbolderstone7@cdc.gov', 'y6AW2B', 8);
insert into recruiter (id, email, hashedPassword, company_id) values (9, 'rdecreuze8@pbs.org', 'X4fFlExe', 9);
insert into recruiter (id, email, hashedPassword, company_id) values (10, 'pstirland9@jiathis.com', 'BJuweTil7Nmn', 10);

insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (1, 'abunny0@merriam-webster.com', 'jt9zsJUiqZE', 'Bunny', 'Maëlys', '469-869-7572', 'Arak University of Technology');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (2, 'csamuels1@hugedomains.com', 'sp9plJU', 'Samuels', 'Cinéma', '348-496-7239', 'University of Science and Technology Sana''a');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (3, 'bguiduzzi2@harvard.edu', 'DQPqPYErN2o', 'Guiduzzi', 'Nadège', '611-765-8187', 'Ecole Européen des Affaires');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (4, 'bleadbeatter3@google.es', 'WgZLKQoqD1', 'Leadbeatter', 'Styrbjörn', '699-191-8689', 'Indiana State University');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (5, 'metheredge4@un.org', 's6iU0hSblRd', 'Etheredge', 'Méng', '540-367-9484', 'Universidad Lasallista Benavente');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (6, 'hmathouse5@uol.com.br', 'XtgpSF8fVkp', 'Mathouse', 'Méline', '392-868-3868', 'Milwaukee School of Engineering');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (7, 'dpagram6@zdnet.com', 'LlHfMl', 'Pagram', 'Maïly', '566-256-9191', 'North South University');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (8, 'tblaney7@t-online.de', '3HyPwV', 'Blaney', 'Régine', '904-980-9845', 'Hokkaido Institute of Pharmaceutical Sciences');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (9, 'apaddemore8@apache.org', 'pMck0AmMcWKG', 'Paddemore', 'Erwéi', '811-497-1205', 'Kamrah International Institute of Technology (KIIT)');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (10, 'spinchen9@squarespace.com', 'nAgflyW', 'Pinchen', 'Célestine', '435-262-4494', 'Universidad Nacional de Educación a Distancia');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (11, 'astrahana@opensource.org', 'nTJDKCz', 'Strahan', 'Ophélie', '168-848-1663', 'University of Seychelles - American Institute of Medicine');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (12, 'cglasonb@baidu.com', 'dzrif3RPe3b', 'Glason', 'Marie-josée', '242-295-1841', 'Hanyang University');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (13, 'sdanielsohnc@123-reg.co.uk', 'fjzjeGM', 'Danielsohn', 'Maïlys', '906-841-3566', 'Universidad Nacional de la Patagonia "San Juan Bosco"');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (14, 'bhaycoxd@ftc.gov', 'PgRJEgFnxgt', 'Haycox', 'Esbjörn', '372-317-9388', 'Technological University (Pathein)');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (15, 'shuortice@baidu.com', 'Szwno6N', 'Huortic', 'Danièle', '981-488-0820', 'Lawrence Technological University');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (16, 'sglisanef@disqus.com', 'RB7Wmx9', 'Glisane', 'Chloé', '206-290-3195', 'Ludwik Solski State Academy of Theatre in Cracow');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (17, 'hwhitemarshg@unicef.org', 'Y87B2ssUW', 'Whitemarsh', 'Mahélie', '495-298-2993', 'Agricultural University of Norway');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (18, 'krottenburyh@hexun.com', 'JKI20WOqI8G', 'Rottenbury', 'Hélène', '366-795-4455', 'Escuela Colombiana de Ingeniería Julio Garavito');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (19, 'clucasi@netlog.com', 'i372Or2JHGG', 'Lucas', 'Alizée', '373-354-2165', 'National Institute of Development Administration');
insert into candidate (id, email, hashed_password, lastname, firstname, phone, presentation) values (20, 'mspandleyj@squarespace.com', 'E7SDzl3j', 'Spandley', 'Bécassine', '364-314-6503', 'Qom University');

insert into offer (id, company_id, title, description, city) values (1, 1, 'VP Quality Control', 'Curabitur convallis.', 'Çepan');
insert into offer (id, company_id, title, description, city) values (2, 1, 'Analyst Programmer', 'Pellentesque at nulla.', 'La Goulette');
insert into offer (id, company_id, title, description, city) values (3, 1, 'Senior Quality Engineer', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Paris 12');
insert into offer (id, company_id, title, description, city) values (4, 2, 'Executive Secretary', 'Phasellus in felis.', 'Arcena Pequena');
insert into offer (id, company_id, title, description, city) values (5, 3, 'Senior Developer', 'Morbi vel lectus in quam fringilla rhoncus.', 'Karangdawa Barat');
insert into offer (id, company_id, title, description, city) values (6, 3, 'Food Chemist', 'Mauris lacinia sapien quis libero.', 'Popayán');
insert into offer (id, company_id, title, description, city) values (7, 4, 'Executive Secretary', 'Morbi non quam nec dui luctus rutrum.', 'Morales');
insert into offer (id, company_id, title, description, city) values (8, 4, 'Teacher', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 'Carvalhal');
insert into offer (id, company_id, title, description, city) values (9, 4, 'Accountant IV', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Tupã');
insert into offer (id, company_id, title, description, city) values (10, 5, 'Safety Technician II', 'Nunc rhoncus dui vel sem.', 'Ranchuelo');
insert into offer (id, company_id, title, description, city) values (11, 6, 'Analog Circuit Design manager', 'In sagittis dui vel nisl. Duis ac nibh.', 'Zapolyarnyy');
insert into offer (id, company_id, title, description, city) values (12, 6, 'General Manager', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 'Sihai');
insert into offer (id, company_id, title, description, city) values (13, 6, 'Sales Representative', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 'Olympia');
insert into offer (id, company_id, title, description, city) values (14, 6, 'Geological Engineer', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'Debark’');
insert into offer (id, company_id, title, description, city) values (15, 7, 'Business Systems Development Analyst', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'Puyehue');
insert into offer (id, company_id, title, description, city) values (16, 7, 'Senior Developer', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'Ralung');
insert into offer (id, company_id, title, description, city) values (17, 8, 'Media Manager IV', 'Aenean sit amet justo.', 'Naikoten Dua');
insert into offer (id, company_id, title, description, city) values (18, 8, 'Database Administrator III', 'Nulla tellus. In sagittis dui vel nisl.', 'Lin’an');
insert into offer (id, company_id, title, description, city) values (19, 8, 'Speech Pathologist', 'In sagittis dui vel nisl. Duis ac nibh.', 'Obispos');
insert into offer (id, company_id, title, description, city) values (20, 8, 'Nurse', 'In congue.', 'Ciherang');
insert into offer (id, company_id, title, description, city) values (21, 9, 'Account Executive', 'Nulla tellus. In sagittis dui vel nisl.', 'Almalaguês');
insert into offer (id, company_id, title, description, city) values (22, 9, 'Data Coordinator', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 'Yarang');
insert into offer (id, company_id, title, description, city) values (23, 10, 'Research Nurse', 'In congue. Etiam justo.', 'Kampinos');
insert into offer (id, company_id, title, description, city) values (24, 10, 'Quality Engineer', 'Aliquam erat volutpat. In congue.', 'Den Chai');
insert into offer (id, company_id, title, description, city) values (25, 10, 'Geologist II', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'Neuquén');
insert into offer (id, company_id, title, description, city) values (26, 10, 'Director of Sales', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Temaiku Village');
insert into offer (id, company_id, title, description, city) values (27, 10, 'Assistant Professor', 'Nulla ut erat id mauris vulputate elementum.', 'Karaundi');
insert into offer (id, company_id, title, description, city) values (28, 10, 'Physical Therapy Assistant', 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'Debar');
insert into offer (id, company_id, title, description, city) values (29, 10, 'Mechanical Systems Engineer', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 'Krajansumbermujur');
insert into offer (id, company_id, title, description, city) values (30, 10, 'Quality Engineer', 'In sagittis dui vel nisl. Duis ac nibh.', 'Xingou');

insert into offer_application (id, candidate_id, offer_id) values (1, 1, 1);
insert into offer_application (id, candidate_id, offer_id) values (2, 1, 2);
insert into offer_application (id, candidate_id, offer_id) values (3, 2, 3);
insert into offer_application (id, candidate_id, offer_id) values (4, 2, 12);
insert into offer_application (id, candidate_id, offer_id) values (5, 2, 15);
insert into offer_application (id, candidate_id, offer_id) values (6, 3, 1);
insert into offer_application (id, candidate_id, offer_id) values (7, 3, 7);
insert into offer_application (id, candidate_id, offer_id) values (8, 3, 22);
insert into offer_application (id, candidate_id, offer_id) values (9, 4, 10);
insert into offer_application (id, candidate_id, offer_id) values (10, 4, 30);
insert into offer_application (id, candidate_id, offer_id) values (11, 5, 11);
insert into offer_application (id, candidate_id, offer_id) values (12, 6, 13);
insert into offer_application (id, candidate_id, offer_id) values (13, 7, 5);
insert into offer_application (id, candidate_id, offer_id) values (14, 8, 16);
insert into offer_application (id, candidate_id, offer_id) values (15, 9, 25);
insert into offer_application (id, candidate_id, offer_id) values (16, 10, 26);
insert into offer_application (id, candidate_id, offer_id) values (17, 11, 12);
insert into offer_application (id, candidate_id, offer_id) values (18, 11, 15);
insert into offer_application (id, candidate_id, offer_id) values (19, 12, 30);
insert into offer_application (id, candidate_id, offer_id) values (20, 12, 29);
insert into offer_application (id, candidate_id, offer_id) values (21, 13, 2);
insert into offer_application (id, candidate_id, offer_id) values (22, 14, 3);
insert into offer_application (id, candidate_id, offer_id) values (23, 14, 4);
insert into offer_application (id, candidate_id, offer_id) values (24, 15, 7);
insert into offer_application (id, candidate_id, offer_id) values (25, 15, 9);
insert into offer_application (id, candidate_id, offer_id) values (26, 16, 2);
insert into offer_application (id, candidate_id, offer_id) values (27, 17, 3);
insert into offer_application (id, candidate_id, offer_id) values (28, 18, 8);
insert into offer_application (id, candidate_id, offer_id) values (29, 18, 10);
insert into offer_application (id, candidate_id, offer_id) values (30, 19, 5);
insert into offer_application (id, candidate_id, offer_id) values (31, 20, 19);


