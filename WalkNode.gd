extends Spatial

signal walkAreaClicked

var defaultCursor = load("res://cursors/magnifying_glass.png")
var moveCursor = load("res://cursors/forward.png")

# Once the area is clicked, emit a signal with global position, so the player can warp to this position
func _on_MoveArea_input_event(camera, event, position, normal, shape_idx):
	event = event as InputEventMouseButton
	if (event != null and 
		event.button_index == BUTTON_LEFT and 
		event.pressed == true):
			emit_signal("walkAreaClicked", self.global_transform.origin)


# Custom cursor stuff
func _on_MoveArea_mouse_entered():
	Input.set_custom_mouse_cursor(moveCursor)
	self.find_node("MeshInstance").visible = true
func _on_MoveArea_mouse_exited():
	Input.set_custom_mouse_cursor(defaultCursor)
	self.find_node("MeshInstance").visible = false
