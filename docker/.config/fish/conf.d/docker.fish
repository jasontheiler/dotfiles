# Adds Docker abbreviations.
abbr -a dps docker ps
abbr -a dc docker compose
abbr -a dcu docker compose up
abbr -a dcl docker compose logs -f
abbr -a dcul docker compose up -d \&\& docker compose logs -f
abbr -a dcr docker compose restart
abbr -a dcrl docker compose restart \&\& docker compose logs -f
abbr -a dcd docker compose down
