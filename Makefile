all: test lint

test:
	./test/test.sh

lint:
	./test/lint.sh

.PHONY: all test lint
