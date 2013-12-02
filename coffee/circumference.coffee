class CircumferenceDemo
  constructor:(s, @circle)->
    @open = false
    @s = s.select "#Circumference"
    sel = (str) =>
      @s.select str

    @arrows = sel("#CArrows")
    @label1 = sel("#CLabel1")
    @label2 = sel("#CLabel2")

    @rOutline = sel "#CUpRightOutline"
    @lOutline = sel "#CDownLeftOutline"
    
    sel("#CDownLeft").attr mask: sel "#CUpRightHalf"
    sel("#CUpRight").attr mask: sel "#CDownLeftHalf"

    @label2.attr opacity:0
    @arrows.attr opacity:0
    sel("#CUpRight").attr mask:sel "#CUpRightHalf"
    sel("#CDownLeft").attr mask:sel "#CDownLeftHalf"
    
    sel("#CLabel").click @toggle
  toggle: =>
    if @open
      @hide()
    else
      @show()
    @open = not @open
  hide: =>
    rAnim = transform:"r"+[0,320,320]
    lAnim = transform:"r"+[0,320,320]
    aAnim = transform:"r"+[0,320,320]
    @arrows.animate {opacity:0}, 800
    @s.animate aAnim, 1000, mina.easeinout
    @label1.animate opacity:1, 600
    @label2.animate opacity:0, 600
    @rOutline.animate rAnim, 1000
    @lOutline.animate lAnim, 1000
  show: =>
    rAnim = transform:"r"+[-179,320,320]
    lAnim = transform:"r"+[179,320,320]
    aAnim = transform:"r"+[10,320,320]
    @arrows.animate {opacity:1}, 800
    @s.animate aAnim, 1000, mina.easeinout
    @label1.animate opacity:0, 600
    @label2.animate opacity:1, 600
    @rOutline.animate rAnim, 1200
    @lOutline.animate lAnim, 1200