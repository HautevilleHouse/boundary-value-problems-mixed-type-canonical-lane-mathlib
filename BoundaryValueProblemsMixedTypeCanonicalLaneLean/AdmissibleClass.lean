import BoundaryValueProblemsMixedTypeCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure AdmissibleClass where
  object : BVPAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BVPWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
