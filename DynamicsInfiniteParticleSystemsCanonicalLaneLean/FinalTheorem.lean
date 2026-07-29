import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

def ConstrainedDynamicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamics_closure (A : AdmissibleClass) :
    ConstrainedDynamicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse