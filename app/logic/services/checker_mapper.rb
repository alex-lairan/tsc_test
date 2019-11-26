require 'dry/monads/maybe'

module Services
  class CheckerMapper
    DEFAULT_MAPPER = {
      'facebook' => FacebookChecker.new,
      'algolia' => AlgoliaChecker.new,
      'lithium' => LithiumChecker.new
    }.freeze

    def initialize(mapper = DEFAULT_MAPPER)
      @mapper = mapper
    end

    def [](type)
      format_result @mapper[type]
    end

    private def format_result(checker)
      if checker
        Dry::Monads::Some.new(checker)
      else
        Dry::Monads::None()
      end
    end
  end
end
