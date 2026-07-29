import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsMixedTypeCanonicalLaneLean.EndpointClassificationPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

def ConstrainedBVPMixedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bvp_mixed_endgame (A : AdmissibleClass) :
    ConstrainedBVPMixedClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse