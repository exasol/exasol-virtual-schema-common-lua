rockspec_format = "3.0"

local tag = "1.0.0"
local project = "exasol-virtual-schema-common-lua"

package = project
version = tag .. "-1"

source = {
    url = "git://github.com/exasol/" .. project,
    tag = tag
}

description = {
    summary = "Common base library for the Exasol Virtual Schema (Lua) and Row-level Security (Lua)",
    detailed = [[This project contains the common parts between EVSL and RLSL that are Exasol-specific.

Common parts that are the same for all Virtual Schemas are in virtual-schema-common-lua, which serves as a base library for this one.]],
    homepage = "https://github.com/exasol/" .. project,
    license = "MIT",
    maintainer = 'Exasol <opensource@exasol.com>'
}

dependencies = {
    "virtual-schema-common-lua = 3.0.0",
}

build_dependencies = {
    "amalg"
}

test_dependencies = {
    "busted >= 2.0.0",
    "luacheck >= 0.25.0",
    "luacov >= 0.15.0",
    "luacov-coveralls >= 0.2.3"
}

test = {
    type = "busted"
}

build = {
    type = "builtin",
    modules = {
        ["exasolvs.ExasolAdapterProperties"] = "src/exasolvs/ExasolAdapterProperties.lua",
        ["exasolvs.AbstractMetadataReader"] = "src/exasolvs/AbstractMetadataReader.lua",
        ["exasolvs.AbstractQueryRewriter"] = "src/exasolvs/AbstractQueryRewriter.lua",
        ["exasolvs.LocalMetadataReader"] = "src/exasolvs/LocalMetadataReader.lua",
        ["exasolvs.LocalQueryRewriter"] = "src/exasolvs/LocalMetadataReader.lua"
    }
}
