extends Node

@export var time: Dictionary = {"hour": "0", "minute": "00", "ending": "am"}
@export var inventory: Dictionary = {"milk": false, "cereal": false, "cereal_bowl": false}

enum LEVELS{HEADWORLD_1, HOUSE_NIGHT_1, HEADWORLD_2, HOUSE_DAY_1, HEADWORLD_3}


@export var current_level = LEVELS.HEADWORLD_1

@export var night_1_sleep_time: bool = false

