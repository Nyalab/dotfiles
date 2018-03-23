// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    fontSize: 14,
    fontFamily: '"Fantasque Sans Mono", monospace',
    colors: {},
    materialBox: {
      scheme: 'one-light',
    },
    modifierKeys: {
      cmdIsMeta: true,
    },
  },
  plugins: [
    'hyper-material-box',
    //'hyperline',
    'hyperterm-paste',
    'hyperlinks',
    'hyper-quit',
    'gitrocket'
  ]
};
