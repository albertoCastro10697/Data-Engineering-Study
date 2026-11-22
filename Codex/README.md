# Material de estudio de Codex

Esta carpeta reúne apuntes y recursos del curso de Codex, configuraciones de ejemplo, instrucciones y skills para agentes, además de un ejemplo independiente de **Databricks Asset Bundles**.

El contenido sirve como material de aprendizaje y referencia. Las configuraciones de `.codex/` pueden depender del entorno local donde se crearon; revísalas y adapta rutas, modelos, permisos o servidores MCP antes de reutilizarlas en otro equipo.

## Contenido

### Apuntes y referencias

- [`anotaciones.txt`](anotaciones.txt): notas sobre agentes y skills.
- [`commands_codex.txt`](commands_codex.txt): referencia rápida de comandos de Codex CLI y comandos slash de la interfaz.
- [`codex-cheat-sheet.jpg`](codex-cheat-sheet.jpg): imagen de referencia rápida de Codex.
- [`docs/`](docs/): documentación adicional. Incluye las instrucciones para esta carpeta y un ejemplo de consulta a Context7.
- [`index.html`](index.html): archivo HTML básico de práctica; contiene texto de ejemplo.

### Instrucciones, configuración y skills

- [`AGENTS.md`](AGENTS.md): pautas para trabajar en esta carpeta y organización recomendada del proyecto.
- [`.codex/config.toml`](.codex/config.toml): configuración general de ejemplo para Codex, incluyendo modelo, permisos, búsqueda web y servidores MCP.
- [`.codex/deep-work.config.toml`](.codex/deep-work.config.toml) y [`.codex/quick-fix.config.toml`](.codex/quick-fix.config.toml): perfiles de configuración para distintos tipos de trabajo.
- [`.agents/skills/`](.agents/skills/): guías de Better Auth para integración y seguridad.
- [`.codex/skills/`](.codex/skills/): skills de Bun, TypeScript, revisión de código, HTML accesible, Next.js, React, APIs del navegador, Tailwind, SQLite y seguridad web.
- [`skills-lock.json`](skills-lock.json): registro de procedencia y hashes de las skills de Better Auth.
- [`skills.zip`](skills.zip) y [`skills/`](skills/): paquete de skills y contenido extraído como material de referencia; `skills/__MACOSX/` contiene metadatos generados por macOS.
- [`.vscode/settings.json`](.vscode/settings.json): ajustes para reconocer marcadores de celdas de notebooks en VS Code.

### Ejemplo de Databricks Asset Bundle

La configuración de Databricks es un ejemplo aparte del material de Codex. Define un job que ejecuta un notebook sencillo:

- [`databricks.yml`](databricks.yml): nombre y configuración del bundle, recursos incluidos y target `dev`.
- [`resources/jobs.yml`](resources/jobs.yml): definición del job `simple_notebook_job` y su tarea de notebook en un clúster nuevo.
- [`src/simple_notebook.py`](src/simple_notebook.py): notebook que imprime un mensaje de prueba.
- [`.gitignore`](.gitignore): excluye el directorio local `.databricks/` generado por la CLI.
- [`SPEC.md`](SPEC.md): especificación detallada del bundle, flujo de despliegue, comportamiento esperado y guía de verificación.

## Ejecutar el ejemplo de Databricks

Desde esta carpeta, con Databricks CLI instalado y autenticado en el workspace correcto:

```powershell
databricks bundle validate
databricks bundle deploy -t dev
databricks bundle run simple_notebook_job -t dev
```

El job crea un clúster nuevo y ejecuta `src/simple_notebook.py`. La salida esperada del notebook es:

```text
Hola desde un notebook task simple en Databricks Asset Bundles
```

`deploy` y `run` interactúan con el workspace de Databricks configurado. Confirma el destino y los permisos disponibles antes de ejecutarlos. Los detalles y pasos de verificación están en [SPEC.md](SPEC.md).

## Alcance actual

La carpeta no contiene una aplicación web o un paquete JavaScript ejecutable: las skills son instrucciones de referencia para agentes, y `index.html` es un archivo de práctica. El ejemplo desplegable es el bundle de Databricks descrito arriba.
