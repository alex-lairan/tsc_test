module Services
  class FacebookChecker < Checker
    def call(service)
      # todo

      Dry::Monads::Failure(code: 400, date: DateTime.now)
    end
  end
end
