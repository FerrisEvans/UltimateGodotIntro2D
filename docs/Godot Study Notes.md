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

# 2. Delta 增量时间

```gdscript
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
```

## 2.1 Movement

The movement speed of our game is determined by how fast the game runs(how many frames are generated)

当我们谈论游戏速度的时候，我们通常在谈论到底生成了多少帧。一台非常慢的电脑和一台非常快的电脑，这个差距是巨大的。

| Speed(pixels per frame) | Frames per second | Total movement(per second) |
| --- | --- | --- |
| 10px | 30 | 10 * 30 = 300 |
| 10px | 60 | 10 * 60 = 600 |
| 10px | 120 | 10 * 120 = 1200 |

Since come scenes are harder to render than others, it might even run inconsistently on the same system!

**<font color="red">Delta Time</font> measures how long it took to create one frame.**

For example, if the framerate is 60fps, delta time is $1s \div 60 = 0.0167$ or about 17 milliseconds.

This information we can use to keep the same at a constant speed regardless of framerate.

We essentially multiply any movement with the delta time.

## 2.2 How framerates influence the game

| Speed(pixels per frame) | Frames per second | Delta time(seconds) | Original movement(per second) | Delta movement(per second) |
| --- | --- | --- | --- | --- |
| 10px | 30 | 1 / 30 = 0.033 | 10 * 30 = 300 | 10 * 30 * 0.033 = 10 | 
| 10px | 60 | 1 / 60 = 0.017 | 10 * 60 = 600 | 10 * 60 * 0.017 = 10 |
| 10px | 120 | 1 / 120 = 0.008 | 10 * 120 = 1200 | 10 * 120 * 0.008 = 10 |

With delta accounted, the game runs at the same speed at any framerate!