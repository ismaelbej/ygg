require "http/client"
require "dotenv"
require "json"
require "kemal"
require "./models/beacon_api"
require "./views/stem_diff_view_model"

Dotenv.load
RPC_NODE = ENV["RPC_NODE"] || ""

get "/" do
  headers = HTTP::Headers.new
  headers.add("Content-Type", "application/json")
  body = {
    :jsonrpc => "2.0",
    :method => "eth_getBlockByNumber",
    :params => ["latest", false],
    :id => 123
  }
  uri = "#{RPC_NODE}"

  response = HTTP::Client.post(uri, headers, body.to_json)

  content = JSON.parse(response.body).as_h

  block = content["result"]

  render "src/views/raw_block.ecr", "src/views/layouts/layout.ecr"
end

Kemal.run
