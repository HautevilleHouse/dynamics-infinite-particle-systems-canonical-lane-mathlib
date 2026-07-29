import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

/-!
# Infinite Particle Configuration Space

This module defines the configuration space for infinite particle systems: locally finite
configurations of particles in a Polish space (e.g., ℝ^d).
-/

structure LocallyFiniteConfig (X : Type) where
  points : Set (X × ℕ)   -- each particle has a position and label
  locallyFinite : ∀ x : X, ∃ r > 0, (points.filter (λ p => dist p.1 x < r)).Finite

def ConfigSpace (X : Type) [MetricSpace X] : Type := { c : LocallyFiniteConfig X // True }

structure InfiniteParticleConfig where
  space : Type
  metric : MetricSpace space
  config : ConfigSpace space

def emptyConfig (X : Type) [MetricSpace X] : InfiniteParticleConfig := {
  space := X,
  metric := inferInstance,
  config := ⟨{ points := ∅, locallyFinite := by intro x; exact ⟨1, by norm_num, by simp⟩ }, trivial⟩
}

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse