#!/bin/bash
echo "=== FULLSTACK INIT ===" &&

rm -rf frontend/ &&
rm -rf backend/ &&
rm -rf express-helper/ &&

rm -rf .git/ &&
rm -rf .gitignore &&
rm -rf README.md &&

# Clone reps
git clone git@github.com:pravosleva/pravosleva-blog-2021-frontend-cra.git frontend &&
git clone git@github.com:pravosleva/pravosleva-blog-2021-backend.git backend &&

# Install
yarn --cwd ./frontend &&
yarn --cwd ./backend &&

# Backend side: Uploads dir init
BACKEND_DIR="${PWD}/backend"
UPLOADS_DIR="${BACKEND_DIR}/public/uploads"
echo "Проверка $UPLOADS_DIR"
if [ ! -d $UPLOADS_DIR ]
then
  echo "  >> $UPLOADS_DIR не существует..."
  mkdir $UPLOADS_DIR
  if [ -d $UPLOADS_DIR ]
  then
    echo "    >> Создана успешно."
  fi
else
  echo "  >> Аlready exists: $UPLOADS_DIR"
fi

# === LOOK! First param: gatsby|nextjs
bash envs-init.sh nextjs &&
yarn --cwd ./frontend envs-init &&
# ===

echo "" &&
echo "  DEVELOPMENT" &&
echo "" &&
echo "👉 CHECK THIS BEFORE START:" &&
echo "  🔥 ./ecosystem.dev.config.js" &&
# echo "  🔥 ./frontend/.env.dev" &&
echo "" &&
echo "🚀 $ pm2 start ecosystem.dev.config.js" &&
echo "" &&
echo "===" &&
echo "" &&
echo "  PRODUCTION" &&
echo "" &&
echo "👉 CHECK THIS BEFORE START:" &&
echo "  🔥 ./ecosystem.prod.config.js" &&
# echo "  🔥 ./frontend/.env.prod" &&
echo "" &&
echo "🚀 $ bash build-all-prod.sh" &&
echo "" &&
# Ниже коментарий для 1-й итерации:
# echo "Кстати, при каждом build-front-prod.sh (точнее, frontend/postbuild.sh) во внешней директории должна быть создана либо дополнена /uploads из backend/uploads" &&
# echo "" &&
echo "🚀 $ pm2 start ecosystem.prod.config.js" &&
echo "" &&
echo "=== 👌" && # rm -rf fullstack-init.sh
echo "Congrats!" &&

bash build-all-prod.sh
