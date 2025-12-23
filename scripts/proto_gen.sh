#!/bin/bash
# filepath: /Users/parthavpovil/effimove/ONDC-Protos/scripts/proto_gen.sh
set -e


PROTO_FILES=$(find protos -name "*.proto")

if [ -z "$PROTO_FILES" ]; then
    echo "No .proto files found"
    exit 1
fi

echo "Found proto files:"
echo "$PROTO_FILES"
echo ""

# Generate code for each proto file
for PROTO_FILE in $PROTO_FILES; do
    echo "Generating protobuf code for $PROTO_FILE"
    
    protoc \
        --go_out=. \
        --go_opt=paths=source_relative \
        --go-grpc_out=. \
        --go-grpc_opt=paths=source_relative \
        "$PROTO_FILE"
    
    echo "✓ Generated $PROTO_FILE"
    echo ""
done

echo "All proto files generated successfully!"