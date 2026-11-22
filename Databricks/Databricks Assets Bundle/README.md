# Databricks Asset Bundles

Apuntes y ejemplos para definir y desplegar recursos de Databricks mediante Databricks Asset Bundles (DAB).

## Contenido

- [`databricks - cli - create - clusters.docx`](databricks%20-%20cli%20-%20create%20-%20clusters.docx): apuntes sobre la creación de clústeres con Databricks CLI.
- [`create-compute.json`](create-compute.json), [`create-compute-stg.json`](create-compute-stg.json) y [`create-compute-prod.json`](create-compute-prod.json): configuraciones de ejemplo para cómputo en distintos entornos.
- [`dab_project_2/`](dab_project_2/README.md): proyecto de bundle con targets `dev`, `stg` y `prod`, un job de notebook y una carpeta de pruebas.

## Proyecto de ejemplo

Consulta el [README del proyecto](dab_project_2/README.md) para los comandos de validación, despliegue y ejecución. Antes de usar los targets, revisa `dab_project_2/databricks.yml`: contiene workspaces y permisos específicos del entorno donde se creó. No despliegues a `stg` o `prod` sin confirmar que el destino y las credenciales son los correctos.
