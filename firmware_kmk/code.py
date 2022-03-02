import board

from kmk.kmk_keyboard import KMKKeyboard
from kmk.keys import KC
from kmk.matrix import DiodeOrientation
from kmk.modules.layers import Layers
from kmk.modules.modtap import ModTap



keyboard = KMKKeyboard()

keyboard.row_pins = (board.GP11,board.GP12,board.GP13,board.GP14,)
keyboard.col_pins = (board.GP0,board.GP1,board.GP2, board.GP3, board.GP4, board.GP5, board.GP6, board.GP7, board.GP8, board.GP9, board.GP10,)
keyboard.diode_orientation = DiodeOrientation.ROW2COL
keyboard.modules.append(Layers())
keyboard.modules.append(ModTap())

keyboard.keymap = [
    [#0
        KC.Q,    KC.W,      KC.E,    KC.R,    KC.T,              KC.NO,    KC.Y,              KC.U,  KC.I,    KC.O,     KC.P,
        KC.A,    KC.S,      KC.D,    KC.F,    KC.G,              KC.NO,    KC.H,              KC.J,  KC.K,    KC.L,     KC.ENT,
        KC.Z,    KC.X,      KC.C,    KC.V,    KC.B,              KC.SPACE, KC.N,              KC.M,  KC.COMM, KC.DOT,   KC.SLASH,
        KC.LSFT, KC.LCTRL,  KC.LGUI, KC.LALT, KC.LT(1,KC.SPACE), KC.SPACE, KC.LT(2,KC.SPACE), KC.N1, KC.N2,   KC.N3,    KC.BSPC,
    ],
    [#1
        KC.N1,     KC.N2,    KC.N3,    KC.N4,     KC.N5,      KC.NO,      KC.N6,             KC.N7,        KC.N8,            KC.N9,            KC.N0, 
        KC.EXLM,   KC.AT,    KC.HASH,  KC.DOLLAR, KC.PERCENT, KC.NO,      KC.CIRCUMFLEX,     KC.AMPERSAND, KC.ASTERISK,      KC.LEFT_PAREN,    KC.RIGHT_PAREN, 
        KC.PLUS,   KC.MINS,  KC.PAST,  KC.SLASH,  KC.EQUAL,   KC.SPACE,   KC.N,              KC.M,         KC.LSFT(KC.LBRC), KC.LSFT(KC.RBRC), KC.SPACE,
        KC.LSFT,   KC.LCTRL, KC.LGUI,  KC.LALT,   KC.NO,      KC.SPACE,   KC.LT(2,KC.SPACE), KC.N1,        KC.N2,            KC.N3,            KC.BSPC,
    ],
    [#2
        KC.F1,    KC.F2,     KC.F3,     KC.F4,              KC.F5,             KC.NO,    KC.F6,    KC.F7,   KC.F8,   KC.F9,     KC.F10,
        KC.AT,    KC.BSLASH, KC.SCOLON, KC.LSFT(KC.SCOLON), KC.QUOTE,          KC.NO,    KC.LEFT,  KC.DOWN, KC.UP,   KC.RIGHT,  KC.LSFT(KC.SLASH), 
        KC.PLUS,  KC.MINS,   KC.PAST,   KC.SLASH,           KC.EQUAL,          KC.SPACE, KC.GRAVE, KC.M,    KC.LBRC, KC.RBRC,   KC.LSFT(KC.MINUS),
        KC.LSFT,  KC.LCTRL,  KC.LGUI,   KC.LALT,            KC.LT(1,KC.SPACE), KC.SPACE, KC.NO,    KC.N1,   KC.N2,   KC.N3,     KC.BSPC,
    ],
]

if __name__ == '__main__':
    keyboard.go()
