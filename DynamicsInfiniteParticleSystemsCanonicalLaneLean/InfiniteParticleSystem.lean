import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Algebra.GroupPower.Basic

/-!
# Infinite Particle System Definitions

This module defines basic structures for infinite particle systems on ℤ^d.
-/

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

abbrev LatticePoint (d : ℕ) : Type := Fin d → ℤ
abbrev ConfigSpace (d : ℕ) : Type := LatticePoint d → ℤ

def zeroConfig (d : ℕ) : ConfigSpace d := fun _ => 0

structure SpinConfig where
  d : ℕ
  config : ConfigSpace d
  finiteSupport : Set.Finite { x : LatticePoint d | config x ≠ 0 }

structure Hamiltonian where
  d : ℕ
  coupling : ConfigSpace d → ConfigSpace d → ℝ
  translationInvariant : ∀ (x : ConfigSpace d), ∀ (y : ConfigSpace d), ∀ (z : LatticePoint d),
    coupling (fun p => x (fun i => p i + z i)) (fun p => y (fun i => p i + z i)) = coupling x y

structure Dynamics where
  d : ℕ
  hamiltonian : Hamiltonian d
  timeEvolution : ℝ → ConfigSpace d → ConfigSpace d
  flowProperty : ∀ (t s : ℝ), timeEvolution (t + s) = timeEvolution t ∘ timeEvolution s

def latticePointAdd (d : ℕ) (x y : LatticePoint d) : LatticePoint d :=
  fun i => x i + y i

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse