flowID=$1
STACKS=$2
echo "flowID: $flowID"
echo "STACKS: $STACKS[@]"

for stack in $STACKS[@]
do
BUCKETNAME=${udapeople-"$flowID"}
echo "BUCKETNAME: $BUCKETNAME"
if [[ $stack =~ "$flowID" ]]
then
  echo "Keeping $stack because equal"
elif [[ $stack != "$flowID" ]]
then
  echo "Deleting $stack"
  echo "URL: s3://$BUCKETNAME"
  aws s3 rm "s3://$BUCKETNAME" --recursive
  aws cloudformation delete-stack --stack-name "udapeople-$flowID-be"
  aws cloudformation delete-stack --stack-name "udapeople-$flowID-fe"
fi
done
