def predict(example, theta)
  y = 0
  example.each_with_index do |e, row|
    y = y + e*theta[row]
  end
  #return
  y
end