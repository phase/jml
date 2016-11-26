package xyz.jadonfowler.jml.ast

class Module(val declarations: List<Declaration>)

interface Declaration

class Binding(val name: String, val expression: Expression) : Declaration

class Function(val name: String, val arguments: List<Formal>, val declarations: List<Declaration>, val returnExpression: Expression) : Type, Declaration

class DefinedType(val body: List<Type>) : Type, Declaration

class Formal(val name: String, val type: Type)

interface Expression
