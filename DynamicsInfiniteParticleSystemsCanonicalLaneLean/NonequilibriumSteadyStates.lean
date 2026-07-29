import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.HydrodynamicLimitLayer

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

/-!
# Nonequilibrium Steady States Layer

This module defines nonequilibrium steady states (NESS) for infinite particle systems
with boundary driving.
-/

structure BoundaryDriving where
  leftReservoir : GibbsMeasure (ℝ^2)
  rightReservoir : GibbsMeasure (ℝ^2)
  couplingStrength : ℝ

def sourceBoundaryDriving : BoundaryDriving := {
  leftReservoir := sourceGibbsMeasure,
  rightReservoir := sourceGibbsMeasure,
  couplingStrength := 0.5
}

structure NESS where
  current : ℝ → ℝ
  densityProfile : ℝ → ℝ
  steadyStateMeasure : GibbsMeasure (ℝ^2)
  exists : Prop

def sourceNESS : NESS := {
  current := λ x => x,
  densityProfile := λ x => x,
  steadyStateMeasure := sourceGibbsMeasure,
  exists := True
}

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse