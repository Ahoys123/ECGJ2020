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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func setup_key_items():	
	
	print("function running")
	$Books/Sun_Book_Pickup/Sprite.frame = SUN_BOOK	
	$Books/Skull_Book_Pickup/Sprite.frame = SKULL_BOOK
	$Books/Leather_Journal_Pickup/Sprite.frame = JOURNAL_BOOK
	$Books/Cookbook_Pickup/Sprite.frame = COOKBOOK_BOOK
	$Books/History_Book_Pickup/Sprite.frame = HISTORY_BOOK
	
	$TorchParts/Log_Pickup/Sprite.frame = LOG_TORCH
	$TorchParts/TorchBody_Pickup/Sprite.frame = TORCH_BODY_TORCH
	$TorchParts/Coal_Pickup/Sprite.frame = COAL_TORCH
	$TorchParts/Flint_Pickup/Sprite.frame = FLINT_TORCH
	
	$Heirlooms/Will_Pickup/Sprite.frame = WILL_HEIRLOOM
	$Heirlooms/WeddingBand_Pickup/Sprite.frame = WEDDING_BAND_HEIRLOOM
	$Heirlooms/Mystery_Pickup/Sprite.frame = MYSTERY_POUCH_HEIRLOOM
	$Heirlooms/LostMedicine_Pickup/Sprite.frame = LOST_MEDICINE_HEIRLOOM
	$Heirlooms/StolenValor_Pickup/Sprite.frame = STOLEN_VALOR_HEIRLOOM
	$Heirlooms/StarSaphire_Pickup/Sprite.frame = STAR_SAPHIRE_HEIRLOOM
	
	
	$Keys/IronKey_Pickup/Sprite.frame = IRON_KEY
	$Keys/BrassKey_Pickup/Sprite.frame = BRASS_KEY

func _on_BrassKey_Pickup_ready():
	setup_key_items()
