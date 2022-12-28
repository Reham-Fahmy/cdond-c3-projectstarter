flowID=$1

  echo "Deleting $flowID"
  echo "URL: s3://$flowID"
  aws s3 rm "s3://$flowID" --recursive
  aws cloudformation delete-stack --stack-name "$flowID-be"
  aws cloudformation delete-stack --stack-name "$flowID-fe"

