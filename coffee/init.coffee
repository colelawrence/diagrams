#_require circumference.coffee
#_require radius.coffee

# First lets create our drawing surface out of existing SVG element
# If you want to create new surface just provide dimensions
# like s = Snap(800, 600);
s = Snap("#svg")
Snap.load "svg/circle/circle.svg", (f) ->
  g = f.select("g")
  s.append g
  radius = new RadiusDemo(s)
  circumference = new CircumferenceDemo(s)