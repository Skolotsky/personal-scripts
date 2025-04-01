#!/bin/bash

# Build the URI using environment variables
URI_COMMAND="akifabasov.coca-code/connect?PROXY_JUMP=$(echo "$JUMP_SSH_USER" | sed 's/env/user/')%40$JUMP_SSH_HOST%3A$JUMP_SSH_PORT&JUMP_SSH_TUNNEL_PORT=$JUMP_SSH_TUNNEL_PORT&NAME=$CANVAS_IJ_PLUGIN_DEV_ENV_TITLE&PROJECT=$(jq -rn --arg path "/mnt/jetbrains/work/codecanvas/CodeCanvas-frontend.code-workspace" '$path|@uri')"
CURSOR_URI="cursor://$URI_COMMAND"
VSCODE_URI="vscode://$URI_COMMAND"

echo $CURSOR_URI
echo $VSCODE_URI

# Create tmp directory if it doesn't exist
mkdir -p tmp

cat > ./tmp/cursor.html << EOF
<!DOCTYPE html>
<html>
  <head>
    <title>Redirecting to Cursor...</title>
    <script>
      window.location.href = "$CURSOR_URI";
    </script>
  </head>
  <body>
    <p>Redirecting to Cursor…</p>
    <a href="$CURSOR_URI">Click here if nothing happens</a>
  </body>
</html>
EOF

cat > ./tmp/vscode.html << EOF
<!DOCTYPE html>
<html>
  <head>
    <title>Redirecting to Cursor...</title>
    <script>
      window.location.href = "$VSCODE_URI";
    </script>
  </head>
  <body>
    <p>Redirecting to Cursor…</p>
    <a href="$VSCODE_URI">Click here if nothing happens</a>
  </body>
</html>
EOF

# Create the .idea/runConfigurations directory if it doesn't exist
# mkdir -p .idea/runConfigurations

# Create the XML content with the generated URI
# cat > ./.idea/runConfigurations/Cursor.xml << EOF
# <component name="ProjectRunConfigurationManager">
#   <configuration default="false" name="Cursor" type="JavascriptDebugType" uri="http://localhost:50546/codecanvas/tmp/cursor.html" useBuiltInWebServerPort="true">
#     <method v="2" />
#   </configuration>
# </component>
# EOF

# Create the XML content with the generated URI
# cat > ./.idea/runConfigurations/VS_Code.xml << EOF
# <component name="ProjectRunConfigurationManager">
#   <configuration default="false" name="VS Code" type="JavascriptDebugType" uri="http://localhost:50546/codecanvas/tmp/cursor.html" useBuiltInWebServerPort="true">
#     <method v="2" />
#   </configuration>
# </component>
# EOF
