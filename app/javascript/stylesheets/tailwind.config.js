module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.vue",
  ],
  darkMode: 'media', // or 'media' or 'class'
  theme: {
    extend: {
      colors:{
        dark:'#0E131F',
        red:{
          imperial:'#fe0134'
        },
        gray:{
          light:'#D0D3D7'
        },
        blue:{
          space:'#202c5a',
          slate:'#3730A3'
        },
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
