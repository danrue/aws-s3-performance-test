all: small.log large.log

small.log: .populate
	sh test.sh small

large.log: .populate
	sh test.sh large

.populate: .prep
	sh populate.sh

.prep:
	sh prep

reset:
	rm -rf *.log

clean_all:
	rm -rf small large *.log .populate
