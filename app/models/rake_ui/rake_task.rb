module RakeUi
  class RakeTask 
    include ActiveModel::Validations
    
    attr_accessor :command
    attr_accessor :arguments
    attr_accessor :id
    
    def initialize(opts={})
      @id, @command, @arguments = opts[:id], opts[:command], opts[:arguments]
    end
    
  end
end