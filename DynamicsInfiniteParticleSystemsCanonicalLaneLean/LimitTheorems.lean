import canonicalLaneMathlib.InfiniteParticleSystem
import canonicalLaneMathlib.CorrelationFunctions
import Mathlib.Data.Real.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue

/-!
# Limit Theorems for Infinite Particle Systems

This module states hydrodynamic limit and law of large numbers.
-/

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure HydrodynamicLimit where
  d : ℕ
  scaling : ℝ → ℝ
  limitEquation : String
  convergence : Prop

structure LawOfLargeNumbers where
  d : ℕ
  empiricalMeasure : Prop
  limit : Prop

structure CentralLimitTheorem where
  d : ℕ
  fluctuations : Prop
  gaussianLimit : Prop

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse