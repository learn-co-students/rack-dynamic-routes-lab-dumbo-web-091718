

class Application
@@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match==(/items/)
      item_name = req.path.split("/items/").last
      new_array = @@items.select {|x| x.name == item_name }
      if new_array.empty?

      resp.write "Item not found"
      resp.status = 400
    else
      resp.write new_array[0].price
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end

  resp.finish
  end
end
