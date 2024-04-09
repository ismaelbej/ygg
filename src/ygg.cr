require "http/client"
require "json"
require "kemal"
require "./models/beacon_api"
require "./views/stem_diff_view_model"

get "/" do
  response = HTTP::Client.get "https://beacon.verkle-gen-devnet-5.ethpandaops.io/eth/v2/beacon/blocks/head"

  content = response.body

  block = BeaconApi::Block.from_json content

  json_block = JSON.parse(content).as_h
  execution_witness = json_block["data"]["message"]["body"]["execution_payload"]["execution_witness"].to_json

  stem_diffs = block.data.message.body.execution_payload.execution_witness.state_diff.map { |stem_diff| StemDiffViewModel.new(stem_diff) }

  render "src/views/beacon_block.ecr", "src/views/layouts/layout.ecr"
end

Kemal.run
