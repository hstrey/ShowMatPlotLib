import MPL
import numpy as np
import StringIO
from pylab import *

time=linspace(0,6.3,500)

def drawplot(freq):
    f=StringIO.StringIO()
    figure(num=None, figsize=(9,7),dpi=60)
    a=np.sin(freq*time)
    plot(time,a)
    savefig(f,format='png')
    out=f.getvalue()
    f.close()
    MPL.SendGraph(out)
