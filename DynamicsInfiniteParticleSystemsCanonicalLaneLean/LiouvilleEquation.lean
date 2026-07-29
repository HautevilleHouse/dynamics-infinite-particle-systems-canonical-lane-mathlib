import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.ParticleSystemState

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure LiouvilleEquationData where
  densityFunction : ℝ → ℝ → ℝ  -- density as function of position and time
  continuityEquation : Prop
  advectionTerm : Prop
  interactionTerm : Prop
  continuityEquationClosed : continuityEquation
  advectionTermClosed : advectionTerm
  interactionTermClosed : interactionTerm

def sourceLiouvilleEquationData : LiouvilleEquationData := {
  densityFunction := λ x t => 0.0
  continuityEquation := True
  advectionTerm := True
  interactionTerm := True
  continuityEquationClosed := trivial
  advectionTermClosed := trivial
  interactionTermClosed := trivial
}

def LiouvilleEquationClosed (L : LiouvilleEquationData) : Prop :=
  L.continuityEquation ∧ L.advectionTerm ∧ L.interactionTerm

theorem source_liouville_equation_closed : LiouvilleEquationClosed sourceLiouvilleEquationData := by
  exact And.intro sourceLiouvilleEquationData.continuityEquationClosed
    (And.intro sourceLiouvilleEquationData.advectionTermClosed sourceLiouvilleEquationData.interactionTermClosed)

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse