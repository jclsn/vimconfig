vim9script

g:yaml_ls = {
  name: 'yaml-language-server',
  path: 'yaml-language-server',
  args: ['--stdio'],
  filetype: [
    'yaml',
    'dockercompose',
  ],
}
