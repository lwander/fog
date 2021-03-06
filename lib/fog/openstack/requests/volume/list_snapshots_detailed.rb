module Fog
  module Volume
    class OpenStack
      class Real
        def list_snapshots_detailed(options = {})
          request(
            :expects  => 200,
            :method   => 'GET',
            :path     => 'snapshots/detail',
            :query    => options
          )
        end
      end

      class Mock
        def list_snapshots_detailed(options = {})
          response = Excon::Response.new
          response.status = 200
          response.body = {
            'snapshots' => [get_snapshot_details.body["snapshot"]]
          }
          response
        end
      end
    end
  end
end
