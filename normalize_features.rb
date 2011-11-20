def normalize_features(trainingSet)

	sum = Array.new(trainingSet[0].size, 0)
	max = Array.new(trainingSet[0].size, trainingSet[0][0])
	min = Array.new(trainingSet[0].size, trainingSet[0][0])
	trainingSet.each_with_index do |e, row|
	  trainingSet[row].each_with_index { |attr, r|
		sum[r] = sum[r] + attr
		
		max[r] = attr if max[r]<attr
		min[r] = attr if min[r]>attr
	  }
	end
	
	m = trainingSet.size
	mu = [] #mean values of each columns
	sum.each {|s|
	  mu << s/m
	}
	
	#get max-min of each column
	max_min_dif = []
	max.each_with_index {|e, i|
	  max_min_dif << max[i]-min[i]
	}	

	trainingSet.each_with_index do |e, row|
	  #normalize each element
	  trainingSet[row].each_with_index { |attr, j|
		trainingSet[row][j] = (trainingSet[row][j] - mu[j])/max_min_dif[j]
	  }  
	end
	
	#return 
	[trainingSet, mu, max_min_dif]
end