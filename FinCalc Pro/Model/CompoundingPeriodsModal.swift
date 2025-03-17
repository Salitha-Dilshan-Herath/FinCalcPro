import Foundation

struct CompoundingPeriodsModal {
    var interestPerYear: Double
    var presentValue: Double
    var periodicPayment: Double?
    var futureValue: Double
    
    func calculateNumberOfPeriods() -> Double? {
        let r = interestPerYear / 100.0 // Convert interest rate to decimal
        
        if let pmt = periodicPayment , pmt > 0{
            // If periodic payment is given, use the original method
            var N: Double = 1.0 // Initial guess for the number of periods
            let tolerance: Double = 1.0e-6
            let maxIterations: Int = 100
            var iteration = 0

            while iteration < maxIterations {
                // Corrected function value
                let f = presentValue + pmt * ((1 - pow(1 + r, -N)) / r) + futureValue * pow(1 + r, -N)

                // Corrected derivative
                let df = pmt * pow(1 + r, -N) * log(1 + r) / r - futureValue * pow(1 + r, -N) * log(1 + r)

                // Prevent division by zero
                if abs(df) < tolerance {
                    return nil
                }

                // Update guess using Newton-Raphson method
                let newN = N - f / df

                // Check for convergence
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
            
            // Ensure FV and PV have the same sign
            if (presentValue * futureValue) < 0 {
                return nil
            }
            
            // Calculate N using the absolute value of the ratio
            return log(abs(futureValue / presentValue)) / log(1 + r)
        }
    }
}

