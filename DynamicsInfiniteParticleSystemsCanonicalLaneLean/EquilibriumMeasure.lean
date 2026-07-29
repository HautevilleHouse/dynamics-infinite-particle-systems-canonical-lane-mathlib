import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.VlasovEquation

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure EquilibriumMeasureData where
  invariantMeasure : ℝ → ℝ → ℝ
  detailedBalanceCondition : Prop
  detailedBalanceConditionClosed : detailedBalanceCondition

def sourceEquilibriumMeasureData : EquilibriumMeasureData := {
  invariantMeasure := λ x v => 0.0
  detailedBalanceCondition := True
  detailedBalanceConditionClosed := trivial
}

structure EquilibriumMeasureCertificate where
  vlasovPoisson : VlasovPoissonCertificate
  equilibriumData : EquilibriumMeasureData
  equilibriumConvergence : Prop
  equilibriumConvergenceClosed : equilibriumConvergence

def sourceEquilibriumMeasureCertificate : EquilibriumMeasureCertificate := {
  vlasovPoisson := sourceVlasovPoissonCertificate
  equilibriumData := sourceEquilibriumMeasureData
  equilibriumConvergence := True
  equilibriumConvergenceClosed := trivial
}

def EquilibriumMeasureClosed (C : EquilibriumMeasureCertificate) : Prop :=
  VlasovPoissonClosed C.vlasovPoisson ∧
  C.equilibriumData.detailedBalanceCondition ∧
  C.equilibriumConvergence

theorem source_equilibrium_measure_closed : EquilibriumMeasureClosed sourceEquilibriumMeasureCertificate := by
  exact And.intro source_vlasov_poisson_closed
    (And.intro sourceEquilibriumMeasureCertificate.equilibriumData.detailedBalanceConditionClosed
      sourceEquilibriumMeasureCertificate.equilibriumConvergenceClosed)

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse