extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var turnSpeed = 1.0
var turningLeft = false
var turningRight = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if turningLeft:
		self.rotate_y(deg2rad(turnSpeed))
		
	if turningRight:
		self.rotate_y(deg2rad(-turnSpeed))

func _on_Left_Area_mouse_entered():
	turningLeft = true

func _on_Left_Area_mouse_exited():
	turningLeft = false

func _on_Right_Area_mouse_entered():
	turningRight = true

func _on_Right_Area_mouse_exited():
	turningRight = false
