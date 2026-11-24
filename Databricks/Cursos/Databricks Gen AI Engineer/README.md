# Databricks Gen AI Engineer

Course notes on generative AI, prompt engineering, and context engineering.

## Generative AI and LLMs

Generative AI creates content such as text, images, audio, and video in response to prompts. Generative models typically learn patterns and relationships from large datasets and use them to generate content that fits the input.

A large language model (LLM) is trained on large amounts of text and other language data. An LLM that generates text does so by repeatedly predicting the next **token**, which can be a word, part of a word, or a punctuation mark.

## Prompt engineering

Prompt engineering is the practice of writing and refining instructions to help a model produce a useful response. Clear prompts communicate the task and the expected output. For tasks involving private or recent information, provide a relevant source in the prompt or through a connected system. Models can still hallucinate by producing plausible but inaccurate claims.

### Anatomy of a prompt

| Component | What it specifies |
| --- | --- |
| Instructions | The task the model should perform. |
| Context | Background information, data, or constraints. Separate it from the instructions with a heading or a delimiter such as triple quotes. |
| Question or input | The question to answer or the item to process. |
| Output format | The expected structure, such as JSON, HTML, a Markdown table, or plain text. Include tone and style when they matter. |

### 1. Zero-shot prompting

Give a direct instruction without examples. The model uses the instructions and what it learned during training.

```text
Classify the message as ACCESS, DATA_QUALITY, or PIPELINE_FAILURE.
Return only the label.

Message: The ingestion job stopped because the source API timed out.
```

Expected output: `PIPELINE_FAILURE`.

### 2. One-shot prompting

Give one input-output example to demonstrate the expected format.

```text
Extract the table name and issue from the report. Return a JSON object.

Example input: The bronze.orders table contains duplicate rows.
Example output: {"table":"bronze.orders","issue":"duplicate rows"}

Report: The silver.customers table contains null customer IDs.
```

Expected output: `{"table":"silver.customers","issue":"null customer IDs"}`.

### 3. Few-shot prompting

Give several input-output examples to show how the model should handle different cases.

```text
Classify the message as ACCESS, DATA_QUALITY, or PIPELINE_FAILURE.
Return only the label.

The analyst cannot query gold.sales. -> ACCESS
The silver.orders table has duplicate order IDs. -> DATA_QUALITY
The ingestion task stopped after the source API timed out. -> PIPELINE_FAILURE

Message: The silver.customers table has null customer IDs.
```

Expected output: `DATA_QUALITY`.

### 4. Persona adoption

Assign a role to guide the model's tone, vocabulary, and level of detail.

```text
Act as a Databricks instructor teaching a SQL analyst who is new to Delta Lake.
Explain what a Delta table is in two sentences. Use an example involving a
sales table whose latest update contains incorrect rows.
```

Possible output: A Delta table keeps a history of changes to its data. If an update adds incorrect rows to a sales table, you can query an earlier version to see what the data looked like before that update.

### 5. Prompt chaining

Split a task into smaller prompts. Pass the output of one prompt as input to the next.

**Prompt 1 · Extract the facts**

```text
Extract the job name, error, and retry outcome from this log.
Return a JSON object with the keys job, error, and retry_outcome.

Log: The orders_ingest job failed with a source API timeout. It succeeded
after one retry.
```

**Prompt 2 · Turn the extracted facts into a status update**

```text
Use the JSON below to write a one-sentence status update for the data team.
Mention the job, the cause of the failure, and the retry outcome.

{"job":"orders_ingest","error":"source API timeout","retry_outcome":"succeeded"}
```

Possible output: The `orders_ingest` job hit a source API timeout and succeeded on retry.

### 6. Chain-of-thought prompting

Frame a problem as a sequence of steps. For calculations, ask for a short derivation so you can check the result.

```text
A Databricks job processed 1,250 records. It rejected 50 records, and 30 of
those were rejected because of missing timestamps.

First calculate the overall rejection rate. Then calculate the percentage of
rejected records that had missing timestamps. Show one equation for each result.
```

Expected output:

- Overall rejection rate = `50 / 1,250 × 100 = 4%`.
- Share of rejected records with missing timestamps = `30 / 50 × 100 = 60%`.

## Context engineering

Context engineering designs systems that decide what information an LLM receives for each task. A system might retrieve relevant documentation or pass in the result of a tool call. The **context window** limits how much information the model can process, and more input tokens can increase cost.

| Technique | How it helps |
| --- | --- |
| Retrieval-augmented generation (RAG) | Retrieves relevant material from external sources and supplies it to the model before it generates a response. |
| Chunking | Splits documents into sections that can be retrieved individually. |
| Tool calling | Lets an application execute a query or call an API at the model's request and return the result as context. |
| AI agents | Use model outputs and tool results to choose what to do next in a multi-step task. |
