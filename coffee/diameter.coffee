class DiameterDemo
  constructor:(s, @circle)->
    @open = false
    @s = s.select "#Diameter"
    sel = (str) =>
      @s.select str
    @uArrow = sel("#dUpArrow")
    @dArrow = sel("#dDownArrow")
    @arrows = sel("#dArrows")
    @label1 = sel("#dLabel1")
    @label2 = sel("#dLabel2")

    @label2.attr opacity:0
    @arrows.attr opacity:0
    sel("#dUp").attr mask:sel "#dUpSide"
    sel("#dDown").attr mask:sel "#dDownSide"
    
    sel("#dLabel").click @toggle
  toggle: =>
    if @open
      @hide()
    else
      @show()
    @open = not @open
  hide: =>
    @uArrow.animate transform:"t"+[0,0], 1000
    @dArrow.animate transform:"t"+[0,0], 1000
    @label1.animate opacity:1, 400
    @label2.animate opacity:0, 400
    @arrows.animate opacity:0, 400

  show: =>
    @uArrow.animate transform:"t"+[0,-206.5], 1000, mina.easein
    @dArrow.animate transform:"t"+[0,206.5], 1000, mina.easein
    @label1.animate opacity:0, 400
    @label2.animate opacity:1, 400
    @arrows.animate opacity:1, 400
