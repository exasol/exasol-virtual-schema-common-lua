# Exasol Virtual Schema Common Lua Developer Guide 

## Filtering Tables and Columns

There are multiple reasons why you might want to filter out tables that are present in the data source when creating the Virtual Schema. The obvious situation is where Users provide an include list of tables. This is often done when the source has a lot more tables than are wanted in the Virtual Schema.

Another reason is filtering out control or logging tables. Row Level security for example uses control tables to map roles to users or manage RLS groups. These tables must not appear in the projection the VS users see.

### Filtering Tables

Which tables are visible is controlled by the `AbstractMetadataReader`, more precisely by the method `_is_included_table(table_id, include_tables_lookup)`. The parameters are the ID (aka. 'name') of the table to be checked and a lookup-table to check against. This lookup table is fed by the list of tables the user provided as VS parameter. If no parameter is provided, it always returns true.

If you want to change the behavior of the inclusion decision, override `_is_included_table` in your derived metadata reader class.

### Filtering Columns

Similarly, the columns projected by the virtual schema are controlled by `is_included_colum(table_id, column_id, column_type)`. Note however, that the default behavior in EVSCL is to always return true here, since this is what most VS will need.

If you plan to filter out columns (like control columns or ETL columns), override this method in your derived adapter. 