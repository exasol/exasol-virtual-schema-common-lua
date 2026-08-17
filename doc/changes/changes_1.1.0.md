# Exasol Virtual Schema Common (Lua) 1.1.0, 206-08-17

Code name: TIMESTAMP(9) Support

## Summary

This release adds metadata-reader support for explicit Exasol timestamp precision. It also updates `virtual-schema-common-lua` to 5.1.0 to support rendering queries with timestamp precision (e.g., a `CAST (… AS TIMESTAMP(9))`).

## Features

* #12: Added TIMESTAMP(9) support
