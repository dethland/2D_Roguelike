extends TextureButton
enum STATE {LOCKED, UNLOCKED, UNLOCKABLE}

export var skill_name = "";
export var skill_info = "";
export var skill_cost = 0;
export var image_path = "";
var _normal = "res://Scene/SkillTree/ButtonArt/normal.png";
var _normal_unlocked = "res://Scene/SkillTree/ButtonArt/normal_unlocked.png";
export(STATE) var cur_state = STATE.LOCKED;


func _ready():
	# set to either unlocked, unlockable, or locked
	load_state();
	# load in the appropriate image asset for the skill itself
	$TextureRect.texture = load(image_path);
	# set the appropriate skill information
	$SkillPanel/SkillName.text = skill_name;
	$SkillPanel/SkillInfo.text = skill_info;
	$SkillPanel.visible = false;
	
func _on_SkillButton_pressed():
	# only grant skill if the player can afford to buy the skill
	var can_buy = true #global_tool.get_player().xp >= skill_cost;
	if can_buy and cur_state == STATE.UNLOCKABLE:
		set_state(STATE.UNLOCKED)
		# subtract money from player
		# global_tool.get_player().xp -= skill_cost;

func set_state(state_enum:int) -> void:
	cur_state = state_enum;
	match state_enum:
		STATE.LOCKED:
			disabled = true
		STATE.UNLOCKABLE:
			self.texture_normal = load(_normal);
			disabled = false
		STATE.UNLOCKED:
			self.texture_normal = load(_normal_unlocked);
			update_children()
			disabled = false
	
	# implement in future (pozdnm)
	#save[skill_name] = cur_state

func load_state():
	# read save data to determine state
	var unlocked = grab_from_save(skill_name);
	# if it is unlocked, set to unlocked
	if unlocked:  
		set_state(STATE.UNLOCKED)
		update_children()
	# if the preceding node is unlocked, this one is unlockable
	elif parent_unlocked(): 
		set_state(STATE.UNLOCKABLE)
	# else
	else:
		set_state(STATE.LOCKED);

# propogates the state change to children
func update_children():
	for child in get_children():
		if "skill_name" in child: 
			child.set_state(STATE.UNLOCKABLE);

# return true if parent skill in hierarchy is unlocked
func parent_unlocked():
	# if parent is another Skill button node, see if it is unlocked
	if "cur_state" in get_parent():
		return get_parent().cur_state == STATE.UNLOCKED;
	# if tree is parent, then should be unlockable
	else: 
		return true

# returns true if the skill is unlocked, false otherwise
func grab_from_save(name):
	# will work like this in the future (pozdnm)
	#if name in save: 	return (save.unlocked_skills[name] == true)
	#else:				return false
	# for now, assume it is not in the save
	return false

# handle hovering
func _on_SkillButton_mouse_entered(): $SkillPanel.visible = true;
func _on_SkillButton_focus_entered(): $SkillPanel.visible = true;
func _on_SkillButton_mouse_exited():  $SkillPanel.visible = false;
func _on_SkillButton_focus_exited():  $SkillPanel.visible = false;



