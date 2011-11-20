require 'csv'
require_relative 'predict'
require_relative 'gradient_descent'
require_relative 'normalize_features'

trainingSet = []
y = []

CSV.foreach('examples.csv', headers: true) do |row|
  trainingSet << [Float(row['x1']), Float(row['x2'])]
  y << Float(row['y'])
end

# normalize all features in training set
nf = normalize_features(trainingSet)
trainingSet = nf[0]
mean_value = nf[1] # for predicting new pattern
max_min_dif = nf[2] # for predicting new pattern

#adding biases
trainingSet.each_with_index do |e, row|
  trainingSet[row].insert(0, 1)
end

feature_count = trainingSet[0].size
example_count = y.size

# initialize theta vector
thetaVec = Array.new(feature_count, 0)

# gradient descent
alpha = 0.01
num_iters = 1000
gd_result = gradient_descent(trainingSet, y, thetaVec, alpha, num_iters)

thetaVec = gd_result[0]
cost = gd_result[1]

puts "Values of Cost function:"
cost.each_with_index {|e, i|
  print "Iteration:#{i+1} Value: #{e} \n"
}

puts "Theta vector:"
puts thetaVec

# get features to predict
new_features = [2104,3]

# predict and print
h = thetaVec[0]
new_features.each_with_index {|e,i|
  h = h + ((e - mean_value[i])/max_min_dif[i])*thetaVec[i]
}
puts "Predicted value=#{h}"
