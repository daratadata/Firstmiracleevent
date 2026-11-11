// ===== À REMPLIR après avoir créé votre projet Supabase =====
window.FME={
SUPABASE_URL:"https://foontxruywwssdvldjjz.supabase.co",            // ex: https://xxxx.supabase.co
SUPABASE_KEY:"sb_publishable_IEF1b-XiXS3rurthKvZLJg_Hec2cLGE",            // clé ""
GSHEET_URL:"https://script.google.com/macros/s/AKfycbzKIforQjHSDPVjhUUVHBO3sxzx4_ZNofUtmhE93P1STpt3k67EXGKkwg7VnKv-l4RCqA/exec",              // URL du script Google Apps Script (facultatif)
WHATSAPP:"2250501911199",
PAY_ENABLED:false,          // Mobile Money : mettre true plus tard
FB:"https://www.facebook.com/profile.php?id=61572717685066",
TT:"https://www.tiktok.com/@first.miracle.eve",
MAIL:"contactfirstmiracleevent@gmail.com",
PHONES:["+225 05 01 91 11 99","+225 07 67 61 70 14","+225 07 68 07 29 39","+225 07 49 52 51 68"],
// Catalogue d'exemple (prix à modifier dans l'espace gestionnaire)
// Fidélité : 1 point pour chaque "per" FCFA dépensés. Niveaux et avantages = EXEMPLES à adapter.
LOYALTY:{per:1000,tiers:[
{n:"Bronze",min:0,perk:"Bienvenue dans le club First Miracle Event.",perk_en:"Welcome to the First Miracle Event club."},
{n:"Argent",min:100,perk:"Exemple : 5 % de remise sur votre prochaine réservation.",perk_en:"Example: 5% off your next booking."},
{n:"Or",min:300,perk:"Exemple : 10 % de remise et une attention offerte.",perk_en:"Example: 10% off and a complimentary treat."}]},
DEMO:[
{kind:"pack",name:"Pack Mariage Basic · 100 invités",name_en:"Basic Wedding Pack · 100 guests",description_en:"Welcome panels, photo wall, tablecloths, napkins, menus, table numbers, bridal lounge, dance floor",description:"Panneaux de bienvenue, mur photo, nappes, serviettes, menus, numéros de table, salon nuptial, piste de danse",price:900000,unit:"pack"},
{kind:"pack",name:"Pack Mariage Basic · 200 invités",name_en:"Basic Wedding Pack · 200 guests",description_en:"The Basic pack for 200 people",description:"Le pack Basic pour 200 personnes",price:1200000,unit:"pack"},
{kind:"pack",name:"Pack Mariage Prestige · 300 invités",name_en:"Prestige Wedding Pack · 300 guests",description_en:"Premium floral decor, lighting, arch and more",description:"Décor floral premium, éclairage, arche et plus",price:2000000,unit:"pack"},
{kind:"decoration",name:"Décoration église",name_en:"Church decoration",description_en:"A sacred, elegant and refined setting",description:"Un cadre sacré, élégant et raffiné",price:50000,unit:"prestation"},
{kind:"decoration",name:"Décoration salle",name_en:"Reception hall decoration",description_en:"A unique, chic and memorable atmosphere",description:"Ambiance unique, chic et mémorable",price:300000,unit:"prestation"},
{kind:"decoration",name:"Décoration voiture",name_en:"Car decoration",description_en:"Ride in style on the big day",description:"Roulez avec élégance le jour J",price:50000,unit:"prestation"},
{kind:"surprise",name:"Demande en mariage clé en main",name_en:"Turnkey marriage proposal",description_en:"Venue, decor, petals, candles, ambiance: we prepare it, you ask the question",description:"Lieu, décor, pétales, bougies, ambiance : on prépare, vous dites « Veux-tu m'épouser ? »",price:150000,unit:"prestation"},
{kind:"location",name:"Chaise Chiavari",name_en:"Chiavari chair",description_en:"Gold or white",description:"Dorée ou blanche",price:500,unit:"par chaise",stock:500},
{kind:"location",name:"Table ronde",name_en:"Round table",description_en:"Tablecloth included",description:"Nappe incluse",price:3000,unit:"par table",stock:60},
{kind:"location",name:"Table serpentin",name_en:"Serpentine table",description_en:"For buffets and large gatherings",description:"Pour buffets et grandes tablées",price:15000,unit:"par table",stock:10},
{kind:"location",name:"Assiette de présentation",name_en:"Charger plate",description_en:"Gold",description:"Dorée",price:150,unit:"par invité"},
{kind:"traiteur",name:"Chafing dish",name_en:"Chafing dish",description_en:"With burner, rental",description:"Avec réchaud, location",price:10000,unit:"pièce",stock:30},
{kind:"traiteur",name:"Plateau de mignardises (50 pcs)",name_en:"Petits fours tray (50 pcs)",description_en:"Sweet assortment",description:"Assortiment sucré",price:25000,unit:"plateau"},
{kind:"tenue",name:"Tenue traditionnelle (location)",name_en:"Traditional outfit (rental)",description_en:"Wax print or embroidered outfit, tailored at the fitting",description:"Pagne ou tenue brodée, sur mesure à l'essayage",price:30000,unit:"tenue"},
{kind:"box",name:"Box cadeau",name_en:"Gift box",description_en:"Made to fit your budget",description:"Composée selon votre budget",price:25000,unit:"box"},
{kind:"box",name:"Bouquet de fleurs",name_en:"Flower bouquet",description_en:"Roses and seasonal flowers",description:"Roses et fleurs de saison",price:15000,unit:"bouquet"},
{kind:"sortie",name:"Chic pic",name_en:"Chic picnic",description_en:"Decorated chic picnic for two",description:"Pique-nique chic décoré pour 2",price:45000,unit:"sortie"},
{kind:"sortie",name:"Sortie surprise",name_en:"Surprise outing",description_en:"We organise everything, you enjoy",description:"On organise tout, vous profitez",price:60000,unit:"sortie"}
]};
