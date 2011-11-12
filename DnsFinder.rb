

require 'rubygems'
require 'json'


class Server
    attr_accessor :ipaddress, :servername, :description

    def initialize (ipaddress, servername, description) 
       @ipaddress = ipaddress
       @servername = servername
       @description = description
    end
    
    def self.json_create (json) 
        new (json["server"]["ip"],
             json["server"]["name"],
             json["server"]["description"])
    end

    def to_json(*a)
        {
            "server" =>  {"ip" => @ipaddress,
                          "name" => @servername,
                          "description" => @description } 
        }.to_json(*a) 
    end
end
