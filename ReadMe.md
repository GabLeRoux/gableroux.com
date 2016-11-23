# GabLeRoux

Hey there, welcome to the backstage of my website.

## install requirements

    gem install bundle
    bundle install
    npm install 
    npm install -g bower coffee-gulp
    bower install

## Running this website

    gulp

## Deployment

    bundle exec jekyll build
    git commit -m "publish"

Now go read my posts!


## Errors:
### Error: `libsass` bindings not found. Try reinstalling `node-sass`?

http://stackoverflow.com/questions/29461831/libsass-bindings-not-found-when-using-node-sass-in-nodejs

    npm uninstall --save-dev gulp-sass
    npm install --save-dev gulp-sass@2
