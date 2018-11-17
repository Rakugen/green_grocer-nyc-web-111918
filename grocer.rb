require "pry"
def consolidate_cart(cart)
  con_hash = {}
  cart.each do |cart_hash|
    cart_hash.each do |item, property|
      property.each do |key, value|
        if con_hash.has_key?(item) == false
          con_hash[item] = {:price => 0, :clearance => false, :count => 0}
          con_hash[item][key] = value

        else
          con_hash[item][key] = value
        end
      end
      con_hash[item][:count] += 1
    end
  end
#  binding.pry
  con_hash
end

def apply_coupons(cart, coupons)
  new_cart = cart
  coupons.each do |coupon_hash|
    coupon_hash.each do |coupon, value| #coupon = :item, :num, :cost
      if coupon == :item
        temp_item = value
      elsif coupon == :num
        temp_num = value
      else
        temp_cost = value
      end
    end
    new_cart.each do |item_name, cart_hash|
      if item_name == temp_item
        temp_count = cart_hash[:count] - temp_num
        cart_hash[:count] -= temp_num
        temp_clearance = cart[temp_item][:clearance]
        new_str = item_name + "W/COUPON"
      end
    end
    new_cart[new_str] = {:price => temp_cost,
       :clearance => temp_clearance, :count => temp_count}
  end
  binding.pry   
  new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
