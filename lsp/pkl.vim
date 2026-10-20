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
  syncInit: true,
  debug: false,
}
