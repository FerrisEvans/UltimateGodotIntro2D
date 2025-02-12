# 0. Godot项目中遵循的命名约定

Node的命名使用PascalCase，单词之间没有空格，每个单词大写开头。

其他命名大部分使用蛇形命名法。所有内容都是小写，如果有空格则使用下划线。

# 1. Definition

## 1.1 Variables
You have all the basic datatypes(**int**, **float**, **bool**, **string**, **dicts**). No **Tuples** and **Lists** are replaced by **Arrays**.

```gdscript
# variables and constants
var current_speed = 200
const max_speed = 500
```

You can change the datatype dynamically or you can force one datatype for a variable.

```gdscript
var a_string: String = 'test'
var a_number: int = 123
var switch: bool = true
var some_numbers: Array[int] = [1, 2, 3, 4]
```

## 1.2 Functions

You create functions with `func`. You can specify datatypes for parameters and the return value.

```gdscript
func test_function(param_a: int, param_b: String) -> :
    return true
```

If you don't specify a return value, `void` is returned. Like in Python, indentations assign lines of code to a function.

==There are lots of inbult functions you will use, they all start with an `_`.==
1. `_ready()` is run when a Node is added to the node tree.
2. `_process()` is run on every frame of the game.

## 1.3 Flow

You have `if` statements, `while` & `for` loops alongs with the comparison operators (also `continue` & `break`)

## 1.4 Classes

A script is always added to a Node, that Node is a class with default methods and attributes.

Adding a script to a Node2D creates an object with a position, rotation, scale etc.

You can use code to change these calues and also add new ones.

You can target other nodes in 2 ways:
1. `get_node("node path")`
2. `$node path`