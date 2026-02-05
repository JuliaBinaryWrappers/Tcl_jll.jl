# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Tcl_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Tcl")
JLLWrappers.@generate_main_file("Tcl", Base.UUID("9fc9b8dd-f768-5d0d-bb0b-e65961e00eb6"))
end  # module Tcl_jll
