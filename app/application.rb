
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      ret_item = @@items.select {|x| x.name == item_name }
      if ret_item.empty?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write ret_item[0].price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
