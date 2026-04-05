FROM caddy:2.8.4-alpine

ENV FRONTEND_ORIGINS=app.coldboxstore.com
ENV ACME_SERVER=https://acme-v02.api.letsencrypt.org/directory
ENV URL_BASE_API=https://api.coldboxstore.com
ENV URL_AIR_VCCA=https://air-prod.coldboxstore.com
ENV URL_FARMER_API=https://farmer-prod.coldboxstore.com
ENV URL_IMPACT_API=https://impact-prod.coldboxstore.com

# TODO: Update to correct production URL
ENV URL_COMSOL_DT_API=https://comsol_dt_service.coldboxstore.com 

COPY Caddyfile /etc/caddy/Caddyfile
