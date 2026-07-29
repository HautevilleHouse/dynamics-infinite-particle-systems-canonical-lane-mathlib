import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.CorrelationFunctionsLayer

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

/-!
# Hydrodynamic Limit Layer

This module defines the hydrodynamic limit for infinite particle systems: scaling
limits of conserved quantities leading to PDEs.
-/

structure HydrodynamicLimit where
  conservedQuantity : String
  scalingLimit : ℝ → ℝ
  limitingPDE : String
  holdsUnderScaling : Prop

def sourceHydrodynamicLimit : HydrodynamicLimit := {
  conservedQuantity := "density",
  scalingLimit := λ t => t,
  limitingPDE := "diffusion equation",
  holdsUnderScaling := True
}

structure LargeDeviations where
  rateFunction : ℝ → ℝ
  lowerBound : Prop
  upperBound : Prop

def sourceLargeDeviations : LargeDeviations := {
  rateFunction := λ x => x^2,
  lowerBound := True,
  upperBound := True
}

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse