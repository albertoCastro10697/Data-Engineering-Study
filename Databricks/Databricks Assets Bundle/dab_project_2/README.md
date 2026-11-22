# `dab_project_2`

Ejemplo de **Databricks Asset Bundle** para desplegar un job que ejecuta un notebook de prueba.

## Estructura

- `databricks.yml`: define el bundle y los targets `dev`, `stg` y `prod`, además de cargar los recursos YAML.
- `resources/demo_job.yml`: define el job `job_notebook`, que ejecuta `notebooks/print_hola_mundo.ipynb` en un clúster nuevo.
- `notebooks/`: notebook usado por la tarea del job.
- `tests/`: configuración y espacio para pruebas con `pytest`.
- `pyproject.toml`: metadatos del proyecto y dependencias de desarrollo, incluyendo `pytest`, `databricks-dlt` y `databricks-connect`.
- `scratch/`: espacio local para notebooks exploratorios; sus archivos se ignoran en Git, salvo este README.

## Requisitos

- Databricks CLI instalada y autenticada en el workspace que corresponda al target.
- Acceso para desplegar jobs y crear o utilizar el clúster configurado.
- Python compatible con el rango declarado en `pyproject.toml` para las herramientas de desarrollo local.

## Validar, desplegar y ejecutar

Desde esta carpeta, valida primero el bundle:

```powershell
databricks bundle validate -t dev
```

Para desplegar y ejecutar el job en desarrollo:

```powershell
databricks bundle deploy -t dev
databricks bundle run job_notebook -t dev
```

El bundle también declara targets `stg` y `prod`. Sus configuraciones contienen workspaces específicos y permisos; confirma el destino antes de usar esos targets.

## Nota sobre el notebook

`notebooks/print_hola_mundo.ipynb` es el notebook de demostración. En el estado actual, su celda contiene una cadena sin cerrar (`print('hola mundo)`), por lo que debe corregirse antes de esperar que el job se ejecute correctamente.

El directorio `scratch/` está pensado para experimentos personales y sus archivos se excluyen de Git según `.gitignore`.
