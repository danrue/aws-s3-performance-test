# Usage

Assumes ubuntu and also bucket named 'the-test-is-now'.
```sh
    # Set up S3 with a (default) public endpoint
    make
    cp *.log results/public/
    make reset
    # Add S3 endpoint to VPC
    make
    cp *.log results/vpc/
```
