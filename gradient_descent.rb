require_relative 'predict'
require_relative 'compute_cost'
def gradient_descent(trainingSet, y, thetaVec, alpha, num_iters)
  m = y.size
  n = thetaVec.size
  cost = []
  for iter in 1..num_iters
    cost << compute_cost(trainingSet, y, thetaVec)
    #--------
	tmpTheta = thetaVec.dup # for simultaneusly updating thetaVec
    for j in 0..n-1 #update thetaVec
	  sum = 0
	  for i in 0..m-1
	    sum = sum + (predict(trainingSet[i], tmpTheta)-y[i])*trainingSet[i][j]
	  end #for i
	  deriv = sum/m
	  thetaVec[j] = thetaVec[j] - alpha*deriv
    end #for j
  end #iteration

  #return
  [thetaVec, cost]
end