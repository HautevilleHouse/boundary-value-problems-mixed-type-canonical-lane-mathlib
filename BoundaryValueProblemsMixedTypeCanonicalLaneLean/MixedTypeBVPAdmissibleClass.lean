import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsMixedTypeCanonicalLaneLean.MixedTypeBVPSobolevSpaces
import HautevilleHouse.BoundaryValueProblemsMixedTypeCanonicalLaneLean.MixedTypeBVPObliqueDerivative

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeBVPAdmissibleObject where
  sobolevSpace : MixedTypeBVPSobolevSpace
  obliqueDerivative : MixedTypeBVPObliqueDerivative
  solutionSpace : Type u
  existenceResult : Prop
  uniquenessResult : Prop
  regularityResult : Prop

def MixedTypeBVPCarriedRemainder : Prop := True

def bvpBridgeClosed (A : AdmissibleClass) : Prop :=
  MixedTypeBVPSobolevSpaceClosed A.sobolevSpace ∧ MixedTypeBVPObliqueDerivativeClosed A.obliqueDerivative

def bvpGateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bvp_bridge_from_admissible_class (A : AdmissibleClass) : bvpBridgeClosed A := by
  sorry

theorem bvp_gate_from_admissible_class (A : AdmissibleClass) : bvpGateClosed A := by
  exact A.gateWitness

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse