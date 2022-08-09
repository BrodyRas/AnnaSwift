extends Control


func _ready():
	# Connect to all clues, so we can hide Movement UI
	var clues = get_tree().get_root().find_node("Clues", true, false).get_children()
	for clue in clues:
		clue.connect("clueClicked", self, "_on_clueClicked")
		
	var NPCs = get_tree().get_root().find_node("NPCs", true, false).get_children()
	for NPC in NPCs:
		NPC.connect("npcClicked", self, "_on_NPC_Clicked")
		

func _on_NPC_Clicked(_camera: Camera):
	self.visible = false

func _on_clueClicked(_camera: Camera):
	self.visible = false

# Show Movement UI when the Clue Back Button is pressed
func _on_clueBackButton_button_down():
	self.visible = true

func _on_npcBackButton_button_down():
	self.visible = true
