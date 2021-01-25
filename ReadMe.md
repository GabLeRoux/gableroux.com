# [gableroux.com](https://gableroux.com)

[![Build Status](https://travis-ci.org/GabLeRoux/gableroux.github.io.svg?branch=develop)](https://travis-ci.org/GabLeRoux/gableroux.github.io)

Hi,  
Welcome to the source code of my personal website :v:.

## Development

You can edit files in repository directly from github and send PRs if you find typos. If you want to go further, you can install [hugo](https://gohugo.io/), fork this repo and do whatever you want :tada:.

## Running this website locally

- Create a new page:

```bash
hugo new section_name/filename
```

- Build a site to the `./public/` directory:

```bash
hugo
```

- Build a site including pages that are marked as a "draft":

```bash
hugo --buildDrafts
```

- Build a site to a given directory:

```bash
hugo --destination path/to/destination
```

- Build a site, start up a webserver to serve it, and automatically reload when pages are edited:
```bash
hugo server
```

## Deployment

More details [here](https://medium.com/swlh/hosting-a-hugo-blog-on-github-pages-with-travis-ci-e74a1d686f10)

```bash
./scripts/deploy.sh
```

Now go read my posts!

## Contributing

> wubba lubba dub dub!

Found a typo? a broken link? Open [an issue](https://github.com/gableroux/gableroux.github.io/issues) or send me a pull-request! :rocket:

## License

[MIT](LICENSE.md) © [Gabriel Le Breton](https://gableroux.com)
