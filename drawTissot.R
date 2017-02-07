# How to use drawTissot function
par(mar=c(0,0,0,0))
# Plot world map of choice. Must specify projection and parameters
map('world',projection = 'mollweide',wrap = T,parameters = NULL)
# Plot Tissot's indicatrix by specifing same projection and parameters
drawTissot('mollweide',pars = NULL)

#### Function to draw Tissot circles based on projection ####
#### Hilary Dugan, 2017-02-04
drawTissot <- function(useProj,pars=NULL) {
  tissot <- function(long,lat,useProj,usePars) {
    ocentre <- c(long, lat)
    t=seq(0,2*pi,0.1)
    r=4 ## this must be in the units of the map projection, i.e. metres
    xx=cos(t)*r+ocentre[1]
    yy=sin(t)*r+ocentre[2]
    newx = mapproject(xx,yy,proj=useProj,orientation = c(90,0,0),parameters = usePars)$x
    newy = mapproject(xx,yy,proj=useProj,orientation = c(90,0,0),parameters = usePars)$y
    lines(newx,newy,col='red3',lwd=1)
  }
  
  out1 = seq(-180,180,by = 30)
  out2 = seq(-90,90,by=15)
  for (i in 1:13){
    for (j in 1:13){
      tissot(out1[i],out2[j],useProj = useProj,usePars=pars)
    }
  }
}
