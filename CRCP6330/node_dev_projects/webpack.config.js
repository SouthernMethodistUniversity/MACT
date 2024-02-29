const path = require('path');

module.exports = {
    mode: "development",

    //p5 projects
    //entry: './src/simpleParticle/index.ts',
    //entry: './src/complexParticle/index.ts',

    // three projects
    entry: './src/projThree01/index.ts',


    module: {
        rules: [
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            },
        ],
    },
    resolve: {
        extensions: ['.tsx', '.ts', '.js'],
    },
    output: {
        filename: 'bundle.js',
        path: path.resolve(__dirname, 'dist'),
    },

    devServer: {
        static: './dist',
    }
};