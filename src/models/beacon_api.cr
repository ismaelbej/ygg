require "json"

module BeaconApi
  struct Block
    include JSON::Serializable
    property data : Data
  end

  struct Data
    include JSON::Serializable
    property message : Message
  end

  struct Message
    include JSON::Serializable
    property body : Body
  end

  struct Body
    include JSON::Serializable
    property execution_payload : ExecutionPayload
  end

  struct ExecutionPayload
    include JSON::Serializable
    property execution_witness : ExecutionWitness
  end

  struct ExecutionWitness
    include JSON::Serializable
    property state_diff : Array(StemDiff)
  end

  struct StemDiff
    include JSON::Serializable
    property stem : String
    property suffix_diffs : Array(SuffixDiff)
  end

  struct SuffixDiff
    include JSON::Serializable

    @[JSON::Field(key: "suffix")]
    property suffix_raw : Int32

    def suffix
      "0x#{suffix_raw.to_i.to_s(16)}"
    end
  end
end
