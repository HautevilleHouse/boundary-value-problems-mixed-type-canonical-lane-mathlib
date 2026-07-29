import BoundaryValueProblemsMixedType.MixedTypeAdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

def MixedTypeWitnessClosed (O : MixedTypeAdmittedObject) : Prop :=
  O.conclusion

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MixedTypeWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
