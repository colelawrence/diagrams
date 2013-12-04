#_require Arrow.coffee

# helper class
class Methodder
  constructor: (method, scope) ->
    return (args)->
      method.call(scope, args)

s = Snap("#svg")
circle = {}
Snap.load "svg/testpath.svg", (f) ->
  f.selectAll("path").forEach (el) ->
  	group = s.group el
  	new Arrow(group)
  	s.append el