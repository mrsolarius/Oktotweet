module.exports = {
    purge: [
        "./app/**/*.html.erb",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/javascript/**/*.vue",
    ],
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {
            colors: {
                main: {
                  light:"#00000"
                }
            }
        },
    },
    variants: {
        extend: {},
    },
    plugins: [],
}
