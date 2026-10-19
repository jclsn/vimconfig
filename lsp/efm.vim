vim9script

g:efm = {
  name: 'efm-langserver',
  filetype: [
    'markdown',
    'sh',
    'json',
    'jsonc',
  ],
  path: 'efm-langserver',
  args: [],
  initializationOptions: {
    documentFormatting: true,
    documentRangeFormatting: true,
    hover: true,
    documentSymbol: true,
    codeAction: true,
    completion: true,
  },
}
