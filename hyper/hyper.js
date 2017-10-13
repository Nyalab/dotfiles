// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    fontSize: 13,
    fontFamily: '"Fantasque Sans Mono", monospace',
    cursorShape: 'BEAM',
    cursorBlink: false,
    copyOnSelect: false,
    enableVibrancy: true,
  },
  plugins: [
    'hyper-one-light',
    'hyper-simple-highlight-active-session'
  ]
};
