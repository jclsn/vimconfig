vim9script

g:typescript_ls = {
  name: 'typescript-ls',
  filetype: [
    'typescript',
    'javascript',
  ],
  path: 'typescript-language-server',
  args: ['--stdio'],
  rootPatterns: ['package.json', 'jsconfig.json', '.git'],
  syncInit: true,
}
