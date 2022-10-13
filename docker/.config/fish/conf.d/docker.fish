# Adds Docker abbreviations.
abbr -a dps docker ps
abbr -a dc docker compose
abbr -a dcu docker compose up
abbr -a dcub docker compose up --build
abbr -a dcud docker compose up -d
abbr -a dcubd docker compose up -d --build
abbr -a dcl docker compose logs -f
abbr -a dcul docker compose up -d \&\& docker compose logs -f
abbr -a dcubl docker compose up -d --build \&\& docker compose logs -f
abbr -a dcr docker compose restart
abbr -a dcrl docker compose restart \&\& docker compose logs -f
abbr -a dcd docker compose down
