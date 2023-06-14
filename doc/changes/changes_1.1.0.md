# Exasol Virtual Schema Common (Lua) 1.1.0, released 2023-06-15

Code name: Extension points for adapter notes and control object filter in metadata reader 

## Summary

To enable the use of this base library for Row Level security, we added the following extension points:

1. Adapter notes (adapter data cached between adapter calls)
2. Filtering read tables
3. Filtering read columns

The filters allow hiding control columns in RLS.

## Refactoring

* #4: Added extension points for adapter notes and control object filter in metadata reader 