# pg_imputed_genotype
an efficient, packed probability tuple suitable for imputed genotypes

<h3>Description</h3>
The general functionality of this type is to support a probability-triple stored in 4 bytes. Each probability is recorded in 10-bits as a positive integer ranging from 0 to 1000. Operators for I/O have been carefully selected based on benchmarking on recent x86_64 hardware. The storage of a probability triple with 10-bits of precision per probability makes this type ideal for storing imputed genotype data in PostgreSQL arrays.

<h3>Installation</h3>
<pre>
curl -s -S -L https://github.com/rlichtenwalter/pg_imputed_genotype/archive/master.zip > pg_imputed_genotype.zip
unzip pg_imputed_genotype.zip
(cd pg_imputed_genotype-master &amp;&amp; make PG_CONFIG=&lt;optional custom pg_config path&gt;)
(cd pg_imputed_genotype-master &amp;&amp; make PG_CONFIG=&lt;optional custom pg_config path&gt; install)
(cd ~postgres &amp;&amp; sudo -u postgres psql -c 'CREATE EXTENSION pg_imputed_genotype;')
</pre>

<h3>Usage</h3>
<pre>
testuser=# SELECT '{0.5,0.5,0.0}'::imputed_genotype;
 imputed_genotype
------------------
 {0.500,0.500,0}
(1 row)

testuser=# SELECT '{0.5,0.5,0.1}'::imputed_genotype;
ERROR:  imputed_genotype probabilities must sum to <= 1.0: "{0.5,0.5,0.1}"
LINE 1: SELECT '{0.5,0.5,0.1}'::imputed_genotype;
               ^

testuser=# SELECT '{0.2,0.5,0.1}'::imputed_genotype;
  imputed_genotype
\---------------------
 {0.200,0.500,0.100}
(1 row)
</pre>
