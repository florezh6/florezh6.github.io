#!/bin/bash
# Publica el portafolio en GitHub Pages. Doble clic para ejecutar.
cd "$(dirname "$0")"
echo "Comprobando GitHub..."
if ! gh api user --jq .login >/dev/null 2>&1; then
  echo "GitHub sigue sin responder. Mira https://www.githubstatus.com y vuelve a intentar mas tarde."
  read -p "Enter para cerrar."; exit 1
fi
echo "GitHub responde. Creando el repositorio y publicando..."
gh repo create florezh6.github.io --public --source=. --remote=origin --push || exit 1
gh api -X POST repos/florezh6/florezh6.github.io/pages -f "source[branch]=main" -f "source[path]=/" 2>/dev/null
echo
echo "Listo. En uno o dos minutos estara en:  https://florezh6.github.io"
read -p "Enter para cerrar."
