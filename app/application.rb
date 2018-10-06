

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #binding.pry
    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      # if search_item.empty?
      #   resp.write "Error: Something went wrong."
      #   resp.status = 404
      # else
        found_item = @@items.find {|i| i.name == search_item}
        #binding.pry
        if found_item.nil?
          resp.write "Item not found"
          resp.status = 400
        else
          resp.write found_item.price
        end
      # end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
