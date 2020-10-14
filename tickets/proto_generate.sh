export SRC_PROTO=./proto
export DART_DST=./lib/proto
export PYTHON_DST=../server/proto

rm $DART_DST/*.dart
rm $PYTHON_DST/*.py

protoc -I=$SRC_PROTO --dart_out=$DART_DST $SRC_PROTO/*.proto
protoc -I=$SRC_PROTO --python_out=$PYTHON_DST $SRC_PROTO/*.proto