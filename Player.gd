extends KinematicBody

#how fast player moves in m/s
export var speed = 15
#downward acceleration when in air, m/s^2
export var fall_acceleration = 75

var velocity = Vector3.ZERO 

func _physics_process(delta):
	#local variable to denote character direction
	var direction = Vector3.ZERO
	
	#updating direction according to the input
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_up"):
		direction.z += 1
	if Input.is_action_pressed("move_down"):
		direction.z -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(translation + direction, Vector3.UP)
	
	#Ground Velocity
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	#vertical velocity
	velocity.y -+ fall_acceleration * delta
	#moving the character
	velocity = move_and_slide(velocity, Vector3.UP)

