class Arrow
  @arrowHead = 
    "d":"M 11.731351,10.254022 -4.4968947,0.14728064 11.731351,-9.9594606",
    "stroke":"#000",
    "stroke-linecap":"round",
    "stroke-linejoin":"round",
    "stroke-miterlimit":"4",
    "stroke-width":"6",
    "fill":"none"
  constructor:(@group)->
    @arrow = @group.paper.group @group.paper.el "path", Arrow.arrowHead
    @path = @group.select 'path'
    @group.prepend @arrow

    @totalLength = @path.getTotalLength()

    @path.attr
      "stroke-dasharray":@totalLength,
      "stroke-dashoffset":@totalLength,
      "stroke-width":"6",
      "stroke-linecap":"round",
      fill: "rgba(255,255,255,0.2)"
    @path.click @startAnimation
    @path.hover (e)->
      console.log e

  animate:(val)=>
    @path.attr "stroke-dashoffset":val
    point = @path.getPointAtLength @totalLength - val
    anglePoint = @path.getPointAtLength @totalLength - val - .1
    angle = Snap.angle anglePoint.x, anglePoint.y, point.x, point.y
    @arrow.attr transform:"t"+[point.x,point.y]
    @arrow.select("path").attr transform:"r"+[angle,0,0]

  startAnimation: =>
    duration = 400 * Math.round (@totalLength / 200)
    duration = 400 if duration < 400
    console.log duration + "ms"
    Snap.animate @totalLength, 0, @animate, duration, ()->
      console.log "end animation"