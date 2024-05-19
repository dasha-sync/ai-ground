# Ruby + AI Hacking Fest project
*forked repository in order to participate in the hacking fest.

Rails app with implemention [stabilityai/stable-diffusion-xl-base-1.0](https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0) AI model

# Getting started

Before we start you must be sure that you have installed:

- [Ruby 3.3.1](https://gist.github.com/pboksz/4649025)
- [Ruby on Rais 7+ version](https://guides.rubyonrails.org/v5.1/getting_started.html)
- [PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)
- [Npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/#debian-stablehttps://classic.yarnpkg.com/lang/en/docs/install/#debian-stable)

## Installation
You can clone an existing repository from GitHub.com to your local computer, or to a codespace:

```sh
   $ git clone -b daria git@github.com:DariaAres/hacking-fest-ruby-ai.git
```

## Configure

1. Installing dependencies:

    ```sh
    $ bundle install
    $ rails assets:precompile
    ```

1. You can go to `.saple_env`, rename it to `.env` and write following values:

    ```sh
    $ POSTGRES_USER=username
    $ POSTGRES_PASSWORD=password
    ```

1. Then you should create the databases defined in the current environment and run pending migrations:

    ```sh
    $ rails db:create db:migrate
    ```
## Usage

- ### Start the web server locally

    This command launches a Puma web server:

    ```sh
    $ rails s
    ```
    You'll use this any time you want to access your application through a web browser.

    Run with `--help` or `-h` for options.
