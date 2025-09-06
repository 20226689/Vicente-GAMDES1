shader_type canvas_item;

uniform float SPEED = 0.0005;

void vertex() {
	UV.y -= TIME * SPEED;	
}