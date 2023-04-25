-- Configuration for LDoc
-- See https://stevedonovan.github.io/ldoc/manual/doc.md.html

project = "Exasol Virtual Schema Common Lua"
description = [[# Common base library for Exasol Row Level Security Lua (RLSL) and Exasol Virtual Schema Lua (EVSL).

Please visit the [project homepage on GitHub](https://github.com/exasol/exasol-virtual-schema-common-lua) for detailed information.
]]
title = "Reference"
file = {"./src/"}
package = "."
format = "markdown"
output = "index"
dir = "./target/ldoc"
colon = false
boilerplate = false -- ignore first comment
ext = "html"
one = false -- one column style
pretty = "lua" -- code prettifier
prettify_files = true
charset = "UTF-8"
sort = false
backtick_references = false
wrap = true
no_space_before_args = true
all = true -- show also local functions
custom_tags = {
    {
        "cover",
        title = "Covers Requirements",
        hidden = false,
        format = function (item)
            local covering_artifact_type, covered = item:match(" *%[ *(%w+) *-> *([%-%w~]+)")
            return "<li><code>" .. covered .. "</code> (" .. covering_artifact_type .. ")" .. "</li>"
        end
    }
}
