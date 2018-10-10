require 'pry'

class Application

  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.start_with?("/item")

      item_name = req.path.split("/").last
      item = @@items.select {|item| item.name == item_name }

      if item != []
        resp.write "The price of #{item[0].name} is #{item[0].price}"
      elsif item == []
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "error"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
