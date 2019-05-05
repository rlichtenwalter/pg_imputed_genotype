CREATE TYPE imputed_genotype;

CREATE OR REPLACE FUNCTION imputed_genotype_in( CSTRING )
	RETURNS imputed_genotype
	AS 'MODULE_PATHNAME'
	LANGUAGE C IMMUTABLE STRICT;

CREATE OR REPLACE FUNCTION imputed_genotype_out( imputed_genotype )
	RETURNS CSTRING
	AS 'MODULE_PATHNAME'
	LANGUAGE C IMMUTABLE STRICT;

CREATE TYPE imputed_genotype (
	INPUT = imputed_genotype_in,
	OUTPUT = imputed_genotype_out,
	INTERNALLENGTH = 4,
	PASSEDBYVALUE,
	ALIGNMENT = int4
);
