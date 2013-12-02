#_require circumference.coffee
#_require diameter.coffee
#_require radius.coffee

# helper class
class Methodder
  constructor: (method, scope) ->
    return (args)->
      method.call(scope, args)

s = Snap("#svg")
circle = {}
Snap.load "svg/circle/circle.svg", (f) ->
  s.append f.select("g")
  new CircleApp(s)