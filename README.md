# Classification API - Usage Guide

Docker is assumed to be installed on the system.

---

# Running the Application

Open a terminal in the project directory and run:

```bash
make
```

After the application starts, it will be available at:

```text
http://localhost:8081
```

---

# Make Commands

| Command      | Description                          |
|---------------|--------------------------------------|
| `make`        | Clean, build, and run the project    |
| `make build`  | Build the Docker image only          |
| `make run`    | Start the container only             |
| `make stop`   | Stop the running container           |
| `make clean`  | Remove the container and image fully |

---

# Using the API with Postman

Base URL for all requests:

```text
http://localhost:8081/api/v1/news
```

---

# 1. Health Check

**Method:** `GET`  
**URL:** `http://localhost:8081/api/v1/news/health`

Example response:

```json
{
  "status": "ok",
  "service": "classification-api"
}
```

---

# 2. News Classification (JSON)

**Method:** `POST`  
**URL:** `http://localhost:8081/api/v1/news/classify`

In Postman:

`Body -> raw -> JSON`

Example request:

```json
{
  "headline": "Central Bank sets the interest rate at 50 percent"
}
```

Example response:

```json
{
  "headline": "Central Bank sets the interest rate at 50 percent",
  "assetType": "BOND",
  "symbol": "TR10Y",
  "assetScore": "0.72",
  "symbolScore": "0.68",
  "lexiconSymbol": "TR10Y",
  "topCandidates": ["BOND", "FOREX", "ECONOMY"],
  "unknown": false,
  "modelVersion": "1.0"
}
```

---

# 3. News Classification (Plain Text)

**Method:** `POST`  
**URL:** `http://localhost:8081/api/v1/news/classify-text`

In Postman:

`Body -> raw -> Text`

Send the news headline directly as plain text.

---

# 4. Conservative Classification (JSON)

**Method:** `POST`  
**URL:** `http://localhost:8081/api/v1/news/classify-safe`

Low-confidence predictions are returned with:

```json
"unknown": true
```

Usage is the same as `/classify`.

---

# 5. Conservative Classification (Plain Text)

**Method:** `POST`  
**URL:** `http://localhost:8081/api/v1/news/classify-safe-text`

Usage is the same as `/classify-text`.

---

# Response Fields

| Field            | Description                                             |
|------------------|---------------------------------------------------------|
| `headline`       | Submitted news headline                                 |
| `assetType`      | Predicted asset type (`BOND`, `FOREX`, etc.)            |
| `symbol`         | Predicted symbol (`TR10Y`, `USD/TRY`, etc.)             |
| `assetScore`     | Confidence score for asset type prediction (`0-1`)      |
| `symbolScore`    | Confidence score for symbol prediction (`0-1`)          |
| `lexiconSymbol`  | Symbol matched from the lexicon                         |
| `topCandidates`  | List of the most likely classification candidates       |
| `unknown`        | Returns `true` for low-confidence predictions           |
| `modelVersion`   | Version of the model used                               |
