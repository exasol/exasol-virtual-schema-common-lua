# GH-12 Support TIMESTAMP(9)

## Goal

Report the precision of local Exasol `TIMESTAMP(p)` and `TIMESTAMP(p) WITH LOCAL TIME ZONE`
columns in virtual-schema metadata, so adapters can use the nanosecond timestamp support introduced in
Exasol 2025. Keep the metadata reported for timestamps without an explicit precision unchanged for
Exasol 8 and earlier compatibility.

## Scope

In scope:

* Preserve timestamp precision from the `COLUMN_TYPE` catalog value in `AbstractMetadataReader` metadata
  translations.
* Support both regular and `WITH LOCAL TIME ZONE` timestamp types, with and without explicit precision.
* Document the extended column-metadata behavior and its implementation design.
* Add focused unit coverage and run the established Lua, tracing, and documentation verification gates.

Out of scope:

* Changing query rendering or `LocalQueryRewriter` behavior.
* Changing Exasol timestamp semantics or adding a database-version-dependent compatibility layer.
* Supporting timestamp precisions beyond those returned by Exasol system catalog metadata.

## Design References

* [System Requirements](../system_requirements.md)
* [Timestamp translation activity design](../model/diagrams/activity/act_translate_timestamp.plantuml)
* [Metadata translation implementation](../../src/exasol/evscl/AbstractMetadataReader.lua)
* [Metadata reader tests](../../spec/exasol/evscl/LocalMetadataReader_spec.lua)
* [CI verification workflow](../../.github/workflows/ci-build.yml)

## Strategy

Parse the optional numeric precision directly from the catalog's timestamp type string and add it as the
metadata `precision` field only when it is explicitly present. Retain the existing `TIMESTAMP` type and
`withLocalTimeZone` flag handling, so unqualified timestamp metadata remains byte-for-byte compatible.

## Task List

- [x] Create and check out branch `feature/12-support-timestamp-9` from the current branch.

### Requirements And Design

- [x] Add `req~reading-timestamp-precision-from-column-metadata~1` to require preservation of explicit
  timestamp precision and compatibility for unqualified timestamps.
- [x] Stop and ask user for a review of the system requirements.
- [x] Add `doc/model/diagrams/activity/act_translate_timestamp.plantuml` with the timestamp-metadata translation
  design item that covers the new requirement and needs `impl` and `utest` coverage.
- [x] Stop and ask user for a review of the design.

### Implementation

- [x] Update `AbstractMetadataReader:_translate_timestamp_type` to accept and conditionally return the parsed
  precision while preserving the local-time-zone flag.
- [x] Update `_translate_column_metadata` to pass both Exasol timestamp catalog forms to the timestamp translator.
- [x] Add the required implementation coverage tag without altering unrelated query-rewriter tracing.

### Verification

- [x] Extend `LocalMetadataReader_spec.lua` with `TIMESTAMP(9)` and
  `TIMESTAMP(9) WITH LOCAL TIME ZONE` assertions, alongside regression assertions for both unqualified forms.
- [x] Give the new tests matching `utest` coverage for the timestamp translation design item.
- [x] Run `tools/run_tests.sh --run=ci` and confirm the affected code remains covered.
- [x] Run `tools/run_luacheck.sh`, `tools/run-type-check.sh`, and `tools/shellcheck.sh`.
- [x] Run `tools/trace_requirements.sh` and keep the OpenFastTrace trace clean.
- [x] Run `tools/build_docs.sh` to confirm API-documentation generation remains green.
- [x] Render the activity diagram with `JAVA_TOOL_OPTIONS=-Djava.awt.headless=true tools/build_diagrams.sh`.

### Update User Documentation

- [x] Keep README.md unchanged: this library's README directs users to its downstream adapters, while the
  timestamp-metadata contract is covered by the system requirements and release changelog.

## Version and Changelog Update

- [x] Raise the feature version from `1.0.3` to `1.1.0` in the rockspec.
- [x] Add the corresponding user-facing entry under `doc/changes/`.
