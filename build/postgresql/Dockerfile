FROM postgres:12-alpine

COPY initdb.d/ /docker-entrypoint-initdb.d/
COPY dist/ /dist/

EXPOSE 5432
