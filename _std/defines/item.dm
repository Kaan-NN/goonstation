//FLAGS BITMASK

/// unused
//#define							 (1<<0)
/// can pass by a table or rack
#define TABLEPASS					(1<<1)
/// thing doesn't drift in space
#define NODRIFT						(1<<2)
/// put this on either a thing you don't want to be hit rapidly, or a thing you don't want people to hit other stuff rapidly with
#define USEDELAY					(1<<3)
/// 1 second extra delay on use
#define EXTRADELAY					(1<<4)
/// weapon not affected by shield. MBC also put this flag on cloak/shield device to minimize istype checking, so consider this more SHIELD_ACT (rename? idk)
#define NOSHIELD					(1<<5)
/// conducts electricity (metal etc.)
#define CONDUCT						(1<<6)
/// can mousedrop reagents into from a reagent_container
#define ACCEPTS_MOUSEDROP_REAGENTS	(1<<7)
/// doesn't record fingerprints
#define NOFPRINT					(1<<8)
/// item has priority to check when entering or leaving
#define ON_BORDER					(1<<9)
/// can pass through a closed door
#define DOORPASS					(1<<10)
/// is an open container for chemistry purposes. don't check this flag directly, use obj.is_open_container()
#define OPENCONTAINER				(1<<11)
/// No beaker etc. splashing. For Chem machines etc.
#define NOSPLASH					(1<<12)
/// No attack when hitting stuff with this item.
#define SUPPRESSATTACK				(1<<13)
/// gets an overlay when submerged in fluid
#define FLUID_SUBMERGE				(1<<14)
/// gets a perspective overlay from adjacent fluids
#define IS_PERSPECTIVE_FLUID		(1<<15)
/// this object is solid to fluids as long as it is also dense (think doors)
#define FLUID_DENSE					(1<<16)
/// Calls equipment_click from hand_range_attack on items worn with this flag set.
#define HAS_EQUIP_CLICK				(1<<17)
/// Has the possibility for a TGUI interface
#define TGUI_INTERACTIVE			(1<<18)
/// Has a click delay for attack_self()
#define ATTACK_SELF_DELAY			(1<<19)
/// This object is solid to fluids regardless of density (think fluid forcefields)
#define FLUID_DENSE_ALWAYS			(1<<20)
/// If click delay should be applied even if atom is in user's contents (e.g.: postit notes)
#define CLICK_DELAY_IN_CONTENTS		(1<<21)
/// If an item cannot be crushed by the crusher
#define UNCRUSHABLE					(1<<22)

//Item function flags

/// apply to an item's flags to use the item's intent_switch_trigger() proc. This will be called when intent is switched while this item is in hand.
#define USE_INTENT_SWITCH_TRIGGER	(1<<0)
/// allows special attacks to be performed on help and grab intent with this item
#define USE_SPECIALS_ON_ALL_INTENTS	(1<<1)
/// prevents items from creating smoke while burning
#define SMOKELESS					(1<<2)
/// makes items immune to acid
#define IMMUNE_TO_ACID				(1<<3)
/// prevents items from heating anything up while burning
#define COLD_BURN					(1<<4)
/// Prevents an item from being placed inside of a storage container, regardless of the item's `w_class` or the storage's `can_hold` list.
#define UNSTORABLE					(1<<5)
/// Prevents the action bar when this item is put on someone/interacting with the item of someone to be hidden
#define OBVIOUS_INTERACTION_BAR		(1<<6)
/// When this item is build into an assembly, this flag will cause it to message an admin
#define ASSEMBLY_NEEDS_MESSAGING	(1<<7)

//tool flags
#define TOOL_CLAMPING  (1<<0)
#define TOOL_CUTTING   (1<<1)
#define TOOL_PRYING    (1<<2)
#define TOOL_PULSING   (1<<3)
#define TOOL_SAWING    (1<<4)
#define TOOL_SCREWING  (1<<5)
#define TOOL_SNIPPING  (1<<6)
#define TOOL_SPOONING  (1<<7)
#define TOOL_WELDING   (1<<8)
#define TOOL_WRENCHING (1<<9)
#define TOOL_CHOPPING  (1<<10) // for fire axes, does additional damage to doors.
#define TOOL_SOLDERING (1<<11)
#define TOOL_WIRING    (1<<12)
#define TOOL_ASSEMBLY_APPLIER (1<<13) // for anything that are useable for assemblies, e.g. igniters & bikehorns

//omnitool flags
#define OMNI_MODE_PRYING 1
#define OMNI_MODE_SNIPPING 2
#define OMNI_MODE_WRENCHING 3
#define OMNI_MODE_SCREWING 4
#define OMNI_MODE_PULSING 5
#define OMNI_MODE_CUTTING 6
#define OMNI_MODE_WELDING 7

//fluid_canister flags
#define FLUID_CANISTER_MODE_OFF 1
#define FLUID_CANISTER_MODE_SLURP 2
#define FLUID_CANISTER_MODE_PISS 3

//------

//tooltip flags for rebuilding

/// rebuild tooltip every single time without exception
#define REBUILD_ALWAYS				1
/// force rebuild if dist does not match cache
#define REBUILD_DIST				2
/// force rebuild if viewer has changed at all
#define REBUILD_USER				4
/// force rebuild if spectrospec status of viewer has changed
#define REBUILD_SPECTRO				8

// blood system and item damage things
#define DAMAGE_BLUNT (1<<0) // 420
#define DAMAGE_CUT   (1<<1)
#define DAMAGE_STAB  (1<<2)
#define DAMAGE_BURN  (1<<3)
/// crushing damage is technically blunt damage, but it causes bleeding
#define DAMAGE_CRUSH (1<<4)
#define DEFAULT_BLOOD_COLOR "#990000"	// speak for yourself, as a shapeshifting illuminati lizard, my blood is somewhere between lime and leaf green
#define DAMAGE_TYPE_TO_STRING(x) (x == DAMAGE_BLUNT ? "blunt" : x == DAMAGE_CUT ? "cut" : x == DAMAGE_STAB ? "stab" : x == DAMAGE_BURN ? "burn" : x == DAMAGE_CRUSH ? "crush" : "")

//item rarity stuff
#define ITEM_RARITY_POOR 1
#define ITEM_RARITY_COMMON 2
#define ITEM_RARITY_UNCOMMON 3
#define ITEM_RARITY_RARE 4
#define ITEM_RARITY_EPIC 5
#define ITEM_RARITY_LEGENDARY 6
#define ITEM_RARITY_MYTHIC 7

// item comp defs
#define FORCE_EDIBILITY 1
//item attack bitflags
/// The pre-attack signal doesnt want the attack to continue, so don't
#define ATTACK_PRE_DONT_ATTACK 1

// Limb Kind Bitflags, to avoid the funky typecheck spam limbs usually need
/// Limb typically belongs to one of the normal-ass mutantraces
#define LIMB_MUTANT   (1<<0)
/// Limb is robotic in nature
#define LIMB_ROBOT    (1<<1)
/// Limb lighter than the average limb
#define LIMB_LIGHT    (1<<2)
/// Limb heavier than the average limb
#define LIMB_HEAVY    (1<<3)
/// Limb is really heavy
#define LIMB_HEAVIER  (1<<4)
/// Limb is actually tank treads
#define LIMB_TREADS   (1<<5)
/// Limb typically belongs to a shambling abomination
#define LIMB_ABOM     (1<<6)
/// Limb is made of plants
#define LIMB_PLANT    (1<<7)
/// Limb is whatever the heck a hot limb is
#define LIMB_HOT      (1<<8)
/// Limb typically belongs to the restless undead
#define LIMB_ZOMBIE   (1<<9)
/// Limb typically belongs to hunters
#define LIMB_HUNTER   (1<<10)
/// Limb is actually an item stuck to a stump
#define LIMB_ITEM     (1<<11)
/// Limb is made of stone
#define LIMB_STONE    (1<<12)
/// Limb typically belongs to a vicious bear
#define LIMB_BEAR     (1<<13)
/// Limb typically belongs to a brullbar
#define LIMB_BRULLBAR  (1<<14)
/// Limb typically belongs to a large angry dog
#define LIMB_WOLF     (1<<15)
/// Limb is kinda boney
#define LIMB_SKELLY   (1<<16)
/// Limb is an artifact limb
#define LIMB_ARTIFACT (1<<17)

// islimb macros
#define ismutantlimb(x)   HAS_FLAG(x:kind_of_limb, LIMB_MUTANT)
#define isrobotlimb(x)    HAS_FLAG(x:kind_of_limb, LIMB_ROBOT)
#define islightlimb(x)    HAS_FLAG(x:kind_of_limb, LIMB_LIGHT)
#define isheavyrlimb(x)   HAS_FLAG(x:kind_of_limb, LIMB_HEAVY)
#define isheavierlimb(x)  HAS_FLAG(x:kind_of_limb, LIMB_HEAVIER)
#define istread(x)        HAS_FLAG(x:kind_of_limb, LIMB_TREADS)
#define isabomlimb(x)     HAS_FLAG(x:kind_of_limb, LIMB_ABOM)
#define isplantlimb(x)    HAS_FLAG(x:kind_of_limb, LIMB_PLANT)
#define ishotlimb(x)      HAS_FLAG(x:kind_of_limb, LIMB_HOT)
#define iszombielimb(x)   HAS_FLAG(x:kind_of_limb, LIMB_ZOMBIE)
#define ishunterlimb(x)   HAS_FLAG(x:kind_of_limb, LIMB_HUNTER)
#define isitemlimb(x)     HAS_FLAG(x:kind_of_limb, LIMB_ITEM)
#define isstonelimb(x)    HAS_FLAG(x:kind_of_limb, LIMB_STONE)
#define isbearlimb(x)     HAS_FLAG(x:kind_of_limb, LIMB_BEAR)
#define isbrullbarlimb(x)  HAS_FLAG(x:kind_of_limb, LIMB_BRULLBAR)
#define iswolflimb(x)     HAS_FLAG(x:kind_of_limb, LIMB_WOLF)
#define isskeletonlimb(x) HAS_FLAG(x:kind_of_limb, LIMB_SKELLY)
#define ismonsterlimb(x) (HAS_FLAG(x:kind_of_limb, LIMB_ZOMBIE) |\
                          HAS_FLAG(x:kind_of_limb, LIMB_HUNTER) |\
                          HAS_FLAG(x:kind_of_limb, LIMB_BEAR) |\
                          HAS_FLAG(x:kind_of_limb, LIMB_BRULLBAR) |\
                          HAS_FLAG(x:kind_of_limb, LIMB_ABOM) |\
                          HAS_FLAG(x:kind_of_limb, LIMB_WOLF))
#define isrobolimb(x) (HAS_FLAG(x:kind_of_limb, LIMB_ROBOT) |\
                       HAS_FLAG(x:kind_of_limb, LIMB_LIGHT) |\
                       HAS_FLAG(x:kind_of_limb, LIMB_HEAVY) |\
                       HAS_FLAG(x:kind_of_limb, LIMB_HEAVIER) |\
                       HAS_FLAG(x:kind_of_limb, LIMB_TREADS))

#define W_CLASS_TINY 1
#define W_CLASS_SMALL 2
#define W_CLASS_POCKET_SIZED 2.5
#define W_CLASS_NORMAL 3
#define W_CLASS_BULKY 4
#define W_CLASS_HUGE 5
#define W_CLASS_GIGANTIC 6
#define W_CLASS_BUBSIAN 10

// for firesource logging
/// Firesource is capable of starting fires on its own when dropped
#define FIRESOURCE_OPEN_FLAME 1
/// Firesource can not cause fires on its own when dropped
#define FIRESOURCE_IGNITER 2

// for pen reagent dipping
#define PEN_REAGENT_CAPACITY 4

/// The default, the attack is animated, a message is given, and particles are shown (most items)
#define ATTACK_VISIBLE 0
/// The attack is fully hidden. No animation, no message, no particles (sleepy pen, silenced .22)
#define ATTACK_FULLY_HIDDEN 1
/// No attack message is shown and no particles are displayed, but the animation of the attacker still plays (genetics analyzer, autoinjectors)
#define ATTACK_PARTIALLY_HIDDEN 2
/// for matches
#define MATCH_UNLIT 0
#define MATCH_LIT 1
#define MATCH_INERT 2 /// broken or burn out

/// Macro for rendering an image fullsize on paper
#define PAPER_IMAGE_RENDER(image) "<img style='position: absolute; top: 0; left: 0' src='[resource(image)]'>"

// implant stuff
#define IMPLANT_SCAN_CATEGORY_OTHER "other"
#define IMPLANT_SCAN_CATEGORY_HEALTH "health"
#define IMPLANT_SCAN_CATEGORY_CLONER "cloner"
#define IMPLANT_SCAN_CATEGORY_SYNDICATE "syndicate"
#define IMPLANT_SCAN_CATEGORY_UNKNOWN "unknown"
#define IMPLANT_SCAN_CATEGORY_NOT_SHOWN "not_shown"
