GDPC                                                                                @   res://.import/ballon.png-eb1e6374d0c5de284183504f3fe61045.stex  0      ?      ?2?=???:??aA]<   res://.import/blue.png-4d748ed6429caf8afc2e9d3803eadf6e.stexp#      ?       ;??p??\?????K?+@   res://.import/green.png-5db815cc8219d4fb24db6968e2796f87.stex   @'      ?       -<??pF}y???i#Q??<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex`*      ?      ?ǥ0R????r???J?@   res://.import/kniff.png-9bddc34f52fa6b6770e43b3bc75be388.stex   ?.      ?      ?bQ??d??L?cޏ?@   res://.import/particle.png-c2ba3d91e96c62035d672392a1197218.stex08      ?       ?????W??8???^??<   res://.import/red.png-13f6abb0e0c70056504666ed9c349d99.stex p;      ?       ?????F??-??(??4[@   res://.import/yellow.png-1fff2f74667453120412091eeb717b92.stex  `C      ?       ?
?????*J????i   res://Ball.gd.remap ?F             ?F????"????j   res://Ball.gdc  ?      ?      ?q???<?d(lp????   res://Ball.tscn ?      F      q??(????0?[??:?   res://Ballon.gd.remap   ?F      !       %??????O??)??   res://Ballon.gdc       ?      ^D5R??A??
   res://Ballon.tres   ?      +      ?rHF?(??5 b??'   res://Ballon.tscn         ?	      )??8?z????}k   res://Wall.tscn ?      U      M??O???8y?S?Z   res://ballon.png.import ?       ?      ??2w????4O???CH   res://blue.png.import    $      ?      0!????q?N?N:)U   res://default_env.tres  ?&      ?       um?`?N??<*ỳ?8   res://green.png.import  ?'      ?      n??V??6SM?'?   res://icon.png   G      ?      ?E??4?0E?l???   res://icon.png.import   @,      ?      ?????%??(#AB?   res://kniff.png.import  p0      ?      ???[.????*???   res://level.tscn 3      R      J:????֓???#0?nA   res://new_shader.shader `7      ?       5sQ?.?XI;?;?n?   res://particle.png.import   ?8      ?      ???\)????팎-<?   res://project.binary?H      ?      ?sR??:v??~7?jT??   res://red.png.import <            +'????3Kp?   res://spawner.gd.remap  ?F      "       hmGu???\s?????   res://spawner.gdc   ?>      ?      @?	????T?????-|   res://spawner.tscn  B      G      ?"??C	C????l???   res://yellow.png.import ?C      ?      RdT?o??'.??^?E?            GDSC            u      ????????τ??   ???????ݶ???   ???????ݶ???   ??ƶ   ?????϶?   ????????????Ӷ??   ???????Ŷ???   ????׶??   ????¶??   ?????????????????????Ҷ?   ???????????¶???   ?????????????????ض?   ??????????????????????Ҷ                d         click                                  
                     	      
                     0      1      2      3      :      C      M      V      `      r      s      3YYYY;?  V?  Y;?  V?  YY;?  YYYY0?  PQV?  ?  P?  P?  R?  QR?  P?  R?  QQYYYY0?  P?  QV?  &?  T?	  P?  QV?  ?  ?
  PQT?  PQ?  &?  T?  P?  QV?  ?  ?
  PQT?  PQ?  ?  P?  P?  R?  QR?  P?  ?  QQ?  Y`            [gd_scene load_steps=5 format=2]

[ext_resource path="res://kniff.png" type="Texture" id=1]
[ext_resource path="res://Ball.gd" type="Script" id=2]

[sub_resource type="PhysicsMaterial" id=1]
bounce = 1.0

[sub_resource type="CircleShape2D" id=2]
radius = 6.0

[node name="RigidBody2D" type="RigidBody2D"]
collision_layer = 513
physics_material_override = SubResource( 1 )
continuous_cd = 1
script = ExtResource( 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 2 )

[node name="Sprite" type="Sprite" parent="."]
texture = ExtResource( 1 )
          GDSC         %   ?      ???ׄ???   ??Ķ   ???????Ӷ???   ????????ń??   ????Ķ??   ????Ķ??   ?????Ӷ?   ?????Ӷ?   ?????϶?   ??Ѷ   ????????????????????Ķ??   ????   ƶ??   ???????ڶ???   ???????????????۶???   ???????ӄ?????????????Ҷ   ???϶???   ??????Ӷ   ???????Ѷ???   ????¶??   ????????????????¶??   ?????????Ӷ?            palett                                  	      
                           	   !   
   "      #      $      %      +      4      :      C      H      Q      a      b      c      d      e      f      g      h      o      u      {      ?       ?   !   ?   "   ?   #   ?   $   ?   %   3YY8;?  V?  YYYY5;?  W?  Y5;?  W?  Y5;?  W?  YYYYY0?  PQV?  ;?	  ?
  T?  PQ?  ?	  T?%  PQ?  ;?  ?	  T?&  PQ?  ??  P?  Q?  ??  PP?  QQ?  ?  T?  T?  P?  R?  L?  MQYYYYYYYY0?  P?  QV?  ?  T?  ?  ?  ?  T?  ?  ?  ?  T?  ?  ?  ?  T?  PQYYY0?  PQV?  ?  PQY`[gd_resource type="ShaderMaterial" load_steps=4 format=2]

[ext_resource path="res://new_shader.shader" type="Shader" id=1]

[sub_resource type="Gradient" id=1]
offsets = PoolRealArray( 0, 0.25, 0.5, 0.75, 1 )
colors = PoolColorArray( 0, 0, 0, 1, 0.625, 0.0463867, 0.236244, 1, 1, 0.0820313, 0.189606, 1, 1, 0.666667, 0.431373, 1, 1, 1, 1, 1 )

[sub_resource type="GradientTexture" id=2]
resource_local_to_scene = true
gradient = SubResource( 1 )

[resource]
resource_local_to_scene = true
shader = ExtResource( 1 )
shader_param/palett = SubResource( 2 )
     [gd_scene load_steps=11 format=2]

[ext_resource path="res://ballon.png" type="Texture" id=1]
[ext_resource path="res://Ballon.tres" type="Material" id=2]
[ext_resource path="res://particle.png" type="Texture" id=4]
[ext_resource path="res://red.png" type="Texture" id=5]
[ext_resource path="res://yellow.png" type="Texture" id=6]
[ext_resource path="res://green.png" type="Texture" id=7]
[ext_resource path="res://blue.png" type="Texture" id=8]

[sub_resource type="GDScript" id=7]
script/source = "extends Area2D

export var arr : Array
# Declare member variables here. Examples:
# var a = 2
# var b = \"text\"
onready var particle =$Particles2D
onready var timer=$Timer
onready var sprite=$Sprite



# Called when the node enters the scene tree for the first time.
func _ready():
	var rng =RandomNumberGenerator.new()
	rng.randomize()
	var p=rng.randi()
	print(p)
	print((p%4))
	sprite.material.set_shader_param ( \"palett\", arr[p%4] )


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node2D_body_entered(body):
	sprite.visible=false
	particle.visible=true
	particle.emitting=true
	timer.start()


func _on_Timer_timeout():
	queue_free()
"

[sub_resource type="CircleShape2D" id=4]

[sub_resource type="ParticlesMaterial" id=6]
flag_disable_z = true
spread = 180.0
gravity = Vector3( 0, 98, 0 )
initial_velocity = 100.0
initial_velocity_random = 0.7
angular_velocity = 30.0
angular_velocity_random = 1.0
orbit_velocity = 0.0
orbit_velocity_random = 0.0
angle = 180.0
angle_random = 1.0

[node name="Node2D" type="Area2D"]
collision_layer = 512
collision_mask = 512
script = SubResource( 7 )
arr = [ ExtResource( 8 ), ExtResource( 5 ), ExtResource( 6 ), ExtResource( 7 ) ]

[node name="Sprite" type="Sprite" parent="."]
material = ExtResource( 2 )
position = Vector2( 1, 0 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 0, -4 )
shape = SubResource( 4 )

[node name="Particles2D" type="Particles2D" parent="."]
visible = false
material = ExtResource( 2 )
emitting = false
lifetime = 2.0
one_shot = true
explosiveness = 1.0
local_coords = false
process_material = SubResource( 6 )
texture = ExtResource( 4 )

[node name="Timer" type="Timer" parent="."]
wait_time = 2.0
one_shot = true
[connection signal="body_entered" from="." to="." method="_on_Node2D_body_entered"]
[connection signal="timeout" from="Timer" to="." method="_on_Timer_timeout"]
          [gd_scene load_steps=3 format=2]

[sub_resource type="PhysicsMaterial" id=2]
bounce = 0.5

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 270, 10 )

[node name="Wall" type="StaticBody2D"]
physics_material_override = SubResource( 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
           GDST                 ?  PNG ?PNG

   IHDR           szz?   sRGB ???  EIDATX??VA?? ĭyXxY?&?s.c??&59?vUI?ƦQ??4??0?V0?????=????S%?`&ż$ ??ْOu??/?q!6?/?Ƈ?i?mz Y?K????E???(`]??&/"?{DԀ?քU?]2?$???JILd>?0+@뺌OU?Jp?~R.A?}?"bH??	`?m??Q|??"@%`f?j?z??>????
Q	.;?M/??aꁻ?C?eh?{?Uɿr??v?Dɉ???;???ޏ?A+?@??g??})-?	?D??kO?@???yd{E?(0??A??Ju? IK???&?$q?x????J?"i?? <??Q?'?????P?8    IEND?B`?     [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ballon.png-eb1e6374d0c5de284183504f3fe61045.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://ballon.png"
dest_files=[ "res://.import/ballon.png-eb1e6374d0c5de284183504f3fe61045.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
        GDST               h   PNG ?PNG

   IHDR         ?d?   sRGB ???   IDAT?c```?/f{??j??????????? f[??[ҋ    IEND?B`?            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/blue.png-4d748ed6429caf8afc2e9d3803eadf6e.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://blue.png"
dest_files=[ "res://.import/blue.png-4d748ed6429caf8afc2e9d3803eadf6e.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
              [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST               h   PNG ?PNG

   IHDR         ?d?   sRGB ???   IDAT?c```?/???????????????? f??/??    IEND?B`?            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/green.png-5db815cc8219d4fb24db6968e2796f87.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://green.png"
dest_files=[ "res://.import/green.png-5db815cc8219d4fb24db6968e2796f87.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
           GDST@   @           ?  PNG ?PNG

   IHDR   @   @   ?iq?   sRGB ???  wIDATx?홱jBAEU҉?6?????]~%M?|G*?4!u???2??? I HR??0??;???-???2ww??N?g????h42?@#h42?@sA???l??6???????v~?
?? |??m?? h4????O????o?E맯 @??? ???h<??o??d -??????7E|n_B???y???= ??? @?q??h???̷M?
?? ??x??-???f~??ͷx}A?
?? ??}?????Oe?|??(?/H_2?@S|'?t???̗??d -?&??}?۾î_?N??d -??????????GI_2?@?N??ع^?y?6??Є?΍? h42?@#h4ǋ\???    IEND?B`?   [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST               ?  PNG ?PNG

   IHDR         ??a   sRGB ???  ?IDAT8????JA??=,K??>?V""l:??I?XY&?????eR(Ik?k<?% A$`??t??)I;?[.????2?????*@???C?B{!"?""D?ק????b @?ѢT?????U?@??)?
?֛??????&?D????AP??$wN??-W?GK-(??%?X???8<??d{?46H???~ءvxy~?u??e??f??xk?eTؖ,Y?v???]?@{0?2??&y????.???hft???-{d<`eQ\?t???K?6/?a?$?؅A?7?Zo
??m???8B<y????^??V??K ?d????z    IEND?B`?           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/kniff.png-9bddc34f52fa6b6770e43b3bc75be388.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://kniff.png"
dest_files=[ "res://.import/kniff.png-9bddc34f52fa6b6770e43b3bc75be388.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
           [gd_scene load_steps=4 format=2]

[ext_resource path="res://Wall.tscn" type="PackedScene" id=1]
[ext_resource path="res://Ball.tscn" type="PackedScene" id=2]
[ext_resource path="res://spawner.tscn" type="PackedScene" id=4]

[node name="Node2D" type="Node2D"]

[node name="RigidBody2D" parent="." instance=ExtResource( 2 )]
position = Vector2( 214, 116 )

[node name="Wall" parent="." instance=ExtResource( 1 )]
position = Vector2( 240, 270 )

[node name="Wall2" parent="." instance=ExtResource( 1 )]
position = Vector2( 240, 0 )

[node name="Wall3" parent="." instance=ExtResource( 1 )]
position = Vector2( 0, 135 )
rotation = 1.5708

[node name="Wall4" parent="." instance=ExtResource( 1 )]
position = Vector2( 480, 135 )
rotation = 1.5708

[node name="spawner" parent="." instance=ExtResource( 4 )]
position = Vector2( 104, 68 )

[node name="spawner2" parent="." instance=ExtResource( 4 )]
position = Vector2( 300, 163 )

[node name="spawner3" parent="." instance=ExtResource( 4 )]
position = Vector2( 390, 74 )

[node name="spawner4" parent="." instance=ExtResource( 4 )]
position = Vector2( 122, 218 )
              shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D palett : hint_white ;

void fragment(){
	vec4 tex=texture(TEXTURE,UV);
	COLOR=vec4(texture(palett,vec2(tex.r,0.5)).rgb,tex.a);
}             GDST               ?   PNG ?PNG

   IHDR         ???   sRGB ???   FIDAT????? ??(?Ҷ3??Qq?싁[?"B???_?R??~?j??Xu?z?????u? |??o?¯?J    IEND?B`?    [remap]

importer="texture"
type="StreamTexture"
path="res://.import/particle.png-c2ba3d91e96c62035d672392a1197218.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://particle.png"
dest_files=[ "res://.import/particle.png-c2ba3d91e96c62035d672392a1197218.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
  GDST               h   PNG ?PNG

   IHDR         ?d?   sRGB ???   IDAT?c```????????????????? a$
???    IEND?B`?            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/red.png-13f6abb0e0c70056504666ed9c349d99.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://red.png"
dest_files=[ "res://.import/red.png-13f6abb0e0c70056504666ed9c349d99.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
 GDSC         #   ?      ???????؄???   ??ڶ   ????Ķ??   ????Ķ??   ?????϶?   ????ζ??   ????϶??   ??ƶ   ???????Ӷ???   ????????Ҷ??   ??????????????ض   ????????????????¶??   ????¶??      res://Ballon.tscn      Q      (      	                                                                   	      
                     ,      9      B      C      H      U      V      W      X      Y      Z      [      \      ]      c      p      }      ?      ?       ?   !   ?   "   ?   #   3YYYYYY;?  ?PQY5;?  W?  YYYY0?  PQV?  ;?  P?&  PQ?  Q?  ?  ;?  P?&  PQ?  Q?  ?  ;?  ?  T?  PQY?  ?	  P?  Q?  ?  T?
  ?
  ?  P?  R?  Q?  YYYYYYYY0?  PQV?  ;?  P?&  PQ?  Q?  ?  ;?  P?&  PQ?  Q?  ?  ;?  ?  T?  PQY?  ?	  P?  Q?  ?  T?
  ?
  ?  P?  R?  Q?  ?  T?  P?  ?&  PQ?  QY`            [gd_scene load_steps=2 format=2]

[ext_resource path="res://spawner.gd" type="Script" id=1]

[node name="spawner" type="Position2D"]
position = Vector2( 93, 80 )
script = ExtResource( 1 )

[node name="Timer" type="Timer" parent="."]
autostart = true
[connection signal="timeout" from="Timer" to="." method="_on_Timer_timeout"]
         GDST               h   PNG ?PNG

   IHDR         ?d?   sRGB ???   IDAT?c```???E??????????????x?]8?    IEND?B`?            [remap]

importer="texture"
type="StreamTexture"
path="res://.import/yellow.png-1fff2f74667453120412091eeb717b92.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://yellow.png"
dest_files=[ "res://.import/yellow.png-1fff2f74667453120412091eeb717b92.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=false
svg/scale=1.0
        [remap]

path="res://Ball.gdc"
 [remap]

path="res://Ballon.gdc"
               [remap]

path="res://spawner.gdc"
              ?PNG

   IHDR   @   @   ?iq?   	pHYs  5?  5?!Cw   tEXtSoftware Celsys Studio Tool???|  IDATx??د
A?q/?? V?6??F??*??a2YĬ].m? *??o?.?????w?r??',3?:?O)??        ??j?j????|O?7?'   ?? ?r???  ??n??ӫ??xV/v'  ????v-??o   @? ??P????vz???? ?C   0l?o???l   ?pNd?F?X?i?P?@   ?t?!yh?v=???   ??;?,   ?/@ځ]????   ?@ض?   ??1?v????R  (Z      @??i?????    IEND?B`?            ECFG      _global_script_classes             _global_script_class_icons             application/config/name      
   PhysicsLab     application/run/main_scene         res://level.tscn   application/config/icon         res://icon.png     display/window/size/width      ?     display/window/size/height           display/window/size/borderless            display/window/size/test_width      ?     display/window/size/test_height           display/window/stretch/mode         viewport   display/window/stretch/aspect         keep   importer_defaults/texture\              compress/bptc_ldr                compress/hdr_mode                compress/lossy_quality    ffffff??      compress/mode                compress/normal_map           	   detect_3d                flags/anisotropic                flags/filter             flags/mipmaps                flags/repeat          
   flags/srgb              process/HDR_as_SRGB              process/fix_alpha_border            process/invert_color             process/premult_alpha             
   size_limit               stream            	   svg/scale        ??   input/click?              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       ??   button_index         pressed           doubleclick           script      7   rendering/quality/intended_usage/framebuffer_allocation         #   rendering/quality/2d/use_pixel_snap         )   rendering/environment/default_clear_color      ??>???=?l>  ??)   rendering/environment/default_environment          res://default_env.tres                