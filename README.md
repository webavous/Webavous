# Web à vous — Site vitrine

Site statique (HTML/CSS/JS, aucun framework) avec formulaire de contact connecté à Supabase.

## 1. Créer le projet Supabase

1. Va sur [supabase.com](https://supabase.com) → **New project**.
2. Une fois le projet créé, ouvre l'onglet **SQL Editor** → **New query**.
3. Colle le contenu du fichier `supabase-schema.sql` (fourni à côté) et clique sur **Run**.
   Cela crée la table `messages` qui recevra les messages du formulaire, avec la sécurité (RLS) correctement configurée : n'importe qui peut envoyer un message, mais seul toi (via le tableau de bord Supabase) peux les lire.
4. Va dans **Project Settings > API**. Récupère deux valeurs :
   - **Project URL**
   - **anon public key**

## 2. Brancher les clés dans le site

Ouvre `index.html`, cherche ces deux lignes (tout en bas, dans le `<script>`) :

```js
const SUPABASE_URL = "https://TON-PROJET.supabase.co";
const SUPABASE_ANON_KEY = "TA_CLE_ANON_PUBLIQUE";
```

Remplace-les par les valeurs récupérées à l'étape 1.4.

⚠️ La clé "anon public" est **prévue pour être visible côté client** (donc dans ton code, même une fois en ligne) — ce n'est pas une faille de sécurité tant que tu gardes les règles RLS telles quelles (elle ne permet que d'écrire, jamais de lire les messages des autres).

## 3. Mettre le code sur GitHub

Dans un terminal, à la racine du dossier du projet :

```bash
git init
git add .
git commit -m "Site Web à vous"
git branch -M main
git remote add origin https://github.com/TON-COMPTE/web-a-vous.git
git push -u origin main
```

(Crée d'abord le dépôt vide sur GitHub si ce n'est pas déjà fait : bouton **New repository**, sans README ni .gitignore pour éviter les conflits.)

## 4. Déployer sur Vercel

1. Sur [vercel.com](https://vercel.com) → **Add New... > Project**.
2. Choisis ton dépôt GitHub `web-a-vous`.
3. Vercel détecte un site statique : aucune configuration de build n'est nécessaire, laisse les réglages par défaut.
4. Clique sur **Deploy**.

Ton site est en ligne en quelques secondes, avec une adresse du type `web-a-vous.vercel.app`. Tu pourras ensuite relier un vrai nom de domaine depuis **Project Settings > Domains** sur Vercel.

## 5. Lire les messages reçus

Va dans ton projet Supabase → **Table Editor > messages**. Chaque message envoyé depuis le site apparaît ici (nom, e-mail, message, date).

## Pour aller plus loin (optionnel)

Si tu veux être notifié par e-mail à chaque nouveau message plutôt que d'aller vérifier Supabase, ce sera une prochaine étape (via une Edge Function Supabase ou un webhook) — dis-le-moi quand tu voudras t'y mettre.
