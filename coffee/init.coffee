#_require circumference.coffee
#_require diameter.coffee
#_require radius.coffee

# First lets create our drawing surface out of existing SVG element
# If you want to create new surface just provide dimensions
# like s = Snap(800, 600);
s = Snap("#svg")
circle = {}
Snap.load "svg/circle/circle.svg", (f) ->
  s.append f.select("g")
  new CircleApp(s)