class @BezierCustomRun

	constructor: () ->

		# Get canvas
		@bezierCanvas = $( '#bezierCanvas' )

		# Create some random points 
		points = []
		points.push( { x: 10, y: 10 } )
		points.push( { x: 20, y: 40 } )
		points.push( { x: 30, y: 20 } )
		points.push( { x: 40, y: 85 } )
		points.push( { x: 50, y: 70 } )
		points.push( { x: 60, y: 0 } )
		points.push( { x: 70, y: 50 } )
		points.push( { x: 80, y: 30 } )
		points.push( { x: 85, y: 70 } )
		points.push( { x: 100, y: 50 } )

		# Create Bezier curve object and play it
		@curve = new BezierCurve( points, @bezierCanvas, 110, 100 )
		@curve.play()

$ ->
	bezier = new BezierCustomRun()