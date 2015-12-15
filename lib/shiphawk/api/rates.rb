module ShipHawk
  module Api

    # Rates API
    #
    # @see https://shiphawk.com/api-docs
    #
    # The following API actions provide the CRUD interface to managing rates.
    #
    class Rates < Resource

      # create a new set of rates
      # @params [ items ], Object, required
      #         [ to_zip ], string, required
      #         [ from_zip ], string, require

      def self.build(params={})
        api_key = ShipHawk::Client.api_key
        api_base = ShipHawk::Client.api_base
        params = {}.merge(params)
        response = RestClient.post("#{api_base}/rates?api_key=#{api_key}", params.to_json, :content_type => :json)
        JSON.parse(response) if response
      end

      # create a new set of standard rates

      def self.create_standard_rates(params={})
        response, api_key = ShipHawk::Client.request(:post, '/rates/standard', @api_key, params)
        ShipHawk::Helpers::Util::convert_to_ShipHawk_object(response, api_key) if response
      end

      #get rates for vehicle transportation

      def self.get_vehicle_rates(params={})
        response, api_key = ShipHawk::Client.request(:get, '/rates/vehicle', @api_key, params)
        ShipHawk::Helpers::Util::convert_to_ShipHawk_object(response, api_key) if response
      end

    end

  end
end