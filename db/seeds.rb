
Admin.delete_all
Catch.delete_all
Desa.delete_all
District.delete_all
Engine.delete_all
ExcelFile.delete_all
Fish.delete_all
Fishery.delete_all
Gear.delete_all
Graticule.delete_all
Landing.delete_all
Logbook.delete_all
LoggedDay.delete_all
Office.delete_all
Province.delete_all
Role.delete_all
Survey.delete_all
User.delete_all
VesselType.delete_all


desa = Desa.create([
  { name: "Ampenan", code: "001", lat: -8.583333, lng: 116.116667, district_id: 1},
  { name: "Banka Banka", code: "002", lat: -8.747771, lng: 115.864595, district_id: 1 },
  { name: "Seraya", code: "003", lat: -8.349155, lng: 115.682927, district_id: 2 },
  { name: "Kasamba", code: "004", lat: -8.569655, lng: 115.433475, district_id: 2 }
]) 

fishery = Fishery.create([
  { name: "Lombok Strait small pelagic", code: "LOM-PS" },
  { name: "Lombok Strait large pelagic", code: "LOM-PL" }
]) 

engine = Engine.create([
  { name: "Outboard", code: "OB" },
  { name: "Longtail", code: "LT" },
  { name: "Inboard", code: "IB" }
]) 

gear = Gear.create([
	{ cat_ind: "Jaring lingkar", cat_eng: "Surrounding nets", sub_cat_ind: "Jaring lingkar bertali kerut", sub_cat_eng: "With purse lines/Purse seine", type_ind: "Pukat cincin dengan satu kapal", type_eng: "One boat operated purse seines", name: "Pukat cincin pelagis kecil dengan satu kapal", alpha_code: "PS1-K", num_code: "01.1.1.1", fao_code: "PS" },
	{ cat_ind: "Jaring lingkar", cat_eng: "Surrounding nets", sub_cat_ind: "Jaring lingkar bertali kerut", sub_cat_eng: "With purse lines/Purse seine", type_ind: "Pukat cincin dengan satu kapal", type_eng: "One boat operated purse seines", name: "Pukat cincin pelagis besar dengan satu kapal", alpha_code: "PS1-B", num_code: "01.1.1.2", fao_code: "PS" },
	{ cat_ind: "Jaring lingkar", cat_eng: "Surrounding nets", sub_cat_ind: "Jaring lingkar bertali kerut", sub_cat_eng: "With purse lines/Purse seine", type_ind: "Pukat cincin dengan dua kapal", type_eng: "Two boat operated purse seines", name: "Pukat cincin grup pelagis kecil", alpha_code: "PS2-K", num_code: "01.1.2.1", fao_code: "PS" },
	{ cat_ind: "Jaring lingkar", cat_eng: "Surrounding nets", sub_cat_ind: "Jaring lingkar bertali kerut", sub_cat_eng: "With purse lines/Purse seine", type_ind: "Pukat cincin dengan dua kapal", type_eng: "Two boat operated purse seines", name: "Pukat cincin grup pelagis besar", alpha_code: "PS2-B", num_code: "01.1.2.2", fao_code: "PS" },
	{ cat_ind: "Jaring lingkar", cat_eng: "Surrounding nets", sub_cat_ind: "Jaring lingkar tanpa tali kerut", sub_cat_eng: "Without purse lines/Lampara", type_ind: "", type_eng: "", name: "", alpha_code: "LA", num_code: "01.2.0", fao_code: "LA" },
	{ cat_ind: "Pukat Tarik", cat_eng: "Seine nets", sub_cat_ind: "Pukat tarik pantai", sub_cat_eng: "Beach seines", type_ind: "", type_eng: "", name: "", alpha_code: "SB", num_code: "02.1.0", fao_code: "SB" },
	{ cat_ind: "Pukat Tarik", cat_eng: "Seine nets", sub_cat_ind: "Pukat tarik berkapal", sub_cat_eng: "Boat or vessel seines", type_ind: "Dogol", type_eng: "", name: "Danish seines", alpha_code: "SDN", num_code: "02.2.1", fao_code: "SV" },
	{ cat_ind: "Pukat Tarik", cat_eng: "Seine nets", sub_cat_ind: "Pukat tarik berkapal", sub_cat_eng: "Boat or vessel seines", type_ind: "", type_eng: "", name: "Scottish seines", alpha_code: "SSC", num_code: "02.2.2", fao_code: "SV" },
	{ cat_ind: "Pukat Tarik", cat_eng: "Seine nets", sub_cat_ind: "Pukat tarik berkapal", sub_cat_eng: "Boat or vessel seines", type_ind: "", type_eng: "", name: "Pair seines", alpha_code: "SPR", num_code: "02.2.3", fao_code: "SV" },
	{ cat_ind: "Pukat Tarik", cat_eng: "Seine nets", sub_cat_ind: "Pukat tarik berkapal", sub_cat_eng: "Boat or vessel seines", type_ind: "", type_eng: "", name: "Payang", alpha_code: "SV-PYG", num_code: "02.2.0.1", fao_code: "SV" },
	{ cat_ind: "Pukat Tarik", cat_eng: "Seine nets", sub_cat_ind: "Pukat tarik berkapal", sub_cat_eng: "Boat or vessel seines", type_ind: "", type_eng: "", name: "Cantrang", alpha_code: "SV-CTG", num_code: "02.2.0.2", fao_code: "SV" },
	{ cat_ind: "Pukat Tarik", cat_eng: "Seine nets", sub_cat_ind: "Pukat tarik berkapal", sub_cat_eng: "Boat or vessel seines", type_ind: "", type_eng: "", name: "Lampara dasar", alpha_code: "SV-LDS", num_code: "02.2.0.3", fao_code: "SV" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela dasar", sub_cat_eng: "Bottom trawls", type_ind: "Pukat hela dasar berpalang", type_eng: "Beam trawl", name: "", alpha_code: "TBB", num_code: "03.1.1", fao_code: "TBB" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela dasar", sub_cat_eng: "Bottom trawls", type_ind: "Pukat hela dasar berpapan", type_eng: "Otter trawls", name: "", alpha_code: "OTB", num_code: "03.1.2", fao_code: "OTB" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela dasar", sub_cat_eng: "Bottom trawls", type_ind: "Pukat hela dasar dua kapal", type_eng: "Pair trawls", name: "", alpha_code: "PTB", num_code: "03.1.3", fao_code: "PTB" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela dasar", sub_cat_eng: "Bottom trawls", type_ind: "Nephrops trawl", type_eng: "Nephrops trawl", name: "", alpha_code: "TBN", num_code: "03.1.4", fao_code: "TBB" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela dasar", sub_cat_eng: "Bottom trawls", type_ind: "Pukat hela dasar udang", type_eng: "Shrimp trawls", name: "Pukat udang", alpha_code: "TBS-PU", num_code: "03.1.5.1", fao_code: "TBB" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela pertengahan", sub_cat_eng: "Midwater trawls", type_ind: "Pukat hela pertengahan berpapan", type_eng: "Otter trawls", name: "Pukat ikan", alpha_code: "OTM-PI", num_code: "03.2.1.1", fao_code: "OTM" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela pertengahan", sub_cat_eng: "Midwater trawls", type_ind: "Pukat hela pertengahan dua kapal", type_eng: "Pair trawls", name: "", alpha_code: "PTM", num_code: "03.2.2", fao_code: "PTM" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela pertengahan", sub_cat_eng: "Midwater trawls", type_ind: "Pukat hela pertengahan udang", type_eng: "Shrimp trawls", name: "", alpha_code: "TMS", num_code: "03.2.3", fao_code: "TM" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat hela kembar berpapan", sub_cat_eng: "Otter twin trawls", type_ind: "", type_eng: "", name: "", alpha_code: "OTT", num_code: "03.3.0", fao_code: "OTT" },
	{ cat_ind: "Pukat hela", cat_eng: "Trawls", sub_cat_ind: "Pukat dorong", sub_cat_eng: "", type_ind: "", type_eng: "", name: "", alpha_code: "TX-PD", num_code: "03.9.0.1", fao_code: "TX" },
	{ cat_ind: "Penggaruk", cat_eng: "Dredges", sub_cat_ind: "Penggaruk berkapal", sub_cat_eng: "Boat dredges", type_ind: "", type_eng: "", name: "", alpha_code: "DRB", num_code: "04.1.0", fao_code: "DRB" },
	{ cat_ind: "Penggaruk", cat_eng: "Dredges", sub_cat_ind: "Penggaruk tanpa kapal", sub_cat_eng: "Hand dredges", type_ind: "", type_eng: "", name: "", alpha_code: "DRH", num_code: "04.2.0", fao_code: "DRH" },
	{ cat_ind: "Jaring angkat", cat_eng: "Lift nets", sub_cat_ind: "Anco", sub_cat_eng: "Portable lift nets", type_ind: "", type_eng: "", name: "", alpha_code: "LNP", num_code: "05.1.0", fao_code: "LNP" },
	{ cat_ind: "Jaring angkat", cat_eng: "Lift nets", sub_cat_ind: "Jaring angkat berperahu", sub_cat_eng: "Boat-operated lift nets", type_ind: "Bagan berperahu", type_eng: "", name: "", alpha_code: "LNP-BP", num_code: "05.2.0.1", fao_code: "LNP" },
	{ cat_ind: "Jaring angkat", cat_eng: "Lift nets", sub_cat_ind: "Jaring angkat berperahu", sub_cat_eng: "Boat-operated lift nets", type_ind: "Bouke ami", type_eng: "", name: "", alpha_code: "LNB-BA", num_code: "05.2.0.2", fao_code: "LNB" },
	{ cat_ind: "Jaring angkat", cat_eng: "Lift nets", sub_cat_ind: "Jaring angkat berperahu", sub_cat_eng: "Boat-operated lift nets", type_ind: "Bagan tancap", type_eng: "Shore-operated stationary lift nets", name: "", alpha_code: "LNS", num_code: "05.3.0", fao_code: "LNS" },
	{ cat_ind: "Yang dijatuhkan atau ditebarkan", cat_eng: "Falling gear", sub_cat_ind: "Jala jatuh berkapal", sub_cat_eng: "Cast nets", type_ind: "", type_eng: "", name: "", alpha_code: "FCN", num_code: "06.1.0", fao_code: "FCN" },
	{ cat_ind: "Yang dijatuhkan atau ditebarkan", cat_eng: "Falling gear", sub_cat_ind: "Jala tebar", sub_cat_eng: "Falling gear not specified", type_ind: "", type_eng: "", name: "", alpha_code: "FG", num_code: "06.9.0", fao_code: "FG" },
	{ cat_ind: "Jaring Insang", cat_eng: "Gillnets and entangling nets", sub_cat_ind: "Jaring insang tetap", sub_cat_eng: "Set gillnets (anchored)", type_ind: "", type_eng: "", name: "Jaring Liong bun", alpha_code: "GNS-LB", num_code: "07.1.0.1", fao_code: "GNS" },
	{ cat_ind: "Jaring Insang", cat_eng: "Gillnets and entangling nets", sub_cat_ind: "Jaring insang hanyut", sub_cat_eng: "Drifnets", type_ind: "", type_eng: "", name: "Jaring gillnet oseanik", alpha_code: "GND-OC", num_code: "07.2.0.1", fao_code: "GND" },
	{ cat_ind: "Jaring Insang", cat_eng: "Gillnets and entangling nets", sub_cat_ind: "Jaring insang lingkar", sub_cat_eng: "Encircling gillnets", type_ind: "", type_eng: "", name: "", alpha_code: "GNC", num_code: "07.3.0", fao_code: "GNC" },
	{ cat_ind: "Jaring Insang", cat_eng: "Gillnets and entangling nets", sub_cat_ind: "Jaring insang berpancang", sub_cat_eng: "Fixed gillnets (on stakes)", type_ind: "", type_eng: "", name: "", alpha_code: "GNI", num_code: "07.4.0", fao_code: "GNF" },
	{ cat_ind: "Jaring Insang", cat_eng: "Gillnets and entangling nets", sub_cat_ind: "Jaring insang berlapis", sub_cat_eng: "Trammel nets", type_ind: "", type_eng: "", name: "Jaring klitik", alpha_code: "GTR-JK", num_code: "07.5.0.1", fao_code: "GTR" },
	{ cat_ind: "Jaring Insang", cat_eng: "Gillnets and entangling nets", sub_cat_ind: "", sub_cat_eng: "Combined gillnets-trammel nets", type_ind: "", type_eng: "", name: "", alpha_code: "GTN", num_code: "07.6.0", fao_code: "GTN" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "", sub_cat_eng: "Stationary uncovered pound nets", type_ind: "", type_eng: "", name: "Set net", alpha_code: "FPN", num_code: "08.1.0", fao_code: "FPN" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "Bubu", sub_cat_eng: "Pots", type_ind: "", type_eng: "", name: "", alpha_code: "FPO", num_code: "08.2.0", fao_code: "FPO" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "Bubu bersayap", sub_cat_eng: "Fyke nets", type_ind: "", type_eng: "", name: "", alpha_code: "FYK", num_code: "08.3.0", fao_code: "FYK" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "", sub_cat_eng: "Stow nets", type_ind: "Pukat labuh", type_eng: "Long bag set net", name: "", alpha_code: "FSN-PL", num_code: "08.4.0.1", fao_code: "FSN" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "", sub_cat_eng: "", type_ind: "Togo", type_eng: "", name: "", alpha_code: "FSN-TG", num_code: "08.4.0.2", fao_code: "FSN" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "", sub_cat_eng: "", type_ind: "Ambai", type_eng: "", name: "", alpha_code: "FSN-AB", num_code: "08.4.0.3", fao_code: "FSN" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "", sub_cat_eng: "", type_ind: "Jermal", type_eng: "", name: "", alpha_code: "FSN-JM", num_code: "08.4.0.4", fao_code: "FSN" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "", sub_cat_eng: "", type_ind: "Pengerih", type_eng: "", name: "", alpha_code: "FSN-PG", num_code: "08.4.0.5", fao_code: "FSN" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "", sub_cat_eng: "Barriers, fences, weirs", type_ind: "", type_eng: "", name: "Sero", alpha_code: "FWR-SR", num_code: "08.5.0.1", fao_code: "FWR" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "Perangkap Ikan Peloncat", sub_cat_eng: "Aerial traps", type_ind: "", type_eng: "", name: "", alpha_code: "FWR", num_code: "08.6.0", fao_code: "FWR" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "Muro ami", sub_cat_eng: "", type_ind: "", type_eng: "", name: "", alpha_code: "FIX-MA", num_code: "08.9.0.1", fao_code: "FIX" },
	{ cat_ind: "Perangkap", cat_eng: "Traps", sub_cat_ind: "Seser", sub_cat_eng: "", type_ind: "", type_eng: "", name: "", alpha_code: "FIX-SS", num_code: "08.9.0.2", fao_code: "FIX" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "", sub_cat_eng: "Handlines and pole-lines/hand operated", type_ind: "Pancing ulur", type_eng: "", name: "", alpha_code: "LHP-PU", num_code: "09.1.0.1", fao_code: "LHP" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "", sub_cat_eng: "Handlines and pole-lines/hand operated", type_ind: "Pancing berjoran", type_eng: "", name: "", alpha_code: "LHP-PJ", num_code: "09.1.0.2", fao_code: "LHP" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "", sub_cat_eng: "Handlines and pole-lines/hand operated", type_ind: "Huhate", type_eng: "", name: "", alpha_code: "LHP-PH", num_code: "09.1.0.3", fao_code: "LHP" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "", sub_cat_eng: "Handlines and pole-lines/hand operated", type_ind: "", type_eng: "Squid angling", name: "", alpha_code: "LHP-SA", num_code: "09.1.0.4", fao_code: "LHP" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "", sub_cat_eng: "Handlines and pole-lines/mechanized", type_ind: "", type_eng: "Squid jiggling", name: "", alpha_code: "LHM-PC", num_code: "09.2.0.1", fao_code: "LHM" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "", sub_cat_eng: "Handlines and pole-lines/mechanized", type_ind: "Huhate mekanis", type_eng: "", name: "", alpha_code: "LHM-HM", num_code: "09.2.0.2", fao_code: "LHM" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "Rawai dasar", sub_cat_eng: "Set long lines", type_ind: "", type_eng: "", name: "", alpha_code: "LLS", num_code: "09.3.0", fao_code: "LLS" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "Rawai hanyut", sub_cat_eng: "Drifting long lines", type_ind: "Rawai tuna", type_eng: "", name: "", alpha_code: "LLD-RT", num_code: "09.4.0.1", fao_code: "LLD" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "Rawai hanyut", sub_cat_eng: "Drifting long lines", type_ind: "Rawai cucut", type_eng: "", name: "", alpha_code: "LLD-RC", num_code: "09.4.0.2", fao_code: "LLD" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "Tonda", sub_cat_eng: "Trolling lines", type_ind: "", type_eng: "", name: "", alpha_code: "LTL", num_code: "09.6.0", fao_code: "LTL" },
	{ cat_ind: "Pancing", cat_eng: "Hooks and Lines", sub_cat_ind: "Pancing layang-layang", sub_cat_eng: "", type_ind: "", type_eng: "", name: "", alpha_code: "LX-LY", num_code: "09.9.0.1", fao_code: "LX" },
	{ cat_ind: "Penjepit dan Melukai", cat_eng: "Grappling and Wounding", sub_cat_ind: "Tombak", sub_cat_eng: "Harpoons", type_ind: "Ladung", type_eng: "", name: "", alpha_code: "HAR-LD", num_code: "10.0.0.1", fao_code: "HAR" },
	{ cat_ind: "Penjepit dan Melukai", cat_eng: "Grappling and Wounding", sub_cat_ind: "Tombak", sub_cat_eng: "Harpoons", type_ind: "Panah", type_eng: "", name: "", alpha_code: "HAR-PN", num_code: "10.0.0.2", fao_code: "HAR" }
])

fish = Fish.create([
	{ order: "", family: "", scientific_name: "Netuma thalassina", fishbase_name: "Giant catfish", english_name: "Giant catfish", indonesia_name: "Manyung", code: "" },
	{ order: "BELONIFORMES", family: "Belonidae", scientific_name: "Belonidae", fishbase_name: "", english_name: "Needle fish", indonesia_name: "Cendro", code: "BEN" },
	{ order: "BELONIFORMES", family: "Belonidae", scientific_name: "Tylosurus spp", fishbase_name: "", english_name: "Needle fish", indonesia_name: "Cendro", code: "NED" },
	{ order: "PLEURONECTIFORMES", family: "Psettodidae", scientific_name: "Psettodidae", fishbase_name: "", english_name: "Indian halibut/Queensland halibut", indonesia_name: "Ikan sebelah", code: "HPX" },
	{ order: "PERCOIDEI", family: "Caesionidae", scientific_name: "Caesio cuning", fishbase_name: "Redbelly yellowtail fusilier", english_name: "Redbelly yellowtail fusilier", indonesia_name: "Ekor kuning/Pisang-pisang", code: "CJU" },
	{ order: "PERCOIDEI", family: "Caesionidae", scientific_name: "Caesio caerulaurea", fishbase_name: "Blue and gold fusilier", english_name: "Blue and gold fusilier", indonesia_name: "Lolosi biru", code: "CJC" },
	{ order: "", family: "", scientific_name: "Selaroides spp", fishbase_name: "", english_name: "Trevallies", indonesia_name: "Selar", code: "" },
	{ order: "PERCOIDEI", family: "Carangidae", scientific_name: "Caranx spp", fishbase_name: "", english_name: "Jack trevallies", indonesia_name: "Kuwe", code: "TRE" },
	{ order: "PERCOIDEI", family: "Carangidae", scientific_name: "Decapterus spp", fishbase_name: "", english_name: "Scad", indonesia_name: "Layang", code: "SDX" },
	{ order: "", family: "", scientific_name: "Elagatis bipinnulatus", fishbase_name: "", english_name: "Rainbow runner", indonesia_name: "Sunglir", code: "" },
	{ order: "PERCOIDEI", family: "Carangidae", scientific_name: "Megalaspis cordyla", fishbase_name: "Torpedo scad", english_name: "Torpedo Scad", indonesia_name: "Tetengkek", code: "HAS" },
	{ order: "", family: "", scientific_name: "Formio niger", fishbase_name: "", english_name: "Black pomfret", indonesia_name: "Bawal hitam", code: "" },
	{ order: "STROMATEOIDEI, ANABANTOIDEI", family: "Stromateidae", scientific_name: "Pampus argenteus", fishbase_name: "Silver pomfret", english_name: "Silver pomfret", indonesia_name: "Bawal putih", code: "SIP" },
	{ order: "", family: "", scientific_name: "Chorinemus spp", fishbase_name: "", english_name: "Queen fish", indonesia_name: "Daun bambu/Talang-talang", code: "" },
	{ order: "PERCOIDEI", family: "Carangidae", scientific_name: "Selar boops", fishbase_name: "Oxeye scad", english_name: "Oxeye scad", indonesia_name: "Bentong", code: "LRO" },
	{ order: "PERCOIDEI", family: "Carangidae", scientific_name: "Selar crumenophthalmus", fishbase_name: "Bigeye scad", english_name: "Bigeye scad", indonesia_name: "Bentong", code: "BIS" },
	{ order: "PERCOIDEI", family: "Centropomidae", scientific_name: "Lates calcarifer", fishbase_name: "Barramundi", english_name: "Barramundi/Giant sea perch", indonesia_name: "Kakap putih", code: "GIP" },
	{ order: "CLUPEIFORMES", family: "Chirocentridae", scientific_name: "Chirocentrus dorab", fishbase_name: "Dorab wolf-herring", english_name: "Dorab wolf herring", indonesia_name: "Golok-golok", code: "DOB" },
	{ order: "", family: "", scientific_name: "Anodonstoma chacunda", fishbase_name: "", english_name: "Chacunda gizard shad", indonesia_name: "Selanget", code: "" },
	{ order: "CLUPEIFORMES", family: "Clupeidae", scientific_name: "Amblygaster sirm", fishbase_name: "Spotted sardinella", english_name: "Spotted sardinella", indonesia_name: "Siro", code: "AGS" },
	{ order: "CLUPEIFORMES", family: "Clupeidae", scientific_name: "Dussumieria acuta", fishbase_name: "Rainbow sardine", english_name: "Rainbow sardine", indonesia_name: "Japuh", code: "RAS" },
	{ order: "CLUPEIFORMES", family: "Clupeidae", scientific_name: "Sardinella fimbriata", fishbase_name: "", english_name: "Fringescale sardinella", indonesia_name: "Tembang", code: "FRS" },
	{ order: "CLUPEIFORMES", family: "Clupeidae", scientific_name: "Sardinella gibbosa", fishbase_name: "Goldstripe sardinella", english_name: "Goldstripe sardinella", indonesia_name: "Tembang", code: "SAG" },
	{ order: "CLUPEIFORMES", family: "Clupeidae", scientific_name: "Sardinella lemuru", fishbase_name: "Bali sardinella", english_name: "Bali sardinella", indonesia_name: "Lemuru", code: "SAM" },
	{ order: "CLUPEIFORMES", family: "Clupeidae", scientific_name: "Tenualosa ilisha", fishbase_name: "", english_name: "Hilsa shad", indonesia_name: "Terubuk", code: "HIL" },
	{ order: "PERCOIDEI", family: "Coryphaenidae", scientific_name: "Coryphaena hippurus", fishbase_name: "Common dolphinfish", english_name: "Common dolphin fish", indonesia_name: "Lemadang", code: "DOL" },
	{ order: "AULOPIFORMES", family: "Synodontidae", scientific_name: "Saurida tumbil", fishbase_name: "Greater lizardfish", english_name: "Greater lizardfish", indonesia_name: "Beloso/Buntut kebo", code: "LIG" },
	{ order: "PLEURONECTIFORMES", family: "Cynoglossidae", scientific_name: "Cynoglossus spp", fishbase_name: "", english_name: "Tongue soles", indonesia_name: "Ikan lidah", code: "YOX" },
	{ order: "", family: "", scientific_name: "Pleuronectus spp", fishbase_name: "", english_name: "Tongue soles", indonesia_name: "Ikan lidah", code: "" },
	{ order: "CLUPEIFORMES", family: "Engraulidae", scientific_name: "Stolephorus spp", fishbase_name: "", english_name: "Anchovies", indonesia_name: "Teri", code: "STO" },
	{ order: "BELONIFORMES", family: "Exocoetidae", scientific_name: "Cypselurus spp", fishbase_name: "", english_name: "Flying fish", indonesia_name: "Ikan terbang", code: "YPX" },
	{ order: "", family: "", scientific_name: "Hemirhampus spp", fishbase_name: "", english_name: "Garfish and Halfbeaks", indonesia_name: "Julung-julung", code: "" },
	{ order: "PERCOIDEI", family: "Haemulidae", scientific_name: "Pomadasys maculatus", fishbase_name: "Saddle grunt", english_name: "Saddle grunt/Spotted javelinfish", indonesia_name: "Gerot-gerot", code: "PKL" },
	{ order: "PERCOIDEI", family: "Haemulidae", scientific_name: "Plectorhinchus spp", fishbase_name: "", english_name: "Sweetlips", indonesia_name: "Ikan gaji", code: "PBX" },
	{ order: "AULOPIFORMES", family: "Synodontidae", scientific_name: "Harpadon nehereus", fishbase_name: "Bombay-duck", english_name: "Bombay duck", indonesia_name: "Ikan nomei/Lomei", code: "BUC" },
	{ order: "SCOMBROIDEI", family: "Istiophoridae", scientific_name: "Istiophorus platypterus", fishbase_name: "Indo-Pacific sailfish", english_name: "Indo-pacific sailfish", indonesia_name: "Ikan layaran", code: "SFA" },
	{ order: "SCOMBROIDEI", family: "Istiophoridae", scientific_name: "Makaira indica", fishbase_name: "", english_name: "Black marlin", indonesia_name: "Setuhuk hitam", code: "BLM" },
	{ order: "", family: "", scientific_name: "Makaira mazarra", fishbase_name: "", english_name: "Indo-pacific blue marlin", indonesia_name: "Setuhuk biru", code: "" },
	{ order: "SCOMBROIDEI", family: "Istiophoridae", scientific_name: "Tetrapturus audax", fishbase_name: "", english_name: "Striped marlin", indonesia_name: "Setuhuk loreng", code: "MLS" },
	{ order: "SCOMBROIDEI", family: "Xiphiidae", scientific_name: "Xiphias gladius", fishbase_name: "Swordfish", english_name: "Swordfish", indonesia_name: "Ikan pedang", code: "SWO" },
	{ order: "PERCOIDEI", family: "Labridae", scientific_name: "Cheilinus undulatus", fishbase_name: "Humphead wrasse", english_name: "Napoleon wrasse/Humphead wrasse", indonesia_name: "Ikan napoleon", code: "HVM" },
	{ order: "PERCOIDEI", family: "Lactariidae", scientific_name: "Lactarius lactarius", fishbase_name: "False trevally", english_name: "Fals trevally", indonesia_name: "Kapas-kapas", code: "TRF" },
	{ order: "PERCOIDEI", family: "Leiognathidae", scientific_name: "Leiognathus spp", fishbase_name: "", english_name: "Slipmouths/Pony fishes", indonesia_name: "Peperek", code: "POY" },
	{ order: "PERCOIDEI", family: "Lethrinidae", scientific_name: "Lethrinus spp", fishbase_name: "", english_name: "Emperors", indonesia_name: " Lencam", code: "LZX" },
	{ order: "PERCOIDEI", family: "Lutjanidae", scientific_name: "Lutjanus spp", fishbase_name: "", english_name: "Red snappers", indonesia_name: " Kakap merah/Bambangan", code: "SNA" },
	{ order: "PERCOIDEI", family: "Lutjanidae", scientific_name: "Pristipomoides multidens", fishbase_name: "Goldbanded jobfish", english_name: "Goldenbanded jobfish", indonesia_name: "Pinjalo", code: "LRI" },
	{ order: "PERCOIDEI", family: "Lutjanidae", scientific_name: "Pristipomoides typus", fishbase_name: "Sharptooth jobfish", english_name: "Sharptooth jobfish", indonesia_name: "Pinjalo", code: "LRU" },
	{ order: "MUGILIFORMES", family: "Mugilidae", scientific_name: "Mugil cephalus", fishbase_name: "Flathead grey mullet", english_name: "Mangrove mullets", indonesia_name: "Belanak", code: "MUF" },
	{ order: "MUGILIFORMES", family: "Mugilidae", scientific_name: "Valamugil seheli", fishbase_name: "", english_name: "Blue-spot mullet/Blue-tail mullet", indonesia_name: "Belanak", code: "VMH" },
	{ order: "PERCOIDEI", family: "Mullidae", scientific_name: "Parupeneus indicus", fishbase_name: "Indian goatfish", english_name: "Indian goatfish", indonesia_name: "Biji nangka karang", code: "RFQ" },
	{ order: "PERCOIDEI", family: "Mullidae", scientific_name: "Upeneus sulphureus", fishbase_name: "Sulphur goatfish", english_name: "Sulphur goatfish", indonesia_name: "Kuniran", code: "UPS" },
	{ order: "PERCOIDEI", family: "Mullidae", scientific_name: "Upeneus vittatus", fishbase_name: "Yellowstriped goatfish", english_name: "Yellow-strip goatfish", indonesia_name: "Biji nangka karang", code: "UPI" },
	{ order: "", family: "", scientific_name: "Nemimterus hexodon", fishbase_name: "", english_name: "Ornate treafin bream", indonesia_name: "Kurisi", code: "" },
	{ order: "PERCOIDEI", family: "Polynemidae", scientific_name: "Eleutheronema tetradactylum", fishbase_name: "Fourfinger threadfin", english_name: "Four finger treadfin", indonesia_name: "Kurau", code: "FOT" },
	{ order: "PERCOIDEI", family: "Polynemidae", scientific_name: "Polynemus spp", fishbase_name: "", english_name: "Treadfin", indonesia_name: " Kuro/Senangin", code: "QTX" },
	{ order: "PERCOIDEI", family: "Priacanthidae", scientific_name: "Priacanthus tayenus", fishbase_name: "Purple-spotted bigeye", english_name: "Purple-spotted/Big eye", indonesia_name: "Swangi/Mata besar", code: "PQY" },
	{ order: "", family: "", scientific_name: "Priacanthus marcracanthus", fishbase_name: "", english_name: "Red big eye", indonesia_name: "Serinding tembakau", code: "" },
	{ order: "PERCOIDEI", family: "Sciaenidae", scientific_name: "Nibea albiflora", fishbase_name: "", english_name: "Croacker", indonesia_name: "Gulamah/Tigawaja", code: "YED" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Auxis rochei", fishbase_name: "", english_name: "Bullet tuna", indonesia_name: "Lisong", code: "BLT" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Auxis thazard", fishbase_name: "", english_name: "Firgate tuna", indonesia_name: "Tongkol krai", code: "FRI" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Euthynnus affinis", fishbase_name: "Kawakawa", english_name: "Kawa kawa/Eastern little tuna", indonesia_name: "Tongkol komo", code: "KAW" },
	{ order: "", family: "", scientific_name: "Katsuwanus pelamis", fishbase_name: "", english_name: "Skipjack tuna", indonesia_name: "Cakalang", code: "" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Rastrelliger brachysoma", fishbase_name: "Short mackerel", english_name: "Short-body mackerel", indonesia_name: "Kembung", code: "RAB" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Rastrelliger kanagurta", fishbase_name: "Indian mackerel", english_name: "Indian mackerel", indonesia_name: "Banyar", code: "RAG" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Sarda orientalis", fishbase_name: "Striped bonito", english_name: "Striped bonito", indonesia_name: "Kenyar", code: "BIP" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Scomber australasicus", fishbase_name: "Blue mackerel", english_name: "Spotted chub mackerel", indonesia_name: "Slengseng", code: "MAA" },
	{ order: "", family: "", scientific_name: "Scomberomorus cammerson", fishbase_name: "", english_name: "Narrow-barred spanish mackerel", indonesia_name: "Tenggiri", code: "" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Scomberomorus guttatus", fishbase_name: "Indo-Pacific king mackerel", english_name: "Indo-pacific king mackerel", indonesia_name: "Tenggiri papan", code: "GUT" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Thunnus alalunga", fishbase_name: "Albacore", english_name: "Albacore", indonesia_name: "Albakora", code: "ALB" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Thunnus albacares", fishbase_name: "Yellowfin tuna", english_name: "Yellowfin tuna", indonesia_name: "Madidihang", code: "YFT" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Thunnus maccoyii", fishbase_name: "Southern bluefin tuna", english_name: "Southern bluefin tuna", indonesia_name: "Tuna sirip biru selatan", code: "SBF" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Thunnus obesus", fishbase_name: "Bigeye tuna", english_name: "Bigeye tuna", indonesia_name: "Tuna mata besar", code: "BET" },
	{ order: "SCOMBROIDEI", family: "Scombridae", scientific_name: "Thunnus tonggol", fishbase_name: "Longtail tuna", english_name: "Longtail tuna", indonesia_name: "Tongkol abu-abu", code: "LOT" },
	{ order: "", family: "", scientific_name: "Cephalophodis boenack", fishbase_name: "", english_name: "Blue lined seabass", indonesia_name: "Kerapu karang", code: "" },
	{ order: "PERCOIDEI", family: "Serranidae", scientific_name: "Cromileptes altivelis", fishbase_name: "Humpback grouper", english_name: "Humpback hind", indonesia_name: "Kerapu bebek", code: "MPV" },
	{ order: "PERCOIDEI", family: "Serranidae", scientific_name: "Epinephelus merra", fishbase_name: "Honeycomb grouper", english_name: "Honeycomb grouper", indonesia_name: "Kerapu balong", code: "EER" },
	{ order: "PERCOIDEI", family: "Serranidae", scientific_name: "Epinephelus tauvina", fishbase_name: "Greasy grouper", english_name: "Greasy rockcod/Estuary rockcod", indonesia_name: "Kerapu lumpur", code: "EPT" },
	{ order: "PERCOIDEI", family: "Serranidae", scientific_name: "Plectropomus leopardus", fishbase_name: "Leopard coralgrouper", english_name: "Leopard coralgrouper", indonesia_name: "Kerapu sunu", code: "EMO" },
	{ order: "ACANTHUROIDEI", family: "Siganidae", scientific_name: "Siganus canaliculatus", fishbase_name: "White-spotted spinefoot", english_name: "White-spotted spinefoot", indonesia_name: "Beronang lingkis", code: "SCN" },
	{ order: "ACANTHUROIDEI", family: "Siganidae", scientific_name: "Siganus guttatus", fishbase_name: "Goldlined spinefoot", english_name: "Orange-spotted spinefoot", indonesia_name: "Ikan beronang", code: "SGU" },
	{ order: "ACANTHUROIDEI", family: "Siganidae", scientific_name: "Siganus virgatus", fishbase_name: "Barhead spinefoot", english_name: "Barhed spinefoot", indonesia_name: "Beronang kuning", code: "IUG" },
	{ order: "", family: "", scientific_name: "Silago sihama", fishbase_name: "", english_name: "Sivler silago", indonesia_name: "Rejung", code: "" },
	{ order: "OTHER PERCIFORMES", family: "Sphyraenidae", scientific_name: "Sphyraena barracuda", fishbase_name: "Great barracuda", english_name: "Great barracuda", indonesia_name: "Alu-alu/Manggilala/Pucul", code: "GBA" },
	{ order: "OTHER PERCIFORMES", family: "Sphyraenidae", scientific_name: "Sphyraena jello", fishbase_name: "Pickhandle barracuda", english_name: "Pickhandel barracuda", indonesia_name: "Senuk", code: "BAC" },
	{ order: "PERCOIDEI", family: "Terapontidae", scientific_name: "Terapon jarbua", fishbase_name: "Jarbua terapon", english_name: "Jarbua terapon", indonesia_name: "Kerong-kerong", code: "TJB" },
	{ order: "PERCOIDEI", family: "Terapontidae", scientific_name: "Terapon theraps", fishbase_name: "Largescaled terapon", english_name: "Largescale terapon", indonesia_name: "Kerong-kerong", code: "TEH" },
	{ order: "SCOMBROIDEI", family: "Trichiuridae", scientific_name: "Trichiurus spp", fishbase_name: "", english_name: "Hairtails", indonesia_name: "Layur", code: "TCW" },
	{ order: "LAMNIFORMES", family: "Alopiidae", scientific_name: "Alopias spp", fishbase_name: "", english_name: "Thresher sharks", indonesia_name: "Cucut tikus, Cucut moneyt", code: "THR" },
	{ order: "CARCHARHINIFORMES", family: "Carcharhinidae", scientific_name: "Carcharhinus spp", fishbase_name: "", english_name: "Requiem sharks (ground sharks, blue sharks, sharpnose sharks)", indonesia_name: "Cucut lanyam", code: "CWZ" },
	{ order: "LAMNIFORMES", family: "Lamnidae", scientific_name: "Isurus spp", fishbase_name: "", english_name: "Mackerel sharks, Makos, White sharks, Porbeagles", indonesia_name: "Mako", code: "MAK" },
	{ order: "", family: "", scientific_name: "Pristis spp", fishbase_name: "", english_name: "Sawfishes", indonesia_name: "Ikan gergaji", code: "" },
	{ order: "", family: "", scientific_name: "Eusphyra blochi", fishbase_name: "", english_name: "Wingehead", indonesia_name: "Cucut martil", code: "" },
	{ order: "", family: "", scientific_name: "Sphyma spp", fishbase_name: "", english_name: "Hammerhead sharks", indonesia_name: "Capingan", code: "" },
	{ order: "SQUALIFORMES", family: "Squalidae", scientific_name: "Squalus spp", fishbase_name: "", english_name: "Dogfish sharks", indonesia_name: "Cucut botol", code: "DGZ" },
	{ order: "RAJIFORMES", family: "Dasyatidae", scientific_name: "Dasyatis spp", fishbase_name: "", english_name: "Stingrays", indonesia_name: "Pari kembang", code: "STI" },
	{ order: "RAJIFORMES", family: "Dasyatidae", scientific_name: "Dasyatis spp", fishbase_name: "", english_name: "Stingrays", indonesia_name: "Pari macan", code: "STI" },
	{ order: "RAJIFORMES", family: "Mobulidae", scientific_name: "Mobula spp", fishbase_name: "", english_name: "Devilrays", indonesia_name: "Pari kelelawar", code: "RMV" },
	{ order: "RAJIFORMES", family: "Mobulidae", scientific_name: "Mobula spp", fishbase_name: "", english_name: "Mantarays", indonesia_name: "Pari kelelawar", code: "RMV" },
	{ order: "", family: "", scientific_name: "Myliobatus spp", fishbase_name: "", english_name: "Eaglerays", indonesia_name: "Pari burung", code: "" },
	{ order: "RAJIFORMES", family: "Myliobatidae", scientific_name: "Aetobatus spp", fishbase_name: "", english_name: "Eaglerays", indonesia_name: "Pari burung", code: "AQX" },
	{ order: "RAJIFORMES", family: "Myliobatidae", scientific_name: "Aetomylaeus spp", fishbase_name: "", english_name: "Eaglerays", indonesia_name: "Pari burung", code: "RJX" },
	{ order: "RAJIFORMES", family: "Rhinobatidae", scientific_name: "Rhina ancylostoma", fishbase_name: "Bowmouth guitarfish", english_name: "Guitarfishes", indonesia_name: "Pari hidung sekop", code: "RRY" },
	{ order: "RAJIFORMES", family: "Rhinobatidae", scientific_name: "Rhina ancylostoma", fishbase_name: "Bowmouth guitarfish", english_name: "Shovelnose rays", indonesia_name: "Pari hidung sekop", code: "RRY" },
	{ order: "RAJIFORMES", family: "Rhinobatidae", scientific_name: "Rhynchobatus djiddensis", fishbase_name: "Giant guitarfish", english_name: "Whitespotted wedgefishes", indonesia_name: "Pari kekeh", code: "RCD" },
	{ order: "", family: "", scientific_name: "-", fishbase_name: "", english_name: "All fishes other than those listed above", indonesia_name: "Ikan-ikan yang lain", code: "" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Metapenaeus ensis", fishbase_name: "", english_name: "Endeavour prawn/shrimp, Bluetail endeavour prawn/shrimp, Red greasiback", indonesia_name: "Udang dogol", code: "MPE" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Metapenaeus monoceros", fishbase_name: "", english_name: "Endeavour prawn/shrimp, Bluetail endeavour prawn/shrimp, Red greasiback", indonesia_name: "Udang dogol", code: "MPN" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Penaeus merguiensis", fishbase_name: "", english_name: "Banana prawn/White shrimp", indonesia_name: "Udang putih/Jerbung", code: "PBA" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Penaeus indicus", fishbase_name: "", english_name: "Banana prawn/Indian", indonesia_name: "Udang putih/Jerbung", code: "PNI" },
	{ order: "", family: "", scientific_name: "Parapenaeopsis sculptitis", fishbase_name: "", english_name: "Tiger cat shrimp/Rainbow shrimp", indonesia_name: "Udang krosok", code: "" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Penaeus latisulcatus", fishbase_name: "", english_name: "King/Blue legged prawn", indonesia_name: "Udang ratu/raja", code: "WKP" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Penaeus monodon", fishbase_name: "", english_name: "Jumbo tiger prawn/shrimp, Giant tiger prawn/shrimp, Blue tiger prawn", indonesia_name: "Udang windu", code: "GIT" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Penaeus semisulcatus", fishbase_name: "", english_name: "Jumbo tiger prawn/Brown tiger prawn", indonesia_name: "Udang windu", code: "TIP" },
	{ order: "NATANTIA", family: "Penaeidae", scientific_name: "Penaeus esculentus", fishbase_name: "", english_name: "Tiger prawn/Brown tiger prawn", indonesia_name: "Udang windu", code: "PRB" },
	{ order: "REPTANTIA", family: "Palinuridae", scientific_name: "Panulirus versicolor", fishbase_name: "", english_name: "Spiny lobster", indonesia_name: "Udang barong/Udang karang", code: "NUV" },
	{ order: "", family: "", scientific_name: "-", fishbase_name: "", english_name: "Other shrimps", indonesia_name: "Udang lainnya", code: "" },
	{ order: "BRACHYURA", family: "Portunidae", scientific_name: "Scylla serrata", fishbase_name: "", english_name: "Mangrove mud crab", indonesia_name: "Kepiting", code: "MUD" },
	{ order: "BRACHYURA", family: "Portunidae", scientific_name: "Portunus pelagicus", fishbase_name: "", english_name: "Swimming crab", indonesia_name: "Rajungan", code: "SCD" },
	{ order: "", family: "", scientific_name: "Cheolina mydas", fishbase_name: "", english_name: "Marine turtles", indonesia_name: "Penyu", code: "" },
	{ order: "", family: "", scientific_name: "-", fishbase_name: "", english_name: "All crustaceans other than those listed above", indonesia_name: "Binatang berkulit keras lainnya", code: "" },
	{ order: "BIVALVIA", family: "Arcidae", scientific_name: "Anadara granosa", fishbase_name: "", english_name: "Blood cockles", indonesia_name: "Kerang darah", code: "BLC" },
	{ order: "BIVALVIA", family: "Mytilidae", scientific_name: "Perna viridis", fishbase_name: "", english_name: "Green mussels", indonesia_name: "Kerang hijau", code: "MSV" },
	{ order: "CEPHALOPODA", family: "Loliginidae", scientific_name: "Loligo spp", fishbase_name: "", english_name: "Common squids", indonesia_name: "Cumi-cumi", code: "SQC" },
	{ order: "CEPHALOPODA", family: "Octopodidae", scientific_name: "Octopus spp", fishbase_name: "", english_name: "Octupuses", indonesia_name: "Gurita", code: "OCZ" },
	{ order: "BIVALVIA", family: "Ostreidae", scientific_name: "Crassostrea gigas", fishbase_name: "", english_name: "Pacific oyster", indonesia_name: "Tiram", code: "OYG" },
	{ order: "", family: "", scientific_name: "Amusium spp", fishbase_name: "", english_name: "Scallops", indonesia_name: "Simping", code: "" },
	{ order: "BIVALVIA", family: "Pteriidae", scientific_name: "Pinctada margaritifera", fishbase_name: "", english_name: "Black-lip pearl oyster", indonesia_name: "Kerang mutiara/Tapis-tapis", code: "PNM" },
	{ order: "CEPHALOPODA", family: "Sepiidae", scientific_name: "Sepia spp", fishbase_name: "", english_name: "Cuttle fish", indonesia_name: "Sotong", code: "IAX" },
	{ order: "", family: "", scientific_name: "Trochus (Teptus) nilotic", fishbase_name: "", english_name: "Top shell", indonesia_name: "Lola/Susu bundar", code: "" },
	{ order: "BIVALVIA", family: "Veneridae", scientific_name: "Meretrix spp", fishbase_name: "", english_name: "Clams", indonesia_name: "Remis", code: "HCX" },
	{ order: "", family: "", scientific_name: "-", fishbase_name: "", english_name: "All molluscs other than those listed above", indonesia_name: "Binatang lunak lainnya", code: "" },
	{ order: "", family: "", scientific_name: "Stichopus spp", fishbase_name: "", english_name: "Sea cucumber", indonesia_name: "Teripang", code: "" },
	{ order: "", family: "", scientific_name: "Aulleta spp", fishbase_name: "", english_name: "Sponge", indonesia_name: "Bunga karang", code: "" },
	{ order: "SCYPHOZOA", family: "Rhizostomidae", scientific_name: "Rhopilema spp", fishbase_name: "", english_name: "Jelly fish", indonesia_name: "Ubur-ubur", code: "JEL" },
	{ order: "", family: "", scientific_name: "-", fishbase_name: "", english_name: "All aquaitc animals other than those listed above", indonesia_name: "Binatang air lainnya", code: "" },
	{ order: "", family: "", scientific_name: "Euchema spp", fishbase_name: "", english_name: "Sea weeds", indonesia_name: "Rumput laut", code: "" },
	{ order: "", family: "", scientific_name: "Gracillia spp", fishbase_name: "", english_name: "Sea weeds", indonesia_name: "Rumput laut", code: "" },
	{ order: "", family: "", scientific_name: "Aetomylaeus spp", fishbase_name: "", english_name: "Sea weeds", indonesia_name: "Rumput laut", code: "RJX" }
])

province = Province.create([
  { name: "NTB", code: "51" }
]) 
# Districts
district1 = District.create(name: "District1", province_id: 1)
district9 = District.create(name: "District Prawn", province_id: 1)

# Offices
office1 = Office.create(name: "Test office 1", district_id: district1.id)
office2 = Office.create(name: "Test office 2", district_id: district9.id)

# Roles
role_public = Role.create(name: "public")
role_staff = Role.create(name: "staff")
role_supervisor = Role.create(name: "supervisor")
role_admin = Role.create(name: "administrator")

# Administrators
admin1 = office1.admins.create(email: "admin@fish.com",
  name: "Admin Adminson",
  office_id: office1.id,
  password: "admin1",
  password_confirmation: "admin1")

admin_staff1 = Admin.create(email: "staff1@fish.com",
	name: "staff1",
	password: "staff1",
	password_confirmation: "staff1",
	office_id: office1.id)
admin_staff1.roles.push role_staff
admin_staff2 = Admin.create(email: "staff2@fish.com",
	name: "staff2",
	password: "staff2",
	password_confirmation: "staff2",
	office_id: office2.id)
admin_staff2.roles.push role_staff

admin_supervisor1 = Admin.create(email: "supervisor1@fish.Common",
	name: "supervisor1",
	password: "supervisor1",
	password_confirmation: "supervisor1",
	office_id: office1.id)
admin_supervisor1.roles.push role_supervisor
admin_supervisor2 = Admin.create(email: "supervisor2@fish.com",
	name: "supervisor2",
	password: "supervisor2",
	password_confirmation: "supervisor2",
	office_id: office2.id)
admin_supervisor2.roles.push role_supervisor

