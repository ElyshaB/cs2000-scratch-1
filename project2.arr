use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include image
include reactors
# Your project work here!


fun draw-circle(color :: String) -> Image:
  doc: "draws a circle with input color"
  circle(100, "solid", color)
end

fun color-cycle(color :: String) -> String:
  doc: "takes the current color and keyboard move and returns nect color"
  if color == "red":
    "blue"
  else if color == "blue":
    "green"
  else:
    "red"
  end
where: color-cycle("red") is "blue"
end

fun mouse1(color :: String, x :: Number, y :: Number, thing :: String) -> String:
  doc: "on a click, switches to the next color"
  if thing == "button-down":
    color-cycle(color)
  else: color
  end
end
fun key1(color :: String, key :: String) -> String:
  doc: "when enter key pressed, switches to next color"
  if key == "enter":
    color-cycle(color)
  else: color
  end
end
r = reactor:
  init: "red",
  to-draw: draw-circle,
  on-mouse: mouse1,
  on-key: key1,
  title: "Circle-cycle"
end
interact(r)

# I want to make and image of a tree where when a key is pressed, some of the tree turns orange/red/yellow to symbolize the season change. I could do different keys for different colors
# I will need to use if statements,
BACKGROUND-URL =
  "https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/img/lab5-background.png"
background = image-url(BACKGROUND-URL)
#tree1 = above-align("center", triangle(30, "solid", "dark-green"), above-align("center",
#triangle(40, "solid", "dark-green"), #triangle(50, "solid", "dark-green")))
#tree2 = above-align("center", triangle(20, "solid", "dark-green"), above-align("center", triangle(30, "solid", "dark-green"), above-align("center",
#     triangle(40, "solid", "dark-green"), triangle(50, "solid", "dark-green"))))


fun make-tree1(color :: String):
  above-align("center", triangle(30, "solid", color),
    above-align("center", triangle(40, "solid", color),
      triangle(50, "solid", color)))
end

fun make-tree2(color :: String):
  above-align("center", triangle(20, "solid", color),
    above-align("center", triangle(30, "solid", color),
      above-align("center", triangle(40, "solid", color),
        triangle(50, "solid", color))))
end

fun change-color(current :: String, key :: String) -> String:
  doc: "Picks the new foliage color based on the key pressed. Unknown keys change nothing."
  if key == "o":
    "orange"
  else if key == "r":
    "red"
  else if key == "y":
    "yellow"
  else if key == "g":
    "dark-green"
  else:
    current
  end
where:
  change-color("dark-green", "o") is "orange"
  change-color("dark-green", "r") is "red"
  change-color("orange", "g") is "dark-green"
end

fun draw-scene(color :: String):
  place-image(make-tree1(color), 100, 250,
    place-image(make-tree2(color), 250, 230, background))
end

tree-reactor = reactor:
  init: "dark-green",
  on-key: change-color,
  to-draw: draw-scene
end

interact(tree-reactor)


