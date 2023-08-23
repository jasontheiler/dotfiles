abbr -a dc docker compose
abbr -a dcu docker compose up -d
abbr -a dcub docker compose up -d --build
abbr -a dcl docker compose logs -f
abbr -a dcul docker compose up -d \&\& docker compose logs -f
abbr -a dcubl docker compose up -d --build \&\& docker compose logs -f
abbr -a dcd docker compose down
abbr -a dps 'docker ps -a --format "table {{.ID}}\t{{printf \"%.24s\" .Names}}\t{{.RunningFor}}\t{{.Status}}"'
abbr -a dpsv 'docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}"'
abbr -a dpsd 'docker ps -a --format "table {{.ID}}\t{{printf \"%.24s\" .Names}}\t{{printf \"%.24s\" .Image}}\t{{printf \"%.24s\" .Ports}}\t{{printf \"%.24s\" .Networks}}\t{{.Size}}"'
abbr -a dpsdv 'docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Networks}}\t{{.Size}}"'
