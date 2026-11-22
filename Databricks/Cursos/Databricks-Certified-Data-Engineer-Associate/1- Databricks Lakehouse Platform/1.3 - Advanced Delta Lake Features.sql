-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ## Delta Time Travel

-- COMMAND ----------
-- Nos va a mostrar el historial de cambios que ha tenido la tabla employees
DESCRIBE HISTORY employees



-- COMMAND ----------
-- Seleccionamos la información de la tabla employess para la version 4
SELECT * 
FROM employees VERSION AS OF 4

-- COMMAND ----------
-- Seleccionamos la información de la tabla employess para la version 4, solo que de otra manera
SELECT * FROM employees@v4

-- COMMAND ----------
--- Hacemos un delete de los registros de la tabla, esto se guarda en la historia como un operation  = DELETE
DELETE FROM employees

-- COMMAND ----------
--- Vemos que está vacío
SELECT * FROM employees

-- COMMAND ----------
--- Hacemos un restore de la tabla employees y de lo que no habían registros, ahora si habrán y será la de la verión número 5 de la tabla.
RESTORE TABLE employees TO VERSION AS OF 5

-- COMMAND ----------
-- Verificamos que existan registros
SELECT * FROM employees

-- COMMAND ----------

DESCRIBE HISTORY employees

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## OPTIMIZE Command

-- COMMAND ----------
--- Al ver el detalle de la tabla employees vemos que toda la información está guardada en 4 archivos
--- Lo que queremos es que con el comando optimize, estos 4 archivos pequeños se conviertan en 1
DESCRIBE DETAIL employees

-- COMMAND ----------
--- Hcemos un optimize por od
OPTIMIZE employees
ZORDER BY id

-- COMMAND ----------
--- Vemos que solo hay 5 archivos, los 4 antiguos y este nuevo grande
DESCRIBE DETAIL employees

-- COMMAND ----------
--- Vemos las operaciones
DESCRIBE HISTORY employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## VACUUM Command

-- COMMAND ----------
--- Al hacer el vacuum lo que haría es limpiar los 4 archivos small antiguos y solo quedarnos con el archivo único grande
--- Este botará error por el parámetro retention_time que por defcto es 7 días
VACUUM employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------
--- Ejecutamos VACUUM con 0 horas
VACUUM employees RETAIN 0 HOURS

-- COMMAND ----------

SET spark.databricks.delta.retentionDurationCheck.enabled = false;

-- COMMAND ----------

VACUUM employees RETAIN 0 HOURS

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

SELECT * FROM employees@v1

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC ## Dropping Tables

-- COMMAND ----------

DROP TABLE employees

-- COMMAND ----------

SELECT * FROM employees

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'
