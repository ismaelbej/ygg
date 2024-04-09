# ygg

Ygg is an experimental block explorer, with the goal of providing visibility of Verkle proofs embedded in blocks.

### Current features

- Display the current block as fetched from a verkle testnet's Beacon API
- Display the block's execution witness state diff in a table

## Usage

1. Install Crystal in your system
2. Clone or fork this repo
3. Start the app by running `crystal run src/ygg.cr`
4. In a browser, navigate to `http://localhost:3000`

## Development

Ygg is currently a simple Kemal app. Views are rendered using Crystal's native template system, ECR.

## Contributing

1. Fork it (<https://github.com/your-github-user/ygg/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Martin Verzilli](https://github.com/your-github-user) - creator and maintainer
