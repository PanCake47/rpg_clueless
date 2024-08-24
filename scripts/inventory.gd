extends Node

var max_slots: int = 8  # Maximum number of inventory slots
var items: Array = []  # Array to store item data dictionaries

func add_item(item):
	if items.size() < max_slots:
		# Create a dictionary with the item's properties
		var item_data = {
			"name": item.item_name,
			"description": item.description,
			"icon_texture": item.icon_texture
		}
		items.append(item_data)
		update_inventory_ui()
		print("Item added:", item_data["name"], "Current inventory size:", items.size())
		return true
	print("Inventory full. Cannot add item:", item.item_name)
	return false

func remove_item(index):
	if index >= 0 and index < items.size():
		items.remove_at(index)  # Correctly remove the item
		update_inventory_ui()
		print("Item removed. Current inventory size:", items.size())
		return true
	print("Invalid index. Cannot remove item.")
	return false

func update_inventory_ui():
	print("Updating inventory UI. Current items:", items)
	var slot_container = get_node("ItemSlotsContainer")  # Adjust the path as needed
	
	for i in range(max_slots):
		var slot = slot_container.get_child(i) as TextureButton  # Adjust the node type if different
		
		if i < items.size():
			slot.texture_normal = items[i]["icon_texture"]
			slot.visible = true
			print("Slot", i, "updated with", items[i]["name"])
		else:
			slot.texture_normal = null
			slot.visible = true  # Ensure empty slots remain visible
			print("Slot", i, "cleared")
