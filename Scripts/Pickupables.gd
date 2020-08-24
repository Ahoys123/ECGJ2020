extends Node


const SUN_BOOK = 37
const SKULL_BOOK = 36
const JOURNAL_BOOK = 35
const COOKBOOK_BOOK = 53
const HISTORY_BOOK = 35

const LOG_TORCH = 17
const TORCH_BODY_TORCH = 16
const COAL_TORCH = 48
const FLINT_TORCH = 18

const WILL_HEIRLOOM = 33
const WEDDING_BAND_HEIRLOOM = 40
const MYSTERY_POUCH_HEIRLOOM = 80
const LOST_MEDICINE_HEIRLOOM = 98
const STOLEN_VALOR_HEIRLOOM = 137
const STAR_SAPHIRE_HEIRLOOM = 26

const IRON_KEY = 126
const BRASS_KEY = 94

onready var sun_sprite = $Books/Sun_Book_Pickup/Sprite.frame
onready var skull_sprite = $Books/Skull_Book_Pickup/Sprite.frame
onready var journal_sprite = $Books/Leather_Journal_Pickup/Sprite.frame
onready var cookbook_sprite = $Books/Cookbook_Pickup/Sprite.frame
onready var history_sprite = $Books/History_Book_Pickup/Sprite.frame

onready var log_sprite = $TorchParts/Log_Pickup/Sprite.frame
onready var torchbody_sprite = $TorchParts/TorchBody_Pickup/Sprite.frame
onready var coal_sprite = $TorchParts/Coal_Pickup/Sprite.frame
onready var flint_sprite = $TorchParts/Flint_Pickup/Sprite.frame

onready var will_sprite = $Heirlooms/Will_Pickup/Sprite.frame
onready var wedding_sprite = $Heirlooms/WeddingBand_Pickup/Sprite.frame
onready var mystery_sprite = $Heirlooms/Mystery_Pickup/Sprite.frame
onready var medicine_sprite = $Heirlooms/LostMedicine_Pickup/Sprite.frame
onready var valor_sprite = $Heirlooms/StolenValor_Pickup/Sprite.frame
onready var saphire_sprite = $Heirlooms/StarSaphire_Pickup/Sprite.frame

onready var ironkey_sprite = $Keys/IronKey_Pickup/Sprite.frame
onready var brass_key = $Keys/BrassKey_Pickup/Sprite.frame


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("setup_key_items", null, null)
	pass

func setup_key_items():	
	print("function running")
	sun_sprite = SUN_BOOK
	skull_sprite = SKULL_BOOK
	journal_sprite = JOURNAL_BOOK
	cookbook_sprite = COOKBOOK_BOOK
	history_sprite = HISTORY_BOOK
	
	log_sprite = LOG_TORCH
	torchbody_sprite = TORCH_BODY_TORCH
	coal_sprite = COAL_TORCH
	flint_sprite = FLINT_TORCH
	
	will_sprite = WILL_HEIRLOOM
	wedding_sprite = WEDDING_BAND_HEIRLOOM
	mystery_sprite = MYSTERY_POUCH_HEIRLOOM
	medicine_sprite = LOST_MEDICINE_HEIRLOOM
	valor_sprite = STOLEN_VALOR_HEIRLOOM
	saphire_sprite = STAR_SAPHIRE_HEIRLOOM
	
	ironkey_sprite = IRON_KEY
	brass_key = BRASS_KEY
