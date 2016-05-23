#!/bin/bash
aws s3 sync ./html s3://$PROD_BUCKET_NAME --cache-control "$CACHE_CONTROL"
