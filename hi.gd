extends VBoxContainer

# I put no fucking effort into this shitpost,
# ignore how bad the code is

var totalPercent: float = 0

func _process(_delta) -> void:
	totalPercent = 0
	for fucker in get_children():
		if fucker.name == "Template": continue
		if fucker.name == "Final": continue
		updateGender(fucker)
	$Final/Label.text = "Total Percent: %f%%" % [totalPercent] 

func updateGender(this: HBoxContainer) -> void:
	if this.get_node("Button").button_pressed:
		this.queue_free()
		return
	var percent: float = this.get_node("HSlider").value
	this.get_node("Label3").text = "%f%%" % [percent]
	totalPercent += percent

func addGender() -> void:
	# Clone the tempalte
	var new: HBoxContainer = $Template.duplicate()
	# Add it and send it to the bottom, '- 2' because math yay
	add_child(new)
	move_child(new, get_child_count() - 2)
	# Show it
	new.show()
	# That's it I think
