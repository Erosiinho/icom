#!/bin/sh
SETUP_FLAG="/app/.isDbSetup"

if [ ! -f "$SETUP_FLAG" ]; then
  echo "Initialisation de la base de données Medusa..."
  touch "$SETUP_FLAG"
  npx medusa db:setup --no-interactive
  npm run seed
  echo "✅ Setup terminé, flag créé à $SETUP_FLAG"
else
  echo "⚠️  Setup déjà effectué, skip."
fi

echo "🟢 Démarrage du backend MedusaJS..."
npm run dev
