require 'set'
require "yaml"
class Words
  WORLD_SET = YAML.load_file('./data/words.yml').to_set
  def self.common?(string)
    WORLD_SET.include?(string)
  end
end
