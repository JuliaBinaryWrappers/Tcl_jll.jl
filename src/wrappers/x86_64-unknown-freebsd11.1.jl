# Autogenerated wrapper script for Tcl_jll for x86_64-unknown-freebsd11.1
export libtcl

using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libtcl`
const libtcl_splitpath = ["lib", "libtcl8.6.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libtcl_path = ""

# libtcl-specific global declaration
# This will be filled out by __init__()
libtcl_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libtcl = "libtcl8.6.so"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Zlib_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Zlib_jll.LIBPATH_list,))

    global libtcl_path = abspath(joinpath(artifact"Tcl", libtcl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libtcl_handle = dlopen(libtcl_path)
    push!(LIBPATH_list, dirname(libtcl_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

