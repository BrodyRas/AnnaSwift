extends Spatial

signal clueClicked

var defaultCursor = load("res://cursors/magnifying_glass.png")
var inspectCursor = load("res://cursors/magnifying_glass_highlight.png")

func _ready():
	var area: Area = self.find_node("Area")	
	area.connect("input_event", self, "_on_Area_input_event")
	area.connect("mouse_entered", self, "_on_Area_mouse_entered")
	area.connect("mouse_exited", self, "_on_Area_mouse_exited")

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	event = event as InputEventMouseButton
	if (event != null and 
		event.button_index == BUTTON_LEFT and 
		event.pressed == true):
			emit_signal("clueClicked", self.find_node("Camera"))


func _on_Area_mouse_entered():
	Input.set_custom_mouse_cursor(inspectCursor)
func _on_Area_mouse_exited():
	Input.set_custom_mouse_cursor(defaultCursor)
