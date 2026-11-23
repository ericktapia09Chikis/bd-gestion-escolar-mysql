-- Base de datos para Gestión Escolar (UTFV)
CREATE DATABASE IF NOT EXISTS gestion_escolar;
USE gestion_escolar;

-- Tabla de Alumnos
CREATE TABLE alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    carrera VARCHAR(100) NOT NULL,
    cuatrimestre INT NOT NULL
);

-- Tabla de Materias
CREATE TABLE materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    clave VARCHAR(10) NOT NULL UNIQUE,
    nombre_materia VARCHAR(100) NOT NULL,
    creditos INT NOT NULL
);

-- Tabla de Calificaciones (Relación muchos a muchos)
CREATE TABLE calificaciones (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    id_materia INT NOT NULL,
    calificacion DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_materia) REFERENCES materias(id_materia)
);

-- Inserción de datos de prueba
INSERT INTO alumnos (matricula, nombre, carrera, cuatrimestre) VALUES
('20231001', 'Erick Antonio Perez Tapia', 'Ing. Desarrollo y Gestion de Software', 10),
('20231002', 'Laura Gomez Hernandez', 'Ing. Desarrollo y Gestion de Software', 10);

INSERT INTO materias (clave, nombre_materia, creditos) VALUES
('BD-101', 'Administracion de Bases de Datos', 8),
('DW-202', 'Desarrollo Web Integral', 8);

INSERT INTO calificaciones (id_alumno, id_materia, calificacion) VALUES
(1, 1, 9.50),
(1, 2, 10.00),
(2, 1, 8.80);

-- Consulta de reporte de boleta con JOIN
SELECT 
    a.matricula,
    a.nombre AS alumno,
    m.nombre_materia AS materia,
    c.calificacion
FROM calificaciones c
INNER JOIN alumnos a ON c.id_alumno = a.id_alumno
INNER JOIN materias m ON c.id_materia = m.id_materia
ORDER BY a.nombre;
