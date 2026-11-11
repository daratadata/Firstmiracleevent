# Guide de déploiement — First Miracle Event

## 1. Supabase
1. **SQL Editor** : ouvrez `schema.sql`, remplacez `REMPLACEZ@VOTRE-EMAIL.COM` (une seule fois, dans la fonction `is_admin`) par l'e-mail de votre compte administrateur, collez tout dans SQL Editor, **Run**. Ce script peut être relancé sans risque.
2. **Authentication > Users** : votre compte e-mail existant devient l'administrateur (rien d'autre à faire).
3. **Authentication > Sign In / Providers > Email** : 
   - laissez **Enable Email provider** activé ;
   - **désactivez « Confirm email »** (indispensable : les clients n'ont pas de vraie boîte e-mail) ;
   - **Authentication > Sign In / Providers** (réglages généraux) : **« Allow new users to sign up » activé**.
4. **Project Settings > API** : copiez l'URL du projet et la clé `anon public` dans `config.js`.

## 2. Netlify
Glissez-déposez le dossier décompressé du site dans Netlify (Deploys). Aucun fichier `admin.html` : la gestion est dans l'application.

## 3. Utilisation
- **Clients** : bouton « 👤 Compte » > Créer un compte (nom, numéro, mot de passe, œil pour voir le mot de passe). Connexion ensuite avec le numéro + mot de passe. Ils retrouvent « Mes demandes » avec leur statut.
- **Vous (administrateur)** : « 👤 Compte » > Connexion avec votre **e-mail** et votre mot de passe Supabase > bouton **⚙ Gestion** (catalogue, photos, galerie, demandes, clients, QR codes).
- Premier remplissage : Gestion > Catalogue > « Charger le catalogue d'exemple », puis modifiez les prix et ajoutez les photos.

## 4. Devis vers Google Sheets (facultatif)
Voir l'étape détaillée envoyée dans la conversation : script Apps Script, URL `/exec` dans `GSHEET_URL`.

## 5. Mot de passe oublié d'un client
Il n'y a pas d'e-mail réel, donc pas de réinitialisation automatique. Solution simple : Supabase > Authentication > Users > supprimer le compte du client, qui recrée un compte avec le même numéro.

## 6. Langues
Bouton FR/EN. Les articles sans traduction anglaise sont traduits automatiquement ; vous pouvez corriger dans Gestion > Catalogue (champs « en anglais »).

## 7. Mise à jour
Après toute modification : glissez à nouveau le dossier dans Netlify, puis rechargez le site deux fois.

## Plus tard : Mobile Money
`PAY_ENABLED:true` dans `config.js` puis branchement CinetPay ou PayDunya.

## Proformas (factures proforma)
1. **Une seule fois** : Supabase > SQL Editor > collez `proformas.sql` > Run. (Ne relancez pas `schema.sql` en entier sans remettre votre e-mail administrateur dans la fonction `is_admin`.)
2. Application > 👤 Compte > ⚙ Gestion > **Proformas** > « Nouveau proforma ».
3. Remplissez le client, la livraison et les articles (le catalogue propose les noms et remplit le prix), puis les montants (jours, remise, transport, caution, avance). L'aperçu se met à jour en direct.
4. **Enregistrer**, puis **Imprimer / PDF** (choisir « Enregistrer au format PDF » dans la fenêtre d'impression) ou **WhatsApp** pour envoyer le résumé au client.
5. Depuis **Demandes**, le bouton « 🧾 Créer un proforma » reprend automatiquement le client et les articles d'une demande reçue.

## Fidélité et avis clients
1. **Une seule fois** : Supabase > SQL Editor > collez `fidelite_avis.sql` > Run.
2. **Fidélité** : réglages dans `config.js` (`LOYALTY` : points par FCFA, niveaux, avantages). Les clients voient leur carte dans « 👤 Compte ». Vous créditez les points depuis un proforma (⭐ Créditer les points fidélité) ou depuis Gestion > Clients (± pts).
3. **Avis** : les clients connectés laissent une note et un commentaire ; l'avis est publié après votre validation dans Gestion > Avis. Vous pouvez aussi y ajouter un avis reçu par WhatsApp.
4. **Proformas** : sections (ex. « Location de matériel »), désignation libre, détail sous chaque article, ajout depuis le catalogue par cases à cocher, boutons ↑ ↓ pour réordonner.
