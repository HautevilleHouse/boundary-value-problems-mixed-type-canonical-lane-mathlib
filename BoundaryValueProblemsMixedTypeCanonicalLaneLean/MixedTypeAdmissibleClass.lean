import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeAdmittedObject where
  domain : Type u
  boundary : Type v
  equationType : Prop
  solutionSpace : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : MixedTypeAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MixedTypeWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
