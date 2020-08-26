# Autogenerated wrapper script for Tcl_jll for armv7l-linux-gnueabihf
export libtcl

using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

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
    global artifact_dir = abspath(artifact"Tcl")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list,))

    global libtcl_path = normpath(joinpath(artifact_dir, libtcl_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libtcl_handle = dlopen(libtcl_path)
    push!(LIBPATH_list, dirname(libtcl_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

