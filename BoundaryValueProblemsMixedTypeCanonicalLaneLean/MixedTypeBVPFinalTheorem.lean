import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsMixedTypeCanonicalLaneLean.MixedTypeBVPAdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

def MixedTypeBVPConstrainedClosure (A : AdmissibleClass) : Prop :=
  bvpBridgeClosed A ∧ bvpGateClosed A

theorem mixed_type_bvp_endgame (A : AdmissibleClass) : MixedTypeBVPConstrainedClosure A := by
  exact And.intro (bvp_bridge_from_admissible_class A) (bvp_gate_from_admissible_class A)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse