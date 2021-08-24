if [ $# -eq 1 ]
then
  case $1 in
    "cra")
      echo "
=========================================
  DEVELOPMENT
=========================================

👉 CHECK THIS BEFORE START:
  🔥 ./ecosystem.dev.config.js" &&
      echo "module.exports = {
  apps : [{
    name: 'strapi-1337-dev',
    cwd: __dirname + '/backend',
    script: 'yarn',
    args: 'develop',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '1337',
      DATABASE_HOST: 'cluster0.iwmwb.mongodb.net',
      DATABASE_PORT: '27017',
      DATABASE_NAME: 'pravosleva-corp-dev',
      DATABASE_USERNAME: 'admin',
      DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
      DATABASE_AUTHENTICATION_DATABASE: 'admin',
      DATABASE_SRV: true,
      DATABASE_SSL: true,
    }
  }, {
    name: 'cra-3000',
    cwd: __dirname + '/frontend',
    script: 'yarn',
    args: 'start',
    interpreter: 'none',
    env: {
      NODE_ENV: 'development',
      PORT: '3000',
      REACT_APP_API_ENDPOINT: 'http://localhost:1337'
    }
  }],
};" > ecosystem.dev.config.js &&
      echo "  🔥 (if you dont use pm2): ./frontend/.env.development" &&
      echo "REACT_APP_API_ENDPOINT=http://localhost:1337" > frontend/.env.development.local &&
      echo "
  🚀 $ pm2 start ecosystem.dev.config.js

=========================================
  PRODUCTION
=========================================

👉 CHECK THIS BEFORE START:
  🔥 ./frontend/.env.production" &&
      echo "module.exports = {
apps : [{
  name: 'strapi-1337-prod',
  cwd: __dirname + '/backend',
  script: 'yarn',
  args: 'start',
  interpreter: 'none',
  env: {
    NODE_ENV: 'production',
    PORT: '1337',
    DATABASE_HOST: 'cluster0.u3xvs.mongodb.net',
    DATABASE_NAME: 'pravosleva-corp',
    DATABASE_USERNAME: 'admin',
    DATABASE_PASSWORD: '<DATABASE_PASSWORD>',
    DATABASE_AUTHENTICATION_DATABASE: 'admin',
    DATABASE_SRV: true,
    DATABASE_SSL: true,
  }
}],
};" > ecosystem.prod.config.js
      echo "REACT_APP_API_ENDPOINT=http://pravosleva.ru/api" > frontend/.env.production.local &&
      echo "{
  \"prod:demo\": {
    \"user\": \"root\",
    \"host\": \"pravosleva.ru\",
    \"port\": \"22\",
    \"files\": \"./build/*\",
    \"path\": \"/home/projects/pravosleva-blog/backend/public/cra\",
    \"pre-deploy-local\": \"yarn build && yarn analyze\"
  },
  \"dev\": {},
  \"staging\": {}
}
" > frontend/deploy-app-config.json &&
      echo "
  🚀 $ bash build-all.sh\n
  🚀 $ pm2 start ecosystem.prod.config.js

👉 CHECK THIS BEFORE DEPLOY:
  🔥 ./frontend/deploy-app-config.json
== END: ENVS INIT is Ok  ================"
    ;;
    *)
    echo "☠️ SCRIPT: envs-init.sh | Undefined param value" &&
    exit 1
  esac
  exit 0
else
  echo "☠️ SCRIPT: envs-init.sh | Param is required! cra|nextjs"
  exit 1
fi
