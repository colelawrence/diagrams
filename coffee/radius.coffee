class RadiusDemo
  constructor:(s)->
    @open = false
    @s = s.select "#Radius"
    sel = (str) =>
      @s.select str
    @lArrow = sel("#RadiusLeftArrow")
    @rArrow = sel("#RadiusRightArrow")
    @arrows = sel("#RadiusArrows")
    @label1 = sel("#RadiusLabel1")
    @label2 = sel("#RadiusLabel2")

    @label2.attr opacity:0
    @arrows.attr opacity:0
    sel("#RadiusLeft").attr mask:sel "#RadiusLeftSide"
    sel("#RadiusRight").attr mask:sel "#RadiusRightSide"
    
    sel("#RadiusLabel").click @toggle
  toggle: =>
    if @open
      @hide()
    else
      @show()
    @open = not @open
  hide: =>
    @lArrow.animate transform:"t"+[0,0], 1000
    @rArrow.animate transform:"t"+[0,0], 1000
    @label1.animate opacity:1, 400
    @label2.animate opacity:0, 400
    @arrows.animate opacity:0, 400

  show: =>
    @lArrow.animate transform:"t"+[-105,0], 1000, mina.easein
    @rArrow.animate transform:"t"+[105,0], 1000, mina.easein
    @label1.animate opacity:0, 400
    @label2.animate opacity:1, 400
    @arrows.animate opacity:1, 400
