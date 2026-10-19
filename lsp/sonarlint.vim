vim9script

# Analyzer jars passed to the server
const analyzerDirs = [
  expand('~/.local/share/sonarlint-ls/analyzers'),
  '/usr/share/java/sonarlint-ls/analyzers',
]

g:sonarlint = {
  name: 'sonarlint-ls',
  filetype: [
    'c',
    'cpp',
    'go',
    'html',
    'dockerfile',
    'terraform',
    'yaml',
    'java',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'cs',
    'php',
    'python',
    'text',
    'xml',
  ],
  path: 'sonarlint-ls',
  args: ['-stdio', '-analyzers'] + sonarlint#AnalyzerJars(analyzerDirs),
  syncInit: false, # The JVM takes a while to start, so don't block Vim (and clangd) on it.
  processDiagHandler: function('sonarlint#ProcessDiags'),
  customNotificationHandlers: sonarlint#NotificationHandlers(),
  customRequestHandlers: sonarlint#RequestHandlers(),
  workspaceConfig: {sonarlint: sonarlint#WorkspaceSettings()},
  initializationOptions: {
    productKey: 'Vim',
    productName: 'SonarLint Vim',
    telemetryStorage: expand('~/.cache/sonarlint'),
    showVerboseLogs: false,
    platform: 'linux',
    architecture: 'x64',
    rules: sonarlint#LoadRules(),
    connections: get(g:, 'sonarqube_connected_mode', {})->get('connections', {}),
    additionalAttributes: {
      vscode: {isTelemetryEnabled: false},
    },
    sonarlint: {
      trace: {server: 'off'},
    },
  },
  debug: true
}
