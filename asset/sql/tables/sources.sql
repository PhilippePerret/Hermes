-- Pour définir la table qui contient la source
-- des exemples, en général des films.

DROP TABLE IF EXISTS `sources`;

CREATE TABLE `sources` (
  id INT(10) AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  type TINYINT NOT NULL
);
