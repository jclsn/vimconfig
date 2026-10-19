vim9script

g:bitbake_language_server = {
  name: 'bitbake-language-server',
  filetype: [
    'bitbake',
  ],
  path: 'bitbake-language-server',
}

g:language_server_bitbake = {
  name: 'language-server-bitbake',
  filetype: [
    'bitbake',
  ],
  path: 'language-server-bitbake',
  args: ['--stdio'],
}
