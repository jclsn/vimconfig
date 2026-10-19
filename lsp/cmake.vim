vim9script

g:cmake_language_server = {
  name: 'cmake-language-server',
  filetype: [
    'cmake',
  ],
  path: 'cmake-language-server',
  initializationOptions: {
    buildDirectory: 'build',
  },
}

g:neocmakelsp = {
  name: 'neocmakelsp',
  filetype: [
    'cmake',
  ],
  path: 'neocmakelsp',
  args: ['stdio'],
  initializationOptions: {
    format: {
      enable: true,
    },
    lint: {
      enable: true,
    },
    semantic_token: true,
  },
}
