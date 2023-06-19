-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema desis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema desis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `desis` DEFAULT CHARACTER SET utf8 ;
USE `desis` ;

-- -----------------------------------------------------
-- Table `desis`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desis`.`regiones` (
                                                  `idRegion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                  `nombre` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idRegion`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desis`.`comunas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desis`.`comunas` (
                                                 `idcomunas` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                 `nombre` VARCHAR(45) NOT NULL,
    `regiones_idRegion` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`idcomunas`),
    INDEX `fk_comunas_regiones_idx` (`regiones_idRegion` ASC),
    CONSTRAINT `fk_comunas_regiones`
    FOREIGN KEY (`regiones_idRegion`)
    REFERENCES `desis`.`regiones` (`idRegion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desis`.`candidatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desis`.`candidatos` (
                                                    `idcandidato` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                    `nombre` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idcandidato`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desis`.`votaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `desis`.`votaciones` (
                                                    `idvotaciones` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                    `nombre_completo` VARCHAR(255) NOT NULL,
    `alias` VARCHAR(45) NULL,
    `email` VARCHAR(45) NULL,
    `run` VARCHAR(45) NULL,
    `web` TINYINT NULL DEFAULT 0,
    `tv` TINYINT NULL DEFAULT 0,
    `rrss` TINYINT NULL DEFAULT 0,
    `amigo` TINYINT NULL DEFAULT 0,
    `candidatos_idcandidato` INT UNSIGNED NOT NULL,
    `comunas_idcomunas` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`idvotaciones`),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC),
    UNIQUE INDEX `run_UNIQUE` (`run` ASC),
    INDEX `fk_votaciones_candidatos1_idx` (`candidatos_idcandidato` ASC),
    INDEX `fk_votaciones_comunas1_idx` (`comunas_idcomunas` ASC),
    CONSTRAINT `fk_votaciones_candidatos1`
    FOREIGN KEY (`candidatos_idcandidato`)
    REFERENCES `desis`.`candidatos` (`idcandidato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_votaciones_comunas1`
    FOREIGN KEY (`comunas_idcomunas`)
    REFERENCES `desis`.`comunas` (`idcomunas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO regiones (nombre) VALUES
  ('Arica y Parinacota'),
  ('Tarapacá'),
  ('Antofagasta'),
  ('Atacama'),
  ('Coquimbo'),
  ('Valparaíso'),
  ('Región Metropolitana de Santiago'),
  ('Libertador General Bernardo O''Higgins'),
  ('Maule'),
  ('Ñuble'),
  ('Biobío'),
  ('La Araucanía'),
  ('Los Ríos'),
  ('Los Lagos'),
  ('Aysén del General Carlos Ibáñez del Campo'),
  ('Magallanes y de la Antártica Chilena');
SELECT * FROM regiones;

-- Insertar comunas de la Región de Arica y Parinacota
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Arica', 1),
    ('Camarones', 1),
    ('Putre', 1),
    ('General Lagos', 1);
-- Insertar comunas de la Región de Tarapacá
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Iquique', 2),
    ('Alto Hospicio', 2),
    ('Pozo Almonte', 2),
    ('Camiña', 2),
    ('Colchane', 2),
    ('Huara', 2),
    ('Pica', 2);
-- Insertar comunas de la Región de Antofagasta
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Antofagasta', 3),
    ('Mejillones', 3),
    ('Sierra Gorda', 3),
    ('Taltal', 3),
    ('Calama', 3),
    ('Ollagüe', 3),
    ('San Pedro de Atacama', 3),
    ('Tocopilla', 3),
    ('María Elena', 3);
-- Insertar comunas de la Región de Atacama
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Copiapó', 4),
    ('Caldera', 4),
    ('Tierra Amarilla', 4),
    ('Chañaral', 4),
    ('Diego de Almagro', 4),
    ('Vallenar', 4),
    ('Alto del Carmen', 4),
    ('Freirina', 4),
    ('Huasco', 4);
-- Insertar comunas de la Región de Coquimbo
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('La Serena', 5),
    ('Coquimbo', 5),
    ('Andacollo', 5),
    ('La Higuera', 5),
    ('Paiguano', 5),
    ('Vicuña', 5),
    ('Illapel', 5),
    ('Canela', 5),
    ('Los Vilos', 5),
    ('Salamanca', 5),
    ('Ovalle', 5),
    ('Combarbalá', 5),
    ('Monte Patria', 5),
    ('Punitaqui', 5),
    ('Río Hurtado', 5);
-- Insertar comunas de la Región de Valparaíso
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Valparaíso', 6),
    ('Casablanca', 6),
    ('Concón', 6),
    ('Juan Fernández', 6),
    ('Puchuncaví', 6),
    ('Quilpué', 6),
    ('Quintero', 6),
    ('Villa Alemana', 6),
    ('Viña del Mar', 6),
    ('Isla de Pascua', 6),
    ('Los Andes', 6),
    ('Calle Larga', 6),
    ('Rinconada', 6),
    ('San Esteban', 6),
    ('La Ligua', 6),
    ('Cabildo', 6),
    ('Papudo', 6),
    ('Petorca', 6),
    ('Zapallar', 6),
    ('Quillota', 6),
    ('Calera', 6),
    ('Hijuelas', 6),
    ('La Cruz', 6),
    ('Nogales', 6),
    ('San Antonio', 6),
    ('Algarrobo', 6),
    ('Cartagena', 6),
    ('El Quisco', 6),
    ('El Tabo', 6),
    ('Santo Domingo', 6),
    ('San Felipe', 6),
    ('Catemu', 6),
    ('Llaillay', 6),
    ('Panquehue', 6),
    ('Putaendo', 6),
    ('Santa María', 6),
    ('Quilpué', 6);
-- Insertar comunas de la Región Metropolitana de Santiago
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Santiago', 7),
    ('Cerrillos', 7),
    ('Cerro Navia', 7),
    ('Conchalí', 7),
    ('El Bosque', 7),
    ('Estación Central', 7),
    ('Huechuraba', 7),
    ('Independencia', 7),
    ('La Cisterna', 7),
    ('La Florida', 7),
    ('La Granja', 7),
    ('La Pintana', 7),
    ('La Reina', 7),
    ('Las Condes', 7),
    ('Lo Barnechea', 7),
    ('Lo Espejo', 7),
    ('Lo Prado', 7),
    ('Macul', 7),
    ('Maipú', 7),
    ('Ñuñoa', 7),
    ('Pedro Aguirre Cerda', 7),
    ('Peñalolén', 7),
    ('Providencia', 7),
    ('Pudahuel', 7),
    ('Quilicura', 7),
    ('Quinta Normal', 7),
    ('Recoleta', 7),
    ('Renca', 7),
    ('San Joaquín', 7),
    ('San Miguel', 7),
    ('San Ramón', 7),
    ('Vitacura', 7),
    ('Puente Alto', 7),
    ('Pirque', 7),
    ('San José de Maipo', 7),
    ('Colina', 7),
    ('Lampa', 7),
    ('Tiltil', 7),
    ('San Bernardo', 7),
    ('Buin', 7),
    ('Calera de Tango', 7),
    ('Paine', 7),
    ('Melipilla', 7),
    ('Alhué', 7),
    ('Curacaví', 7),
    ('María Pinto', 7),
    ('San Pedro', 7),
    ('Talagante', 7),
    ('El Monte', 7),
    ('Isla de Maipo', 7),
    ('Padre Hurtado', 7),
    ('Peñaflor', 7);
-- Insertar comunas de la Región Libertador General Bernardo O'Higgins
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Rancagua', 8),
    ('Codegua', 8),
    ('Coinco', 8),
    ('Coltauco', 8),
    ('Doñihue', 8),
    ('Graneros', 8),
    ('Las Cabras', 8),
    ('Machalí', 8),
    ('Malloa', 8),
    ('Mostazal', 8),
    ('Olivar', 8),
    ('Peumo', 8),
    ('Pichidegua', 8),
    ('Quinta de Tilcoco', 8),
    ('Rengo', 8),
    ('Requínoa', 8),
    ('San Vicente de Tagua Tagua', 8),
    ('Pichilemu', 8),
    ('La Estrella', 8),
    ('Litueche', 8),
    ('Marchihue', 8),
    ('Navidad', 8),
    ('Paredones', 8),
    ('San Fernando', 8),
    ('Chépica', 8),
    ('Chimbarongo', 8),
    ('Lolol', 8),
    ('Nancagua', 8),
    ('Palmilla', 8),
    ('Peralillo', 8),
    ('Placilla', 8),
    ('Pumanque', 8),
    ('Santa Cruz', 8);
-- Insertar comunas de la Región del Maule
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Talca', 9),
    ('Constitución', 9),
    ('Curepto', 9),
    ('Empedrado', 9),
    ('Maule', 9),
    ('Pelarco', 9),
    ('Pencahue', 9),
    ('Río Claro', 9),
    ('San Clemente', 9),
    ('San Rafael', 9),
    ('Cauquenes', 9),
    ('Chanco', 9),
    ('Pelluhue', 9),
    ('Curicó', 9),
    ('Hualañé', 9),
    ('Licantén', 9),
    ('Molina', 9),
    ('Rauco', 9),
    ('Romeral', 9),
    ('Sagrada Familia', 9),
    ('Teno', 9),
    ('Vichuquén', 9),
    ('Linares', 9),
    ('Colbún', 9),
    ('Longaví', 9),
    ('Parral', 9),
    ('Retiro', 9),
    ('San Javier', 9),
    ('Villa Alegre', 9),
    ('Yerbas Buenas', 9);
-- Insertar comunas de la Región de Ñuble
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Chillán', 10),
    ('Bulnes', 10),
    ('Cobquecura', 10),
    ('Coelemu', 10),
    ('Coihueco', 10),
    ('Chillán Viejo', 10),
    ('El Carmen', 10),
    ('Ninhue', 10),
    ('Ñiquén', 10),
    ('Pemuco', 10),
    ('Pinto', 10),
    ('Portezuelo', 10),
    ('Quillón', 10),
    ('Quirihue', 10),
    ('Ránquil', 16),
    ('San Carlos', 10),
    ('San Fabián', 10),
    ('San Ignacio', 10),
    ('San Nicolás', 10),
    ('Treguaco', 10),
    ('Yungay', 16);
-- Insertar comunas de la Región del Biobío
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Concepción', 11),
    ('Coronel', 11),
    ('Chiguayante', 11),
    ('Florida', 11),
    ('Hualqui', 11),
    ('Lota', 11),
    ('Penco', 11),
    ('San Pedro de la Paz', 11),
    ('Santa Juana', 11),
    ('Talcahuano', 11),
    ('Tomé', 11),
    ('Hualpén', 11),
    ('Lebu', 11),
    ('Arauco', 11),
    ('Cañete', 11),
    ('Contulmo', 11),
    ('Curanilahue', 11),
    ('Los Álamos', 11),
    ('Tirúa', 11),
    ('Los Ángeles', 11),
    ('Antuco', 11),
    ('Cabrero', 11),
    ('Laja', 11),
    ('Mulchén', 11),
    ('Nacimiento', 11),
    ('Negrete', 11),
    ('Quilaco', 11),
    ('Quilleco', 11),
    ('San Rosendo', 11),
    ('Santa Bárbara', 11),
    ('Tucapel', 11),
    ('Yumbel', 11),
    ('Alto Biobío', 11);
-- Insertar comunas de la Región de La Araucanía
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Temuco', 12),
    ('Carahue', 12),
    ('Cunco', 12),
    ('Curarrehue', 12),
    ('Freire', 12),
    ('Galvarino', 12),
    ('Gorbea', 12),
    ('Lautaro', 12),
    ('Loncoche', 12),
    ('Melipeuco', 12),
    ('Nueva Imperial', 12),
    ('Padre las Casas', 12),
    ('Perquenco', 12),
    ('Pitrufquén', 12),
    ('Pucón', 12),
    ('Saavedra', 12),
    ('Teodoro Schmidt', 12),
    ('Toltén', 12),
    ('Vilcún', 12),
    ('Villarrica', 12),
    ('Cholchol', 12),
    ('Angol', 12),
    ('Collipulli', 12),
    ('Curacautín', 12),
    ('Ercilla', 12),
    ('Lonquimay', 12),
    ('Los Sauces', 12),
    ('Lumaco', 12),
    ('Purén', 12),
    ('Renaico', 12),
    ('Traiguén', 12),
    ('Victoria', 12);
-- Insertar comunas de la Región de Los Ríos
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Valdivia', 13),
    ('Corral', 13),
    ('Lanco', 13),
    ('Los Lagos', 13),
    ('Máfil', 13),
    ('Mariquina', 13),
    ('Paillaco', 13),
    ('Panguipulli', 13),
    ('La Unión', 13),
    ('Futrono', 13),
    ('Lago Ranco', 13),
    ('Río Bueno', 13);
-- Insertar comunas de la Región de Los Lagos
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Puerto Montt', 14),
    ('Calbuco', 14),
    ('Cochamó', 14),
    ('Fresia', 14),
    ('Frutillar', 14),
    ('Los Muermos', 14),
    ('Llanquihue', 14),
    ('Maullín', 14),
    ('Puerto Varas', 14),
    ('Castro', 14),
    ('Ancud', 14),
    ('Chonchi', 14),
    ('Curaco de Vélez', 14),
    ('Dalcahue', 14),
    ('Puqueldón', 14),
    ('Queilén', 14),
    ('Quellón', 14),
    ('Quemchi', 14),
    ('Quinchao', 14),
    ('Osorno', 14),
    ('Puerto Octay', 14),
    ('Purranque', 14),
    ('Puyehue', 14),
    ('Río Negro', 14),
    ('San Juan de la Costa', 14),
    ('San Pablo', 14),
    ('Chaitén', 14),
    ('Futaleufú', 14),
    ('Hualaihué', 10),
    ('Palena', 14);
-- Insertar comunas de la Región de Aysén del General Carlos Ibáñez del Campo
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Coyhaique', 15),
    ('Lago Verde', 15),
    ('Aysén', 15),
    ('Cisnes', 15),
    ('Guaitecas', 15),
    ('Cochrane', 15),
    ('O''Higgins', 15),
    ('Tortel', 15);
-- Insertar comunas de la Región de Magallanes y de la Antártica Chilena
INSERT INTO comunas (nombre, regiones_idRegion) VALUES
    ('Punta Arenas', 16),
    ('Laguna Blanca', 16),
    ('Río Verde', 16),
    ('San Gregorio', 16),
    ('Cabo de Hornos (Ex Navarino)', 16),
    ('Antártica', 16),
    ('Porvenir', 16),
    ('Primavera', 16),
    ('Timaukel', 16),
    ('Natales', 16),
    ('Torres del Paine', 16);