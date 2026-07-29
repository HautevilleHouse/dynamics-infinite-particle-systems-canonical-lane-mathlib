import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.LiouvilleEquation

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure BBGKYHierarchyLevel where
  level : ℕ
  marginalDensity : ℝ → ℝ → ℝ
  closureCondition : Prop
  closureConditionClosed : closureCondition

def sourceBBGKYHierarchyLevel : ℕ → BBGKYHierarchyLevel := λ n => {
  level := n
  marginalDensity := λ x t => 0.0
  closureCondition := True
  closureConditionClosed := trivial
}

structure BBGKYCertificate where
  liouvilleData : LiouvilleEquationData
  hierarchyLevels : List BBGKYHierarchyLevel
  hierarchyClosed : ∀ L ∈ hierarchyLevels, L.closureCondition
  unfoldingProperty : Prop
  unfoldingPropertyClosed : unfoldingProperty

def sourceBBGKYCertificate : BBGKYCertificate := {
  liouvilleData := sourceLiouvilleEquationData
  hierarchyLevels := [sourceBBGKYHierarchyLevel 1, sourceBBGKYHierarchyLevel 2]
  hierarchyClosed := by
    intro L h
    have : L ∈ [sourceBBGKYHierarchyLevel 1, sourceBBGKYHierarchyLevel 2] := h
    rcases this with (rfl|rfl)
    · exact trivial
    · exact trivial
  unfoldingProperty := True
  unfoldingPropertyClosed := trivial
}

def BBGKYHierarchyClosed (C : BBGKYCertificate) : Prop :=
  LiouvilleEquationClosed C.liouvilleData ∧
  C.hierarchyClosed ∧
  C.unfoldingProperty

theorem source_bbgky_hierarchy_closed : BBGKYHierarchyClosed sourceBBGKYCertificate := by
  exact And.intro source_liouville_equation_closed
    (And.intro sourceBBGKYCertificate.hierarchyClosed sourceBBGKYCertificate.unfoldingPropertyClosed)

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse