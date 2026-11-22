# Databricks notebook source
print("Hello World!")

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT "Hello world from SQL!"

# COMMAND ----------

# MAGIC %md
# MAGIC # Title 1
# MAGIC ## Title 2
# MAGIC ### Title 3
# MAGIC
# MAGIC text with a **bold** and *italicized* in it.
# MAGIC
# MAGIC Ordered list
# MAGIC 1. first
# MAGIC 1. second
# MAGIC 1. third
# MAGIC
# MAGIC Unordered list
# MAGIC * coffee
# MAGIC * tea
# MAGIC * milk
# MAGIC
# MAGIC
# MAGIC Images:
# MAGIC ![Associate-badge](https://www.databricks.com/wp-content/uploads/2022/04/associate-badge-eng.svg)
# MAGIC
# MAGIC And of course, tables:
# MAGIC
# MAGIC | user_id | user_name |
# MAGIC |---------|-----------|
# MAGIC |    1    |    Adam   |
# MAGIC |    2    |    Sarah  |
# MAGIC |    3    |    John   |
# MAGIC
# MAGIC Links (or Embedded HTML): <a href="https://docs.databricks.com/notebooks/notebooks-manage.html" target="_blank"> Managing Notebooks documentation</a>

# COMMAND ----------

# Este comando te permitirá ejecutar un notebook desde otro notebook
# Lo bueno es que las variables que se están 
# MAGIC %run ../Includes/Setup

# COMMAND ----------

print(full_name)

# COMMAND ----------

# Databricks también va a brindarnos un storage por defecto en la nube, cloud storage
# El vamos a poder consultar o listas los archivos que existen ahí.
# MAGIC %fs ls '/databricks-datasets'

# COMMAND ----------

dbutils.help()

# COMMAND ----------

dbutils.fs.help()

# COMMAND ----------
# También podemos apoyarnos con el dbutils que nos permite ejecutar ciertas funciones como:
# ls: Listar archivos y directorios de una ruta especificada
# mkdirs: Creación de directorios.
# cp: Copiar archivos 
# mv: Mover archivos de un origen a un destino
# rm: Eliminar archivos.
# put: Escribir dentro de un archivo
# head: Preview de un archivo.
files = dbutils.fs.ls('/databricks-datasets')
print(files)

