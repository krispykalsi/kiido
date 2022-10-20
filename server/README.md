## ⚙️ Setup

1. Make sure you have [Go](https://go.dev/doc/install) installed.
2. Spinup a [PostgreSQL](https://www.postgresql.org/download/) server.
3. Create a file `credentials.env` at the root of `server` directory. Copy the following content and replace with your values from the previous step.
      ```bash
      export KIIDO_HOST="xyz.postgres.database.abc.com"
      export KIIDO_DATABASE="postgres"
      export KIIDO_USER="your username"
      export KIIDO_PASSWORD="your password"
      export KIIDO_PORT="any free port" # eg. 9000
      ```
4. Execute the following in your default shell.
      ```bash
      source credentials.env
      ```
5. Download the required Go packages
      ```bash
      go mod download
      ```
      anddd run the server!
      ```bash
      go run ./cmd/kiido-server
      ```