-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 03, 2014 at 08:07 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `357894`
--

-- --------------------------------------------------------

--
-- Table structure for table `COUNTRY`
--

CREATE TABLE IF NOT EXISTS `COUNTRY` (
  `ISO_CODE` char(2) NOT NULL,
  `NAME` varchar(80) NOT NULL,
  `PRINTABLE_NAME` varchar(80) NOT NULL,
  `ISO3` char(3) DEFAULT NULL,
  `NUM_CODE` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ISO_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COUNTRY`
--

INSERT INTO `COUNTRY` (`ISO_CODE`, `NAME`, `PRINTABLE_NAME`, `ISO3`, `NUM_CODE`) VALUES
('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
('AL', 'ALBANIA', 'Albania', 'ALB', 8),
('DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
('AD', 'ANDORRA', 'Andorra', 'AND', 20),
('AO', 'ANGOLA', 'Angola', 'AGO', 24),
('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
('AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
('AM', 'ARMENIA', 'Armenia', 'ARM', 51),
('AW', 'ARUBA', 'Aruba', 'ABW', 533),
('AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
('AT', 'AUSTRIA', 'Austria', 'AUT', 40),
('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
('BB', 'BARBADOS', 'Barbados', 'BRB', 52),
('BY', 'BELARUS', 'Belarus', 'BLR', 112),
('BE', 'BELGIUM', 'Belgium', 'BEL', 56),
('BZ', 'BELIZE', 'Belize', 'BLZ', 84),
('BJ', 'BENIN', 'Benin', 'BEN', 204),
('BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
('BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
('BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
('BR', 'BRAZIL', 'Brazil', 'BRA', 76),
('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
('BI', 'BURUNDI', 'Burundi', 'BDI', 108),
('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
('CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
('CA', 'CANADA', 'Canada', 'CAN', 124),
('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
('TD', 'CHAD', 'Chad', 'TCD', 148),
('CL', 'CHILE', 'Chile', 'CHL', 152),
('CN', 'CHINA', 'China', 'CHN', 156),
('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
('CO', 'COLOMBIA', 'Colombia', 'COL', 170),
('KM', 'COMOROS', 'Comoros', 'COM', 174),
('CG', 'CONGO', 'Congo', 'COG', 178),
('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
('HR', 'CROATIA', 'Croatia', 'HRV', 191),
('CU', 'CUBA', 'Cuba', 'CUB', 192),
('CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
('DK', 'DENMARK', 'Denmark', 'DNK', 208),
('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
('DM', 'DOMINICA', 'Dominica', 'DMA', 212),
('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
('EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
('EG', 'EGYPT', 'Egypt', 'EGY', 818),
('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
('ER', 'ERITREA', 'Eritrea', 'ERI', 232),
('EE', 'ESTONIA', 'Estonia', 'EST', 233),
('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
('FJ', 'FIJI', 'Fiji', 'FJI', 242),
('FI', 'FINLAND', 'Finland', 'FIN', 246),
('FR', 'FRANCE', 'France', 'FRA', 250),
('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
('GA', 'GABON', 'Gabon', 'GAB', 266),
('GM', 'GAMBIA', 'Gambia', 'GMB', 270),
('GE', 'GEORGIA', 'Georgia', 'GEO', 268),
('DE', 'GERMANY', 'Germany', 'DEU', 276),
('GH', 'GHANA', 'Ghana', 'GHA', 288),
('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
('GR', 'GREECE', 'Greece', 'GRC', 300),
('GL', 'GREENLAND', 'Greenland', 'GRL', 304),
('GD', 'GRENADA', 'Grenada', 'GRD', 308),
('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
('GU', 'GUAM', 'Guam', 'GUM', 316),
('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
('GN', 'GUINEA', 'Guinea', 'GIN', 324),
('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
('GY', 'GUYANA', 'Guyana', 'GUY', 328),
('HT', 'HAITI', 'Haiti', 'HTI', 332),
('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
('HN', 'HONDURAS', 'Honduras', 'HND', 340),
('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
('HU', 'HUNGARY', 'Hungary', 'HUN', 348),
('IS', 'ICELAND', 'Iceland', 'ISL', 352),
('IN', 'INDIA', 'India', 'IND', 356),
('ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
('IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
('IE', 'IRELAND', 'Ireland', 'IRL', 372),
('IL', 'ISRAEL', 'Israel', 'ISR', 376),
('IT', 'ITALY', 'Italy', 'ITA', 380),
('JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
('JP', 'JAPAN', 'Japan', 'JPN', 392),
('JO', 'JORDAN', 'Jordan', 'JOR', 400),
('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
('KE', 'KENYA', 'Kenya', 'KEN', 404),
('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
('KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
('LV', 'LATVIA', 'Latvia', 'LVA', 428),
('LB', 'LEBANON', 'Lebanon', 'LBN', 422),
('LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
('LR', 'LIBERIA', 'Liberia', 'LBR', 430),
('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
('MO', 'MACAO', 'Macao', 'MAC', 446),
('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
('MW', 'MALAWI', 'Malawi', 'MWI', 454),
('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
('MV', 'MALDIVES', 'Maldives', 'MDV', 462),
('ML', 'MALI', 'Mali', 'MLI', 466),
('MT', 'MALTA', 'Malta', 'MLT', 470),
('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
('YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
('MX', 'MEXICO', 'Mexico', 'MEX', 484),
('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
('MC', 'MONACO', 'Monaco', 'MCO', 492),
('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
('MA', 'MOROCCO', 'Morocco', 'MAR', 504),
('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
('MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
('NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
('NR', 'NAURU', 'Nauru', 'NRU', 520),
('NP', 'NEPAL', 'Nepal', 'NPL', 524),
('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
('NE', 'NIGER', 'Niger', 'NER', 562),
('NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
('NU', 'NIUE', 'Niue', 'NIU', 570),
('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
('NO', 'NORWAY', 'Norway', 'NOR', 578),
('OM', 'OMAN', 'Oman', 'OMN', 512),
('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
('PW', 'PALAU', 'Palau', 'PLW', 585),
('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
('PA', 'PANAMA', 'Panama', 'PAN', 591),
('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
('PE', 'PERU', 'Peru', 'PER', 604),
('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
('PL', 'POLAND', 'Poland', 'POL', 616),
('PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
('QA', 'QATAR', 'Qatar', 'QAT', 634),
('RE', 'REUNION', 'Reunion', 'REU', 638),
('RO', 'ROMANIA', 'Romania', 'ROM', 642),
('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
('RW', 'RWANDA', 'Rwanda', 'RWA', 646),
('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
('WS', 'SAMOA', 'Samoa', 'WSM', 882),
('SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
('SN', 'SENEGAL', 'Senegal', 'SEN', 686),
('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
('SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
('SO', 'SOMALIA', 'Somalia', 'SOM', 706),
('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
('ES', 'SPAIN', 'Spain', 'ESP', 724),
('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
('SD', 'SUDAN', 'Sudan', 'SDN', 736),
('SR', 'SURINAME', 'Suriname', 'SUR', 740),
('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
('SE', 'SWEDEN', 'Sweden', 'SWE', 752),
('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158),
('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
('TH', 'THAILAND', 'Thailand', 'THA', 764),
('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
('TG', 'TOGO', 'Togo', 'TGO', 768),
('TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
('TO', 'TONGA', 'Tonga', 'TON', 776),
('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
('TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
('TR', 'TURKEY', 'Turkey', 'TUR', 792),
('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
('TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
('UG', 'UGANDA', 'Uganda', 'UGA', 800),
('UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
('US', 'UNITED STATES', 'United States', 'USA', 840),
('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
('UY', 'URUGUAY', 'Uruguay', 'URY', 858),
('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
('VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
('YE', 'YEMEN', 'Yemen', 'YEM', 887),
('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `GUEST`
--

CREATE TABLE IF NOT EXISTS `GUEST` (
  `ID_GUEST` int(11) NOT NULL,
  `ISO_CODE` char(2) DEFAULT NULL,
  `F_NAME` varchar(100) NOT NULL,
  `L_NAME` varchar(100) NOT NULL,
  `GENDER` varchar(1) DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_GUEST`),
  KEY `FK_SEASON` (`ISO_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GUEST`
--

INSERT INTO `GUEST` (`ID_GUEST`, `ISO_CODE`, `F_NAME`, `L_NAME`, `GENDER`, `DATE_OF_BIRTH`, `EMAIL`, `PHONE`, `ADDRESS`) VALUES
(0, 'AU', 'Owen', 'Cook', 'M', '1970-09-01', 'owenc@rsd.com', '+1-541-754-3010', '1 East Washington'),
(1, 'AU', 'Ann', 'Oreb', 'F', '1983-03-24', 'anno@gmail.com', '+1-541-326-8973', '45 Flinders Street'),
(2, 'HR', 'Ivan', 'Vlašić', 'M', '1989-07-12', 'ivanv@globalnet.hr', '+38502312487', '11 Ulica žrtava harakirija'),
(3, 'HR', 'Mićo', 'Čabatina', 'M', '1975-05-25', 'micoc@carnet.hr', '+385098423395', '13 Ulica žrtava harakirija');

-- --------------------------------------------------------

--
-- Table structure for table `RESERVATION`
--

CREATE TABLE IF NOT EXISTS `RESERVATION` (
  `ID_RESERVATION` int(11) NOT NULL,
  `ID_GUEST` int(11) NOT NULL,
  `ARRIVAL_DATE` date DEFAULT NULL,
  `DEPARTURE_DATE` date DEFAULT NULL,
  `NUM_OF_PERSONS` int(11) DEFAULT NULL,
  `TOTAL_PRICE` int(11) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `ADDITIONAL_INFO` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID_RESERVATION`),
  KEY `FK_GUEST` (`ID_GUEST`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RESERVATION`
--

INSERT INTO `RESERVATION` (`ID_RESERVATION`, `ID_GUEST`, `ARRIVAL_DATE`, `DEPARTURE_DATE`, `NUM_OF_PERSONS`, `TOTAL_PRICE`, `STATE`, `ADDITIONAL_INFO`) VALUES
(0, 0, '2013-05-15', '2013-05-23', 2, 320, 0, NULL),
(1, 1, '2013-06-11', '2013-06-19', 3, 440, 1, NULL),
(2, 2, '2013-08-22', '2013-08-29', 2, 420, 2, NULL),
(3, 3, '2013-09-11', '2013-09-20', 1, 450, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RESERVATION_DETAIL`
--

CREATE TABLE IF NOT EXISTS `RESERVATION_DETAIL` (
  `ID_RESERVATION_DETAIL` int(11) NOT NULL,
  `ID_RESERVATION` int(11) NOT NULL,
  `ENQUIRY_DATE` date DEFAULT NULL,
  `ADVANCE_PERCENT` int(11) DEFAULT NULL,
  `ADVANCE_AMOUNT` int(11) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_RESERVATION_DETAIL`),
  KEY `FK_RESERVATION` (`ID_RESERVATION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RESERVATION_DETAIL`
--

INSERT INTO `RESERVATION_DETAIL` (`ID_RESERVATION_DETAIL`, `ID_RESERVATION`, `ENQUIRY_DATE`, `ADVANCE_PERCENT`, `ADVANCE_AMOUNT`, `STATE`) VALUES
(0, 0, '2013-01-22', 20, 64, 0),
(1, 1, '2013-02-28', 20, 88, 0),
(2, 1, '0000-00-00', 15, 66, 1),
(3, 2, '2013-04-02', 20, 84, 0),
(4, 2, '2013-04-04', 20, 84, 1),
(5, 2, '2013-04-10', 20, 84, 2),
(6, 3, '2013-02-11', 20, 90, 0),
(7, 3, '2013-02-13', 10, 45, 0),
(8, 3, '2013-02-15', 10, 45, 3);

-- --------------------------------------------------------

--
-- Table structure for table `SEASON`
--

CREATE TABLE IF NOT EXISTS `SEASON` (
  `ID_SEASON` int(11) NOT NULL,
  `SEASON_CODE` varchar(20) NOT NULL,
  `BEGINNING` date NOT NULL,
  `ENDING` date NOT NULL,
  `PRICE_PER_NIGHT` int(11) DEFAULT NULL,
  `SEASON_TYPE` varchar(255) DEFAULT NULL,
  `SEASON_YEAR` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`ID_SEASON`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SEASON`
--

INSERT INTO `SEASON` (`ID_SEASON`, `SEASON_CODE`, `BEGINNING`, `ENDING`, `PRICE_PER_NIGHT`, `SEASON_TYPE`, `SEASON_YEAR`) VALUES
(0, 'HSEASON1', '2013-01-01', '2013-01-04', 60, 'HIGH_SEASON', '2013'),
(1, 'REST1', '2013-01-05', '2013-04-30', 40, 'OUTER_SEASON', '2013'),
(2, 'BSEASONE', '2013-05-01', '2013-05-31', 40, 'BEGINNING_SEASON', '2013'),
(3, 'PSEASON', '2013-06-01', '2013-06-30', 50, 'PRE_SEASON', '2013'),
(4, 'HSEASON2', '2013-07-01', '2013-08-31', 60, 'HIGH_SEASON', '2013'),
(5, 'HSEASON3', '2013-09-01', '2013-09-30', 50, 'HIGH_SEASON', '2013'),
(6, 'ESEASON', '2013-10-01', '2013-10-31', 50, 'END_SEASON', '2013'),
(7, 'REST2', '2013-11-01', '2013-12-15', 40, 'OUTER_SEASON', '2013'),
(8, 'HSEASON4', '2013-12-16', '2014-01-04', 60, 'HIGH_SEASON', '2013'),
(9, 'NSEASON', '2014-01-05', '2014-01-31', 40, 'NEXT_SEASON', '2013'),
(10, 'HSEASON1', '2014-01-01', '2014-01-04', 60, 'HIGH_SEASON', '2014'),
(11, 'REST1', '2014-01-05', '2014-04-30', 40, 'OUTER_SEASON', '2014'),
(12, 'BSEASONE', '2014-05-01', '2014-05-31', 40, 'BEGINNING_SEASON', '2014'),
(13, 'PSEASON', '2014-06-01', '2014-06-30', 50, 'PRE_SEASON', '2014'),
(14, 'HSEASON2', '2014-07-01', '2014-08-31', 60, 'HIGH_SEASON', '2014'),
(15, 'HSEASON3', '2014-09-01', '2014-09-30', 50, 'HIGH_SEASON', '2014'),
(16, 'ESEASON', '2014-10-01', '2014-10-31', 50, 'END_SEASON', '2014'),
(17, 'REST2', '2014-11-01', '2014-12-15', 40, 'OUTER_SEASON', '2014'),
(18, 'HSEASON4', '2014-12-16', '2015-01-04', 60, 'HIGH_SEASON', '2014'),
(19, 'NSEASON', '2015-01-05', '2015-01-31', 40, 'NEXT_SEASON', '2014'),
(20, 'HSEASON1', '2015-01-01', '2015-01-04', 60, 'HIGH_SEASON', '2015'),
(21, 'REST1', '2015-01-05', '2014-05-30', 40, 'OUTER_SEASON', '2015'),
(22, 'BSEASONE', '2015-05-01', '2015-05-31', 40, 'BEGINNING_SEASON', '2015'),
(23, 'PSEASON', '2015-06-01', '2015-06-30', 50, 'PRE_SEASON', '2015'),
(24, 'HSEASON2', '2015-07-01', '2015-08-31', 60, 'HIGH_SEASON', '2015'),
(25, 'HSEASON3', '2015-09-01', '2015-09-30', 50, 'HIGH_SEASON', '2015'),
(26, 'ESEASON', '2015-10-01', '2015-10-31', 50, 'END_SEASON', '2015'),
(27, 'REST2', '2015-11-01', '2015-12-15', 40, 'OUTER_SEASON', '2015'),
(28, 'HSEASON4', '2015-12-16', '2016-01-04', 60, 'HIGH_SEASON', '2015'),
(29, 'NSEASON', '2016-01-05', '2016-01-31', 40, 'NEXT_SEASON', '2015');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
