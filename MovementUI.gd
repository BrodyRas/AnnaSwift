extends Control

# When a clue is clicked, hide the movement UI
func _ready():
	var clues = get_tree().get_root().find_node("Clues", true, false).get_children()
	for clue in clues:
		clue.connect("clueClicked", self, "_on_clueClicked")

func _on_clueClicked(_camera: Camera):
	self.visible = false

# Show Movement UI when the Clue Back Button is pressed
func _on_clueBackButton_button_down():
	self.visible = true
