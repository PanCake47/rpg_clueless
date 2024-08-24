extends Control

@onready var health_bar: TextureProgressBar = $HealthBar

func update_hp(current_hp, max_hp):
	var percentage = float(current_hp) / float(max_hp) * 100.0
	health_bar.value = percentage
