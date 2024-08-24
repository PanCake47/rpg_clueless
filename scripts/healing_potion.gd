extends Area2D

var item_name: String = "Healing Potion"  
var description: String = "Restores 20 HP."
var icon_texture: Texture = ResourceLoader.load("res://assets/rpg_healing_potion.png")

func _ready():
	if icon_texture:
		$PotionSprite.texture = icon_texture
	else:
		print("Icon texture not assigned for", item_name)

func _on_body_entered(body: Node):
	if body.name == "Player":
		print("Player detected: ", body.name)
		var inventory = body.get_node("Inventory")
		if inventory:
			if inventory.add_item(self):
				print("You've picked up a 'Healing Potion'")
				queue_free()
		else:
			print("Inventory node not found in player.")

func use_item(player: Node):
	if item_name == "Healing Potion":
		print("Using Healing Potion.")
		player.heal(20)
