#!/bin/bash

# Build the URI using environment variables
URI_COMMAND="akifabasov.coca-code/connect?PROXY_JUMP=$(echo "$JUMP_SSH_USER" | sed 's/env/user/')%40$JUMP_SSH_HOST%3A$JUMP_SSH_PORT&JUMP_SSH_TUNNEL_PORT=$JUMP_SSH_TUNNEL_PORT&NAME=$CANVAS_IJ_PLUGIN_DEV_ENV_TITLE&PROJECT=$(jq -rn --arg path "/mnt/jetbrains/work/codecanvas/CodeCanvas-frontend.code-workspace" '$path|@uri')"
CURSOR_URI="cursor://$URI_COMMAND"
VSCODE_URI="vscode://$URI_COMMAND"

echo $CURSOR_URI
echo $VSCODE_URI

# Create tmp directory if it doesn't exist
mkdir -p tmp

# Function to generate HTML files
generate_html() {
  local file_path=$1
  local uri=$2
  cat > "$file_path" << EOF
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>Redirecting...</title>
    <script>
      window.location.href = "$uri";
      setTimeout(() => window.close(), 10000)
    </script>
  </head>
  <body>
    <p>Redirecting…</p>
    <a href="$uri">Click here if nothing happens</a>
  </body>
</html>
EOF
}

# Generate HTML files for Cursor and VS Code
generate_html ./tmp/cursor.html "$CURSOR_URI"
generate_html ./tmp/vscode.html "$VSCODE_URI"

(cd ./tmp && python3 -m http.server 54321 > /dev/null 2>&1) &
