extends Spatial

signal walkAreaClicked

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MoveArea_input_event(camera, event, position, normal, shape_idx):
	event = event as InputEventMouseButton
	if event != null:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print('clicked')
			emit_signal("walkAreaClicked")
