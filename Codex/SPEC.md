# Simple Databricks Asset Bundle Specification

This specification explains how this project works and how to verify it. It is
written for someone who is learning how a Databricks Asset Bundle connects local
files, job definitions, and a notebook task deployed to a Databricks workspace.

## 1. Purpose

This project is a minimal Databricks Asset Bundle. Its purpose is to deploy and
run one simple Databricks job that executes a notebook task.

The spec answers:

- What files make up the bundle?
- What does each file do?
- How does the bundle get validated, deployed, and run?
- How can someone confirm the bundle is working?

## 2. Project Summary

The bundle is named `simple-notebook-job`.

At a high level:

1. `databricks.yml` defines the bundle and target environment.
2. `resources/jobs.yml` defines the Databricks job resource.
3. `src/simple_notebook.py` contains the notebook code that the job runs.
4. `README.md` lists the main Databricks CLI commands.

When the job runs, the notebook prints:

```text
Hola desde un notebook task simple en Databricks Asset Bundles
```

## 3. File Map

| File | Role |
| --- | --- |
| `databricks.yml` | Main bundle configuration |
| `resources/jobs.yml` | Databricks job and task definition |
| `src/simple_notebook.py` | Notebook source executed by the job |
| `README.md` | Quick command reference for validate, deploy, and run |

## 4. How The Bundle Is Organized

### 4.1 `databricks.yml`

`databricks.yml` is the entry point for the Databricks Asset Bundle.

It defines:

- The bundle name: `simple-notebook-job`.
- The resource files to include: `resources/*.yml`.
- The default target: `dev`.
- The workspace root path used for development deployments.

The important idea is that `databricks.yml` does not need to contain every job
definition directly. Instead, it includes resource files from the `resources`
folder.

### 4.2 `resources/jobs.yml`

`resources/jobs.yml` is where the Databricks job is expected to be defined.

This file should describe the deployable job resource, including details such
as:

- The job name.
- The task name.
- The notebook path or source file used by the task.

In this project, the README expects a job named:

```text
simple_notebook_job
```

That is the job run by this command:

```powershell
databricks bundle run simple_notebook_job -t dev
```

### 4.3 `src/simple_notebook.py`

`src/simple_notebook.py` is the notebook source file.

It currently contains one simple behavior: print a message when the notebook
runs.

Expected output:

```text
Hola desde un notebook task simple en Databricks Asset Bundles
```

This makes the project useful as a learning example because the notebook behavior
is easy to recognize in a Databricks job run.

### 4.4 `README.md`

`README.md` provides the short command reference for using the bundle.

The README also reminds the user to authenticate the Databricks CLI against the
correct workspace before running bundle commands.

## 5. Expected Behavior

The expected behavior is:

1. The Databricks CLI validates the bundle configuration successfully.
2. The bundle deploys to the `dev` target.
3. The deployed job can be run by name.
4. The job executes the notebook task.
5. The notebook prints the expected Spanish message.

This project does not currently define complex data processing, parameters,
multiple environments, or production deployment behavior.

## 6. Deployment Flow

Run these commands from the project root.

### 6.1 Validate

```powershell
databricks bundle validate
```

Use this first. It checks that the bundle files are valid before deployment.

### 6.2 Deploy

```powershell
databricks bundle deploy -t dev
```

This deploys the bundle to the `dev` target defined in `databricks.yml`.

### 6.3 Run

```powershell
databricks bundle run simple_notebook_job -t dev
```

This runs the deployed job named `simple_notebook_job` in the `dev` target.

## 7. Optional SQLite Migration Example

This project does not currently require a database. If a local SQLite database is
added later for examples, fixtures, or lightweight metadata, use Bun's built-in
SQLite client for simple migrations.

Inline migration script:

```ts
import { Database } from "bun:sqlite";

const db = new Database("local.db");

db.exec(`
  CREATE TABLE IF NOT EXISTS migrations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    applied_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );

  CREATE TABLE IF NOT EXISTS task_runs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    job_name TEXT NOT NULL,
    target TEXT NOT NULL,
    status TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
  );
`);

const migrationName = "001_create_task_runs";

const applied = db
  .query("SELECT id FROM migrations WHERE name = ?")
  .get(migrationName);

if (!applied) {
  db.query("INSERT INTO migrations (name) VALUES (?)").run(migrationName);
  console.log(`Applied migration: ${migrationName}`);
} else {
  console.log(`Migration already applied: ${migrationName}`);
}

db.close();
```

Run it with:

```powershell
bun run migrate.ts
```

Keep migrations idempotent by using `CREATE TABLE IF NOT EXISTS` and recording
applied migration names.

## 8. Acceptance Criteria

The bundle is working when:

- `databricks bundle validate` completes successfully.
- `databricks bundle deploy -t dev` completes successfully.
- `databricks bundle run simple_notebook_job -t dev` starts a Databricks job run.
- The job run executes the notebook task from `src/simple_notebook.py`.
- The notebook output contains:

```text
Hola desde un notebook task simple en Databricks Asset Bundles
```

## 9. Manual Test Checklist

Use this checklist when changing the bundle.

1. Confirm the Databricks CLI is authenticated to the intended workspace.
2. Run `databricks bundle validate`.
3. If validation passes, run `databricks bundle deploy -t dev`.
4. Run `databricks bundle run simple_notebook_job -t dev`.
5. Open the Databricks job run.
6. Confirm the notebook task completed successfully.
7. Confirm the notebook output contains the expected message.

## 10. Troubleshooting Notes

| Symptom | Likely Cause | What To Check |
| --- | --- | --- |
| Bundle validation fails | Invalid YAML or missing resource reference | Check `databricks.yml` and `resources/jobs.yml` |
| Deploy fails | Databricks CLI is not authenticated or target workspace is wrong | Run Databricks CLI auth checks and confirm the workspace |
| Run command cannot find the job | Job name mismatch | Confirm the job name in `resources/jobs.yml` matches `simple_notebook_job` |
| Notebook task fails | Source path or notebook code issue | Check the task config and `src/simple_notebook.py` |
| Output is missing | Notebook did not run or logs were checked in the wrong place | Open the task run output in Databricks |

## 11. Open Questions

These questions are not required for the current minimal bundle, but they are
useful if the project grows:

- Should there be separate `dev`, `staging`, and `prod` targets?
- Should the notebook accept parameters?
- Should the job have a schedule?
- Should the bundle include automated tests?
- Should deployment be handled by CI instead of local CLI commands?

## 12. Revision History

| Date | Author | Notes |
| --- | --- | --- |
| 2026-06-02 | Codex | Created project-tied SPEC.md for the Databricks Asset Bundle |
| 2026-06-02 | Codex | Added optional Bun SQLite migration example |
