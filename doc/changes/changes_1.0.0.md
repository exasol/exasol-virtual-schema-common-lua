# Exasol Virtual Schema Common (Lua) 1.0.0, released 2023-04-28

Code name: Extracted from EVSL

## Summary

This is the common library extracted from EVSL. Moved the following classes:

* `AbstractMetadataReader`
* `AbstractQueryRewriter`
* `ExasolAdapterProperties` &rarr; `ExasolBaseAdapterProperties`
* `LocalMetadataReader`
* `LocalQueryRewriter`

We also now provide a rendered version of the API documentation (see [README](../../README.md)).

## Refactoring

* #1: Extracted from EVSL
* #3: Added more documentation, fixed requirement chain and changed namespace to 'exasol.evscl'