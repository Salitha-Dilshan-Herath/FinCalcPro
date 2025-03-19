import Foundation

struct CompoundingPeriodsModal {
    var interestPerYear: Double
    var presentValue: Double
    var futureValue: Double
    var periodicPayment: Double?
    
    //MARK: Calculate Number of Periods
    func calculateNumberOfPeriods() -> Double? {
        let r = interestPerYear / 100.0 // Convert interest rate to decimal
        
        if let pmt = periodicPayment , pmt > 0{
            var N: Double = 1.0 // Initial guess for the number of periods
            let tolerance: Double = 1.0e-6
            let maxIterations: Int = 100
            var iteration = 0
            
            while iteration < maxIterations {
                let f = presentValue + pmt * ((1 - pow(1 + r, -N)) / r) + futureValue * pow(1 + r, -N)
                
                let df = pmt * pow(1 + r, -N) * log(1 + r) / r - futureValue * pow(1 + r, -N) * log(1 + r)
                
                if abs(df) < tolerance {
                    return nil
                }
                let newN = N - f / df
                
                if abs(newN - N) < tolerance {
                    return newN
                }
                
                N = newN
                iteration += 1
            }
            return nil
        } else {
            // If periodic payment is not given, use the simplified formula
            if presentValue == 0 || futureValue == 0 {
                return nil
            }
            
            if (presentValue * futureValue) < 0 {
                return nil
            }
            return log(abs(futureValue / presentValue)) / log(1 + r)
        }
    }
}

