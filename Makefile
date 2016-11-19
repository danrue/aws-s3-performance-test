# Writes first, so reads have something to read.
all: small-write.log large-write.log small-read.log large-read.log

small-write.log:
	sh write.sh small

large-write.log:
	sh write.sh large

small-read.log:
	sh read.sh small

large-read.log:
	sh read.sh large

# Install Ubuntu required packages
.prep:
	sh prep

# Reset for a new test
reset:
	rm -rf *.log
