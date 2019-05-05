
<h3>Description</h3>
The general functionality of this type is to support a probability-triple stored in 4 bytes. Each probability is recorded in 10-bits as a positive integer ranging from 0 to 1000. Operators for I/O have been carefully selected based on benchmarking on recent x86_64 hardware. The storage of a probability triple with 10-bits of precision per probability makes this type ideal for storing imputed genotype data in PostgreSQL arrays.

<h3>Installation</h3>

<h3>Usage</h3>
