# Guide de déploiement — First Miracle Event

## 1. Supabase (base de données, gratuit)
1. supabase.com > New project (nom : first-miracle-event, région proche, mot de passe fort).
2. SQL Editor > New query > coller tout `schema.sql` > Run.
3. Authentication > Users > Add user : votre e-mail + mot de passe (c'est votre accès gestionnaire).
4. Authentication > Sign In / Providers : désactiver « Allow new users to sign up ».
5. Project Settings > API : copier **Project URL** et la clé **anon public**.

## 2. Configuration
Ouvrir `config.js`, coller SUPABASE_URL et SUPABASE_KEY. Renseigner SITE_URL plus tard (l'adresse Netlify).

## 3. Netlify
1. app.netlify.com > Add new site > Deploy manually.
2. Glisser-déposer le dossier du site (tous les fichiers).
3. Site configuration > Change site name : ex. `firstmiracleevent` → https://firstmiracleevent.netlify.app

## 4. Premier remplissage
1. Aller sur `votre-site/admin.html`, se connecter.
2. Catalogue > « Charger le catalogue d'exemple », puis modifier les prix et ajouter vos photos.
3. Galerie > publier vos meilleures réalisations.

## 5. Devis vers Google Sheets (facultatif)
1. Créer un Google Sheet > Extensions > Apps Script, coller :
```js
function doPost(e){const d=JSON.parse(e.postData.contents);
SpreadsheetApp.getActiveSheet().appendRow([new Date(),d.name,d.phone,d.event_type,d.event_date,d.guests,d.total,JSON.stringify(d.items),d.message,d.source]);
return ContentService.createTextOutput('ok');}
```
2. Déployer > Nouveau déploiement > Application Web > Accès : Tout le monde > copier l'URL.
3. La coller dans `GSHEET_URL` de `config.js`, puis redéployer sur Netlify.

## 6. QR code
Admin > QR code : télécharger/capturer un QR par support (flyer, carte, banderole). Les demandes indiquent la source.

## 7. Installer l'app
Sur Android/Chrome : bouton « Installer » du site. Sur iPhone/Safari : Partager > Sur l'écran d'accueil.

## Plus tard : Mobile Money
Mettre `PAY_ENABLED:true` dans `config.js` et brancher CinetPay ou PayDunya sur le bloc `#pay`.

## Mise à jour
Après toute modification de fichier : glisser le dossier à nouveau dans Netlify (Deploys > drag and drop).

## Langues FR / EN
Le bouton FR/EN est en haut du site. Les textes du site sont traduits automatiquement. Pour les articles du catalogue, remplissez « Nom en anglais » et « Description en anglais » dans l'admin. Si votre base Supabase existe déjà, exécutez `migration-langue.sql` une fois dans SQL Editor.
