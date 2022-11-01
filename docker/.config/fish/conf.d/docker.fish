abbr -a dps 'docker ps --format "table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}"'
abbr -a dpsd 'docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Networks}}\t{{.Size}}"'
abbr -a dc docker compose
abbr -a dcu docker compose up -d
abbr -a dcub docker compose up -d --build
abbr -a dcl docker compose logs -f
abbr -a dcul docker compose up -d \&\& docker compose logs -f
abbr -a dcubl docker compose up -d --build \&\& docker compose logs -f
abbr -a dcr docker compose restart
abbr -a dcrl docker compose restart \&\& docker compose logs -f
abbr -a dcd docker compose down
