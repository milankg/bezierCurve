class @BezierCustomRun

	constructor: () ->


		# Get canvas
		@bezierCanvas = $( '#bezierCanvas' )

		# Create points 
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

		@curve = new BezierCurve( points, @bezierCanvas, 110, 100 )
		@curve.play()


		# E
		# @bezierCanvas = $( '#bezierCanvasE' )
		# points = []
		# points.push( { x: 30, y: 10 } )
		# points.push( { x: 0, y: 10 } )
		# points.push( { x: 0, y: 10 } )
		# points.push( { x: 0, y: 40 } )
		# points.push( { x: 0, y: 40 } )
		# points.push( { x: 0, y: 40 } )
		# points.push( { x: 30, y: 40 } )
		# points.push( { x: 0, y: 40 } )
		# points.push( { x: 30, y: 40 } )
		# points.push( { x: 0, y: 40 } )
		# points.push( { x: 0, y: 40 } )
		# points.push( { x: 0, y: 40 } )
		# points.push( { x: 0, y: 70 } )
		# points.push( { x: 0, y: 70 } )
		# points.push( { x: 30, y: 70 } )
		# @curve = new BezierCurve( points, @bezierCanvas, 36, 80 )
		# @curve.play()


		# # C
		# @bezierCanvas = $( '#bezierCanvasC' )
		# points = []
		# points.push( { x: 20, y: 10 } )
		# points.push( { x: 0, y: 10 } )
		# points.push( { x: 0, y: 70 } )
		# points.push( { x: 20, y: 70 } )
		# @curve = new BezierCurve( points, @bezierCanvas, 20, 80 )
		# @curve.play()


		# @bezierCanvas = $( '#bezierCanvasH' )
		# points = []
		# points.push( { x: 10, y: 10 } )
		# points.push( { x: 10, y: 50 } )
		# points.push( { x: 30, y: 50 } )
		# points.push( { x: 30, y: 10 } )
		# @curve = new BezierCurve( points, @bezierCanvas, 50, 80 )
		# @curve.play()

		# points = []
		# points.push( { x: 10, y: 80 } )
		# points.push( { x: 10, y: 30 } )
		# points.push( { x: 30, y: 30 } )
		# points.push( { x: 30, y: 80 } )
		# @curve = new BezierCurve( points, @bezierCanvas, 50, 80 )
		# @curve.play()



		# # O
		# @bezierCanvas = $( '#bezierCanvasO' )
		# points = []
		# points.push( { x: 15, y: 10 } )

		# points.push( { x: 0, y: 10 } )

		# points.push( { x: 0, y: 35 } )
		# points.push( { x: 0, y: 35 } )
		# points.push( { x: 0, y: 35 } )

		# points.push( { x: 0, y: 70 } )
		# points.push( { x: 0, y: 70 } )

		# points.push( { x: 15, y: 70 } )
		# points.push( { x: 15, y: 70 } )
		# points.push( { x: 15, y: 70 } )
		# points.push( { x: 15, y: 70 } )
		# points.push( { x: 15, y: 70 } )

		# points.push( { x: 30, y: 70 } )
		# points.push( { x: 30, y: 70 } )

		# points.push( { x: 30, y: 35 } )
		# points.push( { x: 30, y: 35 } )
		# points.push( { x: 30, y: 35 } )

		# points.push( { x: 30, y: 10 } )

		# points.push( { x: 15, y: 10 } )
		# @curve = new BezierCurve( points, @bezierCanvas, 30, 80 )
		# @curve.play()


$ ->


	bezier = new BezierCustomRun()