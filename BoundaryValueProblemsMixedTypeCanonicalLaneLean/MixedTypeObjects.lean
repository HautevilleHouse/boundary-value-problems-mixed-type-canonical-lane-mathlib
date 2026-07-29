import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  dimension : Nat
  signature : Prop  -- elliptic/hyperbolic/mixed

structure MixedTypeProblem where
  domain : MixedTypeSpace
  operator : Prop
  boundaryData : Prop
  solutionSpace : Prop
  wellPosed : Prop
  conclusion : wellPosed

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse