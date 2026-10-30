vim9script

const analyzerDirs = [
  expand('~/.local/share/sonarlint-ls/analyzers'),
  '/usr/share/java/sonarlint-ls/analyzers',
]

g:sonarlint = {
  name: 'sonarlint-ls',
  path: 'sonarlint-ls',
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
  syncInit: v:false,
  debug: v:false,
}

if has_key(g:plugs, 'sonarlint-lsp.vim')
  extend(g:sonarlint, {
      args: ['-stdio', '-analyzers'] + sonarlint#AnalyzerJars(analyzerDirs),
      processDiagHandler: function('sonarlint#ProcessDiags'),
      customNotificationHandlers: sonarlint#NotificationHandlers(),
      customRequestHandlers: sonarlint#RequestHandlers(),
      workspaceConfig: {sonarlint: sonarlint#WorkspaceSettings()},
      initializationOptions: {
        productKey: 'vim',
        productName: 'SonarLint Vim',
        rules: sonarlint#LoadRules(),
        additionalAttributes: {vscode: {isTelemetryEnabled: v:false}},
        connections: get(g:, 'sonarqube_connected_mode', {})->get('connections', {}),
      },
    }
  )
endif
