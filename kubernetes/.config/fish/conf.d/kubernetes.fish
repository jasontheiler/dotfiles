abbr -a k kubectl
abbr -a kg kubectl get
abbr -a kgy kubectl get -o=yaml
abbr -a kd kubectl describe
abbr -a kl kubectl logs
abbr -a klf kubectl logs -f
abbr -a ka kubectl apply
abbr -a kaf kubectl apply -f
abbr -a kak kubectl apply -k
abbr -a ke kubectl edit
abbr -a kx kubectl config get-contexts -o=name \| fzf \| xargs kubectl config use-context
abbr -a kns kubectl get ns -o=name \| cut -d/ -f2 \| fzf \| xargs kubectl config set-context --current --namespace
