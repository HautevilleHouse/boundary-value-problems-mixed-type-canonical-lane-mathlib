import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure BVPAdmittedObject where
  domain : Type
  boundary : Type
  mixedTypeOperator : Type
  wellPosedness : Prop
  conclusion : wellPosedness
  
def BVPWitnessClosed (O : BVPAdmittedObject) : Prop :=
  O.wellPosedness

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse