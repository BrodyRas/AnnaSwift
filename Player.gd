extends Spatial

export var turnSpeed = 1.0
var turningLeft = false
var turningRight = false


# Called when the node enters the scene tree for the first time.
func _ready():
	# Get the list of WalkNodes in the scene, and connect their signals to our move function
	var children = get_tree().get_root().find_node("WalkNodes", true, false).get_children()
	for child in children:
		child.connect("walkAreaClicked", self, "_on_WalkArea_Clicked")

# When a WalkArea is clicked, warp to its global position
func _on_WalkArea_Clicked(position):
	self.global_transform.origin = position


func _physics_process(delta):
	handleTurning(delta)

func handleTurning(delta):
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
