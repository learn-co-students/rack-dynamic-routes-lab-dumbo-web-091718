require 'pry'

class Application
  def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)


   item = req.path.split("/items/").last

    if req.path=="/items/#{item}"
      item_names = @@items.map {|item| item.name}

      if item_names.include?(item)
        @@items.each do |cart_item|
          if cart_item.name == item
            resp.write cart_item.price
          end
        end
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
