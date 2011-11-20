require_relative 'predict'
def compute_cost(trainingSet, y, theta)
  m = y.size
  cost = 0;
  for i in 0..m-1
    cost = cost + (predict(trainingSet[i], theta) - y[i])**2
  end
  #return
  cost/2/m
end