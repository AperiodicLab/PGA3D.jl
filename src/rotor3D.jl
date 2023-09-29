struct Rotor3D{T<:Number} <: AbstractPGA3DElement{T}
    vec::SVector{4,T}

    function Rotor3D(scalar::Number, e23::Number, e31::Number, e12::Number)
        T = promote_type(eltype(scalar), eltype(e23), eltype(e31), eltype(e12))
        vec = SVector{4,T}(promote(scalar, e23, e31, e12)...)
        return new{T}(vec)
    end

    function Rotor3D(vec::SVector{4,T}) where {T<:Number}
        return new{T}(vec)
    end
end

internal_vec(a::Rotor3D) = a.vec

Base.length(::Rotor3D) = 4
Base.size(::Rotor3D) = (4,)


get_scalar(a::Rotor3D) = a[1]
get_e23(a::Rotor3D) = a[2]
get_e31(a::Rotor3D) = a[3]
get_e12(a::Rotor3D) = a[4]
