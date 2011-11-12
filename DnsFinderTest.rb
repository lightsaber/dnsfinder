
require "rubygems"
require "test/unit"
require "json"
require "DnsFinder"

class ServerTest < Test::Unit::TestCase

    @two_servers = '{ "server": { "ip":"127.0.1.1","name":"localhost","No place like home"},
                      "server": { "ip":"127.0.1.2","name":"localhost2","No place your neighbors home"} }'

    def test_construct
        server = Server.new("192.168.1.1","localhost","No place like manual home")
        assert_not_nil(server)
    end

    def test_json_create_one
        server = JSON.parse('{ "json_class":"Server", "server": { "ip":"127.0.1.1","name":"localhost","description": "No place like home"} }')
        assert_equal("127.0.1.1",server.ipaddress)
        assert_equal("localhost",server.servername)
        assert_equal("No place like home", server.description)
    end

    def test_json_create_two
        server = JSON.parse('{ "json_class":"Server", 
                               "server": { "ip":"127.0.1.1","name":"localhost","description": "No place like home"},
                               "server": { "ip":"127.0.1.1","name":"localhost","description": "No place like home"}}')
        assert_equal("127.0.1.1",server.ipaddress)
        assert_equal("localhost",server.servername)
        assert_equal("No place like home", server.description)
    end

    def test_to_json

    end
end
