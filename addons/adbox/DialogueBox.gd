"""

Licensed under MIT

v. 0.0

Author: Max Schmitt 
		from
		Divirad - Kepper, Lösing, Schmitt GbR
"""

extends NinePatchRect
class_name DialogueBox, "icon.png"

export var message_sound : Resource
export var font : Font
export var action_name : String
export var wait_time = 0.2
export var block_time = 0.3
var time : float

var text = []
var num : int
var wait : bool = false
var block_walk : bool
var hidden : bool = true

var audio : AudioStreamPlayer
var audioShouldPlay : bool = true

var TextBox : RichTextLabel
var InputBlocker : Timer
var ShowTimer : Timer

var block_box_timer : bool

signal dialogue_exit()

func _ready():
	audio = AudioStreamPlayer.new()
	audio.stream = message_sound
	add_child(audio)
	
	TextBox = load_node("res://addons/adbox/TextBox.tscn").instance()
	add_child(TextBox)
	#TextBox.visible_characters = -1
	#TextBox.percent_visible = 1#0.05
	#TextBox.scroll_active = true
	#TextBox.anchor_right = 1
	#TextBox.anchor_bottom = 1
	
	#TextBox.margin_left = 10
	#TextBox.margin_top = 10 
	#TextBox.margin_right = -10
	#TextBox.margin_bottom = -10)
	#TextBox.add_font_override("normal_font", font)
	
	print("2")
	InputBlocker = Timer.new()
	InputBlocker.connect("timeout", self, "_on_InputBlocker_timeout")
	InputBlocker.autostart = true
	InputBlocker.one_shot = true
	InputBlocker.wait_time = block_time
	add_child(InputBlocker)
	print("3")
	ShowTimer = Timer.new()
	ShowTimer.autostart = true
	ShowTimer.connect("timeout", self, "_on_Timer_timeout")
	ShowTimer.wait_time = wait_time
	add_child(ShowTimer)
	print("4")

func _process(delta):
	#process(delta)
	pass
	
func process(delta):
	if hidden:
		return
	
	if hidden and !audio.playing && audioShouldPlay:
		audio.play(0)
		
	if hidden and Input.is_action_just_pressed(action_name):
		if wait == true:
			if TextBox.percent_visible != 1:
				TextBox.percent_visible = 1
				return
			if num < len(text) - 1:
				num += 1
				TextBox.text = text[num]
				to_beginning()
			elif TextBox.percent_visible == 1:
				num = 0
				TextBox.percent_visible = .05
				hide()
				InputBlocker.wait_time = block_time
				InputBlocker.start()

func talk(textarray : Array):
	"""
	Use this function to activate the DialogueBox
	"""
	text = textarray
	block_walk = true
	num = 0
	TextBox.text = text[num]
	print("start")
	show()
	to_beginning()

func to_beginning():
	ShowTimer.wait_time = wait_time
	TextBox.percent_visible = 0.05
	
	wait = false
	hidden = false
	audioShouldPlay = true
	
	ShowTimer.start()

func _on_Timer_timeout():
	if TextBox.percent_visible < 1:
		TextBox.percent_visible += .01
	else:
		audioShouldPlay = false
		audio.stop()
	wait = true

func _on_InputBlocker_timeout():
	hidden = true
	block_walk = false
	ShowTimer.stop()
	audio.stop()
	emit_signal("dialogue_exit")