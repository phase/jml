package xyz.jadonfowler.jml.ast

interface Type

val T_UNDEF = object : Type {
    override fun toString(): String = "Undefined"
}

val T_NAT = object : Type {
    override fun toString(): String = "Nat"
}

val T_STRING = object : Type {
    override fun toString(): String = "String"
}

fun getType(name: String) = when (name) {
    "Nat" -> T_NAT
    "String" -> T_STRING
    else -> T_UNDEF
}
