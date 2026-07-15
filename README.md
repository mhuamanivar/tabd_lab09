# Práctica N° 9: Búsqueda Vectorial con MongoDB Atlas - Atlas Vector Search y Aggregation Pipeline

**Curso:** Tópicos Avanzados de Bases de Datos - A

**Nombre:** Melsy Melany Huamaní Vargas

Este repositorio contiene la entrega del **Laboratorio 09 (MongoDB Atlas Vector Search)**, dividida en dos notebooks: uno con el marco conceptual y el ejercicio resuelto por el docente, y otro con los ejercicios propuestos y el cuestionario.

Como el Lab09 pide comparar Precision@5 contra ChromaDB y pgvector usando el mismo `eval_set`, el repositorio también incluye dos notebooks de apoyo (Lab06 y Lab08) que sirven únicamente para generar esos dos números de comparación — no son entregas completas de sus propias guías.

---

Cada guía original pide un corpus distinto (Lab06: 50+ docs en 3 categorías; Lab08: 30+ docs en las mismas 3; Lab09: 40 docs en 4 categorías, con su propio `eval_set` de 10 queries).

Como el Ejercicio 4/5 del Lab09 pide comparar Precision@5 entre los tres sistemas "con el mismo eval_set", los notebooks de Lab06 y Lab08 usan el **corpus de 40 documentos del Lab09** (10 por categoría × 4 categorías) y su mismo `eval_set`, en vez de la especificación más chica de sus propias guías. Solo así la comparación es válida.

---

## Cómo ejecutar cada notebook

- **Lab06:** Con Jupyter/VS Code, no necesita ningún servicio externo.
- **Lab08:** Con Jupyter/VS Code y el contenedor de `docker-compose.yml` en `localhost:5436`.
- **Lab09** Se requiere una cuenta y clúster de MongoDB Atlas con su índice vectorial creado. Hay que correr primero el notebook del ejercicio resuelto, que crea los datos y el índice; luego el del propuesto que se conecta después al mismo clúster.

---

## Entorno de trabajo

- Python **3.10.11**. Entorno virtual en `.venv/`, registrado como kernel de Jupyter con el nombre **"Python (tabd venv)"**.
- Todo lo de `requirements.txt` instalado, incluyendo el pin `numpy<2` (versiones antiguas de `chromadb` usan `np.float_`, eliminado en NumPy 2.0) y los paquetes `langchain-chroma`/`langchain-huggingface` (integraciones vigentes, en reemplazo de las clases de `langchain_community` que están en desuso).
- Docker Desktop corriendo, contenedor `pgvector-lab` levantado con `docker compose up -d` en el puerto **5436**.
- Clúster MongoDB Atlas M0 creado, usuario de base de datos, acceso de red `0.0.0.0/0`, e índice `vector_index` creado y verificado.
  ```
  {
    "fields": [
      {"type": "vector", "path": "embedding", "numDimensions": 384, "similarity": "cosine"},
      {"type": "filter", "path": "categoria"},
      {"type": "filter", "path": "año"},
      {"type": "filter", "path": "region"}
    ]
  }
  ```
