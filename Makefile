MODULES = pg_imputed_genotype
EXTENSION = pg_imputed_genotype
DATA = pg_imputed_genotype--1.0.sql
DOCS = README.pg_imputed_genotype

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
