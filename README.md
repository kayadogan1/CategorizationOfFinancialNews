Classification API - User Guide
This guide assumes that Docker is already installed on your system.

Getting Started
Open a terminal in the project directory and run the following command:

Bash
make
Once the application is up and running, you can access it at:

http://localhost:8081
Make Commands
Command	Description
make	Clean, build, and run the application
make build	Build the Docker image only
make run	Start the container only
make stop	Stop the running container
make clean	Completely remove the container and the image
API Usage with Postman
Base URL for all requests: http://localhost:8081/api/v1/news

1. Health Check
Method: GET

URL: http://localhost:8081/api/v1/news/health

Example Response:

JSON
{
  "status": "ok",
  "service": "classification-api"
}
2. News Classification (JSON)
Method: POST

URL: http://localhost:8081/api/v1/news/classify

In Postman: Select Body > raw > JSON

Example Request:

JSON
{
  "headline": "Central Bank sets the interest rate at 50 percent"
}
Example Response:

JSON
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
3. News Classification (Plain Text)
Method: POST

URL: http://localhost:8081/api/v1/news/classify-text

In Postman: Select Body > raw > Text, and enter the news headline as plain text.

4. Conservative Classification (JSON)
Method: POST

URL: http://localhost:8081/api/v1/news/classify-safe

Returns unknown: true for predictions with low confidence scores. Usage is identical to the /classify endpoint.

5. Conservative Classification (Plain Text)
Method: POST

URL: http://localhost:8081/api/v1/news/classify-safe-text

Usage is identical to the /classify-text endpoint.

Response Fields
Field	Description
headline	The submitted news headline
assetType	Predicted asset type (e.g., BOND, FOREX, etc.)
symbol	Predicted symbol (e.g., TR10Y, USD/TRY, etc.)
assetScore	Confidence score for the asset type (between 0-1)
symbolScore	Confidence score for the symbol prediction (between 0-1)
lexiconSymbol	Result based on dictionary matching
topCandidates	List of the most probable classification categories
unknown	Returns true for low-confidence/uncertain predictions
modelVersion	The version of the model currently in use
