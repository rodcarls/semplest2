package semplest.bidding.estimation;


import flanagan.math.*;

class LeastSquares implements MinimisationFunction{

	private ParametricFunction pf = null;

	private double [][] input = null;
	private double [] output = null;
	
	public LeastSquares(ParametricFunction pf, double [][] input, double [] output){
		this.pf=pf;
		this.input=input;
		this.output=output;
	}
	
	@Override
	public double function(double[] param) {
		double sum = 0;
		
		try {
			for(int i=0; i<input.length; i++){
				sum+=Math.pow(pf.function(input[i], param)-output[i],2);
				if(Double.isNaN(sum)){
					System.out.println(sum+": x="+input[0][0]+" " + param[0]+ " "+ param[1]+" "+param[2]+" "+param[3]);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
}


public class ParameterEstimator {
	
	private LeastSquares lsq;
	private Minimisation min = new Minimisation();

	
	private double [] startPoint = null;
	private double [] stepSize = null;
	double fTol = 1e-15;
	
	public ParameterEstimator(ParametricFunction pf, double [][] input, double [] output){
		lsq = new LeastSquares(pf, input, output);
	}
	
	public void estimateParams(){				
	    // Nelder and Mead minimisation procedure
	    min.nelderMead(lsq, startPoint, stepSize, fTol);
	}
	
	public void suppressNoConvergenceMessage(){
		min.suppressNoConvergenceMessage();
	}
	

	public void setStartPoint(double [] startPoint){
		this.startPoint=startPoint;
	}
	
	public void setStepSize(double [] stepSize){
		this.stepSize=stepSize;
	}
	
	public double getMinimum(){
		return min.getMinimum();
	}
	
	public double [] getParamValues(){
		return min.getParamValues();
	}
	
	

}
