# Exasol Virtual Schema Common (Lua) 1.1.1, 206-08-18

Code name: TIMESTAMP fractionalSecondsPrecision

## Summary

This release fixes how timestamp precision is reported to the virtual schema API, using `fractionalSecondsPrecision` instead of `precision`.

This issue was detected in a dependent virtual schema's integration test.

## Features

* #15: Fixed timestamp precision API usage
