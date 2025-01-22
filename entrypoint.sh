#!/bin/sh -l
echo "Running QA workflow for PR created for project $2 branch"
echo "Request url: https://circleci.com/api/v2/project/gh/$GITHUB_REPOSITORY/pipeline"
echo "Params: {$3}"

response=$(curl -X POST "https://circleci.com/api/v2/project/gh/$GITHUB_REPOSITORY/pipeline" \
            -H "Circle-Token: $1" \
            -H "Content-Type: application/json" \
            -d "{
              \"branch\": \"$2\",
              \"parameters\": {$3}
            }")
output=$?
echo $response
echo ::set-output name=response::$output
(exit $output)
