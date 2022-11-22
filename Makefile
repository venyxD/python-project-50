install:
	poetry install

# build:
# 	poetry build

test:
	poetry run pytest

test-coverage:
	poetry run pytest --cov=gendiff --cov-report xml

lint:
	poetry run flake8 gendiff

selfcheck:
	poetry check

check: selfcheck test lint

build: check
	poetry build

#.PHONY: install test lint selfcheck check build

# publish:
# 	poetry publish --dry-run

package-install:
	pip install --user --force-reinstall dist/*.whl

test-run:
	poetry run gendiff ./tests/fixtures/file1_plain.json ./tests/fixtures/file2_plain.json
	poetry run gendiff ./tests/fixtures/file1_plain.yml ./tests/fixtures/file2_plain.yml
