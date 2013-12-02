class CircleApp
  constructor:(s)->
    @radius = new RadiusDemo(s, @)
    @circumference = new CircumferenceDemo(s, @)
    @diameter = new DiameterDemo(s, @)
    @showAll()
  deselectAll:()=>
    @radius.deselect()
    @circumference.deselect()
    @diameter.deselect()
  showAll:(callback = null) =>
    setTimeout( =>
      @circumference.show()
      setTimeout( =>
        @diameter.show()
        setTimeout( =>
          @radius.show()
          callback() if callback?
        ,700)
      ,700)
    ,700)

  hideAll: =>
    setTimeout( =>
      @radius.hide()
      setTimeout( =>
        @diameter.hide()
        setTimeout( =>
          @circumference.hide()
        ,700)
      ,700)
    ,700)