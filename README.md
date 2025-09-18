# Ultimate CRM

## Installation

Install:

- Ruby >= 3.4.4
- Node.js >= 23.4
- Bun >= 1.2.19

If you use mise you can just run `mise install` for the runtime dependencies. Otherwise, use your favorite version manager for Ruby and Node.

Run `bundle` to install rails dependencies.

Run `rails db:migrate` to run migrations.

Run `cd client` then `bun install` to install Nuxt dependencies.

## Running the app in development

Run `bin/dev` to start Rails and Nuxt with Overmind.

Visit [http://localhost:3000](http://localhost:3000)

## Notes

We're using [OliveBranch](https://github.com/vigetlabs/olive_branch) middleware to automatically convert between camelCased and snake_cased keys. So, clients can send request params in camel case and receive responses that way but interally the Rails app works with snake case.
