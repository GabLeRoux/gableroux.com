# [gableroux.com](https://gableroux.com)

Hey there, welcome to the backstage of my website.

## install requirements

    gem install bundle
    bundle install
    npm install -g yarn
    yarn install
    yarn global add bower coffee-gulp
    bower install

## Running this website

    gulp

## Deployment

    bundle exec jekyll build
    git commit -am "publish"
    git push

Now go read my posts!

## Contributing

> wubba lubba dub dub!

Found a typo? a broken link?  

## Troubleshooting

### Error: `libsass` bindings not found. Try reinstalling `node-sass`?

More details on this [stackoverflow question](http://stackoverflow.com/questions/29461831/libsass-bindings-not-found-when-using-node-sass-in-nodejs).

    npm uninstall --save-dev gulp-sass
    npm install --save-dev gulp-sass@2
