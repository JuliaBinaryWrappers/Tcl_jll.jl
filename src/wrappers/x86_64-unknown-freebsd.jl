# Autogenerated wrapper script for Tcl_jll for x86_64-unknown-freebsd
export libtcl

using Zlib_jll
JLLWrappers.@generate_wrapper_header("Tcl")
JLLWrappers.@declare_library_product(libtcl, "libtcl8.6.so")
function __init__()
    JLLWrappers.@generate_init_header(Zlib_jll)
    JLLWrappers.@init_library_product(
        libtcl,
        "lib/libtcl8.6.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
