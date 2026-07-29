import BoundaryValueProblemsMixedType.MixedTypeGateLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

def ConstrainedMixedTypeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mixed_type_endgame (A : AdmissibleClass) : ConstrainedMixedTypeClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
