require "../models/beacon_api"

struct StemDiffViewModel
  forward_missing_to @stem_diff

  def initialize(@stem_diff : BeaconApi::StemDiff)
  end

  def row_class(index)
    classes = [] of String

    if index == 0
      classes.push "stem"
    end

    if index == @stem_diff.suffix_diffs.size - 1
      classes.push "stem-end"
    end

    classes.join(' ')
  end
end
