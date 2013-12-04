class Arrow
  @arrowHead =
    "d":"M 11.731351,10.254022 -4.4968947,0.14728064 11.731351,-9.9594606",
    "stroke":"#000",
    "stroke-linecap":"round",
    "stroke-linejoin":"round",
    "stroke-miterlimit":"4",
    "stroke-width":"6",
    "fill":"none"
  @getDuration = (val) ->
    val = 400 * Math.round (val / 300)
    val = 400 if val < 400
    val

  constructor:(@group)->
    @arrow = @group.paper.group @group.paper.el "path", Arrow.arrowHead
    @hidden = true
    @animation = null
    @path = @group.select 'path'
    @group.append @arrow

    console.log @group

    @totalLength = @path.getTotalLength()

    @group.attr
      opacity:0
    @path.attr
      "stroke-dasharray":@totalLength,
      "stroke-dashoffset":@totalLength,
      "stroke-width":"6",
      "stroke-linecap":"round",
      fill: "rgba(255,255,255,0.2)"
    @path.click @showAnimation
    @path.hover (e)->
      console.log e

  animate:(val)=>
    @path.attr "stroke-dashoffset":val
    point = @path.getPointAtLength @totalLength - val
    anglePoint = @path.getPointAtLength @totalLength - val - .1
    angle = Snap.angle anglePoint.x, anglePoint.y, point.x, point.y
    @arrow.attr transform:"t"+[point.x,point.y]
    @arrow.select("path").attr transform:"r"+[angle,0,0]

  showAnimation: =>
    dashOffset = parseInt @path.attr("stroke-dashoffset")[...-2]
    console.log dashOffset
    @duration = Arrow.getDuration dashOffset
    console.log Arrow.getDuration dashOffset
    if not @hidden
      return @hideAnimation(dashOffset)
    @animation.stop() if @animation
    @animation = Snap.animate @totalLength, 0, @animate, @duration
    @group.animate opacity: 1, @duration*.2
    @hidden = false

  hideAnimation: (dashOffset) =>
    @animation.stop() if @animation
    @animation = Snap.animate dashOffset, @totalLength, @animate, @duration
    @group.animate opacity: 0, @duration*.2
    @hidden = true