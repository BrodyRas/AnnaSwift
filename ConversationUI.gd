extends Control

# Once you click on a clue, make the Clue UI visible
func _ready():
	var NPCs = get_tree().get_root().find_node("NPCs", true, false).get_children()
	for NPC in NPCs:
		NPC.connect("npcClicked", self, "_on_NPC_Clicked")

func _on_NPC_Clicked(_camera: Camera):
	self.visible = true

func _on_npcBackButton_button_down():
	self.visible = false
