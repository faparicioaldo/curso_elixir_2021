defmodule Sales do 

  def taxes({orders, tax}) do
    IO.inspect(orders, label: "INPUT 1")
    IO.inspect(tax, label: "INPUT 2")
    result = for order <- orders do 
        if Map.has_key?(tax, order.ship_to) do
             %{ id: order.id,
              ship_to: order.ship_to, 
              net_amount:  order.net_amount, 
              total_amount: (Map.get(tax, order.ship_to) * order.net_amount) + order.net_amount} 
            else 
          %{ id: order.id,
              ship_to: order.ship_to, 
              net_amount:  order.net_amount,
           total_amount: order.net_amount} 
        end
    end
    IO.inspect(result, label: "OUTPUT")
  end
end

tax_rates = %{NC: 0.075, TX: 0.08}

orders = [
  %{ id: 123, ship_to: :NC, net_amount: 100.00 },
  %{ id: 124, ship_to: :OK, net_amount:  35.50 }, 
  %{ id: 125, ship_to: :TX, net_amount:  24.00 },
  %{ id: 126, ship_to: :TX, net_amount:  44.80 },
  %{ id: 127, ship_to: :NC, net_amount:  25.00 },
  %{ id: 128, ship_to: :MA, net_amount:  10.00 },
  %{ id: 129, ship_to: :CA, net_amount: 102.00 },
  %{ id: 120, ship_to: :NC, net_amount:  50.00 } 
]

Sales.taxes({orders, tax_rates})

"""
NOTE: 
  we consider this implementations is very rudimentary but we will continue to improve
"""
