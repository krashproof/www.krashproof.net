#!/bin/bash
case $CIRCLE_BRANCH in
	master)
		echo "setting deployment bucket name to : $PROD_BUCKET_NAME"
		BUCKET_NAME=$PROD_BUCKET_NAME
		;;
	develop)
		echo "setting deployment bucket name to : $DEV_BUCKET_NAME"
		BUCKET_NAME=$DEV_BUCKET_NAME
		;;
	*)
		echo "invalid value for '$CIRCLE_BRANCH' : $CIRCLE_BRANCH"
		exit 1
		;;
esac

echo "deploying to bucket : $BUCKET_NAME"
aws s3 sync ./html s3://$BUCKET_NAME --cache-control "$CACHE_CONTROL"
