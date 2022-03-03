# Initialize a Keyboard
kbd = Keyboard.new
# You can make right side the "anchor" (so-called "master")
# kbd.set_anchor(:right)

# Initialize GPIO assign
kbd.init_pins(
  [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ],            # row0, row1,... respectively
  [ 11, 12, 13, 14 ]    # col0, col1,... respectively
)
#keyboard.row_pins = (board.GP11, board.GP12, board.GP13, board.GP14)
#keyboard.col_pins = (board.GP0, board.GP1, board.GP2, board.GP3, board.GP4, board.GP5, board.GP6, board.GP7, board.GP8, board.GP9, board.GP10)

# default layer should be added at first
kbd.add_layer :default, %i[
  ALT_Q   KC_W    KC_E        KC_R      KC_T     KC_4    KC_Y     KC_U     KC_I      KC_O     KC_P      
  KC_A    KC_S    KC_D        KC_F      KC_G     KC_5    KC_H     KC_J     KC_K      KC_L     KC_ENTER
  KC_Z    GUI_X   KC_C        KC_V      KC_B     LOWER_SPC KC_N    KC_M     KC_COMMA  KC_DOT   KC_SLASH
  KC_LSFT KC_LGUI KC_LCTL     KC_LALT   raise    KC_SPACE  lower   KC_1     KC_2      KC_3     KC_BSPACE
]
kbd.add_layer :raise, %i[
  KC_1    KC_2    KC_3        KC_4      KC_5     KC_NO     KC_6      KC_7      KC_8      KC_9     KC_0
  KC_EXLM KC_AT   KC_HASH     KC_DLR    KC_PERC  KC_NO     KC_CIRC   KC_AMPR   KC_ASTER  KC_LPRN  KC_RPRN
  KC_PLUS KC_MINUS KC_ASTER   KC_SLASH  KC_EQUAL  KC_SPACE KC_SPACE  KC_INSERT KC_LBRC  KC_RBRC  KC_BSPACE 
  KC_LSFT KC_LGUI KC_LCTL     KC_LALT   raise    KC_SPACE  lower   KC_1     KC_2      KC_3     KC_BSPACE
]
kbd.add_layer :lower, %i[
    KC_F1   KC_F2   KC_F3       KC_F4     KC_F5    KC_NO   KC_F6     KC_F7     KC_F8     KC_F9     KC_F10
    KC_AT   KC_BSLASH  KC_SCOLON  KC_SCOLON  KC_QUOTE  KC_NO KC_LEFT   KC_DOWN   KC_UP     KC_RIGHT  KC_PIPE  
    KC_Z    KC_X    KC_C        KC_V      KC_B     LOWER_SPC  KC_N      KC_M      KC_LBRC  KC_RBRC  KC_SPACE 
    KC_LSFT KC_LGUI KC_LCTL     KC_LALT   raise    KC_SPACE  lower   KC_1     KC_2      KC_3     KC_BSPACE
]
via = VIA.new
#                   Your custom     Keycode or             Keycode (only modifiers)      Release time      Re-push time
#                   key name        Array of Keycode       or Layer Symbol to be held    threshold(ms)     threshold(ms)
#                                   or Proc                or Proc which will run        to consider as    to consider as
#                                   when you click         while you keep press          `click the key`   `hold the key`
kbd.define_mode_key :ALT_Q,       [ :KC_Q,                 :KC_LALT,                     150,              150 ]
kbd.define_mode_key :GUI_X,       [ :KC_X,                 :KC_LGUI,                     150,              150 ]
kbd.define_mode_key :RAISE_N,     [ :KC_N,                 :raise,                       150,              150 ]
kbd.define_mode_key :LOWER_SPC,   [ :KC_SPACE,             :lower,                       150,              150 ]

via.layer_count = 6
via.row_size = 11
via.col_size = 4

# `before_report` will work just right before reporting what keys are pushed to USB host.
# You can use it to hack data by adding an instance method to Keyboard class by yourself.
# ex) Use Keyboard#before_report filter if you want to input `":" w/o shift` and `";" w/ shift`
kbd.before_report do
  kbd.invert_sft if kbd.keys_include?(:KC_SCOLON)
#  # You'll be also able to write `invert_ctl`, `invert_alt` and `invert_gui`
#end

kbd.append via
kbd.start!