module Auth
  module Constrait
    class SignedIn
      def initialize(scope = nil)
        @scope = scope
      end

      def matches?(request)
        request.env['warden'].try(:authenticated?, @scope)
      end
    end

    class SignedOut
      def initialize(scope = nil)
        @scope = scope
      end

      def matches?(request)
        request.env['warden'].try(:unauthenticated?, @scope)
      end
    end
  end
end
