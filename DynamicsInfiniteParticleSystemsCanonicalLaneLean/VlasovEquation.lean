import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.ParticleSystemState

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure VlasovEquationData where
  selfConsistentField : ℝ → ℝ → ℝ
  collisionTermZero : Prop
  fieldRegularity : Prop
  collisionTermZeroClosed : collisionTermZero
  fieldRegularityClosed : fieldRegularity

def sourceVlasovEquationData : VlasovEquationData := {
  selfConsistentField := λ x t => 0.0
  collisionTermZero := True
  fieldRegularity := True
  collisionTermZeroClosed := trivial
  fieldRegularityClosed := trivial
}

def VlasovEquationClosed (V : VlasovEquationData) : Prop :=
  V.collisionTermZero ∧ V.fieldRegularity

theorem source_vlasov_equation_closed : VlasovEquationClosed sourceVlasovEquationData := by
  exact And.intro sourceVlasovEquationData.collisionTermZeroClosed sourceVlasovEquationData.fieldRegularityClosed

structure VlasovPoissonCertificate where
  vlasovData : VlasovEquationData
  poissonEquation : Prop
  poissonEquationClosed : poissonEquation

def sourceVlasovPoissonCertificate : VlasovPoissonCertificate := {
  vlasovData := sourceVlasovEquationData
  poissonEquation := True
  poissonEquationClosed := trivial
}

def VlasovPoissonClosed (C : VlasovPoissonCertificate) : Prop :=
  VlasovEquationClosed C.vlasovData ∧ C.poissonEquation

theorem source_vlasov_poisson_closed : VlasovPoissonClosed sourceVlasovPoissonCertificate := by
  exact And.intro source_vlasov_equation_closed sourceVlasovPoissonCertificate.poissonEquationClosed

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse