the dbt docs generate output is stored in:

transformation/target/catalog.json
transformation/target/manifest.json
transformation/target/index.html

otherwise it should be reachable within the terminal with:

```cd transformation
```
followed by

```dbt docs serve
```