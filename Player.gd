extends Spatial

export var turnSpeed = 1.0
export var hasMovementControl = true
var turningLeft = false
var turningRight = false

var defaultCursor = load("res://cursors/magnifying_glass.png")
var leftCursor = load("res://cursors/turn_left.png")
var rightCursor = load("res://cursors/turn_right.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	# Get the list of WalkNodes in the scene, and connect their signals to our move function
	var children = get_tree().get_root().find_node("WalkNodes", true, false).get_children()
	for child in children:
		child.connect("walkAreaClicked", self, "_on_WalkArea_Clicked")
		
	# Connect to clues, so we can inspect them 
	var clues = get_tree().get_root().find_node("Clues", true, false).get_children()
	for clue in clues:
		clue.connect("clueClicked", self, "_on_clueClicked")
	
	# Connect to NPCs, so we can talk to them 
	var NPCs = get_tree().get_root().find_node("NPCs", true, false).get_children()
	for NPC in NPCs:
		NPC.connect("npcClicked", self, "_on_clueClicked")

func _on_NPC_Clicked(camera: Camera):
	camera.current = true
	hasMovementControl = false

	
func _on_clueClicked(camera: Camera):
	camera.current = true
	hasMovementControl = false

# When a WalkArea is clicked, warp to its global position
func _on_WalkArea_Clicked(position):
	if hasMovementControl:
		self.global_transform.origin = position


func _physics_process(delta):
	if hasMovementControl:
		handleTurning(delta)

func handleTurning(delta):
	if turningLeft:
		self.rotate_y(deg2rad(turnSpeed))
	if turningRight:
		self.rotate_y(deg2rad(-turnSpeed))

func resumeMovement():
	self.find_node("playerCamera", true, true).current = true
	hasMovementControl = true

func _on_clueBackButton_button_down():
	resumeMovement()
func _on_npcBackButton_button_down():
	resumeMovement()

# Turn left/right based on what panel you're hovering over
func _on_Left_Panel_mouse_entered():
	turningLeft = true
	Input.set_custom_mouse_cursor(leftCursor)
func _on_Left_Panel_mouse_exited():
	turningLeft = false
	Input.set_custom_mouse_cursor(defaultCursor)
func _on_Right_Panel_mouse_entered():
	turningRight = true
	Input.set_custom_mouse_cursor(rightCursor)
func _on_Right_Panel_mouse_exited():
	turningRight = false
	Input.set_custom_mouse_cursor(defaultCursor)



