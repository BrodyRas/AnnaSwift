extends Spatial

signal walkAreaClicked

# Once the area is clicked, emit a signal with global position, so the player can warp to this position
func _on_MoveArea_input_event(camera, event, position, normal, shape_idx):
	event = event as InputEventMouseButton
	if event != null:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			print('clicked', self.global_transform.origin)
			emit_signal("walkAreaClicked", self.global_transform.origin)
