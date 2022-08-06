extends Control

# Once you click on a clue, make the Clue UI visible
func _ready():
	var clues = get_tree().get_root().find_node("Clues", true, false).get_children()
	for clue in clues:
		clue.connect("clueClicked", self, "_on_clueClicked")

func _on_clueClicked(_camera: Camera):
	self.visible = true

# Once the back button is pressed, hide the Clue UI
func _on_clueBackButton_button_down():
	self.visible = false
