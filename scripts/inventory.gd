extends Node

# Define the maximum number of inventory slots
var max_slots: int = 8

# Array to store item data dictionaries
var items: Array = []

# Function to add an item to the inventory
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

# Function to remove an item from the inventory (optional)
func remove_item(index):
	if index >= 0 and index < items.size():
		items.remove_at(index)  # Correctly remove the item without expecting a return value
		update_inventory_ui()
		print("Item removed. Current inventory size:", items.size())
		return true
	print("Invalid index. Cannot remove item.")
	return false

# Function to update the inventory UI
func update_inventory_ui():
	var slot_container = get_node("ItemSlotsContainer")  # Adjust the path as needed
	
	for i in range(max_slots):
		var slot = slot_container.get_child(i) as TextureButton  # Adjust the node type if different
		
		if i < items.size():
			# Assign the texture from the stored item data
			slot.texture_normal = items[i]["icon_texture"]
			slot.visible = true
			print("Slot", i, "updated with", items[i]["name"])
		else:
			# Clear the slot if no item is present
			slot.texture_normal = null
			slot.visible = true  # Ensure empty slots remain visible
			print("Slot", i, "cleared")
