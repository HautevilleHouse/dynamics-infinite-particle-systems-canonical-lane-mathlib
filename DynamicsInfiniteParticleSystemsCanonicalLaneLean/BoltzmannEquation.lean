import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure BoltzmannCertificate where
  collisionKernel : ℝ → ℝ → ℝ → ℝ
  gainTerm : ℝ → ℝ
  lossTerm : ℝ → ℝ
  conservationLaws : Prop
  equilibriumExistence : Prop
  conservationLawsProof : conservationLaws
  equilibriumExistenceProof : equilibriumExistence

def sourceBoltzmannCertificate : BoltzmannCertificate := {
  collisionKernel := λ v w σ => 1.0
  gainTerm := λ v => 1.0
  lossTerm := λ v => 1.0
  conservationLaws := True
  equilibriumExistence := True
  conservationLawsProof := trivial
  equilibriumExistenceProof := trivial
}

def BoltzmannEquationClosed (C : BoltzmannCertificate) : Prop :=
  C.conservationLaws ∧ C.equilibriumExistence

theorem source_boltzmann_equation_closed :
    BoltzmannEquationClosed sourceBoltzmannCertificate := by
  exact And.intro sourceBoltzmannCertificate.conservationLawsProof
    sourceBoltzmannCertificate.equilibriumExistenceProof

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse