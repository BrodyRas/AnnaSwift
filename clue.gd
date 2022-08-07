extends Spatial

signal clueClicked

var defaultCursor = load("res://cursors/magnifying_glass.png")
var inspectCursor = load("res://cursors/magnifying_glass_highlight.png")

func _on_clueArea_input_event(camera, event, position, normal, shape_idx):
	event = event as InputEventMouseButton
	if (event != null and 
		event.button_index == BUTTON_LEFT and 
		event.pressed == true):
			emit_signal("clueClicked", self.find_node("clueCamera"))


func _on_clueArea_mouse_entered():
	Input.set_custom_mouse_cursor(inspectCursor)
func _on_clueArea_mouse_exited():
	Input.set_custom_mouse_cursor(defaultCursor)
