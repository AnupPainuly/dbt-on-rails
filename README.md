# dbt-on-rails — Project Overview

This repository contains a small dbt project and supporting assets for exploring dutch rail network data.


## Prerequisites

1. [uv](https://docs.astral.sh/uv/)
2. [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

In addition to the tools, you would also need to know what dbt is, you can learn about it here: [dbt tutorial](https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/).

Clone the git repo as shown below:

```bash
git clone https://github.com/josephmachado/simple_dbt_project.git
cd simple_dbt_project
```


### Local Setup

Setup python virtual environment as shown below:

```bash
rm -rf .venv
uv python install 3.13
uv venv --python 3.13
uv sync
source .venv/bin/activate
```

### Run dbt 

Run dbt commands as shown below:

```bash
dbt clean
dbt deps
dbt snapshot
dbt run 
dbt test
dbt docs generate
dbt docs serve
```

Go to [http://localhost:8080](http://localhost:8080) to see the dbt documentation.

Press Ctrl + c to stop the document server.


Let's open a python REPL and check our data, as shown below:

```python
import duckdb
con = duckdb.connect("dev.duckdb")
results = con.execute("SHOW TABLES").fetchall()
for row in results:
    print(row)
exit()
```
