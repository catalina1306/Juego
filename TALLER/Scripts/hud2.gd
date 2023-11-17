extends MarginContainer

@onready var h_box_container = $VBoxContainer/HBoxContainer
@onready var health_bar = $VBoxContainer/HBoxContainer/HealthBar
@onready var player_1 = $"VBoxContainer/HBoxContainer/Player 1"


func set_health(value):
	health_bar.value = value 
	
var index = 1 : 
	set(value) : 
		index = value 
		if h_box_container :
			h_box_container.alignment = 0 if index == 1 else 2	
		if health_bar and player_1 :
			h_box_container.remove_child(health_bar)
			h_box_container.remove_child(player_1)
			
			if index == 1:
				h_box_container.add_child(health_bar)
				h_box_container.add_child(player_1)
				player_1.text =  "Player 1"
				
			else :
				h_box_container.add_child(player_1)
				h_box_container.add_child(health_bar)
				player_1.text =  "Player 2"
				
			
				
				
				
