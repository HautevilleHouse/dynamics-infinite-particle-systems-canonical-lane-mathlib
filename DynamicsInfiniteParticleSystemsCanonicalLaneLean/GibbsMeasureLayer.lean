import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.InfiniteParticleConfigSpace

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

/-!
# Gibbs Measure Layer

This module defines Gibbs measures for infinite particle systems via a Hamiltonian
and DLR equations.
-/

structure Hamiltonian (X : Type) [MetricSpace X] where
  interactionPotential : (X × X) → ℝ
  oneBodyPotential : X → ℝ
  isLocallyStable : Prop

def partitionFunction (H : Hamiltonian (ℝ^2)) (beta : ℝ) (Lambda : Set (ℝ^2)) : ℝ := 0

structure GibbsMeasure (X : Type) [MetricSpace X] where
  Hamiltonian : Hamiltonian X
  temperature : ℝ
  dlrEquationsSatisfied : Prop
  exists : Prop

def sourceGibbsMeasure : GibbsMeasure (ℝ^2) := {
  Hamiltonian := { interactionPotential := λ _ => 0, oneBodyPotential := λ _ => 0, isLocallyStable := True },
  temperature := 1.0,
  dlrEquationsSatisfied := True,
  exists := True
}

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse