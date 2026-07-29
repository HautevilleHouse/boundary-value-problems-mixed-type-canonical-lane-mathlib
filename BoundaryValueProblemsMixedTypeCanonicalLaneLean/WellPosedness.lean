import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure WellPosednessPackage where
  boundaryData : Type u
  totalOrder : Nat
  hyperbolicPart : String
  ellipticPart : String
  couplingCondition : String
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop

structure WellPosednessEvidence (W : WellPosednessPackage) where
  existenceClosed : W.existence
  uniquenessClosed : W.uniqueness
  continuousDependenceClosed : W.continuousDependence

def WellPosednessClosed (W : WellPosednessPackage) : Prop :=
  W.existence ∧ W.uniqueness ∧ W.continuousDependence

theorem well_posedness_closed_from_evidence (W : WellPosednessPackage) (E : WellPosednessEvidence W) :
    WellPosednessClosed W := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.continuousDependenceClosed)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse