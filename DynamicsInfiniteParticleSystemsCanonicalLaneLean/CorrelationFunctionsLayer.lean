import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.GibbsMeasureLayer

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

/-!
# Correlation Functions Layer

This module defines correlation functions and cluster expansions for infinite particle systems.
-/

structure CorrelationFunction (n : ℕ) where
  points : Fin n → (ℝ^2)
  value : ℝ

def truncatedCorrelationFunction (n : ℕ) (mu : GibbsMeasure (ℝ^2)) : CorrelationFunction n := {
  points := λ i => (0,0),
  value := 0
}

structure ClusterExpansion where
  convergenceRadius : ℝ
  terms : ℕ → ℝ
  isConvergent : Prop

def sourceClusterExpansion : ClusterExpansion := {
  convergenceRadius := 1.0,
  terms := λ n => 0,
  isConvergent := True
}

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse