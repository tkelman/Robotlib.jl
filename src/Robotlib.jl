"""
This is a library of functions to help out in the Robotlab at LTH
The module imports the following files\n
include("utils.jl")\n
include("DH.jl")\n
include("kinematics.jl")\n
include("robotplot.jl")\n
include("Frames.jl")\n
include("read_log.jl")\n
include("csv2mat.jl")\n

The module includes a submodule, Frames, which is aimed at replacing the Nikon K600 software. It supports creation of frames, simple projections, fitting of planes, lines etc. and has a number of plotting options. It must be separately imported with `using Robotlib.Frames`

The module includes a submodule, Calibration, which includes a number of calibration routines. It must be separately imported with `using Robotlib.Calibration`

Usage:
fkine, ikine, jacobian = get_kinematic_functions("yumi")
data = orcalog2mat(pathopen, pathsave)
q = getData(\"robot_0.\*posRawAbs\", data, 1, removeNaN = false)

For YuMi, joint angles `q` must be converted to logical order using e.g. abb2logical!(q)
You must also consider the base transform of YuMi
"""
module Robotlib
include("utils.jl")
include("DH.jl")
include("kinematics.jl")
include("robotplot.jl")
include("Frames.jl")
include("read_log.jl")
include("csv2mat.jl")

module Calibration
using ..Robotlib
import Robotlib.xii
import Robotlib.Ai
include("calibLPOE.jl")
include("calibForce.jl")
export calibLPOE, calibLPOEdual, calibForce, calibPOE_offsets_from_points

end


export skewcoords, twistcoords, skew, skew4, expω, expξ, expξ2, expξ!, logT, logR, trinv, isrot, isse3, Rangle, conformize, DH2twistsPOE, DH2twistsLPOE, dh2Tn, toOrthoNormal, toOrthoNormal!, rpy2R, Quaternion, xyθ, smartDiff, R2rpy, traj2quat, centralDiff
export fkinePOE, fkineLPOE, ikinePOE, dh2Tn, jacobianPOE, jacobianPOEikine, jacobian, get_kinematic_functions
export trajplot, trajplot3, plot3smart
export DH, DH2400, DHYuMi, DH7600, DHtest, abb2logical!, logical2abb!, abb2logical, logical2abb
export csv2mat, orcalog2mat, getData, readmat


end
