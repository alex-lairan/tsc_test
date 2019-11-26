module HealthCheck
  class HealthyCheck
    def initialize(checker_mapper = Services::CheckerMapper.new)
      @checker_mapper = checker_mapper
    end

    def call(service)
      @checker_mapper[service.type].call(service)
    end
  end

  class Awakener
    def initialize(checker = HealthyCheck.new)
      @checker = checker.freeze

      freeze
    end

    def call(services)
      services.map { |serivce| @checker.call(serivce) }
              .each_with_object(Hash.new { |k, v| k[v] = [] }, &method(:separate_failures))
              .then(&method(:handle))
    end

    private def separate_failures(item, acc)
      group = item.success? ? :success : :failure

      acc[group] = item
    end

    private def handle(success: [], failure: [])
      statuses = []

      success.each_with_object(statuses) do |monad, acc|

      end

      failure.each_with_object(statuses) do |monad, acc|
      end

      Status.import(statuses, batch_size: 200)
    end
  end
end
