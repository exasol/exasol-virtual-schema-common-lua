# Exasol Virtual Schema Common (Lua) 1.1.0, unreleased

## Summary

This release adds metadata-reader support for explicit Exasol timestamp precision.

## Features

* Preserve the precision of `TIMESTAMP(p)` and `TIMESTAMP(p) WITH LOCAL TIME ZONE` columns in virtual-schema
  metadata (#12).
