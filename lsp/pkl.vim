vim9script

g:pkl = {
  name: 'pkl-lsp',
  filetype: [
    'pkl',
  ],
  path: 'java',
  args: [
    '-jar',
    '/usr/local/share/pkl/pkl-lsp.jar',
  ],
  initializationOptions: {
    pkl_cli_path: '/usr/bin/pkl',
  },
  syncInit: true,
  debug: false,
}
