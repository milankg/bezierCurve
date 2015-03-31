class @BezierCurve

	constructor: ( points, canvas, totalPointsX, totalPointsY ) ->

		# -----------------------------------------
		# Constants 
		# -----------------------------------------
		@canvasBackgroundColor = '#FFF'
		@pointColor = '#333'

		@animationTime = 10000

		# -----------------------------------------
		# Canvas and context
		# -----------------------------------------
		@ctx = canvas[0].getContext( '2d' )
		@canvasWidth = canvas.width()
		@canvasHeight = canvas.height()

		# -----------------------------------------
		# Title
		# -----------------------------------------
		@titleBezierCurve = "~ Bezier Curve ~"
		bezierWidth = @ctx.measureText( @titleBezierCurve ).width
		@titleBezierCurveLeft = ( @canvasWidth - bezierWidth ) / 2
		@titleBezierCurveTop = 10

		# -----------------------------------------
		# Convert points in real coordinate
		# -----------------------------------------
		initialPoints = []
		deepLevel = 0
		for inputPoint in points

			# Calculate real coordinate
			realX =  inputPoint.x * @canvasWidth / totalPointsX 
			realY =  @canvasHeight - inputPoint.y * @canvasHeight / totalPointsY 

			# Create point
			point = new BezierCurvePoint( realX, realY, this, deepLevel )

			# add into list 
			initialPoints.push( point )

		# -----------------------------------------
		# Create all points recursively
		# -----------------------------------------
		@allPoints = initialPoints.concat( @_generatePoints( initialPoints, deepLevel + 1 ) )
		@allPoints[ @allPoints.length - 1 ].main = true

		# -----------------------------------------
		# BezierCurve path ( list of points )
		# -----------------------------------------
		@bezierCurvePath = []

	addBezierCurvePoint: ( pointX, pointY ) ->

		@bezierCurvePath.push( { x: pointX, y: pointY } )

	_generatePoints: ( currentPoints, deepLevel ) ->

		# Recursion break
		if currentPoints.length == 1
			return []

		# Create a list of new points
		newPoints = []
		i = 0
		while i < currentPoints.length - 1

			# Get current point
			point = currentPoints[ i ]

			# Create new MOVABLE point
			newPoint = new BezierCurvePoint( point.x, point.y, this, deepLevel )
			newPoint.movable = true

			# Set point where it will move
			newPoint.between( currentPoints[ i ], currentPoints[ i + 1] )

			newPoints.push( newPoint )

			i = i + 1

		# Get nested points from this list
		nestedPoints = @_generatePoints( newPoints, deepLevel + 1 )

		# Return union
		return newPoints.concat( nestedPoints )


	play: () ->

		# Start times
		@animationStartTime = new Date().getTime()
		@animationEndTime = @animationStartTime + @animationTime

		# Request for draw
		window.requestAnimationFrame( @_draw.bind( @ ) )


	_draw: () ->

		now = new Date().getTime()

		# Get how long this is drawing
		deltaInMillis = now - @animationStartTime

		if deltaInMillis > 0		

			# Calculate which percent is this
			delta = deltaInMillis / @animationTime

			# Draw clean background
			@ctx.fillStyle = @canvasBackgroundColor
			@ctx.fillRect( 0, 0, @canvasWidth, @canvasHeight)

			# Draw lines 
			for point in @allPoints
				point.drawLines( delta )

			# Draw lines 
			for point in @allPoints
				point.drawPoint( delta )

			# Draw bezier curve
			for bezierCurvePoint in @bezierCurvePath

				# Draw circle	
				@ctx.beginPath();
				@ctx.fillStyle = 'red';
				@ctx.arc( bezierCurvePoint.x, bezierCurvePoint.y, 1, 0, Math.PI*2);
				@ctx.closePath();
				@ctx.fill();				

			# Draw Bezier Curve points
			@ctx.fillStyle = 'black';
			@ctx.fillText( @titleBezierCurve, @titleBezierCurveLeft, @titleBezierCurveTop );


		if now > @animationEndTime
			console.log 'Stop'
			return

		# Paint again
		window.requestAnimationFrame( @_draw.bind( @ ) )




class @BezierCurvePoint

	constructor: ( x, y, parentBezierCurve, deepLevel ) ->
		@x = x
		@y = y
		@parentBezierCurve = parentBezierCurve
		@deepLevel = deepLevel

		@movable = false
		@main = false

		@fromPoint1 = null
		@fromPoint2 = null


		@ctx = parentBezierCurve.ctx
		@pointColor = parentBezierCurve.pointColor


	between: ( point1, point2 ) ->

		@fromPoint1 = point1
		@fromPoint2 = point2

	calculateMoving: () ->



	drawLines: ( delta ) ->

		# Draw line on which this point is moving on
		if @movable

			
			lineWidth = 1
			if @deepLevel == 1
				lineColor = '#666'
			else
				if @deepLevel % 2 == 0
					lineColor = 'silver'
				else 
					lineColor = '#66CCFF'


			# Draw line between 2 dots
			@ctx.beginPath();
			@ctx.lineWidth = lineWidth
			@ctx.strokeStyle = lineColor
			@ctx.moveTo(@fromPoint1.x, @fromPoint1.y);
			@ctx.lineTo(@fromPoint2.x, @fromPoint2.y);	
			@ctx.stroke();	


	drawPoint: ( delta ) ->

		# Decide if we need to move this point
		if @movable
			@x =  @fromPoint1.x + ((@fromPoint2.x - @fromPoint1.x) * delta ) 
			@y =  @fromPoint1.y + ((@fromPoint2.y - @fromPoint1.y) * delta ) 

		# If this is main point, remember it in bezier curve path
		if @main
			@parentBezierCurve.addBezierCurvePoint( @x, @y )

		if @main
			color = 'red'
			pointSize = 6
		else
			color = @pointColor
			pointSize = 2

		# Draw circle
		@ctx.beginPath();
		@ctx.fillStyle = color;
		@ctx.arc( @x, @y, pointSize, 0, Math.PI*2);
		@ctx.closePath();
		@ctx.fill();





