extends KinematicBody2D
class_name Person

var move = Vector2()
var life = 100
var consciencia = true
var speed

func _ready() -> void:
    pass

func _process(delta):
    if consciencia:
        var prev_move = move
        mov_custom()
        move = lerp(prev_move, move, 0.3)
        move_and_slide(move)

func dano(quanto_de_dano, fonte_do_dano = null):
    if life > 0:
        if fonte_do_dano:
            knockback(fonte_do_dano)
        life -= quanto_de_dano
        dano_custom(fonte_do_dano)
        if life <= 0:
            print("morri")
            consciencia = false
            modulate = Color(0, 0, 0)
            emit_signal("death")
            $Col.queue_free()

func knockback(dano_do_fonte):
    var fonte = dano_do_fonte.position
    var prev_dir = rotation
    look_at(fonte)
    move = Vector2(-5000, 0).rotated(rotation)
    rotation = prev_dir

# Funcs "Inúteis"

func mov_custom():
    pass

func dano_custom(fonte_do_dano):
    pass
