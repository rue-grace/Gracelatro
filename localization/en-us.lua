return {
    descriptions = {
        Joker = {
            j_grace_john_zen = {
                name = "John Zen",
                text = {
                    "This Joker gives",
                    "{C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult"
                }
            },
            j_grace_carnation = {
                name = "Carnation",
                text = {
                    "Gives {C:chips}+#1#{} Chips if played hand" ,
                    "contains {C:hearts}Hearts{} and {C:diamonds}Diamonds{}"
                }
            },
            j_grace_joey = {
                name = "Joey, the Doombringer",
                text = {
                    "Gives {X:mult,C:white} X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this card is",
                    "destroyed after each hand"
                }
            },
            j_grace_kookoo = {
                name = "KooKoo",
                text = {
                    "This joker gains {C:money}+$1{} everytime it triggers",
                    "{C:green}#2# in #3#{} chance to perish",
                    "if this joker hasn't perished",
                    "after {C:attention}12{} activations,",
                    "{C:red}self destructs{}.",
                    "{C:inactive}(Currently {C:attention}#1#{}{C:inactive} activations){}"
                }
            },
            j_grace_goober = {
                name = "goober",
                text = {
                    "This joker gains {C:mult}+#2#{} Mult",
                    "each hand you play",
                    "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult){}"
                }
            },
            j_grace_mime = {
                name = "Mime",
                text = {
                    "you've let {C:attention}it{} consume you,",
                    "now you must live with",
                    "consequences of your actions"
                }
            },
            j_grace_worship = {
                name = " ",
                text = {
                '{C:red}jxuhuyidewbeho{}',
                '{C:red}jxuhuyideweet{}',
                '{C:red}jxuhuyiedbofqyd{}',
                '{C:red}tedjvksajxyikf{}'
                }
            },
            j_grace_doppel = {
                name = "Doppel",
                text = {
                    "this joker gives",
                    "{X:mult,C:white}^^2{} Mult",
                    "{C:attention}broken af.{}"
                }
            },
            j_grace_szymon = {
                name = "Szymon",
                text = {
                    " {C:attention}'I love you, All of you.{}",
                    " {C:attention}This Stick, is the Stick Of Love'{} ",
                    " {C:green}#1#{} "
                }
            },
            j_grace_elkman = {
                name = "Elkman",
                text = {
                    'Applies a random {C:dark_edition}Edition{} to this {C:attention}joker{}',
                    'every hand that is played',
                    '{C:attention}currently does nothing.{}'
                }
            },
            j_grace_heed = {
                name = "Heed",
                text = {
                    'For every card played, {C:red}+#1#{} Mult, {C:green}1/#3#{} chance to',
                    'destroy itself.',
                    '{C:inactive}(Currently{} {C:red}#2#{} {C:inactive}Mult){}'
                }
            },
            j_grace_slight = {
                name = "Slight",
                text = {
                    'For every card played, {C:blue}+#1#{} Chips, {C:green}1/#3#{} chance to',
                    'destroy itself.',
                    '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
                }
            },
            j_grace_slugfish = {
                name = "Slugfish",
                text = {
                    "This joker Gains {C:green}1/5{}th of the",
                    "{C:attention}Money{} you have to its {C:mult}Multiplier{},", 
                    "{C:money}$#2#{} every time it triggers",
                    "{C:inactive}(Currently{} {X:legendary,C:white}^#1#{} {C:inactive}){}"
                }
            },
            j_grace_snap = {
                name = "Snap",
                text = {
                    "This Joker Gains",
                    "{X:mult,C:white}X#2#{} Mult if played hand" ,
                    "contains {C:hearts}Hearts{} and {C:diamonds}Diamonds{}",
                    "{C:green}1 in 10{} chance this card is",
                    "destroyed after each hand",
                    "{C:inactive}(Currently{} {X:mult,C:white} X#1#{} {C:inactive}Mult){}"
                }
            },
            j_grace_sorrow = {
                name = "Sorrow",
                text = {
                    "Takes {C:chips}20{} Chips and {C:mult}3{} Mult",
                    "Gives {X:chips,C:white}X12{} Chips and {X:mult,C:white}X#3#{} Mult",
                    "After {C:attention}5{} activations.",
                    "{C:inactive}(Currently {C:attention}#1#/5{} {C:inactive}activations){}"
                }
            },
            j_grace_duk = {
                name = "Duk",
                text = {
                    "LOVE THY FATHER AND THY MOTHER",
                    "{C:attention}YOU SHOULD LOVE YOUR PARENTS{}",
                    "{X:mult,C:white}NOW!!!!{}"
                }
            }
        }
    },
    misc = {

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_chips="+#1#",
            a_chips_minus="-#1#",
            a_hands="+#1# Hands",
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_mult="+#1# Mult",
            a_mult_minus="-#1# Mult",
            a_remaining="#1# Remaining",
            a_sold_tally="#1#/#2# Sold",
            a_xmult="X#1# Mult",
            a_xmult_minus="-X#1# Mult",
        }
    }
}