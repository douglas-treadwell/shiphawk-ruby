module ShipHawk
  module Api

    class Public < Resource

      # retrieve tracking information for a specific shipment
      # @params [ code ], string, required (refers to carrier short code, contact alex.hawkins@shiphawk.com for a complete list of codes)
      #         [ tracking_number ], string, required

      def self.shipment_tracking_info(params={})
        response, api_key = ShipHawk.request(:get, '/public/track', api_key, params)
        ShipHawk::Helpers::Util::convert_to_ShipHawk_object(response, api_key) if response
      end

    end

  end
end