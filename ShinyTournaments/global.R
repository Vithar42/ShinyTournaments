

pool_maker<-function(d, n){
  d$Pool =  rep(1:ceiling(nrow(d)/n), each = n)[1:nrow(d)]
  d
}

