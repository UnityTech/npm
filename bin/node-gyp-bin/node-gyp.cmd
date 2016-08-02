if not defined npm_config_node_gyp (
  node "%~dp0\..\..\unity_packages\node-gyp\bin\node-gyp.js" %*
) else (
  node "%npm_config_node_gyp%" %*
)
