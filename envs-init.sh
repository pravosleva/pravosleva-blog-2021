if [ $# -eq 1 ]
then
  case $1 in
    "nextjs")
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
        }],
      };" > ecosystem.dev.config.js &&
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
    ;;
    *)
    echo "☠️ SCRIPT: envs-init.sh | Undefined param value" &&
    exit 1
  esac
  exit 0
else
  echo "☠️ SCRIPT: envs-init.sh | Param is required! gatsby|nextjs"
  exit 1
fi
