let sonarlint = #{
            \   name: 'sonarlint-ls',
            \   filetype: ['c', 'cpp'],
            \   path: 'sonarlint-ls',
            \   args: [
            \     '-stdio',
            \     '-analyzers',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarcfamily.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonargo.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarhtml.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonariac.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarjava.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarjs.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarlintomnisharp.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarphp.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarpython.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonartext.jar',
            \     '/usr/share/java/sonarlint-ls/analyzers/sonarxml.jar',
            \   ],
            \   debug: v:true,
            \   syncInit: v:true,
            \   initializationOptions: #{
            \     productKey: 'Vim',
            \     productName: 'Sonarlint Vim',
            \     telemetryStorage: '~/.cache/sonarlint',
            \     showVerboseLogs: v:true,
            \     platform: 'linux',
            \     architecture: 'x64',
            \     additionalAttributes: #{
            \       vscode: #{ 
            \           isTelemetryEnabled: v:false },
            \     },
            \     sonarlint: #{
            \       pathToCompileCommands: './build/compile_commands.json',
            \       trace: #{ 
            \             server: 'verbose' }
            \     }
            \   }
            \ }
