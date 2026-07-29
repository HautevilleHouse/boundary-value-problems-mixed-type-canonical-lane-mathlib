import BoundaryValueProblemsMixedType.MixedTypeBridgeLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
