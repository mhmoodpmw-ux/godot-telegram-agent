
extends Node2D

var score: int = 0
var message_label: Label
var score_label: Label

func _ready() -> void:
    message_label = get_node_or_null("Subtitle")
    score_label = Label.new()
    score_label.position = Vector2(40, 400)
    score_label.size = Vector2(640, 100)
    score_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    score_label.add_theme_font_size_override("font_size", 30)
    add_child(score_label)
    _update_score()

func _input(event: InputEvent) -> void:
    if event is InputEventScreenTouch and event.pressed:
        _add_point()
    elif event is InputEventMouseButton and event.pressed:
        _add_point()

func _add_point() -> void:
    score += 1
    _update_score()

func _update_score() -> void:
    if is_instance_valid(score_label):
        score_label.text = "Score: %d" % score
    if is_instance_valid(message_label):
        message_label.text = "Tap anywhere to play!"

func reset_game() -> void:
    score = 0
    _update_score()
