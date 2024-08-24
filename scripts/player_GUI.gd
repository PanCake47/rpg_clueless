extends Control

@onready var health_bar: TextureProgressBar = $HealthBar

func _ready():
	health_bar.value = 100

func update_hp(current_hp, max_hp):
	health_bar.value = (float(current_hp) / float(max_hp)) * 100  

func use_item()
