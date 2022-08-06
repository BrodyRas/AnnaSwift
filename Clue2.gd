extends Spatial

signal clueClicked

func _on_Clue2Area_input_event(camera, event, position, normal, shape_idx):
	event = event as InputEventMouseButton
	if (event != null and 
		event.button_index == BUTTON_LEFT and 
		event.pressed == true):
			emit_signal("clueClicked", self.find_node("Camera"))
