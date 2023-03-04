package.path  = package.path .. ";.\\LuaSocket\\?.lua"

-- Example Config File
-- You can delete the .gitignore file if you want to track your Config File!
CONFIG = {
    -- Set the directory of your DCS Saved Games folder. You must include \\ at the end to escape the \
    SavedGames = 'C:\\Users\\nicel\\Saved Games\\DCS.openbeta\\',
    -- Set the project name to the same name as your repository folder.
    ProjectName = 'SEATAC',
    -- This is the file where information about repositories is stored.
    Repository = {User = 'nicelym', Repo = 'MSF_Repository', Path = 'REPOSITORIES'},
    -- Remote repository for remote GitHub static Lua file.
    Remote = {User = 'YukAtWar', Repo = 'SEATAC', Path = 'Builds/SEATAC.lua'}
}

---@authors funkyfranky, Applevangelist, TommyC81, FlightControl-User
---@description
---Attribution: MOOSE by FlightControl. https://github.com/FlightControl-Master/MOOSE/blob/master/Moose%20Development/Moose/Utilities/Enums.lua
---DCS enumerators.
---@Created 16MAY22

---@class ENUMS
ENUMS = {}

---@field public ROE table Rules of Engagement.
ENUMS.ROE = {
  ---@field public WeaponFree number AI will engage any enemy group it detects. Target prioritization is based based on the threat of the target.
  ---@field public OpenFireWeaponFree number AI will engage any enemy group it detects, but will prioritize targets specified in the groups tasking.
  ---@field public OpenFire number AI will engage only targets specified in its tasks.
  ---@field public ReturnFire number AI will only engage threats that shoot first.
  ---@field public WeaponHold number AI will hold fire under all circumstances.
  WeaponFree=0,
  OpenFireWeaponFree=1,
  OpenFire=2,
  ReturnFire=3,
  WeaponHold=4,
  }

--- Reaction On Threat.
-- @type ENUMS.ROT
-- @field #number NoReaction No defensive actions will take place to counter threats.
-- @field #number PassiveDefense AI will use jammers and other countermeasures in an attempt to defeat the threat. AI will not attempt a maneuver to defeat a threat.
-- @field #number EvadeFire AI will react by performing defensive maneuvers against incoming threats. AI will also use passive defense.
-- @field #number BypassAndEscape AI will attempt to avoid enemy threat zones all together. This includes attempting to fly above or around threats.
-- @field #number AllowAbortMission If a threat is deemed severe enough the AI will abort its mission and return to base.
ENUMS.ROT = {
  NoReaction=0,
  PassiveDefense=1,
  EvadeFire=2,
  BypassAndEscape=3,
  AllowAbortMission=4,
}

--- Alarm state.
-- @type ENUMS.AlarmState
-- @field #number Auto AI will automatically switch alarm states based on the presence of threats. The AI kind of cheats in this regard.
-- @field #number Green Group is not combat ready. Sensors are stowed if possible.
-- @field #number Red Group is combat ready and actively searching for targets. Some groups like infantry will not move in this state.
ENUMS.AlarmState = {
  Auto=0,
  Green=1,
  Red=2,
}

--- Weapon types. See the [Weapon Flag](https://wiki.hoggitworld.com/view/DCS_enum_weapon_flag) enumerotor on hoggit wiki.
-- @type ENUMS.WeaponFlag
ENUMS.WeaponFlag={
  -- Bombs
  LGB                  =          2,
  TvGB                 =          4,
  SNSGB                =          8,
  HEBomb               =         16,
  Penetrator           =         32,
  NapalmBomb           =         64,
  FAEBomb              =        128,
  ClusterBomb          =        256,
  Dispencer            =        512,
  CandleBomb           =       1024,
  ParachuteBomb        = 2147483648,
  -- Rockets
  LightRocket          =       2048,
  MarkerRocket         =       4096,
  CandleRocket         =       8192,
  HeavyRocket          =      16384,
  -- Air-To-Surface Missiles
  AntiRadarMissile     =      32768,
  AntiShipMissile      =      65536,
  AntiTankMissile      =     131072,
  FireAndForgetASM     =     262144,
  LaserASM             =     524288,
  TeleASM              =    1048576,
  CruiseMissile        =    2097152,
  AntiRadarMissile2    = 1073741824,
  -- Air-To-Air Missiles
  SRAM                 =    4194304,
  MRAAM                =    8388608, 
  LRAAM                =   16777216,
  IR_AAM               =   33554432,
  SAR_AAM              =   67108864,
  AR_AAM               =  134217728,
  --- Guns
  GunPod               =  268435456,
  BuiltInCannon        =  536870912,
  ---
  -- Combinations
  --
  -- Bombs
  GuidedBomb           =         14, -- (LGB + TvGB + SNSGB)
  AnyUnguidedBomb      = 2147485680, -- (HeBomb + Penetrator + NapalmBomb + FAEBomb + ClusterBomb + Dispencer + CandleBomb + ParachuteBomb)
  AnyBomb              = 2147485694, -- (GuidedBomb + AnyUnguidedBomb)
  --- Rockets
  AnyRocket            =      30720, -- LightRocket + MarkerRocket + CandleRocket + HeavyRocket
  --- Air-To-Surface Missiles
  GuidedASM            =    1572864, -- (LaserASM + TeleASM)
  TacticalASM          =    1835008, -- (GuidedASM + FireAndForgetASM)
  AnyASM               =    4161536, -- (AntiRadarMissile + AntiShipMissile + AntiTankMissile + FireAndForgetASM + GuidedASM + CruiseMissile)
  AnyASM2              = 1077903360, -- 4161536+1073741824,
  --- Air-To-Air Missiles
  AnyAAM               =  264241152, -- IR_AAM + SAR_AAM + AR_AAM + SRAAM + MRAAM + LRAAM
  AnyAutonomousMissile =   36012032, -- IR_AAM + AntiRadarMissile + AntiShipMissile + FireAndForgetASM + CruiseMissile
  AnyMissile           =  268402688, -- AnyASM + AnyAAM   
  --- Guns
  Cannons              =  805306368, -- GUN_POD + BuiltInCannon
  --- Torpedo
  Torpedo              = 4294967296,
  ---
  -- Even More Genral
  Auto                 = 3221225470, -- Any Weapon (AnyBomb + AnyRocket + AnyMissile + Cannons)
  AutoDCS              = 1073741822, -- Something if often see
  AnyAG                = 2956984318, -- Any Air-To-Ground Weapon
  AnyAA                =  264241152, -- Any Air-To-Air Weapon
  AnyUnguided          = 2952822768, -- Any Unguided Weapon
  AnyGuided            =  268402702, -- Any Guided Weapon   
}

--- Weapon types by category. See the [Weapon Flag](https://wiki.hoggitworld.com/view/DCS_enum_weapon_flag) enumerator on hoggit wiki.
-- @type ENUMS.WeaponType
-- @field #table Bomb Bombs.
-- @field #table Rocket Rocket.
-- @field #table Gun Guns.
-- @field #table Missile Missiles.
-- @field #table AAM Air-to-Air missiles.
-- @field #table Torpedo Torpedos.
-- @field #table Any Combinations.
ENUMS.WeaponType={}
ENUMS.WeaponType.Bomb={
  -- Bombs
  LGB                  =          2,
  TvGB                 =          4,
  SNSGB                =          8,
  HEBomb               =         16,
  Penetrator           =         32,
  NapalmBomb           =         64,
  FAEBomb              =        128,
  ClusterBomb          =        256,
  Dispencer            =        512,
  CandleBomb           =       1024,
  ParachuteBomb        = 2147483648,
  -- Combinations
  GuidedBomb           =         14, -- (LGB + TvGB + SNSGB)
  AnyUnguidedBomb      = 2147485680, -- (HeBomb + Penetrator + NapalmBomb + FAEBomb + ClusterBomb + Dispencer + CandleBomb + ParachuteBomb)
  AnyBomb              = 2147485694, -- (GuidedBomb + AnyUnguidedBomb)  
}
ENUMS.WeaponType.Rocket={
  -- Rockets
  LightRocket          =       2048,
  MarkerRocket         =       4096,
  CandleRocket         =       8192,
  HeavyRocket          =      16384,
  -- Combinations
  AnyRocket            =      30720, -- LightRocket + MarkerRocket + CandleRocket + HeavyRocket
}
ENUMS.WeaponType.Gun={
  -- Guns
  GunPod               =  268435456,
  BuiltInCannon        =  536870912,
  -- Combinations
  Cannons              =  805306368, -- GUN_POD + BuiltInCannon
}
ENUMS.WeaponType.Missile={
  -- Missiles
  AntiRadarMissile     =      32768,
  AntiShipMissile      =      65536,
  AntiTankMissile      =     131072,
  FireAndForgetASM     =     262144,
  LaserASM             =     524288,
  TeleASM              =    1048576,
  CruiseMissile        =    2097152,
  AntiRadarMissile2    = 1073741824,
  -- Combinations
  GuidedASM            =    1572864, -- (LaserASM + TeleASM)
  TacticalASM          =    1835008, -- (GuidedASM + FireAndForgetASM)
  AnyASM               =    4161536, -- (AntiRadarMissile + AntiShipMissile + AntiTankMissile + FireAndForgetASM + GuidedASM + CruiseMissile)
  AnyASM2              = 1077903360, -- 4161536+1073741824,
  AnyAutonomousMissile =   36012032, -- IR_AAM + AntiRadarMissile + AntiShipMissile + FireAndForgetASM + CruiseMissile
  AnyMissile           =  268402688, -- AnyASM + AnyAAM       
}
ENUMS.WeaponType.AAM={
  -- Air-To-Air Missiles
  SRAM                 =    4194304,
  MRAAM                =    8388608, 
  LRAAM                =   16777216,
  IR_AAM               =   33554432,
  SAR_AAM              =   67108864,
  AR_AAM               =  134217728,
  -- Combinations
  AnyAAM               =  264241152, -- IR_AAM + SAR_AAM + AR_AAM + SRAAM + MRAAM + LRAAM
}
ENUMS.WeaponType.Torpedo={
  -- Torpedo
  Torpedo              = 4294967296,
}
ENUMS.WeaponType.Any={
  -- General combinations  
  Weapon               = 3221225470, -- Any Weapon (AnyBomb + AnyRocket + AnyMissile + Cannons)
  AG                   = 2956984318, -- Any Air-To-Ground Weapon
  AA                   =  264241152, -- Any Air-To-Air Weapon
  Unguided             = 2952822768, -- Any Unguided Weapon
  Guided               =  268402702, -- Any Guided Weapon   
}


--- Mission tasks.
-- @type ENUMS.MissionTask
-- @field #string NOTHING No special task. Group can perform the minimal tasks: Orbit, Refuelling, Follow and Aerobatics.
-- @field #string AFAC Forward Air Controller Air. Can perform the tasks: Attack Group, Attack Unit, FAC assign group, Bombing, Attack Map Object.
-- @field #string ANTISHIPSTRIKE Naval ops. Can perform the tasks: Attack Group, Attack Unit.
-- @field #string AWACS AWACS.
-- @field #string CAP Combat Air Patrol.
-- @field #string CAS Close Air Support.
-- @field #string ESCORT Escort another group.
-- @field #string FIGHTERSWEEP Fighter sweep.
-- @field #string GROUNDATTACK Ground attack.
-- @field #string INTERCEPT Intercept.
-- @field #string PINPOINTSTRIKE Pinpoint strike.
-- @field #string RECONNAISSANCE Reconnaissance mission.
-- @field #string REFUELING Refueling mission.
-- @field #string RUNWAYATTACK Attack the runway of an airdrome.
-- @field #string SEAD Suppression of Enemy Air Defenses.
-- @field #string TRANSPORT Troop transport.
ENUMS.MissionTask={
  NOTHING="Nothing",
  AFAC="AFAC",
  ANTISHIPSTRIKE="Antiship Strike",
  AWACS="AWACS",
  CAP="CAP",
  CAS="CAS",
  ESCORT="Escort",
  FIGHTERSWEEP="Fighter Sweep",
  GROUNDATTACK="Ground Attack",
  INTERCEPT="Intercept",
  PINPOINTSTRIKE="Pinpoint Strike",
  RECONNAISSANCE="Reconnaissance",
  REFUELING="Refueling",
  RUNWAYATTACK="Runway Attack",
  SEAD="SEAD",
  TRANSPORT="Transport",
}

--- Formations (new). See the [Formations](https://wiki.hoggitworld.com/view/DCS_enum_formation) on hoggit wiki.
-- @type ENUMS.Formation
ENUMS.Formation={}
ENUMS.Formation.FixedWing={}
ENUMS.Formation.FixedWing.LineAbreast={}
ENUMS.Formation.FixedWing.LineAbreast.Close = 65537
ENUMS.Formation.FixedWing.LineAbreast.Open  = 65538
ENUMS.Formation.FixedWing.LineAbreast.Group = 65539
ENUMS.Formation.FixedWing.Trail={}
ENUMS.Formation.FixedWing.Trail.Close = 131073
ENUMS.Formation.FixedWing.Trail.Open  = 131074
ENUMS.Formation.FixedWing.Trail.Group = 131075
ENUMS.Formation.FixedWing.Wedge={}
ENUMS.Formation.FixedWing.Wedge.Close = 196609
ENUMS.Formation.FixedWing.Wedge.Open  = 196610
ENUMS.Formation.FixedWing.Wedge.Group = 196611
ENUMS.Formation.FixedWing.EchelonRight={}
ENUMS.Formation.FixedWing.EchelonRight.Close = 262145
ENUMS.Formation.FixedWing.EchelonRight.Open  = 262146
ENUMS.Formation.FixedWing.EchelonRight.Group = 262147
ENUMS.Formation.FixedWing.EchelonLeft={}
ENUMS.Formation.FixedWing.EchelonLeft.Close = 327681
ENUMS.Formation.FixedWing.EchelonLeft.Open  = 327682
ENUMS.Formation.FixedWing.EchelonLeft.Group = 327683
ENUMS.Formation.FixedWing.FingerFour={}
ENUMS.Formation.FixedWing.FingerFour.Close = 393217
ENUMS.Formation.FixedWing.FingerFour.Open  = 393218
ENUMS.Formation.FixedWing.FingerFour.Group = 393219
ENUMS.Formation.FixedWing.Spread={}
ENUMS.Formation.FixedWing.Spread.Close = 458753
ENUMS.Formation.FixedWing.Spread.Open  = 458754
ENUMS.Formation.FixedWing.Spread.Group = 458755
ENUMS.Formation.FixedWing.BomberElement={}
ENUMS.Formation.FixedWing.BomberElement.Close = 786433
ENUMS.Formation.FixedWing.BomberElement.Open  = 786434
ENUMS.Formation.FixedWing.BomberElement.Group = 786435
ENUMS.Formation.FixedWing.BomberElementHeight={}
ENUMS.Formation.FixedWing.BomberElementHeight.Close = 851968
ENUMS.Formation.FixedWing.FighterVic={}
ENUMS.Formation.FixedWing.FighterVic.Close = 917505
ENUMS.Formation.FixedWing.FighterVic.Open  = 917506
ENUMS.Formation.RotaryWing={}
ENUMS.Formation.RotaryWing.Column={}
ENUMS.Formation.RotaryWing.Column.D70=720896
ENUMS.Formation.RotaryWing.Wedge={}
ENUMS.Formation.RotaryWing.Wedge.D70=8
ENUMS.Formation.RotaryWing.FrontRight={}
ENUMS.Formation.RotaryWing.FrontRight.D300=655361
ENUMS.Formation.RotaryWing.FrontRight.D600=655362
ENUMS.Formation.RotaryWing.FrontLeft={}
ENUMS.Formation.RotaryWing.FrontLeft.D300=655617
ENUMS.Formation.RotaryWing.FrontLeft.D600=655618
ENUMS.Formation.RotaryWing.EchelonRight={}
ENUMS.Formation.RotaryWing.EchelonRight.D70 =589825
ENUMS.Formation.RotaryWing.EchelonRight.D300=589826
ENUMS.Formation.RotaryWing.EchelonRight.D600=589827
ENUMS.Formation.RotaryWing.EchelonLeft={}
ENUMS.Formation.RotaryWing.EchelonLeft.D70 =590081
ENUMS.Formation.RotaryWing.EchelonLeft.D300=590082
ENUMS.Formation.RotaryWing.EchelonLeft.D600=590083
ENUMS.Formation.Vehicle={}
ENUMS.Formation.Vehicle.Vee="Vee"
ENUMS.Formation.Vehicle.EchelonRight="EchelonR"
ENUMS.Formation.Vehicle.OffRoad="Off Road"
ENUMS.Formation.Vehicle.Rank="Rank"
ENUMS.Formation.Vehicle.EchelonLeft="EchelonL"
ENUMS.Formation.Vehicle.OnRoad="On Road"
ENUMS.Formation.Vehicle.Cone="Cone"
ENUMS.Formation.Vehicle.Diamond="Diamond"

--- Formations (old). The old format is a simplified version of the new formation enums, which allow more sophisticated settings.
-- See the [Formations](https://wiki.hoggitworld.com/view/DCS_enum_formation) on hoggit wiki.
-- @type ENUMS.FormationOld
ENUMS.FormationOld={}
ENUMS.FormationOld.FixedWing={}
ENUMS.FormationOld.FixedWing.LineAbreast=1
ENUMS.FormationOld.FixedWing.Trail=2
ENUMS.FormationOld.FixedWing.Wedge=3
ENUMS.FormationOld.FixedWing.EchelonRight=4
ENUMS.FormationOld.FixedWing.EchelonLeft=5
ENUMS.FormationOld.FixedWing.FingerFour=6
ENUMS.FormationOld.FixedWing.SpreadFour=7
ENUMS.FormationOld.FixedWing.BomberElement=12
ENUMS.FormationOld.FixedWing.BomberElementHeight=13
ENUMS.FormationOld.FixedWing.FighterVic=14
ENUMS.FormationOld.RotaryWing={}
ENUMS.FormationOld.RotaryWing.Wedge=8
ENUMS.FormationOld.RotaryWing.Echelon=9
ENUMS.FormationOld.RotaryWing.Front=10
ENUMS.FormationOld.RotaryWing.Column=11


--- Morse Code. See the [Wikipedia](https://en.wikipedia.org/wiki/Morse_code).
-- 
-- * Short pulse "*"
-- * Long pulse "-"
-- 
-- Pulses are separated by a blank character " ".
-- 
-- @type ENUMS.Morse
ENUMS.Morse={}
ENUMS.Morse.A="* -"
ENUMS.Morse.B="- * * *"
ENUMS.Morse.C="- * - *"
ENUMS.Morse.D="- * *"
ENUMS.Morse.E="*"
ENUMS.Morse.F="* * - *"
ENUMS.Morse.G="- - *"
ENUMS.Morse.H="* * * *"
ENUMS.Morse.I="* *"
ENUMS.Morse.J="* - - -"
ENUMS.Morse.K="- * -"
ENUMS.Morse.L="* - * *"
ENUMS.Morse.M="- -"
ENUMS.Morse.N="- *"
ENUMS.Morse.O="- - -"
ENUMS.Morse.P="* - - *"
ENUMS.Morse.Q="- - * -"
ENUMS.Morse.R="* - *"
ENUMS.Morse.S="* * *"
ENUMS.Morse.T="-"
ENUMS.Morse.U="* * -"
ENUMS.Morse.V="* * * -"
ENUMS.Morse.W="* - -"
ENUMS.Morse.X="- * * -"
ENUMS.Morse.Y="- * - -"
ENUMS.Morse.Z="- - * *"
ENUMS.Morse.N1="* - - - -"
ENUMS.Morse.N2="* * - - -"
ENUMS.Morse.N3="* * * - -"
ENUMS.Morse.N4="* * * * -"
ENUMS.Morse.N5="* * * * *"
ENUMS.Morse.N6="- * * * *"
ENUMS.Morse.N7="- - * * *"
ENUMS.Morse.N8="- - - * *"
ENUMS.Morse.N9="- - - - *"
ENUMS.Morse.N0="- - - - -"
ENUMS.Morse[" "]=" "

--- ISO (639-1) 2-letter Language Codes. See the [Wikipedia](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).
-- 
-- @type ENUMS.ISOLang
ENUMS.ISOLang = 
{
  Arabic    = 'AR',
  Chinese   = 'ZH',
  English   = 'EN',
  French    = 'FR',
  German    = 'DE',
  Russian   = 'RU',
  Spanish   = 'ES',
  Japanese  = 'JA',
  Italian   = 'IT',
}

--- Phonetic Alphabet (NATO). See the [Wikipedia](https://en.wikipedia.org/wiki/NATO_phonetic_alphabet).
-- 
-- @type ENUMS.Phonetic
ENUMS.Phonetic =
{
  A = 'Alpha',
  B = 'Bravo',
  C = 'Charlie',
  D = 'Delta',
  E = 'Echo',
  F = 'Foxtrot',
  G = 'Golf',
  H = 'Hotel',
  I = 'India',
  J = 'Juliett',
  K = 'Kilo',
  L = 'Lima',
  M = 'Mike',
  N = 'November',
  O = 'Oscar',
  P = 'Papa',
  Q = 'Quebec',
  R = 'Romeo',
  S = 'Sierra',
  T = 'Tango',
  U = 'Uniform',
  V = 'Victor',
  W = 'Whiskey',
  X = 'Xray',
  Y = 'Yankee',
  Z = 'Zulu',
}

--- Reporting Names (NATO). See the [Wikipedia](https://en.wikipedia.org/wiki/List_of_NATO_reporting_names_for_fighter_aircraft).
-- DCS known aircraft types
-- 
-- @type ENUMS.ReportingName
ENUMS.ReportingName =
{
  NATO = {
    -- Fighters
    Dragon = "JF-17", -- China, correctly Fierce Dragon, Thunder for PAC
    Fagot = "MiG-15",
    Farmer = "MiG-19", -- Shenyang J-6 and Mikoyan-Gurevich MiG-19
    Felon = "Su-57",
    Fencer = "Su-24",
    Fishbed = "MiG-21",
    Fitter = "Su-17", -- Sukhoi Su-7 and Su-17/Su-20/Su-22
    Flogger = "MiG-23",  --and MiG-27
    Flogger_D = "MiG-27",  --and MiG-23
    Flagon = "Su-15",
    Foxbat = "MiG-25",
    Fulcrum = "MiG-29",
    Foxhound = "MiG-31",
    Flanker = "Su-27", -- Sukhoi Su-27/Su-30/Su-33/Su-35/Su-37 and Shenyang J-11/J-15/J-16
    Flanker_C = "Su-30",
    Flanker_E = "Su-35",
    Flanker_F = "Su-37",
    Flanker_L = "J-11A",
    Firebird = "J-10",
    Sea_Flanker = "Su-33",
    Fullback = "Su-34", -- also Su-32
    Frogfoot = "Su-25",
    Tomcat = "F-14", -- Iran
    Mirage = "Mirage", -- various non-NATO
    Codling = "Yak-40",
    Maya = "L-39",
    -- Fighters US/NATO
    Warthog = "A-10",
    --Mosquito = "A-20",
    Skyhawk = "A-4E",
    Viggen = "AJS37",
    Harrier = "AV-8B",
    Spirit = "B-2",
    Aviojet = "C-101",
    Nighthawk = "F-117A",
    Eagle = "F-15C",
    Mudhen = "F-15E",
    Viper = "F-16",
    Phantom = "F-4E",
    Tiger = "F-5", -- was thinking to name this MiG-25 ;)
    Sabre = "F-86",
    Hornet = "A-18", -- avoiding the slash
    Hawk = "Hawk",
    Albatros = "L-39",
    Goshawk = "T-45",
    Starfighter = "F-104",
    Tornado = "Tornado",
    -- Transport / Bomber / Others
    Atlas = "A400",
    Lancer = "B1-B",
    Stratofortress = "B-52H",
    Hercules = "C-130",
    Super_Hercules = "Hercules",
    Globemaster = "C-17",
    Greyhound = "C-2A",
    Galaxy = "C-5",
    Hawkeye = "E-2D",
    Sentry = "E-3A",
    Stratotanker = "KC-135",
    Extender = "KC-10",
    Orion = "P-3C",
    Viking = "S-3B",
    Osprey = "V-22",
    -- Bomber Rus
    Badger = "H6-J",
    Bear_J = "Tu-142", -- also Tu-95
    Bear = "Tu-95", -- also Tu-142
    Blinder = "Tu-22",
    Blackjack = "Tu-160",
    -- AIC / Transport / Other
    Clank = "An-30",
    Curl = "An-26",
    Candid = "IL-76",
    Midas = "IL-78",
    Mainstay = "A-50", 
    Mainring = "KJ-2000", -- A-50 China
    Yak = "Yak-52",
    -- Helos
    Helix = "Ka-27",
    Shark = "Ka-50",
    Hind = "Mi-24",
    Halo = "Mi-26",
    Hip = "Mi-8",
    Havoc = "Mi-28",
    Gazelle = "SA342",
    -- Helos US
    Huey = "UH-1H",
    Cobra = "AH-1",
    Apache = "AH-64",
    Chinook = "CH-47",
    Sea_Stallion = "CH-53",
    Kiowa = "OH-58",
    Seahawk = "SH-60",
    Blackhawk = "UH-60",
    Sea_King = "S-61",
    -- Drones
    UCAV = "WingLoong",
    Reaper = "MQ-9",
    Predator = "MQ-1A",
  }
}

world.event.S_EVENT_REMOVE_UNIT = world.event.S_EVENT_MAX + 1

ENUMS.EVENTS = {
    Shot =              world.event.S_EVENT_SHOT,
    Hit =               world.event.S_EVENT_HIT,
    Takeoff =           world.event.S_EVENT_TAKEOFF,
    Land =              world.event.S_EVENT_LAND,
    Crash =             world.event.S_EVENT_CRASH,
    Ejection =          world.event.S_EVENT_EJECTION,
    Refueling =         world.event.S_EVENT_REFUELING,
    Dead =              world.event.S_EVENT_DEAD,
    PilotDead =         world.event.S_EVENT_PILOT_DEAD,
    BaseCaptured =      world.event.S_EVENT_BASE_CAPTURED,
    MissionStart =      world.event.S_EVENT_MISSION_START,
    MissionEnd =        world.event.S_EVENT_MISSION_END,
    TookControl =       world.event.S_EVENT_TOOK_CONTROL,
    RefuelingStop =     world.event.S_EVENT_REFUELING_STOP,
    Birth =             world.event.S_EVENT_BIRTH,
    HumanFailure =      world.event.S_EVENT_HUMAN_FAILURE,
    EngineStartup =     world.event.S_EVENT_ENGINE_STARTUP,
    EngineShutdown =    world.event.S_EVENT_ENGINE_SHUTDOWN,
    PlayerEnterUnit =   world.event.S_EVENT_PLAYER_ENTER_UNIT,
    PlayerLeaveUnit =   world.event.S_EVENT_PLAYER_LEAVE_UNIT,
    PlayerComment =     world.event.S_EVENT_PLAYER_COMMENT,
    ShootingStart =     world.event.S_EVENT_SHOOTING_START,
    ShootingEnd =       world.event.S_EVENT_SHOOTING_END,
    MarkAdded =         world.event.S_EVENT_MARK_ADDED,
    MarkChange =        world.event.S_EVENT_MARK_CHANGE,
    MarkRemoved =       world.event.S_EVENT_MARK_REMOVED,
    DetailedFailure           = world.event.S_EVENT_DETAILED_FAILURE,
    Kill                      = world.event.S_EVENT_KILL,
    Score                     = world.event.S_EVENT_SCORE,
    UnitLost                  = world.event.S_EVENT_UNIT_LOST,
    LandingAfterEjection      = world.event.S_EVENT_LANDING_AFTER_EJECTION,
    ParatrooperLanding        = world.event.S_EVENT_PARATROOPER_LENDING,
    DiscardChairAfterEjection = world.event.S_EVENT_DISCARD_CHAIR_AFTER_EJECTION,
    WeaponAdd                 = world.event.S_EVENT_WEAPON_ADD,
    TriggerZone               = world.event.S_EVENT_TRIGGER_ZONE,
    LandingQualityMark        = world.event.S_EVENT_LANDING_QUALITY_MARK,
    BDA                       = world.event.S_EVENT_BDA,
    RemoveUnit                = world.event.S_EVENT_REMOVE_UNIT,
  }

ENUMS.EVENTS.ID = {
  [world.event.S_EVENT_SHOT] = true,
  [world.event.S_EVENT_HIT] = true,
  [world.event.S_EVENT_TAKEOFF] = true,
  [world.event.S_EVENT_LAND] = true,
  [world.event.S_EVENT_CRASH] = true,
  [world.event.S_EVENT_EJECTION] = true,
  [world.event.S_EVENT_REFUELING] = true,
  [world.event.S_EVENT_DEAD] = true,
  [world.event.S_EVENT_PILOT_DEAD] = true,
  [world.event.S_EVENT_BASE_CAPTURED] = true,
  [world.event.S_EVENT_MISSION_START] = true,
  [world.event.S_EVENT_MISSION_END] = true,
  [world.event.S_EVENT_TOOK_CONTROL] = true,
  [world.event.S_EVENT_REFUELING_STOP] = true,
  [world.event.S_EVENT_BIRTH] = true,
  [world.event.S_EVENT_HUMAN_FAILURE] = true,
  [world.event.S_EVENT_ENGINE_STARTUP] = true,
  [world.event.S_EVENT_ENGINE_SHUTDOWN] = true,
  [world.event.S_EVENT_PLAYER_ENTER_UNIT] = true,
  [world.event.S_EVENT_PLAYER_LEAVE_UNIT] = true,
  [world.event.S_EVENT_PLAYER_COMMENT] = true,
  [world.event.S_EVENT_SHOOTING_START] = true,
  [world.event.S_EVENT_SHOOTING_END] = true,
  [world.event.S_EVENT_MARK_ADDED] = true,
  [world.event.S_EVENT_MARK_CHANGE] = true,
  [world.event.S_EVENT_MARK_REMOVED] = true,
  [world.event.S_EVENT_DETAILED_FAILURE] = true,
  [world.event.S_EVENT_KILL]  = true,
  [world.event.S_EVENT_SCORE] = true,
  [world.event.S_EVENT_UNIT_LOST] = true,
  [world.event.S_EVENT_LANDING_AFTER_EJECTION] = true,
  [world.event.S_EVENT_PARATROOPER_LENDING] = true,
  [world.event.S_EVENT_DISCARD_CHAIR_AFTER_EJECTION] = true,
  [world.event.S_EVENT_WEAPON_ADD] = true,
  [world.event.S_EVENT_TRIGGER_ZONE] = true,
  [world.event.S_EVENT_LANDING_QUALITY_MARK] = true,
  [world.event.S_EVENT_BDA] = true,
  [world.event.S_EVENT_REMOVE_UNIT] = true
}

---@author West#9009
---@description Routinely used functions.
---@created 16MAY22

---@class ROUTINES
---@field public util table Utility functions.
---@field public file table File functions.
---@field public os table OS functions.
---@field public os table Git functions.
ROUTINES = {}
ROUTINES.util = {}
ROUTINES.file = {}
ROUTINES.os = {}
ROUTINES.git = {}
ROUTINES.string = {}

---@param object table The object or table to copy.
---@return table The new table with copied metatables.
ROUTINES.util.deepCopy = function(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

function ROUTINES.util.basicSerialize(var)
    if var == nil then
        return "\"\""
    else
        if ((type(var) == 'number') or
                (type(var) == 'boolean') or
                (type(var) == 'function') or
                (type(var) == 'table') or
                (type(var) == 'userdata') ) then
            return tostring(var)
        elseif type(var) == 'string' then
            var = string.format('%q', var)
            return var
        end
    end

end

function ROUTINES.util.oneLineSerialize(tbl)
    if type(tbl) == 'table' then

        local tbl_str = {}

        tbl_str[#tbl_str + 1] = '{ '

        for ind, val in pairs(tbl) do
            if type(ind) == "number" then
                tbl_str[#tbl_str + 1] = '['
                tbl_str[#tbl_str + 1] = tostring(ind)
                tbl_str[#tbl_str + 1] = '] = '
            else
                tbl_str[#tbl_str + 1] = '['
                tbl_str[#tbl_str + 1] = ROUTINES.util.basicSerialize(ind)
                tbl_str[#tbl_str + 1] = '] = '
            end

            if ((type(val) == 'number') or (type(val) == 'boolean')) then
                tbl_str[#tbl_str + 1] = tostring(val)
                tbl_str[#tbl_str + 1] = ', '
            elseif type(val) == 'string' then
                tbl_str[#tbl_str + 1] = ROUTINES.util.basicSerialize(val)
                tbl_str[#tbl_str + 1] = ', '
            elseif type(val) == 'nil' then
                tbl_str[#tbl_str + 1] = 'nil, '
            elseif type(val) == 'table' then
                tbl_str[#tbl_str + 1] = ROUTINES.util.oneLineSerialize(val)
                tbl_str[#tbl_str + 1] = ', '
            else

            end
        end
        tbl_str[#tbl_str + 1] = '}'
        return table.concat(tbl_str)
    else
        return  ROUTINES.util.basicSerialize(tbl)
    end
end

ROUTINES.util.size = function(table)
    local size = 0

    for _ in pairs(table) do
       size = size + 1
    end

    return size
end

---@param FilePath string The file name to test.
---@return boolean Is file?
ROUTINES.file.isFile = function(FilePath)
    local NoPathName = string.match(FilePath, "[^\\]+$")
    local Sub = string.sub(NoPathName, 1, 1)

    if lfs.attributes(FilePath, "mode") == "file" and Sub ~= '.' then
        return true
    else
        return false 
    end 
end

---@param dirName string The directory name to test.
---@return boolean Is directory?
ROUTINES.file.isDir = function(dirName)
    if lfs.attributes(dirName, "mode") == "directory" then
        return true
    else
        return false
    end
end

ROUTINES.file.EDSerialize = function(Name, Value, Level, File)
    if Level == nil then Level = "" end

    if Level ~= "" then Level = Level .."  " end

    File:write(Level, Name, " = ")

    if type(Value) == "number" or type(Value) == "string" or type(Value) == "boolean" then
        File:write(ROUTINES.util.basicSerialize(Value), ",\n")
    elseif type(Value) == "table" then
        File:write("\n" .. Level .. "{\n") -- create a new table

        for k,v in pairs(Value) do -- serialize its fields
            local key

            if type(k) == "number" then
                key = string.format("[%s]", k)
            else
                key = string.format("[%q]", k)
            end

            ROUTINES.file.EDSerialize(key, v, Level.."  ", File)
        end

        if Level == "" then
            File:write(Level .."} -- end of ".. Name .."\n")
        else
            File:write(Level .."}, -- end of " .. Name .."\n")
        end
    end
end

ROUTINES.file.EDSerializeToFile = function(FilePath, FileName, Table)
    local File = io.open(FilePath .. FileName, 'w')
    ROUTINES.file.EDSerialize(FileName, Table, nil, File)
    File:close()
end

ROUTINES.file.read = function(FilePath, FileName)
    local File = io.open(FilePath .. FileName, "r")
    local Contents = File:read("*all")

    File:close()

    return Contents
end

ROUTINES.file.write = function(FilePath, FileName, Contents)
    local File = io.open(FilePath .. FileName, "w")
    File:write(Contents)
    File:close()
end

ROUTINES.os.exec = function(cmd, args)
    args = args or ''

    local status = os.execute(string.format('%s %s', cmd, args))

    return status
end

ROUTINES.os.capture = function(cmd)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()

    return s
end

ROUTINES.os.rmdir = function(dir)
    return ROUTINES.os.exec(string.format('rd /s/q "%s"', dir))
end

-- ASCII only.
ROUTINES.os.copy = function(source, destination)
    return ROUTINES.os.exec(string.format('copy "%s" "%s"', source, destination))
end

ROUTINES.git.reset = function(path)
    return ROUTINES.os.exec(string.format('git -C %s reset -q --hard', path))
end

ROUTINES.git.update = function(path)
    ROUTINES.git.reset(path)
    return ROUTINES.os.exec(string.format('git -C %s pull -qa', path))
end

ROUTINES.git.clone = function(URL, destination)
    local argument = string.format('%s "%s"', URL, destination)
    return ROUTINES.os.exec('git clone -q', argument)
end

ROUTINES.git.raw = function(User, Repo, FilePath)
    local Header = '"Accept:application/vnd.github.v3.raw"'
    local Link = string.format('https://api.github.com/repos/%s/%s/contents/%s', User, Repo, FilePath)

    return ROUTINES.os.capture(string.format('curl -s -H %s %s', Header, Link))
end

ROUTINES.string.split = function(String, Sep)
    local Sep = Sep or '%s'

    local t = {}

    for String in string.gmatch(String, "([^"..Sep.."]+)") do
        table.insert(t, String)
    end

    return t
end

---@author West#9009
---@description Base object in which child objects are derived. Includes functions for logging.
---@created 16MAY22

---@class BASE
---@field public BASE table Public methods and fields.
---@field public ClassName string The name of the class.
---@field public self BASE Self reference.
BASE = {
    ClassName = 'BASE',
    Schedules = {},
    Listeners = {}
}

--- Initialize a new instance.
---@return BASE Returns self.
function BASE:New()
    return ROUTINES.util.deepCopy(self)
end

--- Inherit a parents fields and methods to a new child object.
---@param Child table The object that inherits.
---@param Parent table The object to inherit from.
---@return BASE The new object with inherited methods.
function BASE:Inherit(Child, Parent)
    local Child = ROUTINES.util.deepCopy(Child)

    setmetatable(Child, {__index = Parent})

    return Child
end

---@return string The name of the class.
function BASE:GetClassName()
    return self.ClassName
end

---@param EventID number The event ID to handle.
---@param Callback function The function to callback on.
function BASE:HandleEvent(EventID, Callback)
    __EVENTS:AddEvent(EventID, self, Callback)
end

---@param Seconds number How many seconds until callback function.
---@param Callback function The function to callback on.
function BASE:Schedule(Seconds, Callback, ...)
    timer.scheduleFunction(Callback, ..., timer.getTime() + Seconds)

    return self
end

---@param Repeat number How many seconds until callback function is run, and how many seconds thereafter.
---@param Callback function The function to callback on.
---@return function Returns a function to serve as the ID of the scheduler.
function BASE:ScheduleRepeat(Repeat, Callback, ...)
    self.Schedules[Callback] = true

    timer.scheduleFunction(function(Table, Time)
        if not self.Schedules[Callback] then return nil end

        local callback = Table[1]
        local args = Table[2]

        callback(args)

        return Time + Repeat

    end, { Callback, ... }, self:Now() + Repeat)

    return Callback
end

---@param ScheduleID function The function to stop.
function BASE:ScheduleStop(ScheduleID)
    if self.Schedules[ScheduleID] then
        self.Schedules[ScheduleID] = nil
    end

    return self
end

--- Stop all scheduled functions in this class.
function BASE:ScheduleStopAll()
    for key, _ in pairs(self.Schedules) do
        self.Schedules[key] = nil
    end

    return self
end

--- Log a message to DCS.log
---@param logType string info, warning, error
---@param msg string The message to log.
---@return BASE Returns self.
function BASE:Log(msg, logType, ...)
    logType = logType or 'info'

    local write = function(logType, ...)
        logType(string.format('%s: %s', self:GetClassName(), string.format(msg, ...)))
    end

    local logTypes = {
        info = env.info,
        warning = env.warning,
        error = env.error
    }

    write(logTypes[logType], ...)

    return self
end

--- Log an info message to DCS.log
---@param msg string The message to log.
---@return BASE Returns self.
function BASE:Info(msg, ...)
    self:Log(msg, 'info', ...)

    return self
end

--- Log an error message to DCS.log
---@param msg string The message to log.
---@return BASE Returns self.
function BASE:Error(msg, ...)
    self:Log(msg, 'error', ...)

    return self
end

--- Log a warning message to DCS.log
---@param msg string The message to log.
---@return BASE Returns self.
function BASE:Warning(msg, ...)
    self:Log(msg, 'warning', ...)

    return self
end

--- Log a serialized variable to DCS.log
---@param Variable any The variable to serialize. Should be a field within a table.
---@return BASE Returns self.
function BASE:L(Variable)
    if not type(Variable) == 'table' then
        Variable = {Variable}
    end

    self:Info('%30s', ROUTINES.util.oneLineSerialize(Variable))

    return self
end

--- Create a remove event to handle.
---@param Time number The time the event occurred.
---@param Initiator table The object that initiated the event.
function BASE:CreateEventRemoveUnit(Time, Initiator)
    local Event = {
        id = ENUMS.EVENTS.RemoveUnit,
        time = Time,
        initiator = Initiator
    }

    world.onEvent(Event)

    return self
end

--- Get the current time.
---@return number The current time.
function BASE:Now()
    return timer.getTime()
end

function BASE:AddListener(Port, Callback)
    self.Listeners[Port] = SERVER:UDP(Port)

    self.Listeners[Port]:Start()

    self:Info(string.format('Listener added on port %s.', Port))

    return Port
end

function BASE:RemoveListener(Port)
    self.Listeners[Port]:Stop()

    self.Listeners[Port] = nil

    return self
end

function BASE:RemoveAllListeners()
    for _, Listener in pairs(self.Listeners) do
        Listener:Stop()
    end

    self.Listeners = {}

    return self
end

---@author West#9009
---@description Event dispatching. Based in part from MOOSE.
---@created 20MAY22

---@class EVENTS
EVENTS = {
    ClassName = 'EVENTS'
}

--- Initialize a new instance.
---@type BASE
---@return EVENTS Returns self.
function EVENTS:New()
    local self = BASE:Inherit(self, BASE:New())

    world.addEventHandler(self)

    return self
end

--- Event handler and dispatcher.
---@param Event number The event ID
function EVENTS:onEvent(Event)
    if ENUMS.EVENTS.ID[Event.id] then
        local EventData = {}

        if Event.initiator then
            EventData.IniObjectCategory = Event.initiator:getCategory()

            if EventData.IniObjectCategory == Object.Category.STATIC then
                if Event.id ~= 31 and Event.id ~= 33 then
                    EventData.IniDCSUnit = Event.initiator
                    EventData.IniDCSUnitName = EventData.IniDCSUnit:getName()
                    EventData.IniCoalition = EventData.IniDCSUnit:getCoalition()
                    EventData.IniCategory = EventData.IniDCSUnit:getDesc().category
                    EventData.IniTypeName = EventData.IniDCSUnit:getTypeName()
                end
            end

            if EventData.IniObjectCategory == Object.Category.UNIT then
                EventData.IniDCSUnit = Event.initiator
                EventData.IniDCSUnitName = EventData.IniDCSUnit:getName()
                EventData.IniUnit = UNIT:FindByName(EventData.IniDCSUnitName)
                EventData.IniDCSGroup = EventData.IniDCSUnit:getGroup()

                if EventData.IniDCSGroup and EventData.IniDCSGroup:isExist() then
                    EventData.IniDCSGroupName = EventData.IniDCSGroup:getName()
                    EventData.IniGroupName = EventData.IniDCSGroupName
                end

                EventData.IniPlayerName = EventData.IniDCSUnit:getPlayerName()
                EventData.IniCoalition = EventData.IniDCSUnit:getCoalition()
                EventData.IniTypeName = EventData.IniDCSUnit:getTypeName()
                EventData.IniCategory = EventData.IniDCSUnit:getDesc().category
            end

            if Event.target then
                EventData.TgtObjectCategory = Event.target:getCategory()

                if EventData.TgtObjectCategory == Object.Category.UNIT then
                    EventData.TgtDCSUnit = Event.target
                    EventData.TgtDCSGroup = EventData.TgtDCSUnit:getGroup()
                    EventData.TgtDCSUnitName = EventData.TgtDCSUnit:getName()
                    EventData.TgtDCSGroupName = ""

                    if EventData.TgtDCSGroup and EventData.TgtDCSGroup:isExist() then
                        EventData.TgtDCSGroupName = EventData.TgtDCSGroup:getName()
                    end

                    EventData.TgtPlayerName = EventData.TgtDCSUnit:getPlayerName()
                    EventData.TgtCoalition = EventData.TgtDCSUnit:getCoalition()
                    EventData.TgtCategory = EventData.TgtDCSUnit:getDesc().category
                    EventData.TgtTypeName = EventData.TgtDCSUnit:getTypeName()
                end

                if EventData.TgtObjectCategory == Object.Category.STATIC then
                    EventData.TgtDCSUnit = Event.target
                    if EventData.TgtDCSUnit:isExist() and Event.id ~= 33 then
                        EventData.TgtDCSUnitName = EventData.TgtDCSUnit:getName()
                        EventData.TgtCoalition = EventData.TgtDCSUnit:getCoalition()
                        EventData.TgtCategory = EventData.TgtDCSUnit:getDesc().category
                        EventData.TgtTypeName = EventData.TgtDCSUnit:getTypeName()
                    end
                end

                if EventData.TgtObjectCategory == Object.Category.SCENERY then
                    EventData.TgtDCSUnit = Event.target
                    EventData.TgtDCSUnitName = EventData.TgtDCSUnit:getName()
                    EventData.TgtCategory = EventData.TgtDCSUnit:getDesc().category
                    EventData.TgtTypeName = EventData.TgtDCSUnit:getTypeName()
                end
            end

            if Event.weapon then
                EventData.Weapon = Event.weapon
                EventData.WeaponName = EventData.Weapon:getTypeName()
            end

            if Event.place then
                if not Event.id==EVENTS.LandingAfterEjection then
                    EventData.PlaceName=Event.Place:GetName()
                end
            end

            if Event.idx then
                EventData.MarkID=Event.idx
                EventData.MarkVec3=Event.pos
                EventData.MarkText=Event.text
                EventData.MarkCoalition=Event.coalition
                EventData.MarkGroupID = Event.groupID
            end

            if Event.cargo then
                EventData.Cargo = Event.cargo
                EventData.CargoName = Event.cargo.Name
            end

            if Event.zone then
                EventData.Zone = Event.zone
                EventData.ZoneName = Event.zone.ZoneName
            end
        end

        if self._events then
            if self._events[Event.id] then
                for key, object in pairs(self._events[Event.id]) do
                    if object.callback then
                        pcall(function()
                            if EventData.IniObjectCategory == Object.Category.UNIT and object ~= __DATABASE then
                                if EventData.IniUnit == nil then
                                    EventData.IniUnit = UNIT:FindByName(EventData.IniDCSUnitName)
                                end
                            end

                            object.callback(key, EventData)
                        end)
                    end
                end
            end
        end
    else
        self:Warning('Unknown eventID = %s', Event.id)
    end
end

--- Adds an object and callback function to the event dispatching table.
---@param eventID number The event ID to handle.
---@param object table The class or object to index into dispatcher.
---@param callback function The function to call when the event occurs.
function EVENTS:AddEvent(eventID, object, callback)
    self._events = self._events or {}

    if not self._events[eventID] then
        self._events[eventID] = {}
    end

    if not self._events[eventID][object] then
        self._events[eventID][object] = {}
    end

    self._events[eventID][object]['callback'] = callback
end

---@author West#9009
---@description Functions for retrieving zones.
---@created 22MAY22

ZONE = {
    ClassName = 'ZONE',
}

function ZONE:New(zone)
    local self = BASE:Inherit(self, BASE:New())

    if zone.verticies then self.Vertices = zone.verticies end

    self.Radius = zone.radius
    self.ZoneID = zone.zoneId
    self.Color = zone.color
    self.properties = zone.properties
    self.x = zone.x
    self.z = zone.y
    self.Name = zone.name
    self.Type = zone.type

    return self
end

function ZONE:FindByName(Name)
    local Zone = __DATABASE._Zones[Name]

    if Zone then
        return Zone
    end

    return nil
end

function ZONE:GetVec2()
    return {x = self.x, z = self.z}
end

function ZONE:GetRandomVec2(SurfaceType)
    local iterations = 0

    local test = function()
        local NotValid = false
        local x, z

        -- Is a circle
        if not self.Vertices then
            local radius = self.Radius * math.sqrt(math.random())
            local theta = math.random() * 2 * math.pi

            x = self.x + radius * math.cos(theta)
            z = self.z + radius * math.sin(theta)
        -- Is a quadrilateral
        else
            local rx = math.random()
            local ry = math.random()

            x = (1 - rx) * ((1 - ry) * self.Vertices[1].x + ry * self.Vertices[4].x) + rx * ((1 - ry) * self.Vertices[2].x + ry * self.Vertices[3].x)
            z = (1 - rx) * ((1 - ry) * self.Vertices[1].y + ry * self.Vertices[4].y) + rx * ((1 - ry) * self.Vertices[2].y + ry * self.Vertices[3].y)
        end


        if land.getSurfaceType({x = x, y = z}) == SurfaceType then

            local Sphere =  {
                id = world.VolumeType.SPHERE,
                params = {
                    point = {x = x, y = land.getHeight({x = x, y = z}), z = z},
                    radius = 50
                }
            }

            local search = function(object)
                if object:isExist() then

                    NotValid = true

                    return false
                end
            end

            world.searchObjects(Object.Category.SCENERY, Sphere, search)
            world.searchObjects(Object.Category.UNIT, Sphere, search)

            if NotValid then
                return nil
            end

            return {x = x, z = z}
        else
            return nil
        end
    end

    while(iterations < 100) do
        local result = test()

        if result then
            return result
        end

        iterations = iterations + 1
    end
end

function ZONE:GetVec3()
    local Vec3 = self:GetVec2()
    Vec3.y = land.getHeight({x = Vec3.x, y = Vec3.z})

    return Vec3
end

function ZONE:Illuminate()
    local Vec3 = self:GetVec3()

    Vec3.y = Vec3.y + 300

    trigger.action.illuminationBomb(Vec3)

    return self
end

function ZONE:GetName()
    return self.Name
end

---@author West#9009
---@description Databasing of DCS objects.
---@created 21MAY22

---@type BASE
---@class DATABASE
DATABASE = {
    ClassName = 'DATABASE',
    _Groups = {},
    _Units = {},
    _Statics = {},
    _Zones = {},
    _Airbases = {},
    _GroupIterator = 1
}

function DATABASE:New()
    local self = BASE:Inherit(self, BASE:New())

    self:HandleEvent(ENUMS.EVENTS.Birth, self._OnBirth)
    self:HandleEvent(ENUMS.EVENTS.Dead, self._OnGone)
    self:HandleEvent(ENUMS.EVENTS.Crash, self._OnGone)
    self:HandleEvent(ENUMS.EVENTS.RemoveUnit, self._OnGone)
    self:HandleEvent(ENUMS.EVENTS.PlayerLeaveUnit, self._OnGone)
    self:_SearchGroups('Groups')
    self:_SearchGroups('Statics')
    self:_SearchGroups('Airbases')
    self:_SearchZones()

    return self
end

function DATABASE:Add(Table, Name, class, ...)
    if not Table[Name] then
        Table[Name] = class:New(...)

        return Table[Name]
    end

    return nil
end

function DATABASE:Remove(Table, Name)
    if Table[Name] then
        Table[Name] = nil

        return true
    end

    return false
end

function DATABASE:_SearchGroups(search)
    local Coalitions = {}

    if search == 'Groups' then
        Coalitions.Red = coalition.getGroups(coalition.side.RED)
        Coalitions.Blue = coalition.getGroups(coalition.side.BLUE)
        Coalitions.Neutral = coalition.getGroups(coalition.side.NEUTRAL)
    elseif search == 'Statics' then
        Coalitions.Red = coalition.getStaticObjects(coalition.side.RED)
        Coalitions.Blue = coalition.getStaticObjects(coalition.side.BLUE)
        Coalitions.Neutral = coalition.getStaticObjects(coalition.side.NEUTRAL)
    elseif search == 'Airbases' then
        Coalitions.Red = coalition.getAirbases(coalition.side.RED)
        Coalitions.Blue = coalition.getAirbases(coalition.side.BLUE)
        Coalitions.Neutral = coalition.getAirbases(coalition.side.NEUTRAL)
    end

    for _, data in pairs(Coalitions) do
        for _, group in pairs(data) do
            if group:isExist() then
                local GroupName = group:getName()

                if search == 'Statics' then
                    self:Add(self._Statics, GroupName, STATIC, GroupName)
                elseif search == 'Airbases' then
                    self:Add(self._Airbases, GroupName, AIRBASE, GroupName)
                elseif search == 'Groups' then
                    self:Add(self._Groups, GroupName, GROUP, GroupName)

                    local Units = group:getUnits()

                    for _, unit in pairs(Units) do
                        local UnitName = unit:getName()

                        self:Add(self._Units, UnitName, UNIT, UnitName)
                    end
                end
            end
        end
    end
end

function DATABASE:_SearchZones()
    local Zones = env.mission.triggers.zones

    for _, zone in pairs(Zones) do
        local ZoneName = zone.name

        self:Add(self._Zones, ZoneName, ZONE, zone)
    end
end

function DATABASE:_OnBirth(Event)
    if Event.IniDCSUnit then
        if Event.IniObjectCategory == 3 then
            self:Add(self._Statics, Event.IniDCSUnitName, STATIC, Event.IniDCSUnitName)
        elseif Event.IniObjectCategory == 1 then
            self:Add(self._Groups, Event.IniDCSGroupName, GROUP, Event.IniDCSGroupName)

            if Event.IniPlayerName then
                local NetPlayerInfos = NET:GetAllPlayersInfo()
                local ucid = NetPlayerInfos[Event.IniPlayerName].ucid

                self:Add(self._Units, Event.IniDCSUnitName, UNIT, Event.IniDCSUnitName, ucid)
            else
                self:Add(self._Units, Event.IniDCSUnitName, UNIT, Event.IniDCSUnitName)
            end

            if Airbase.getByName(Event.IniDCSUnitName) then
                self:Add(self._Airbases, Event.IniDCSUnitName, AIRBASE, Event.IniDCSUnitName)
            end
        end
    end
end

function DATABASE:_OnGone(Event)
    if Event.IniDCSUnit then
        if Event.IniObjectCategory == 3 then
            self:Remove(self._Statics, Event.IniDCSUnitName)
        elseif Event.IniObjectCategory == 1 then
            self:Remove(self._Units, Event.IniDCSUnitName)
            if Airbase.getByName(Event.IniDCSUnitName) then
                self:Remove(self._Airbases, Event.IniDCSUnitName)
            end
        end
    end
end

function DATABASE:_Iterate()
    self._GroupIterator = self._GroupIterator + 1

    return self._GroupIterator - 1
end

function DATABASE:GetGroups()
    return self._Groups
end

function DATABASE:GetUnits()
    return self._Units
end

function DATABASE:GetZones()
    return self._Zones
end

function DATABASE:GetAirbases()
    return self._Airbases
end

function DATABASE:GetStatics()
    return self._Statics
end

---@author West#9009
---@description Functions for dynamically adding groups into mission.
---@created 22MAY22

---@type BASE
---@class SPAWN
SPAWN = {
    ClassName = 'SPAWN',
    Offset = {x = 0, z = 10},
    UnitIterator = 1,
    GroupIterator = 0
}

--- Create a new ground unit SPAWN class from a type name.
---@param TypeUnit string Optional The type name of the unit to spawn.
---@param Country number Optional The country ID of the unit to spawn.
---@param Name string Optional The name of the unit to spawn.
---@param Skill string Optional The skill of the unit to spawn. {'Excellent', 'High', 'Good', 'Average', 'Random'}
---@param Heading number Optional The heading to spawn in radians.
---@param CanDrive boolean Optional Can the unit be player driven.
---@param Args table Optional Hard set values. eg. {x = number, y = number}
---@return SPAWN Returns self.
function SPAWN:NewGroundFromType(TypeUnit, Country, Name, Skill, Heading, CanDrive, Args)
    local self = BASE:Inherit(self, BASE:New())

    self.Name = Name or 'Group#' .. __DATABASE:_Iterate()
    self.Static = false
    self.Category = Group.Category.GROUND
    self.TypeUnit = TypeUnit or 'Leopard-2'
    self.Country = Country or country.id.USA
    self.Skill = Skill or 'Random'
    self.Heading = Heading or 0
    self.CanDrive = CanDrive or true
    self.Args = Args or {}
    self.Units = {}

    self:AddUnit()

    return self
end

function SPAWN:NewTemplateFromGroup(Group)
    if not Group:GetClassName() == 'GROUP' then return nil end

    local self = BASE:Inherit(self, BASE:New())

    self.Name = 'Group#' .. __DATABASE:_Iterate()
    self.Static = false
    self.Category = Group:GetCategory()
    self.Country = Group:GetCountry()
    self.Skill = 'Random'
    self.CanDrive = true
    self.Units = {}

    local Units = Group:GetUnits()

    for _, Unit in ipairs(Units) do
        local Type = Unit:GetType()
        local Heading = math.rad(Unit:GetHeading())
        local Vec2 = Unit:GetVec3()

        self:AddUnit(Type, nil, nil, Heading, nil, {x = Vec2.x, y = Vec2.z})
    end

    return self
end

function SPAWN:NewEmptyGroundGroup(Name, Country, Args)
    local self = BASE:Inherit(self, BASE:New())

    self.Name = Name or 'Group#' .. __DATABASE:_Iterate()
    self.Static = false
    self.Category = Group.Category.GROUND
    self.Country = Country or country.id.USA
    self.Args = Args or {}
    self.Units = {}

    return self
end

--- Create a new static object SPAWN class from a type name.
---@param TypeUnit string Optional The type name of the unit to spawn.
---@param Category string Optional The category of the static object. eg. 'Heliports'.
---@param Country number Optional The country ID of the unit to spawn.
---@param Heading number Optional The heading to spawn in radians.
---@param Livery string Optional The livery of an aircraft static object.
---@param ShapeFile string Optional The shapefile as required by some statics. eg. 'invisiblefarp' for Invis. FARPs
---@param FARP boolean Optional Is the static a FARP.
---@param Callsign number Optional The callsign of the FARP.
---@param Freq number Optional The frequency of the FARP.
---@param Mod number Optional The modulation of the FARP.
---@return SPAWN Returns self.
function SPAWN:NewStaticFromType(TypeUnit, ShapeFile, Category, Country, Name, Dead, Heading, Livery, FARP, Callsign, Freq, Mod)
    local self = BASE:Inherit(self, BASE:New())

    self.Name = Name or 'Static#' .. __DATABASE:_Iterate()
    self.Dead = Dead or false
    self.Static = true
    self.Category = Category or nil
    self.TypeUnit = TypeUnit or nil
    self.Country = Country or country.id.USA
    self.Heading = Heading or 0

    if Livery then
        self.Livery = Livery
    end

    if ShapeFile then
        self.ShapeFile = ShapeFile
    end

    if FARP then
        self.FARP = FARP
        self.Callsign = Callsign or 1
        self.Freq = Freq or 127.5
        self.Mod = Mod or 0
        self.Name = 'FARP#' .. __DATABASE._GroupIterator
    end

    return self
end

function SPAWN:InitCanDrive(Flag)
    if not type(Flag) == 'boolean' then return end

    self.CanDrive = Flag

    return self
end

function SPAWN:InitSkill(Level)
    local Levels = {
        ['Random'] = 'Random',
        ['Average'] = 'Average',
        ['Good'] = 'Good',
        ['High'] = 'High',
        ['Excellent'] = 'Excellent'
    }

    if not Levels[Level] then return nil end

    self.Skill = Levels[Level]

    return self
end

function SPAWN:InitName(Name)
    self.Name = Name

    return self
end

function SPAWN:InitCountry()

end

--- Add units before spawning to the instantiated SPAWN class. Works only for non-static objects.
---@param TypeUnit string Optional The type name of the unit to spawn.
---@param Name string Optional The Name of the unit to spawn.
---@param Skill string Optional The skill of the unit to spawn. {'Excellent', 'High', 'Good', 'Average', 'Random'}
---@param Heading number Optional The heading to spawn in radians.
---@param CanDrive boolean Optional Can the unit be player driven.
---@param Args table Optional Hard set values. eg. {x = number, y = number}
---@return SPAWN Returns self.
function SPAWN:AddUnit(TypeUnit, Name, Skill, Heading, CanDrive, Args)
    local unit = {}

    unit.type = TypeUnit or self.TypeUnit
    unit.skill = Skill or self.Skill
    unit.name = Name or string.format('%s-%s', self.Name, self.UnitIterator)
    unit.playerCanDrive = CanDrive or self.CanDrive
    unit.heading = Heading or math.rad(math.random(0, 359))

    if Args then
        for key, value in pairs(Args) do
            unit[key] = value
        end
    end

    table.insert(self.Units, unit)
    self:_IterateUnits()

    return self
end

--- Spawn a group without provided coordinates. All units must be built with coordinates for this to work.
function SPAWN:_SpawnGroup()
    coalition.addGroup(self.Country, self.Category, self:_GetTemplate())

    return GROUP:FindByName(self.Name)
end

--- Spawn the GROUP or STATIC object into the mission environment with a Vec2 coordinate.
---@param Vec2 Vec2 The coordinate in which to spawn the GROUP or STATIC.
---@return STATIC|GROUP Returns a GROUP or STATIC.
function SPAWN:SpawnFromVec2(Vec2)
    self.Vec2 = Vec2

    if not self.Static then
        if ROUTINES.util.size(self.Units) == 0 then return end

        for i, unit in ipairs(self.Units) do

            if i == 1 then
                if unit.x and unit.y then
                    self:Info('I have x and y')

                    self.Origin = {
                        x = unit.x,
                        y = unit.y
                    }
                end

                unit.x = self.Vec2.x
                unit.y = self.Vec2.z
            else
                if not unit.x and not unit.y then
                    unit.x = self.Vec2.x + self.Offset.x
                    unit.y = self.Vec2.z + self.Offset.z
                    self.Offset.x = self.Offset.x + self.Offset.x
                    self.Offset.z = self.Offset.z + self.Offset.z
                else
                    unit.x = self.Vec2.x + (unit.x - self.Origin.x)
                    unit.y = self.Vec2.z + (unit.y - self.Origin.y)
                end
            end
        end

        local template = self:_GetTemplate()

        coalition.addGroup(self.Country, self.Category, template)

        self:L{self.GroupIterator}
        return GROUP:FindByName(template.name)
    else
        if self.FARP then
            coalition.addGroup(self.Country, -1, self:_GetTemplate())
            __DATABASE:Add(__DATABASE._Airbases, self.Name, AIRBASE, self.Name)
            __DATABASE:Add(__DATABASE._Statics, self.Name, STATIC, self.Name)

            return STATIC:FindByName(self.Name)
        else
            coalition.addStaticObject(self.Country, self:_GetTemplate())

            return STATIC:FindByName(self.Name)
        end
    end
end

--- Spawn the GROUP or STATIC object into the mission environment with a zone.
---@param Zone ZONE The zone in which to spawn the GROUP or STATIC.
---@return STATIC|GROUP Returns a GROUP or STATIC.
function SPAWN:SpawnFromZone(Zone)
    local Vec2 = Zone:GetVec2()

    return self:SpawnFromVec2(Vec2)
end

function SPAWN:SpawnFromZoneRandomVec2(Zone, SurfaceType)
    local Vec2 = Zone:GetRandomVec2(SurfaceType)

    if Vec2 then
        return self:SpawnFromVec2(Vec2)
    end

    return nil
end

--- Modify the SPAWN class default offsets.
---@param Args table The offset values to change. eg. {x = 10, y = -5} or {x = 2}.
---@return SPAWN Returns self.
function SPAWN:SetOffset(Args)
    local Vec2x = self.Offset.x
    local Vec2z = self.Offset.z

    if type(Args) == 'table' then
        if Args.x then
            Vec2x = Args.x
        end

        if Args.z then
            Vec2z = Args.z
        end

        self.Offset = {x = Vec2x, z = Vec2z}
    end

    return self
end

function SPAWN:_GetTemplate()
    local template = {}

    template.name = string.format('%s#%s', self.Name, self:_IterateGroups())

    if not self.Static then
        template.tasks = {}
        template.units = self.Units
    else
        template.name = self.Name
        template.type = self.TypeUnit
        template.category = self.Category
        template.x = self.Vec2.x
        template.y = self.Vec2.z
        template.heading = self.Heading
        template.dead = self.Dead

        if self.ShapeFile then
            template.shape_name = self.ShapeFile
        end

        if self.Livery then
            template.livery_id = self.Livery
        end

        if self.FARP then
            local group = {}

            template.heliport_callsign_id = self.Callsign
            template.heliport_frequency = self.Freq
            template.heliport_modulation = self.Mod
            group.units = {}
            group.units[1] = template
            group.name = string.format('%s#%s', self.Name, self:_IterateGroups())

            return group
        end
    end

    return template
end

function SPAWN:_IterateUnits()
    self.UnitIterator = self.UnitIterator + 1
end

function SPAWN:_IterateGroups()
    self.GroupIterator = self.GroupIterator + 1

    return self.GroupIterator
end

---@author West#9009
---@description Static Set module. The set only returns collections that existed at the time of installation.
---@created 20MAY22

---@type BASE
SET = {
    ClassName = 'SET'
}

function SET:CreateFrom(Type)
    local self = BASE:Inherit(self, BASE:New())

    local Classes = {
        ['Groups'] = __DATABASE:GetGroups(),
        ['Units'] = __DATABASE:GetUnits(),
        ['Statics'] = __DATABASE:GetStatics(),
        ['Airbases'] = __DATABASE:GetAirbases(),
        ['Zones'] = __DATABASE:GetZones()
    }

    if not Classes[Type] then return nil end

    self.Class = ROUTINES.util.deepCopy(Classes[Type])
    self.Type = Type

    return self
end

function SET:RemoveByName(Name)
    if self.Class[Name] then
        self.Class[Name] = nil
    end

    return self
end

function SET:FilterName(RegEx)
    for Name, _ in pairs(self.Class) do
        -- Escape '-' in-case name has unescaped '-'
        local Name = string.gsub(Name, "-", "%%-")

        if not string.match(Name, RegEx) then
            self:RemoveByName(Name)
        end
    end

    return self
end

function SET:FilterCategory(Category)
    for Name, Object in pairs(self.Class) do
        if not Object.GetCategory then break end

        local ObjectCategory = Object:GetCategory()

        if Category ~= ObjectCategory then
            self:RemoveByName(Name)
        end
    end

    return self
end

function SET:ForEach(Callback, ...)
    for _, object in pairs(self.Class) do
        Callback(object, ...)
    end

    return self
end

---@author West#9009
---@description Menu and Menu command functions.
---@created 15JUN22

---@type BASE
MENU = {
    ClassName = 'MENU',
    Commands = {},
    SubMenus = {}
}

--- Instantiate a new MENU object.
---@param Name string The name of the menu.
---@return self
function MENU:New(Name)
    if not Name then return end

    local self = BASE:Inherit(self, BASE:New())

    self.Name = Name

    return self
end

--- Add a SubMenu by passing another Menu object.
---@param Menu table The Menu object to add as a SubMenu.
---@return self
function MENU:AddSubMenu(Menu)
    if not Menu.GetClassName then return end
    if not Menu:GetClassName() == 'MENU' then return end

    self.SubMenus[Menu] = Menu

    return self
end

--- Add a command to the menu.
---@param Name string The name of the command to be executed.
---@param Callback function The function to be executed.
---@return self
function MENU:AddCommand(Name, Callback, ...)
    if not type(Name) == 'string' then return end
    if not type(Callback) == 'function' then return end

    self.Commands[Callback] = {Name = Name, Callback = Callback, Args = ... or {}}

    return self
end

--- Internal function to add the submenus and commands recursively from the root Menu object.
---@param Who table Who args.
---@return self
function MENU:_Add(Who)
    local AddMenu = {}

    AddMenu.Group = function() return missionCommands.addSubMenuForGroup(Who.ID, self.Name, Who.Root) end
    AddMenu.Coalition = function() return missionCommands
            .addSubMenuForCoalition(Who.CoalitionEnum, self.Name, Who.Root) end
    AddMenu.All = function() return missionCommands.addSubMenu(self.Name, Who.Root) end

    local AddCommand = {}

    AddCommand.Group = function(self, Command) return missionCommands
                    .addCommandForGroup(Who.ID, Command.Name, self.Root, Command.Callback, Command.Args) end
    AddCommand.Coalition = function(self, Command) return missionCommands
            .addCommandForCoalition(Who.CoalitionEnum, Command.Name, self.Root, Command.Callback, Command.Args) end
    AddCommand.All = function(self, Command) return missionCommands
            .addCommand(Command.Name, self.Root, Command.Callback, Command.Args) end

    self.Root = AddMenu[Who.Who](self)
    Who.Root = self.Root

    for _, Menu in pairs(self.SubMenus) do
        Menu:_Add(Who)
    end

    for _, Command in pairs(self.Commands) do
        self.Commands[Command.Callback].Ref = AddCommand[Who.Who](self, Command)
    end

    return self
end

--- Internal function to remove items from Menu from a certain point
---@param Who table Who args.
---@return self
function MENU:_Remove(Who)
    if not Who.Root then return end

    local Remove = {}

    Remove.Group = function() return missionCommands.removeItemForGroup(Who.ID, Who.Root) end
    Remove.Coalition = function() return missionCommands
            .removeItemForCoalition(Who.CoalitionEnum, Who.Root) end
    Remove.All = function() return missionCommands.removeItem(Who.Root) end

    Remove[Who.Who]()

    return self
end

--- Add the Menu to a group.
---@param Group table The Group object wrapper to add.
---@return self
function MENU:AddToGroup(Group)
    if not Group.GetClassName then return end
    if not Group:GetClassName() == 'GROUP' then return end

    local Who = {}
    Who.ID = Group:GetID()
    Who.Who = 'Group'

    self:_Add(Who)

    return self
end

--- Add a menu to an entire Coalition.
---@param CoalitionEnum number The Coalition to add.
---@return self
function MENU:AddToCoalition(CoalitionEnum)
    local Who = {}

    Who.CoalitionEnum = CoalitionEnum
    Who.Who = 'Coalition'

    self:_Add(Who)

    return self
end

--- Add a menu to everyone.
---@return self
function MENU:AddToAll()
    local Who = {}

    Who.Who = 'All'

    self:_Add(Who)

    return self
end

--- Remove a menu from a group.
---@param MenuOrFunction table|function The menu or function to remove.
---@param Group table The Group wrapper to remove.
---@return self
function MENU:RemoveFromGroup(MenuOrFunction, Group)
    if not Group.GetClassName then return end
    if not Group:GetClassName() == 'GROUP' then return end

    local Who = {}

    Who.Who = 'Group'
    Who.ID = Group:GetID()
    Who.Root = self.SubMenus[MenuOrFunction].Root or self.Commands[MenuOrFunction].Ref

    self:_Remove(Who)

    return self
end

--- Remove a menu from a coalition.
---@param MenuOrFunction table|function The menu or function to remove.
---@param CoalitionEnum number The coalition to remove.
---@return self
function MENU:RemoveFromCoalition(MenuOrFunction, CoalitionEnum)
    local Who = {}

    Who.Who = 'Coalition'
    Who.CoalitionEnum = CoalitionEnum
    Who.Root = self.Commands[MenuOrFunction].Ref

    self:_Remove(Who)

    return self
end

--- Remove a menu or function from everyone.
---@param MenuOrFunction table|function The menu or function to remove.
---@return self
function MENU:RemoveFromAll(MenuOrFunction)
    local Who = {}

    Who.Who = 'All'
    Who.Root = self.Commands[MenuOrFunction].Ref

    self:_Remove(Who)

    return self
end

---@author West#9009
---@description Messenger functions
---@created 19JUN22

---@type BASE
---@class MESSAGE
MESSAGE = {
    ClassName = 'MESSAGE'
}

--- Instantiate a new Message object.
---@param Message string The message to be sent.
---@param DefaultTime number The amount of time a message will last.
---@param Prefix string The prefix to adjoin the the message. eg 'Test: msg....' where the prefix is 'Test'
---@param Clear boolean True: The message clear as soon as time is up. False: The message will fade.
---@return self
function MESSAGE:New(Message, DefaultTime, Prefix, Clear)
    if not Message then return end

    local self = BASE:Inherit(self, BASE:New())

    self.Message = Message
    self.Time = DefaultTime or 10
    self.Clear = Clear or false

    if Prefix then
        self.Prefix = Prefix
        self.Message = self:_AdjoinPrefix(self.Message)
    end

    return self
end

--- Internal function to adjoin a prefix to a string.
---@param String string The String to append to self.Prefix
---@return string
function MESSAGE:_AdjoinPrefix(String)
    if not String then return end
    if not type(String) == 'string' then return end
    if not self.Prefix then return String end

    return string.format('%s: %s', self.Prefix, String)
end

--- Set the message Prefix
---@param Prefix string The prefix to adjoin to messages.
---@return self
function MESSAGE:SetPrefix(Prefix)
    if not type(Prefix) == 'string' or not Prefix == nil then return end

    self.Prefix = Prefix

    return self
end

--- Send the message to a specific unit.
---@param Unit table The Unit wrapper object.
---@param Time number Optional. Override time to a set time.
---@param Clear boolean Optional. Override Clear to true or false.
---@param Message string Optional. Override message to a different message.
---@return self
function MESSAGE:ToUnit(Unit, Time, Clear, Message)
    if not Unit.GetClassName then return end
    if not Unit:GetClassName() == 'UNIT' then return end

    local ID = Unit:GetID()
    Time = Time or 10
    Message = self:_AdjoinPrefix(Message) or self.Message
    Clear = Clear or self.Clear

    trigger.action.outTextForUnit(ID, Message, Time, Clear)

    return self
end

--- Send the message to a specific group.
---@param Group table The Group wrapper object.
---@param Time number Optional. Override time to a set time.
---@param Clear boolean Optional. Override Clear to true or false.
---@param Message string Optional. Override message to a different message.
---@return self
function MESSAGE:ToGroup(Group, Time, Clear, Message)
    if not Group.GetClassName then return end
    if not Group:GetClassName() == 'GROUP' then return end

    local ID = Group:GetID()
    Time = Time or self.Time
    Message = self:_AdjoinPrefix(Message) or self.Message
    Clear = Clear or self.Clear

    trigger.action.outTextForGroup(ID, Message, Time, Clear)

    return self
end

--- Send the message to a specific country.
---@param CountryID number The country ID.
---@param Time number Optional. Override time to a set time.
---@param Clear boolean Optional. Override Clear to true or false.
---@param Message string Optional. Override message to a different message.
---@return self
function MESSAGE:ToCountry(CountryID, Time, Clear, Message)
    if not type(CountryID) == 'number' then return end

    Time = Time or self.Time
    Message = self:_AdjoinPrefix(Message) or self.Message
    Clear = Clear or self.Clear

    trigger.action.outTextForCountry(CountryID, Message, Time, Clear)
end

--- Send the message to a specific country.
---@param CoalitionEnum number The coalition ID.
---@param Time number Optional. Override time to a set time.
---@param Clear boolean Optional. Override Clear to true or false.
---@param Message string Optional. Override message to a different message.
---@return self
function MESSAGE:ToCoalition(CoalitionEnum, Time, Clear, Message)
    if not type(CoalitionEnum) == 'number' then return end

    Time = Time or self.Time
    Message = self:_AdjoinPrefix(Message) or self.Message
    Clear = Clear or self.Clear

    trigger.action.outTextForCoalition(CoalitionEnum, Message, Time, Clear)
end

--- Send the message to everyone.
---@param Time number Optional. Override time to a set time.
---@param Clear boolean Optional. Override Clear to true or false.
---@param Message string Optional. Override message to a different message.
---@return self
function MESSAGE:ToAll(Time, Clear, Message)
    Time = Time or self.Time
    Message = self:_AdjoinPrefix(Message) or self.Message
    Clear = Clear or self.Clear

    trigger.action.outText(Message, Time, Clear)
end

--- Send the message to MP Chat-box with or without recipient. Additional From to appear from other user.
---@param Message string Optional. Override message to a different message.
---@param To string | number Optional. UCID, PlayerID, or Name of recipient.
---@param From string | number Optional. UCID, PlayerID, or Name of sender.
---@return self
function MESSAGE:ToChat(To, From, Message)
    NET:SendChat(Message or self.Message, To or nil, From or To)

    return self
end

---@author West#9009
---@description Mission NET module.
---@created 01JAN23

---@type BASE
NET = {
    ClassName = 'NET'
}

function NET:_New()
    local self = BASE:Inherit(self, BASE:New())

    return self
end

function NET:GetNameFromPlayerID(id)
    local name = net.get_name(id)

    if name then return name end

    return nil
end

function NET:GetPlayerIDFromName(Name)
    local NetPlayersInfo = self:GetAllPlayersInfo()

    local PlayerID = NetPlayersInfo[Name].PlayerID

    if PlayerID then return PlayerID end

    return nil
end

function NET:GetCoalitionFromPlayerID(id)
    local coalition = net.get_player_info(id, 'side')

    if coalition then return coalition end

    return nil
end

function NET:GetSlotIDFromPlayerID(id)
    local slot = net.get_player_info(id, 'slot')

    if slot then return slot end

    return nil
end

function NET:ForceSlotByPlayerID(id, SideID, SlotID)
    net.force_player_slot(id, SideID, SlotID)

    return self
end

function NET:GetPingFromPlayerID(id)
    local ping = net.get_player_info(id, 'ping')

    if ping then return ping end

    return nil
end

function NET:GetIPFromPlayerID(id)
    local ip = net.get_player_info(id, 'ipaddr')

    if ip then return ip end

    return nil
end

function NET:GetUCIDFromPlayerID(id)
    local ucid = net.get_player_info(id, 'ucid')

    if ucid then return ucid end

    return nil
end

function NET:GetPlayerIDFromUCID(ucid)
    local NetPlayersInfo = self:_GetAllPlayersInfoUCID()

    local id = NetPlayersInfo[ucid].PlayerID

    if id then return id end

    return nil
end

function NET:KickByPlayerID(PlayerID, Message)
    net.kick(PlayerID, Message or nil)

    return self
end

function NET:KickByUCID(ucid, Message)
    local PlayerID = self:GetPlayerIDFromUCID(ucid)

    self:KickByPlayerID(PlayerID, Message or nil)

    return self
end

function NET:KickToSpectatorsByPlayerID(PlayerID, Message)
    self:ForceSlotByPlayerID(PlayerID, 0, '')

    if Message then
        self:SendChat(Message)
    end

    self:Info('Kicked %s back to spectators.', PlayerID)

    return self
end

function NET:KickToSpectatorsByUCID(ucid, Message)
    local PlayerID = self:GetPlayerIDFromUCID(ucid)

    if not PlayerID then return end

    self:KickToSpectatorsByPlayerID(PlayerID, Message)

    return self
end

function NET:GetAllPlayersInfo()
    local PlayerList = net.get_player_list()
    local PlayersInfo = {}

    for _, id in ipairs(PlayerList) do
        local PlayerInfo = net.get_player_info(id, nil)

        PlayersInfo[PlayerInfo.name] = {
            PlayerID = id,
            Name = PlayerInfo.name,
            Coalition = PlayerInfo.side,
            SlotID = PlayerInfo.slot,
            Ping = PlayerInfo.ping,
            ip = PlayerInfo.ipaddr,
            ucid = PlayerInfo.ucid
        }

    end

    return PlayersInfo
end

function NET:GetAllPlayersInfoID()
    local PlayerList = net.get_player_list()
    local PlayersInfo = {}

    for _, id in ipairs(PlayerList) do
        local PlayerInfo = net.get_player_info(id, nil)

        PlayersInfo[id] = {
            PlayerID = id,
            Name = PlayerInfo.name,
            Coalition = PlayerInfo.side,
            SlotID = PlayerInfo.slot,
            Ping = PlayerInfo.ping,
            ip = PlayerInfo.ipaddr,
            ucid = PlayerInfo.ucid
        }

    end

    return PlayersInfo
end

function NET:_GetAllPlayersInfoUCID()
    local PlayerList = net.get_player_list()
    local PlayersInfo = {}

    for _, id in ipairs(PlayerList) do
        local PlayerInfo = net.get_player_info(id, nil)

        PlayersInfo[PlayerInfo.ucid] = {
            PlayerID = id,
            Name = PlayerInfo.name,
            Coalition = PlayerInfo.side,
            SlotID = PlayerInfo.slot,
            Ping = PlayerInfo.ping,
            ip = PlayerInfo.ipaddr,
            ucid = PlayerInfo.ucid
        }

    end

    return PlayersInfo
end

function NET:SendChat(Message, To, From)
    if not To then net.send_chat(Message) return end
    if To and not From then From = To end

    local ToPlayerID = nil
    local FromPlayerID = nil

    if type(To) == 'string' then
        -- If UCID
        if string.len(To) == 32 then
            ToPlayerID = self:GetPlayerIDFromUCID(To)

            -- If a players name happens to be 32 characters long.
            if not ToPlayerID then
                ToPlayerID = self:GetPlayerIDFromName(To)
            end
        end

        -- If not UCID (A Name with a string length not equal to 32)
        if string.len(To) ~= 32 then
            ToPlayerID = self:GetPlayerIDFromName(To)
        end

    elseif type(To) == 'Number' then
        ToPlayerID = To
    end

    if type(From) == 'string' then
        -- If UCID
        if string.len(From) == 32 then
            FromPlayerID = self:GetPlayerIDFromUCID(From)

            -- If a players name happens to be 32 characters.
            if not FromPlayerID then
                FromPlayerID = self:GetPlayerIDFromName(From)
            end
        end

        -- If not UCID (A Name with a string length not equal to 32)
        if string.len(From) ~= 32 then
            FromPlayerID = self:GetPlayerIDFromName(From)
        end
    elseif type(From) == 'Number' then
        FromPlayerID = From
    end

    net.send_chat_to(Message, ToPlayerID, FromPlayerID)

    return self
end

function NET:JSON2LUA(JSON)
    return net.json2lua(JSON)
end

function NET:LUA2JSON(Lua)
    return net.lua2json(Lua)
end

NET = NET:_New()

---@author West#9009
---@description Multiple bridge module.
---@created 10JAN23

---@type BASE
SERVER = {
    ClassName = 'SERVER',
}

function SERVER:New(Port, InternetProtocol, ApplicationLayerProtocol)
    local self = BASE:Inherit(self, BASE:New())

    self.Socket = require 'socket'
    self.Port = Port

    -- Port checking
    if type(self.Port) ~= 'number' then
        self:Error('%s is not a valid port.', self.Port)

        return nil
    end

    -- Check valid port within registered port range.
    if self.Port < 1024 or self.Port > 49151 then
        self:Error('%s is not a valid port.', self.Port)

        return nil
    end

    self.Running = false
    self.Layer = false
    self.Interval = 0.02
    self.Callbacks = {}

    if InternetProtocol == 'udp' then
        self.Protocol = 'udp'
        self.Server = self.Socket.udp()
        self.Server:setsockname('*', self.Port)
    elseif InternetProtocol == 'tcp' then
        self.Protocol = 'tcp'
        self.Server = self.Socket.tcp()
        self.Server:bind('127.0.0.1', self.Port)

        -- Turn the TCP object into a server willing to accept connections.
        self.Server:listen()

        if ApplicationLayerProtocol then
            -- eg. 'http', currently only support http 1.1
            self.Layer = ApplicationLayerProtocol

            if self.Layer == 'http' then
                self.AllowedMethods = {
                    ['GET'] = true,
                    ['HEAD'] = true,
                    ['POST'] = true
                }

                self.Status = {
                    ['Ok'] = '200 OK',
                    ['Created'] = '201 Created',
                    ['Accepted'] = '202 Accepted',
                    ['NoContent'] = '204 No Content',
                    ['BadRequest'] = '400 Bad Request',
                    ['Unauthorized'] = '401 Unauthorized',
                    ['NotFound'] = '404 Not Found',
                    ['RequestTimeout'] = '408 Request Timeout',
                    ['LengthRequired'] = '411 Length Required',
                    ['Teapot'] = "418 I'm a teapot",
                    ['TooManyRequests'] = '429 Too Many Requests',
                    ['RequestHeaderFieldsTooLarge'] = '431 Request Header Fields Too Large',
                    ['InternalServerError'] = '500 Internal Server Error',
                    ['NotImplemented'] = '501 Not Implemented'
                }

                self.Callbacks = {
                    ['GET'] = {},
                    ['POST'] = {},
                    ['HEAD'] = {}
                }

                self.HeaderLimit = 50
            end
        end
    end

    -- Don't continue if server not valid.
    if not self.Server then return nil end

    -- Either protocol must have timeout as 0 to prevent choppy frames (blocking)
    self.Server:settimeout(0)

    return self
end

function SERVER:HTTP(Port)
    return SERVER:New(Port, 'tcp', 'http')
end

function SERVER:UDP(Port)
    return SERVER:New(Port, 'udp')
end

-- Important to note, handles only one line in one callback.
function SERVER:_HandleUDP()
    local Handler = function()
        while self.Running do
            local Data = self.Server:receive()

            if not Data then coroutine.yield(); break end

            --TODO
        end
    end

    while self.Running do
        Handler()

        coroutine.yield()
    end
end

function SERVER:_HandleTCP()
    if self.Layer == 'http' then self:_HandleHTTP() return end

    --TODO
end

function SERVER:_HandleHTTP()
    local Handler = function ()
        while self.Running do
            local Start = self.Socket.gettime()*1000
            local Client = self.Server:accept()

            if not Client then coroutine.yield(); break end

            Client:settimeout(self.Interval)

            local RequestLine = Client:receive('*l')

            self:Info(RequestLine)

            if not RequestLine then

                self:_Error(Client, 'No Message Received') break
            end

            local Method, Route = string.match(RequestLine, '(%a*) (.*) ')

            self:L{Method}
            if not self.AllowedMethods[Method] then
                self:_Respond(Client, self:_Response(self.Status['NotImplemented'])) break
            end

            if not self.Callbacks[Method][Route] then
                self:_Respond(Client, self:_Response(self.Status['NotFound'])) break
            end

            local Headers = {}
            local HeaderLimit = false

            for i = 1, self.HeaderLimit do
                local Line = Client:receive('*l')

                if Line == '' then break end

                local Name, Value = string.match(Line, '(.*): (.*)')

                Headers[Name] = Value

                if i == self.HeaderLimit then
                    HeaderLimit = true
                end
            end

            if HeaderLimit then
                self:_Respond(Client, self:_Response(self.Status['RequestHeaderFieldsTooLarge'])) break
            end

            local Body = ''

            if not Headers['Content-Length'] then
                self:_Respond(Client, self:_Response(self.Status['LengthRequired'])) break
            end

            local ContentLength = tonumber(Headers['Content-Length'])

            local Error

            if ContentLength > 0 then
                Body, Error = Client:receive(tonumber(Headers['Content-Length']))

                if Error then
                    self:_Timeout(Client, Error) break
                end
            end

            local Media, Type

            if Headers['Content-Type'] then
                Media, Type = string.match(Headers['Content-Type'], '([^/]+)/([^/]+)')
            end

            local Callback = self.Callbacks[Method][Route]

            local Success, Result, ResponseHeaders, ResponseContentType, ResponseBody =

            pcall(Callback, {Headers = Headers, Media = Media, Type = Type, Body = Body})

            if not Success then self:_Error(Client, Result) break end

            local Response =
                self:_Response(self.Status[Result], ResponseHeaders, ResponseBody, ResponseContentType, Method)

            local Sent, Error = self:_Respond(Client, Response)

            if not Sent then self:Error(Error) end

            local End = self.Socket.gettime()*1000
            local ExecutionTime = End - Start
            self:L({Start, End})
            self:Info('Blocked Time = %s milliseconds.', ExecutionTime)
        end
    end

    while self.Running do
        Handler()

        coroutine.yield()
    end
end

function SERVER:AddCallback(Callback, Method, Route)
    if self.Layer == 'http' then
        self.Callbacks[Method][Route] = Callback
    end
end

function SERVER:GET(Route, Callback)
    if not self.Protocol == 'tcp' then return end
    if not self.Layer == 'http' then return end

    self:AddCallback(Callback, 'GET', Route)
    self:AddCallback(Callback, 'HEAD', Route)

    return self
end

function SERVER:POST(Route, Callback)
    if not self.Protocol == 'tcp' then return end
    if not self.Layer == 'http' then return end

    self:AddCallback(Callback, 'POST', Route)

    return self
end

function SERVER:_Error(Client, Message)
    return self:_Respond(Client, self:_Response(self.Status['InternalServerError'], nil, Message))
end

function SERVER:_Timeout(Client, Message)
    return self:_Respond(Client, self:_Response(self.Status['RequestTimeout'], nil, Message))
end

function SERVER:_Response(Status, Headers, Body, ContentType, Method)
    local Body = Body or 'No Content'
    local Method = Method or nil
    local Headers = Headers or {}

    Headers['Content-Length'] = string.len(Body)
    Headers['Content-Type'] = ContentType or 'text/plain'
    Headers['Server'] = 'MSF (West#9009)'
    Headers['Cache-Control'] =  'no-cache, must-revalidate'

    local Response = string.format('HTTP/1.1 %s\r\n', Status)

    for Key, Value in pairs(Headers) do
        Response = string.format('%s%s: %s\r\n', Response, Key, Value)
    end

    if Method == 'HEAD' then return Response end

    Response = string.format('%s\r\n%s', Response, Body)

    return Response
end

function SERVER:_Respond(Client, Response)
    local Sent, Error = Client:send(Response)

    Client:close()

    return Sent, Error
end

function SERVER:Start()
    self.Running = true

    local Handlers = {
        ['udp'] = self._HandleUDP,
        ['tcp'] = self._HandleTCP
    }

    self.co = coroutine.create(Handlers[self.Protocol])
    coroutine.resume(self.co, self)

    self.Scheduler = self:ScheduleRepeat(self.Interval, coroutine.resume, self.co, self)

    return self
end

function SERVER:IsRunning()
    return self.Running
end

function SERVER:Stop()
    self.Running = false
    self:ScheduleStop(self.Scheduler)
end

---@author West#9009
---@description DCS object helper functions.
---@created 21MAY22

---@type BASE
---@class OBJECT
OBJECT = {
    ClassName = 'OBJECT',
    Name = '',
}

function OBJECT:New(Name)
    local self = BASE:Inherit(self, BASE:New())

    self.Name = Name

    return self
end

function OBJECT:GetDCSObject()
    return nil
end

function OBJECT:Destroy()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        DCSObject:destroy()
        self:CreateEventRemoveUnit(timer.getTime(), DCSObject)
    end
end

function OBJECT:GetName()
    return self.Name
end

function OBJECT:GetDesc()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getDesc()
    end

    return nil
end

function OBJECT:GetLife()
    local desc = self:GetDesc()

    if desc then
        if desc.life then
            return desc.life
        end
    end

    return nil
end

function OBJECT:IsExist()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:isExist()
    end

    return nil
end

function OBJECT:GetType()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getTypeName()
    end

    return nil
end

function OBJECT:GetCategory()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getCategory()
    end

    return nil
end

function OBJECT:GetVec3()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getPoint()
    end

    return nil
end

function OBJECT:InAir()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:inAir()
    end

    return nil
end

function OBJECT:GetCoalition()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getCoalition()
    end

    return nil
end

function OBJECT:GetPosition()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getPosition()
    end

    return nil
end

function OBJECT:GetHeading()
    local Position = self:GetPosition()

    if Position then
        local HeadingRad = math.atan2(Position.x.z, Position.x.x)
        local HeadingDeg = math.deg(HeadingRad)

        return HeadingDeg
    end

    return nil
end

---@author West#9009
---@description Unit object wrapper.
---@created 22MAY22

UNIT = {
    ClassName = 'UNIT',
}

function UNIT:New(Name, ucid)
    local self = BASE:Inherit(self, OBJECT:New(Name))

    self.ucid = ucid or nil

    return self
end

function UNIT:FindByName(Name)
    local Unit = __DATABASE._Units[Name]

    if Unit then
        return Unit
    end

    return nil
end

function UNIT:GetDCSObject()
    local DCSObject = Unit.getByName(self.Name)

    if DCSObject then
        return DCSObject
    end

    return nil
end

function UNIT:GetPlayerName()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getPlayerName()
    end

    return nil
end

function UNIT:GetCountry()
    local DCSObject = self:GetDCSObject()

    if DCSObject then
        return DCSObject:getCountry()
    end

    return nil
end

function UNIT:GetID()
    local DCSUnit = self:GetDCSObject()

    if not DCSUnit then return end

    return DCSUnit:getID()
end

function UNIT:GetUCID()
    return self.ucid
end

function UNIT:Kick(Message)
    if not self.ucid then return end

    NET:KickByUCID(self.ucid, Message or nil)

    return self
end

function UNIT:KickToSpectators(Message)
    if not self.ucid then return end

    NET:KickToSpectatorsByUCID(self.ucid, Message)

    return self
end
---@author West#9009
---@description Group object wrapper.
---@created 22MAY22

---@type OBJECT
---@class GROUP
GROUP = {
    ClassName = 'GROUP',
}

function GROUP:New(Name)
    local self = BASE:Inherit(self, OBJECT:New(Name))

    return self
end

function GROUP:FindByName(Name)
    local Group = __DATABASE._Groups[Name]

    if Group then
        return Group
    end

    return nil
end

function GROUP:GetDCSObject()
    local DCSObject = Group.getByName(self.Name)

    if DCSObject then
        return DCSObject
    end

    return nil
end

function GROUP:Activate()
    local DCSGroup = self:GetDCSObject()

    if not DCSGroup then return nil end

    DCSGroup:activate()
end

function GROUP:Destroy()
    local DCSGroup = self:GetDCSObject()

    if DCSGroup then
        local Units = self:GetUnits()

        if Units then
            for _, unit in ipairs(Units) do
                unit:Destroy()
            end
        end

        DCSGroup:destroy()
    end
end

function GROUP:GetUnits()
    local DCSGroup = self:GetDCSObject()

    if DCSGroup then
        local DCSUnits = DCSGroup:getUnits()

        if DCSUnits then
            local Units = {}

            for _, unit in ipairs(DCSUnits) do
                table.insert(Units, UNIT:FindByName(unit:getName()))
            end

            return Units
        end
    end

    return nil
end

function GROUP:GetDCSUnits()
    local DCSGroup = self:GetDCSObject()

    if not DCSGroup then return nil end

    local DCSUnits = DCSGroup:getUnits()

    if not DCSUnits then return nil end

    return DCSUnits
end

function GROUP:GetCountry()
    local Units = self:GetUnits()

    if not Units then return nil end

    return Units[1]:GetCountry()
end

function GROUP:GetID()
    local DCSGroup = self:GetDCSObject()

    if not DCSGroup then return end

    return DCSGroup:getID()
end

---@author West#9009
---@description Static object wrapper.
---@created 23MAY22

STATIC = {
    ClassName = 'STATIC',
}

function STATIC:New(Name)
    local self = BASE:Inherit(self, OBJECT:New(Name))

    return self
end

function STATIC:FindByName(Name)
    local Static = __DATABASE._Statics[Name]

    if Static then
        return Static
    end

    return nil
end

function STATIC:GetDCSObject()
    local DCSObject = StaticObject.getByName(self.Name)

    if DCSObject then
        return DCSObject
    end

    return nil
end

function STATIC:Destroy()
    local Name = self:GetName()

    self:CreateEventRemoveUnit(self:Now(), self:GetDCSObject())

    SPAWN:NewStaticFromType(nil, nil, nil, 80, Name, true)
            :SpawnFromVec2({x = 0, z = 0})
end

---@author West#9009
---@description Airbase object wrapper.
---@created 25MAY22

---@type OBJECT
---@class AIRBASE
AIRBASE = {
    ClassName = 'AIRBASE',
}

function AIRBASE:New(Name)
    local self = BASE:Inherit(self, OBJECT:New(Name))

    return self
end

function AIRBASE:FindByName(Name)
    local Airbase = __DATABASE._Airbases[Name]

    if Airbase then
        return Airbase
    end

    return nil
end

function AIRBASE:GetDCSObject()
    local DCSObject = Airbase.getByName(self.Name)

    if DCSObject then
        return DCSObject
    end

    return nil
end


__EVENTS = EVENTS:New()
__DATABASE = DATABASE:New()

SEATAC = {
    -- Define the ClassName (This is optional)
    SEATAC = 'TEST'
}

-- Instantiation Function
function SEATAC:New()
    -- Inherit Base (This includes many scheduler, event, and log functions for your class).
    local self = BASE:Inherit(self, BASE:New())

    -- Handle Birth Events (Very similar to MOOSE)
    self:HandleEvent(ENUMS.EVENTS.Takeoff, self.OnEventTakeoff)

    -- Return the new object.
    return self
end

-- Callback function for Birth Events
function SEATAC:OnEventTakeoff(Event)
    MESSAGE:New('Test'):ToAll()
end

-- Create a new instance of your class.
SEATAC = SEATAC:New()

