FROM node:14-alpine

WORKDIR /src

COPY package*.json ./
RUN npm install

COPY . .

RUN npx prisma generate
#Server
ENV PORT=$PORT
ENV JWT_SECRET=$JWT_SECRET
# Google Bucket
ENV GOOGLE_CLOUD_CLIENT_EMAIL=$GOOGLE_CLOUD_CLIENT_EMAIL
ENV GOOGLE_CLOUD_PRIVATE_KEY=$GOOGLE_CLOUD_PRIVATE_KEY
ENV GOOGLE_CLOUD_PROJECT_ID=$GOOGLE_CLOUD_PROJECT_ID
ENV GOOGLE_CLOUD_STORAGE_BUCKET=$GOOGLE_CLOUD_STORAGE_BUCKET
# Mailgun
ENV MAILGUN_API_KEY=$MAILGUN_API_KEY
ENV MAILGUN_PUBLIC_KEY=$MAILGUN_PUBLIC_KEY
ENV MAILGUN_DOMAIN=$MAILGUN_DOMAIN
ENV MAILGUN_FROM_EMAIL=$MAILGUN_FROM_EMAIL
#CORS
ENV FRONTEND_URL=https://gizilo.com

EXPOSE 3000

CMD ["npm", "start"]