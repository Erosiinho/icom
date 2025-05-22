# Initialisation du projet MedusaJS + Frontend

Ce projet repose sur deux services :

* Un **backend MedusaJS**
* Un **frontend Next.js**

## Étape 1 : Remplir les fichiers `.env`

### Backend (`./backend/.env`)

Crée un fichier `.env` dans le dossier `backend` avec :

```env
DATABASE_URL=postgres://medusa_user:medusa_password@postgres:5432/medusa_db
```

> Cette URL permet à Medusa de se connecter à PostgreSQL via Docker.

---

### Frontend (`./frontend/.env`)

Crée un fichier `.env` dans le dossier `frontend` avec :

```env
MEDUSA_BACKEND_URL=http://localhost:9000
NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY=
```

> La valeur de `NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY` sera renseignée **plus tard** (voir étape 4).

---

## Étape 2 : Démarrer l’environnement

Dans le dossier racine :

```bash
docker-compose up --build
```

Lance tous les containers :

* PostgreSQL
* Redis
* Backend MedusaJS

---

## Étape 3 : Générer une clé API publique (publishable key)

Connecte-toi à la base PostgreSQL depuis Docker :

```bash
docker compose exec postgres-1 /bin/sh
```

Puis dans le shell du container :

```bash
psql -U medusa_user -d medusa_db
```

Une fois connecté au shell PostgreSQL (`psql`), exécute :

```sql
SELECT * FROM api_key;
```

Repère la valeur de la colonne `token` (ex: `pk_test_123456...`).

---

## Étape 4 : Coller la `publishable key` dans le frontend

Retourne dans le fichier `.env` du frontend (`./frontend/.env`) et colle la clé :

```env
NEXT_PUBLIC_MEDUSA_PUBLISHABLE_KEY=pk_test_123456...
```

---

## Bonus : Création d’un compte admin (si pas déjà fait)

Si tu veux accéder à l’admin de Medusa :

```bash
docker compose exec backend sh
npx medusa user --email admin@admin.com --password admin
```

Puis connecte-toi via le dashboard avec :

* Email : `admin@admin.com`
* Password : `admin`

---