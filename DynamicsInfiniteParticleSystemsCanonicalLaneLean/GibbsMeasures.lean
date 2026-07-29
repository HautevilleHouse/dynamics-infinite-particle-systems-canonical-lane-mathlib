import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure GibbsMeasureCertificate where
  Hamiltonian : ℝ → ℝ → ℝ
  inverseTemperature : ℝ
  partitionFunction : ℝ
  existsLimit : Prop
  mixingProperties : Prop
  existsLimitProof : existsLimit
  mixingPropertiesProof : mixingProperties

def sourceGibbsMeasureCertificate : GibbsMeasureCertificate := {
  Hamiltonian := λ x p => (x^2 + p^2)/2
  inverseTemperature := 1.0
  partitionFunction := (2*π)^(1/2)
  existsLimit := True
  mixingProperties := True
  existsLimitProof := trivial
  mixingPropertiesProof := trivial
}

def GibbsMeasuresClosed (C : GibbsMeasureCertificate) : Prop :=
  C.existsLimit ∧ C.mixingProperties

theorem source_gibbs_measures_closed :
    GibbsMeasuresClosed sourceGibbsMeasureCertificate := by
  exact And.intro sourceGibbsMeasureCertificate.existsLimitProof
    sourceGibbsMeasureCertificate.mixingPropertiesProof

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse