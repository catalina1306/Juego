extends Node

var scene_dir 
@onready var menu_music = $menuMusic
@onready var fight_music = $fightMusic

var character1 = "res://Scenes/player_1.tscn"
var character2 = "res://Scenes/player_3.tscn"


func playMenuMusic():
	fight_music.stop()
	menu_music.play()

func playFightMusic():
	menu_music.stop()
	fight_music.play()
	
 
