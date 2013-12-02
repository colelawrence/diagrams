class CircleApp
  constructor:(s)->
    radius = new RadiusDemo(s, @)
    circumference = new CircumferenceDemo(s, @)
    diameter = new DiameterDemo(s, @)