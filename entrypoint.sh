#!/bin/sh -l
echo "Running QA workflow for PR created on $3 branch"
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
