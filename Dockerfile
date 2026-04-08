FROM flyway/flyway:10-alpine
COPY sql /flyway/sql
# The connection string will be provided via FLYWAY_URL env var on Render
ENTRYPOINT ["flyway", "migrate"]
