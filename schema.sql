CREATE EXTENSION IF NOT EXISTS vector;

DROP TABLE IF EXISTS articulos;

CREATE TABLE articulos (
    id        SERIAL PRIMARY KEY,
    titulo    TEXT NOT NULL,
    resumen   TEXT NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    año       INTEGER,
    region    VARCHAR(50),
    fuente    VARCHAR(100),
    embedding VECTOR(384)              -- all-MiniLM-L6-v2 → 384 dimensiones
);


INSERT INTO articulos (titulo, resumen, categoria, año, region, fuente, embedding)
VALUES (%s, %s, %s, %s, %s, %s, %s);

SELECT COUNT(*) FROM articulos;

SELECT titulo, categoria, 1 - (embedding <=> :query_vector::vector) AS similitud
FROM articulos
ORDER BY embedding <=> :query_vector::vector
LIMIT 5;