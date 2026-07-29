import canonicalLaneMathlib.InfiniteParticleSystem
import Mathlib.Data.Real.Basic

/-!
# Phase Transitions in Infinite Particle Systems

This module defines order parameters and phase transitions.
-/

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure OrderParameter where
  name : String
  value : ℝ

structure PhaseTransition where
  criticalTemperature : ℝ
  orderParameter : OrderParameter
  symmetryBreaking : Prop

structure GibbsMeasure where
  d : ℕ
  hamiltonian : Hamiltonian d
  temperature : ℝ
  measure : Prop
  dLR : Prop

structure DLRCondition where
  d : ℕ
  conditionalProbabilities : Prop

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse