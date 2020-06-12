-- La table contenant les éléments Fieldiens
--

DROP TABLE IF EXISTS `field_elements`;

CREATE TABLE `field_elements` (
  id INT(11) AUTO_INCREMENT PRIMARY KEY,
  type_id TINYINT NOT NULL
);

DROP TABLE IF EXISTS `types_element`;

CREATE TABLE `types_element` (
  id  TINYINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL, -- par exemple 'Développement', 'Pivot 1'
  dim VARCHAR(30) NOT NULL, -- par exemple 'dev' ou 'pvt1'
  description TEXT
);

INSERT INTO `types_element` (name, dim, description)
VALUES
  ('Exposition', 'expo', "Premier acte de la structure générale"),
  ('Développement P1', 'devp1', "Première moitié du développement"),
  ('Développement P2', 'devp2', "Seconde moitié du développement"),
  ('Dénouvement', 'denoue', "Troisième acte de la structure générale"),
  ('Prélude', 'prelude', "Premier temps de l'exposition"),
  ('Incident perturbateur', 'incper', "Premier incident qui met à mal le personnage"),
  ('Incident déclencheur', 'incdec', "Incident qui déclenche véritablement l'histoire, ou va la déclencher"),
  ('QDF', 'qdf', "Question Dramatique Fondamentale posée"),
  ('Refus de l’appel', 'refus', "Zone de temps pendant laquelle le personnage refuse son histoire (ou d'autres la refusent pour lui)"),
  ('Pivot 1', 'pvt1', "Nœud qui fait basculer l'histoire dans le développement"),
  ('Première action post-expo', 'act1dev', "La toute première action du développement"),
  ('Clé de voûte', 'cdv', "Milieu de l'histoire, qui la divise en deux parties"),
  ('Première action post-clé de voûte', 'act1cdv', "Première action après la clé de voûte"),
  ('Crise de fin de développement', 'crisedev', "La crise, quand on la trouve dans le développement"),
  ('Pivot 2', 'pvt2', 'Nœud dramatique important qui fait basculer dans le dénouement'),
  ('Première action du dénouement', 'act1denoue', "La toute première action du dénouvement"),
  ('Crise de dénouement', 'crisedenoue', "La crise, quand elle a lieu dans le dénouement"),
  ('Climax', 'climax', "L'affrontement entre les forces antagonistes"),
  ('RDF', 'rdf', "La Réponse Dramatique Fondamentale donnée"),
  ('Désinence', 'desin', "La fin finale de l'histoire")
;
