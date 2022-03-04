# Initialize a Keyboard
kbd = Keyboard.new
# You can make right side the "anchor" (so-called "master")
# kbd.set_anchor(:right)

# Initialize GPIO assign
kbd.init_pins(
  [ 11, 12, 13, 14 ],            # row0, row1,... respectively
  [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]    # col0, col1,... respectively
)
#keyboard.row_pins = (board.GP11, board.GP12, board.GP13, board.GP14)
#keyboard.col_pins = (board.GP0, board.GP1, board.GP2, board.GP3, board.GP4, board.GP5, board.GP6, board.GP7, board.GP8, board.GP9, board.GP10)

# Relation between init_pins and init_matrix_pins
kbd.init_matrix_pins(
    [
        [[0,11],[1,11],[2,11],[3,11],[4,11],[5,11],[6,11],[7,11],[8,11],[9,11],[10,11]],
        [[0,12],[1,12],[2,12],[3,12],[4,12],[5,12],[6,12],[7,12],[8,12],[9,12],[10,12]],
        [[0,13],[1,13],[2,13],[3,13],[4,13],[5,13],[6,13],[7,13],[8,13],[9,13],[10,13]],
        [[0,14],[1,14],[2,14],[3,14],[4,14],[5,14],[6,14],[7,14],[8,14],[9,14],[10,14]],
    ]
)
# default keymap
#  ------------------------------                  ------------------------------- 
# |ALT_Q|  W  |  E  |  R  |  T  |         |        |  Y  |  U  |  I  |  O  |  P  |
# -------------------------------                  ------------------------------- 
# |  A  |  S  |  D  |  F  |  G  |         |        |  H  |  J  |  K  |  L  |Enter|
# -------------------------------------------------------------------------------- 
# |  Z  |  X  |  C  |  V  |  B  |KC_SPACE |SFT_SPC|  N  |  M  |  ,  |  .  |  /  |
# --------------------------------------------------------------------------------
# |LSFT |LCTRL|LGUI |LALT |raise|         |        |lower|  1  |  2  |  3  |  BS |
# --------------------------------------------------------------------------------

# default layer should be added at first
kbd.add_layer :default, %i[
  KC_Q    KC_W    KC_E        KC_R      KC_T      KC_NO              KC_Y      KC_U     KC_I      KC_O     KC_P      
  KC_A    KC_S    KC_D        KC_F      KC_G      KC_NO              KC_H      KC_J     KC_K      KC_L     KC_ENTER
  KC_Z    KC_X    KC_C        KC_V      KC_B      SFT_SPC           KC_N      KC_M     KC_COMMA  KC_DOT   KC_SLASH
  KC_LSFT KC_LCTL KC_LGUI     KC_LALT   KC_RAISE  KC_SPACE           KC_LOWER  KC_1     KC_2      KC_3     KC_BSPACE
]
kbd.add_layer :raise, %i[
  KC_1    KC_2    KC_3        KC_4      KC_5      KC_NO              KC_6      KC_7      KC_8      KC_9     KC_0
  KC_EXLM KC_AT   KC_HASH     KC_DLR    KC_PERC   KC_NO              KC_CIRC   KC_AMPR   KC_ASTER  KC_LPRN  KC_RPRN
  KC_PLUS KC_MINUS KC_ASTER   KC_SLASH  KC_EQUAL  KC_SPACE           KC_N      KC_INSERT KC_LBRC   KC_RBRC  KC_BSPACE 
  KC_LSFT KC_LCTL KC_LGUI      KC_LALT  KC_RAISE  KC_SPACE           KC_LOWER  KC_1      KC_2      KC_3     KC_BSPACE
]
kbd.add_layer :lower, %i[
    KC_F1   KC_F2   KC_F3       KC_F4     KC_F5        KC_NO         KC_F6     KC_F7     KC_F8     KC_F9     KC_F10
    KC_AT   KC_BSLASH  KC_SCOLON  KC_SCOLON  KC_QUOTE  KC_NO         KC_LEFT   KC_DOWN   KC_UP     KC_RIGHT  KC_PIPE  
    KC_Z    KC_X    KC_C        KC_V      KC_B         KC_SPACE      KC_N      KC_M      KC_LBRC   KC_RBRC   KC_SPACE 
    KC_LSFT KC_LCTL KC_LGUI     KC_LALT   KC_RAISE     KC_SPACE      KC_LOWER  KC_1      KC_2      KC_3      KC_BSPACE
]
#                   Your custom     Keycode or             Keycode (only modifiers)      Release time      Re-push time
#                   key name        Array of Keycode       or Layer Symbol to be held    threshold(ms)     threshold(ms)
#                                   or Proc                or Proc which will run        to consider as    to consider as
#                                   when you click         while you keep press          `click the key`   `hold the key`
kbd.define_mode_key :KC_RAISE,     [ :raise,                 :raise,                       150,              150 ]
kbd.define_mode_key :KC_LOWER,     [ :lower,                 :lower,                       150,              150 ]
kbd.define_mode_key :SFT_SPC,      [ :KC_SPACE,              :KC_LSFT,                     150,              150 ]

# `before_report` will work just right before reporting what keys are pushed to USB host.
# You can use it to hack data by adding an instance method to Keyboard class by yourself.
# ex) Use Keyboard#before_report filter if you want to input `":" w/o shift` and `";" w/ shift`
#kbd.before_report do
#  kbd.invert_sft if kbd.keys_include?(:KC_SCOLON)
#  # You'll be also able to write `invert_ctl`, `invert_alt` and `invert_gui`
#end

kbd.start!