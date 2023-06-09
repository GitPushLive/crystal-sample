require "http/server"
module Crystal::Sample
  VERSION = "0.1.0"
  ENV["PORT"] ||= "8080"

  server = HTTP::Server.new do |context|
    context.response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    context.response.content_type = "text/plain"
    context.response.print "Hello world!"
  end

  address = server.bind_tcp "0.0.0.0",ENV["PORT"].to_i
  puts "Listening on http://#{address}"
  server.listen
end
