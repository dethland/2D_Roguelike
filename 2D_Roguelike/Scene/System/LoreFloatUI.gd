extends Panel



# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false;
	$Tween.interpolate_method(self,"fade_in",0,0.7,0.5);
	$Tween.start();
	visible = true;

func fade_in(t):
	var panel = get_stylebox("panel", "" );
	var oldcol = panel.get_bg_color();
	oldcol.a = t;
	panel.set_bg_color(oldcol);

func fade_out(t):
	var panel = get_stylebox("panel", "" );
	var oldcol = panel.get_bg_color();
	oldcol.a = t;
	panel.set_bg_color(oldcol);
	if (t <= 0.001): visible = false;

func start_fade_out():
	$Tween.interpolate_method(self,"fade_out",0.7,0,0.5);
	$Tween.start();
	
func _on_Tween_tween_completed(object, key):
	$Tween.interpolate_callback(self,3,"start_fade_out");
	$Tween.start();
