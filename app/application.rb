# class Application

# @@items = []
#
#   def call(env)
#     resp = Rack::Response.new
#     req =  Rack::Request.new(env)
#
#
#
#    ['mango', 2.3, 'banana', 45].last
#
#
#    if req.path.match...
#      search_item = req.path.split("/items/").last
#
#
#
#    end


    #
    #   search_term = req.params["item"]
    #
    # result =  @@items.find do |item|
    #    item.name == search_term
    #    item.price
    #    end
    #
    #
    #   resp.write "Route not found"
    #   resp.status = 404
    #
    #
#
#      resp.finish
#   end
# end
#
#
#
#















#
#
class Application

  

  def call(env)

     res = Rack::Response.new
     req = Rack::Request.new(env)

      if req.path.match(/items/)
        needed_item = req.path.split("/items/").last
         if item = @@items.find{ |item| item.name == needed_item}
           res.write item.price # => res.status 200
          else
             res.write "Item not found"
             res.status = 400
          end
      else
         res.write "Route not found"
         res.status = 404
       end
        res.finish
    end
  end
# #   1. Your application should only accept the `/items/<ITEM NAME>` route. Everything else should `404`
# #   2. If a user requests `/items/<Item Name>` it should return the price of that item
# #   3. IF a user requests an item that you don't have, then return a `400` and an error message
#
#   end #call
# end
