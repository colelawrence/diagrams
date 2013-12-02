class DemoSelect
  constructor: (@circle) ->
  	@selected = no
  select: =>
    if @selected
      @deselect()
      return @hide()
    if not @open
      @show()
    else
      @circle.deselectAll()
      @s.selectAll("[fill='none']").forEach (el)->
        el.animate {stroke:"#FFF847"}, 100
      @selected = yes

  deselect: =>
    @s.selectAll("[fill='none']").forEach (el)->
      el.animate {stroke:"#000000"}, 100
    @selected = no
