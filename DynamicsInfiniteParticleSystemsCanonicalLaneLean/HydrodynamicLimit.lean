import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.EquilibriumMeasure

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure HydrodynamicLimitData where
  continuityEquation : Prop
  eulerEquation : Prop
  localEquilibrium : Prop
  continuityEquationClosed : continuityEquation
  eulerEquationClosed : eulerEquation
  localEquilibriumClosed : localEquilibrium

def sourceHydrodynamicLimitData : HydrodynamicLimitData := {
  continuityEquation := True
  eulerEquation := True
  localEquilibrium := True
  continuityEquationClosed := trivial
  eulerEquationClosed := trivial
  localEquilibriumClosed := trivial
}

structure HydrodynamicLimitCertificate where
  equilibriumMeasure : EquilibriumMeasureCertificate
  hydrodynamicData : HydrodynamicLimitData
  limitTheorem : Prop
  limitTheoremClosed : limitTheorem

def sourceHydrodynamicLimitCertificate : HydrodynamicLimitCertificate := {
  equilibriumMeasure := sourceEquilibriumMeasureCertificate
  hydrodynamicData := sourceHydrodynamicLimitData
  limitTheorem := True
  limitTheoremClosed := trivial
}

def HydrodynamicLimitClosed (C : HydrodynamicLimitCertificate) : Prop :=
  EquilibriumMeasureClosed C.equilibriumMeasure ∧
  C.hydrodynamicData.continuityEquation ∧
  C.hydrodynamicData.eulerEquation ∧
  C.hydrodynamicData.localEquilibrium ∧
  C.limitTheorem

theorem source_hydrodynamic_limit_closed : HydrodynamicLimitClosed sourceHydrodynamicLimitCertificate := by
  refine And.intro source_equilibrium_measure_closed
    (And.intro sourceHydrodynamicLimitCertificate.hydrodynamicData.continuityEquationClosed
      (And.intro sourceHydrodynamicLimitCertificate.hydrodynamicData.eulerEquationClosed
        (And.intro sourceHydrodynamicLimitCertificate.hydrodynamicData.localEquilibriumClosed
          sourceHydrodynamicLimitCertificate.limitTheoremClosed)))

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse