
-- you can have shared helper functions
function shakecard(self) --visually shake a card
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function return_JokerValues() -- not used, just here to demonstrate how you could return values from a joker
    if context.joker_main and context.cardarea == G.jokers then
        return {
            chips = card.ability.extra.chips,       -- these are the 3 possible scoring effects any joker can return.
            mult = card.ability.extra.mult,         -- adds mult (+)
            x_mult = card.ability.extra.x_mult,     -- multiplies existing mult (*)
            card = self,                            -- under which card to show the message
            colour = G.C.CHIPS,                     -- colour of the message, Balatro has some predefined colours, (Balatro/globals.lua)
            message = localize('k_upgrade_ex'),     -- this is the message that will be shown under the card when it triggers.
            extra = { focus = self, message = localize('k_upgrade_ex') }, -- another way to show messages, not sure what's the difference.
        }
    end
end

SMODS.Atlas({
    key = "carnation",
    path = "j_carnation.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "slight",
    path = "j_slight.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "slugfish",
    path = "j_slugfish.png",
    px = 35.5,
    py = 47.5
})

SMODS.Atlas({
    key = "elkman",
    path = "j_elkman.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "heed",
    path = "j_heed.png",
    px = 71,
    py = 95
})

 SMODS.Atlas({
  key = "sorrow",
  path = "j_sorrow.png",
  px = 71,
  py = 95
})

-- SMODS.Atlas({
--  key = "dozer",
--  path = "j_dozer.png",
--  px = 71,
--  py = 95
--})

SMODS.Atlas({
    key = "kookoo",
    path = "j_kookoo.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "joey",
    path = "j_joey.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "goober",
    path = "j_goob.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "mime",
    path = "j_mime.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "duk",
    path = "j_duk.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "snap",
    path = "j_snap.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "worship",
    path = "j_worship.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "doppel",
    path = "j_doppel.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "john_zen",
    path = "j_john_zen.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "szymon",
    path = "j_szymon.png",
    px = 71,
    py = 95
})

SMODS.Joker{ --Carnation
    key = "carnation",
    config = { extra = { chips = 120 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'carnation',

    calculate = function (self, card, context)
        local suits = { ['Hearts'] = 0, ['Diamonds'] = 0 }

        if context.joker_main and context.cardarea == G.jokers then

            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].ability.name ~= 'Wild Card' then
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0  then suits["Hearts"] = suits["Hearts"] + 1
                end

                if context.scoring_hand[i].ability.name == 'Wild Card' then
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0  then suits["Hearts"] = suits["Hearts"] + 1
                end
            end

            if suits['Hearts'] > 0 and suits['Diamonds'] > 0 then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = {card.ability.extra.chips} }
    end
}

SMODS.Joker{ --Slight
    key = "slight",
    config = { extra = { chipsmod = 10, chips = 0, odds = 5 } },
    pos = { x = 0, y = 0 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'slight',
    G_Eyes = 0,
    
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsmod

            if not context.blueprint then
                if SMODS.pseudorandom_probability(card, 'seed', 1, card.ability.extra.odds, 'slight_chance') then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1, blockable = true,
                        func = function()
                        card:remove(self)
                    return true; end}))
                    return { extra = { focus = card, message = 'Slighted' } }

                end

                if SMODS.pseudorandom_probability(card, 'seed', 1, 2, 'slight_oddschange_chance') then
                    card.ability.extra.odds = card.ability.extra.odds - 1
                else
                    card.ability.extra.odds = card.ability.extra.odds + 1
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.chipsmod, card.ability.extra.chips + 10, card.ability.extra.odds } }
    end
}

SMODS.Joker{ --Slugfish {Currently doesnt work properly}
    key = "slugfish",
    config = { extra_slots_used = 1, extra = { emult = 1, dollars = 10 } },
    pos = { x = 0, y = 0 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'slugfish',

    
    calculate = function(self, card, context)
        local varies = G.GAME.dollars / 5
        if context.cardarea == G.jokers and context.joker_main  then
            ease_dollars((-card.ability.extra.dollars + -card.ability.extra.emult) / 2)
            card.ability.extra.emult = card.ability.extra.emult + varies
            return {
                e_mult = card.ability.extra.emult,
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.emult, -((card.ability.extra.dollars + card.ability.extra.emult) / 2) } }
        
    end
}

--[[ SMODS.Joker{ --Elkman {Doesn't do anything}
    key = "elkman", 
    config = {
        extra = {
            edition = 0,
            odds = 4,
            start_dissolve = 0,
            n = 0,
            respect = 0
        }
    },
    pos = { x = 0, y = 0 },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'elkman',

    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local edition_num = math.random(1, 4)
            print(edition_num)
            if edition_num == 1 then
                Card:set_edition('e_base')
            elseif edition_num == 2 then
                Card:set_edition('e_foil')
            elseif edition_num == 3 then
                Card:set_edition('e_holographic')
            elseif edition_num == 4 then
                Card:set_edition('e_polychrome')
            end
        end
    end
}
]]

SMODS.Joker{ --Heed
    key = "heed",
    config = { extra = { multsmod = 5, mult = 0, odds = 5 } },
    pos = { x = 0, y = 0 },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'heed',
    G_Eyes = 0,
    
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.multsmod

            if not context.blueprint then
                if SMODS.pseudorandom_probability(card, 'seed', 1, card.ability.extra.odds, 'heed_chance') then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1, blockable = true,
                        func = function()
                        card:remove(self)
                    return true; end}))
                    return { extra = { focus = card, message = 'Heeded' } }

                end

                if SMODS.pseudorandom_probability(card, 'seed', 1, 2, 'heed_oddschange_chance') then
                    card.ability.extra.odds = card.ability.extra.odds - 1
                else
                    card.ability.extra.odds = card.ability.extra.odds + 1
                end
            end
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.multsmod, card.ability.extra.mult + 5, card.ability.extra.odds } }
    end
}

SMODS.Joker{ --Sorrow
    key = "sorrow",
    config = { xmult = 30, extra = { triggers = 0, cycles = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'sorrow',

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            card.ability.extra.triggers = card.ability.extra.triggers + 1
            if card.ability.extra.triggers < 5 then
                return {
                    chips = -20,
                    mult = -3
                }
            elseif card.ability.extra.triggers == 5 then
                card.ability.extra.triggers = 0
                if card.ability.extra.cycles == 0 then
                    card.ability.extra.cycles = 1
                    card.ability.xmult = 30
                elseif card.ability.extra.cycles == 1 then
                    card.ability.extra.cycles = 0
                    card.ability.xmult = 31
                end
                return {
                    x_chips = 12,
                    x_mult = card.ability.xmult
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.triggers, card.ability.extra.cycles, card.ability.xmult } }
    end
}

SMODS.Joker{ --Kookoo
    key = "kookoo",
    config = { extra = { trigger_amount = 0, chance = 1, odds = 12 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'kookoo',

    calculate = function(self, card, context)

        if context.end_of_round and not (context.individual or context.repetition) then
            card.ability.extra.trigger_amount = card.ability.extra.trigger_amount + 1
            ease_dollars(card.ability.extra.trigger_amount)
            if not context.blueprint then
                if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.chance, card.ability.extra.odds, 'kookoo_chance') then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2, blockable = true,
                        func = function()
                        card:remove(self)
                    return true; end}))
                    return { extra = { focus = card, message = "Error 408"} }
                else
                    card.ability.extra.odds = card.ability.extra.odds - 1
                    return { extra = {focus = card, message = "+" .. card.ability.extra.trigger_amount .. "$" } }
                end
            end
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.trigger_amount + 1, card.ability.extra.chance, card.ability.extra.odds } }
    end
}

SMODS.Joker{ --Joey
    key = "joey",
    config = { extra = { x_mult = 2, chance = 1, odds = 8 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'joey',

    calculate = function (self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.chance, card.ability.extra.odds, 'joey_chance') then
                if not context.blueprint then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2, blockable = true,
                        destroyed = true,
                        func = function()
                        card:remove(self)
                    return true; end}))
                    return { extra = { focus = card, message = "AAAA" } }
                end
            else
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.chance, card.ability.extra.odds } }
    end
}

SMODS.Joker{ --Goober
    key = "goober",
    config = { extra = { mult = 0, mult_mod = 1 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'goober',

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if not context.blueprint then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            end
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
    end
}

SMODS.Joker{ --Mime
    key = "mime",
    config = {},
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'mime',

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = 300
            }
        end
        if not context.blueprint then
            if context.selling_self then
                SMODS.restart_game()
            end
        end
    end
}

SMODS.Joker{ --Duk
    key = "duk",
    config = {},
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'duk',

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return
        end
    end
}

SMODS.Joker{ --Snap
    key = "snap",
    config = { x_mult = 1, extra = { x_mod = 0.5, chance = 1, odds = 10 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'snap',

    calculate = function (self, card, context)
        local suits = { ['Hearts'] = 0, ['Diamonds'] = 0 }

        if context.joker_main and context.cardarea == G.jokers then

            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].ability.name ~= 'Wild Card' then
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0  then suits["Hearts"] = suits["Hearts"] + 1
                end

                if context.scoring_hand[i].ability.name == 'Wild Card' then
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0  then suits["Hearts"] = suits["Hearts"] + 1
                end
            end
            if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.chance, card.ability.extra.odds, 'snap_chance') then
                if not context.blueprint then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2, blockable = true,
                        destroyed = true,
                        func = function()
                        card:remove(self)
                    return true; end}))
                    return { extra = { focus = card, message = "eu!" } }
                end
            else
                if suits['Hearts'] > 0 and suits['Diamonds'] > 0 then
                card.ability.x_mult = card.ability.x_mult + card.ability.extra.x_mod
                return { 
                    extra = {focus = card, message = localize('k_upgrade_ex')},
                    x_mult = card.ability.x_mult
                }
                end
            end
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.x_mult, card.ability.extra.x_mod, card.ability.extra.chance, card.ability.extra.odds } }
    end
}

SMODS.Joker{ --Pihsrow
    key = "worship",
    config = {},
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'worship',

    calculate = function (self, card, context)
        if context.before then
            if not context.blueprint then
                card:remove(self)
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 6, blockable = false,
                    destroyed = true,
                    func = function()
                    SMODS.restart_game()
                return true; end}))
            end
        end
    end
}

SMODS.Joker{ --Doppel
    key = "doppel",
    config = {},
    pos = { x = 0, y = 0 },
    rarity = 4,
    cost = 30,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'doppel',

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                eemult = 2
            }
        end
    end
}

SMODS.Joker{ --Zen (john)
    key = "john_zen",
    config = { extra = { chips = 750, mult = 15 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 14,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    atlas = 'john_zen',

    calculate = function (self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
        end 
    end,
    
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult }, key = self.key }
    end
}

SMODS.Joker{ --Simon (dev)
    key = "szymon",
    config = { simonphase = 0, extra = { emult = 0, eemult = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    effect = nil,
    soul_pos = { x = 1, y = 0 },
    atlas = "szymon",

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            
            card.ability.simonphase = card.ability.simonphase + 1

            if card.ability.simonphase < 5 then
                card.ability.extra.emult = 1
            elseif card.ability.simonphase > 5 then
                card.ability.extra.emult = (card.ability.simonphase / 5)
            end

            if card.ability.simonphase < 25 then
                card.ability.extra.eemult = 1
            elseif card.ability.simonphase > 25 then
                card.ability.extra.eemult = (card.ability.simonphase / 25)
            end

            return {
                mult = card.ability.simonphase * 3,
                x_mult = card.ability.simonphase,
                emult = card.ability.extra.emult,
                eemult = card.ability.extra.eemult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.simonphase } }
    end
}







-- SMODS.Joker{
--    key = "sample_wee",                                  --name used by the joker.    
--    config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
--    pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
--    rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
--    cost = 1,                                            --cost to buy the joker in shops.
--    blueprint_compat=true,                               --does joker work with blueprint.
--    eternal_compat=true,                                 --can joker be eternal.
--    unlocked = true,                                     --is joker unlocked by default.
--    discovered = true,                                   --is joker discovered by default.    
--    effect=nil,                                          --you can specify an effect here eg. 'Mult'
--    soul_pos=nil,                                        --pos of a soul sprite.
--    atlas = 'sample_wee',                                --atlas name, single sprites are deprecated.
--
--    calculate = function(self,card,context)              --define calculate functions here
--        if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
--            if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
--                if context.other_card:get_id() == 2 then -- played card is a 2 by rank
--                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
--                    
--                    return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
--                        extra = {focus = card, message = localize('k_upgrade_ex')},
--                        card = card,
--                        colour = G.C.CHIPS
--                    }
--                end
--            end
--        end
--       if context.joker_main and context.cardarea == G.jokers then
--            return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
--                chips = card.ability.extra.chips, 
--                colour = G.C.CHIPS
--            }
--        end
--    end,
--
--    loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
--        return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
--    end }

-- SMODS.Joker{
--    key = "sample_obelisk",
--    config = { extra = { x_mult = 0.1 } },
--    pos = { x = 0, y = 0 },
--    rarity = 3,
--    cost = 6,
--    blueprint_compat = true,
--    eternal_compat = true,
--    unlocked = true,
--    discovered = true,
--    effect = nil,
--    atlas = 'sample_obelisk',
--    soul_pos = nil,
--
--    calculate = function(self, card, context)
--        if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
--            local current_hand_times = (G.GAME.hands[context.scoring_name].played or 0) -- how many times has the player played the current type of hand. (pair, two pair. etc..)
--            local current_xmult = 1 + (current_hand_times * card.ability.extra.x_mult)
--            
--            return {
--                message = localize{type='variable',key='a_xmult',vars={current_xmult}},
--                colour = G.C.RED,
--                x_mult = current_xmult
--            }
--
--            -- you could also apply it to the joker, to do it like the sample wee, but then you'd have to reset the card and text every time the previewed hand changes.
--        end
--    end,
--
--    loc_vars = function(self, info_queue, card)
--        return { vars = { card.ability.extra.x_mult }, key = self.key }
--    end
-- }

--SMODS.Joker{
--    key = "sample_specifichand",
--    config = { extra = { poker_hand = "Five of a Kind", x_mult = 5 } },
--    pos={ x = 0, y = 0 },
--    rarity = 3,
--    cost = 10,
--    blueprint_compat=true,
--    eternal_compat=true,
--    unlocked = true,
--    discovered = true,
--    effect=nil,
--    soul_pos=nil,
--    atlas = 'sample_specifichand',
--
--    calculate = function(self,card,context)
--        if context.joker_main and context.cardarea == G.jokers then
--            if context.scoring_name == card.ability.extra.poker_hand then
--                return {
--                    message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
--                    colour = G.C.RED,
--                    x_mult = card.ability.x_mult
--                }
--            end
--        end
--    end,
--
--    loc_vars = function(self, info_queue, card)
 --       return { vars = { card.ability.extra.poker_hand, card.ability.extra.x_mult }, key = self.key }
--    end        
--}

--SMODS.Joker{
--    key = "sample_money",
--    config={ },
--    pos = { x = 0, y = 0 },
--    rarity = 1,
--    cost = 4,
--    blueprint_compat = true,
--    eternal_compat = true,
--    unlocked = true,
--    discovered = true,
--    effect = nil,
--    atlas = 'sample_money',
--    soul_pos = nil,
--
--    calculate = function(self, card, context)
--        if context.end_of_round and not (context.individual or context.repetition) then --and not (context.individual or context.repetition) => make sure doesn't activate on every card like gold cards.
--            ease_dollars(G.GAME.round_resets.blind_ante*2) -- ease_dollars adds or removes provided amount of money. (-5 would remove 5 for example)
--        end
--    end,
--    loc_vars = function(self, info_queue, card)
--        return { }
--    end
--}

--SMODS.Joker{
--    key = "sample_roomba",
--    config={ },
--    pos = { x = 0, y = 0 },
--    rarity = 2,
--    cost = 4,
--    blueprint_compat = true,
--    eternal_compat = false,
--    unlocked = true,
--    discovered = true,
--    effect = nil,
--    atlas = 'sample_roomba',
--    soul_pos = nil,
--
--        calculate = function(self, card, context)
--        if context.end_of_round and not (context.individual or context.repetition) then
--            local cleanable_jokers = {}
--
--            for i = 1, #G.jokers.cards do
--                if G.jokers.cards[i] ~= self then -- if joker is not itself 
--                    cleanable_jokers[#cleanable_jokers+1] = G.jokers.cards[i] -- add all other jokers into a array
--                end
--            end
--
--            local joker_to_clean = #cleanable_jokers > 0 and pseudorandom_element(cleanable_jokers, pseudoseed('clean')) or nil -- pick a random valid joker, or null if no valid jokers
--
--            if joker_to_clean then -- if we have a valid joker we can bump into
--                shakecard(joker_to_clean) -- simulate bumping into a card
--                if(joker_to_clean.edition) then --if joker has an edition
--                    if not joker_to_clean.edition.negative then --if joker is not negative
--                        joker_to_clean:set_edition(nil) -- clean the joker from it's edition
--                    end
--                end
--            end
--        end
--    end,
--
--    loc_vars = function(self, info_queue, card)
--        return { }
--    end
--}

--SMODS.Joker{
--    key = "sample_drunk_juggler",
--    config = { d_size = 1 }, -- d_size  = discard size, h_size = hand size. (HOWEVER, you can't have both on 1 joker!)
--    pos = { x = 0, y = 0 },
--    rarity = 2,
--    cost = 4,
--    blueprint_compat = true,
--    eternal_compat = false,
--    unlocked = true,
--    discovered = true,
--    effect = nil,
--    atlas = 'sample_drunk_juggler',
--    soul_pos = nil,
--
--    calculate = function(self, card, context)
--        return nil
--    end,
--
--   loc_vars = function(self, info_queue, card)
--        return { vars = { card.ability.d_size, localize{type = 'name_text', key = 'tag_double', set = 'Tag'} } }
--    end
--}
--
--SMODS.Joker{
--    key = "sample_hackerman",
--    config = { repetitions = 1 },
--    pos = { x = 0, y = 0 },
--    rarity = 2,
--    cost = 4,
--    blueprint_compat = true,
--    eternal_compat = false,
--   unlocked = true,
-- discovered = true,
-- effect = nil,
-- atlas = 'sample_hackerman'
-- soul_pos = nil,
--
--    calculate = function(self, card, context)
--        if context.cardarea == G.play and context.repetition and (
--            context.other_card:get_id() == 6 or 
--            context.other_card:get_id() == 7 or 
--            context.other_card:get_id() == 8 or 
--            context.other_card:get_id() == 9) then
--            return {
--                message = localize('k_again_ex'),
--                repetitions = card.ability.repetitions,
--                card = self
--            }
--        end
--    end,
--
--    loc_vars = function(self, info_queue, card)
--        return { }
--    end
--}
--
--SMODS.Joker{
--    key = "sample_baroness",
--    config = { extra = { x_mult = 1.5 } },
--    pos = { x = 0, y = 0 },
--    rarity = 3,
--    cost = 8,
--    blueprint_compat = true,
--    eternal_compat = false,
--    unlocked = true,
--    discovered = true,
--    effect = nil,
----   atlas = 'sample_baroness',
 --   soul_pos = nil,
--
  --  calculate = function(self, card, context)
  --      if not context.end_of_round then
  --          if context.cardarea == G.hand and context.individual and context.other_card:get_id() == 12 then
  --              if context.other_card.debuff then
  --                  return {
  --                      message = localize('k_debuffed'),
  --                      colour = G.C.RED,
  --                      card = self,
  --                  }
  --              else
  --                  return {
  --                      x_mult = card.ability.extra.x_mult,
  --                      card = self
  --                  }
  --              end
  --          end
  --      end
  --  end,
--
  --  loc_vars = function(self, info_queue, card)
  --      return { vars = { card.ability.extra.x_mult } }
  --  end
--}
--
--SMODS.Joker{
--    key = "sample_rarebaseballcard",
--    config = { extra = { x_mult = 2 } },
--    pos = { x = 0, y = 0 },
--    rarity = 2,
--    cost = 8,
--    blueprint_compat = true,
--    eternal_compat = false,
--    unlocked = true,
--    discovered = true,
--    effect = nil,
--    atlas = 'sample_rarebaseballcard',
--    soul_pos = nil,
--
--    calculate = function(self, card, context)
--        if not (context.individual or context.repetition) and context.other_joker and context.other_joker.config.center.rarity == 3 and self ~= context.other_joker then
--            shakecard(context.other_joker)
--            return {
--                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
--                colour = G.C.RED,
--                x_mult = card.ability.extra.x_mult
--            }
--        end
--    end,
--
--    loc_vars = function(self, info_queue, card)
--        return { vars = { card.ability.extra.x_mult }, key = self.key}
--    end
--}
--
--SMODS.Joker{
--    key = "sample_multieffect",
--    config = { extra = { chips = 10, mult = 10, x_mult = 2 } },
--    pos = { x = 0, y = 0 },
--    rarity = 2,
--    cost = 4,
--    blueprint_compat = true,
--    eternal_compat = false,
--    unlocked = true,
--    discovered = true,
--    effect = nil,
--    atlas = 'sample_multieffect',
--    soul_pos = nil,
--
--    calculate = function(self, card, context)
--        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 then
--            return {
--                chips = card.ability.extra.chips,
--                mult = card.ability.extra.mult,
--                x_mult = card.ability.extra.x_mult,
--                card = self
--            }
--        end
--    end,
--
--    loc_vars = function(self, info_queue, card)
--        return { vars = { card.ability.extra.chips, card.ability.extra.mult }, key = self.key }
--    end
--}