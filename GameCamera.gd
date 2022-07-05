extends Camera




func _process(delta):
	
	var players = get_tree().get_nodes_in_group("player")
	
	if (players.size() > 0):
		var player = players[0]
		
	
	pass

