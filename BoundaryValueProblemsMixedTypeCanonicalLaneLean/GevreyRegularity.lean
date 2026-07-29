import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure GevreyRegularityPackage where
  boundaryData : Type u
  totalOrder : Nat
  hyperbolicPart : String
  ellipticPart : String
  gevreyIndex : Nat
  semigroupEstimates : Prop
  symbolBounds : Prop

structure GevreyRegularityEvidence (G : GevreyRegularityPackage) where
  semigroupEstimatesClosed : G.semigroupEstimates
  symbolBoundsClosed : G.symbolBounds

def GevreyRegularityClosed (G : GevreyRegularityPackage) : Prop :=
  G.semigroupEstimates ∧ G.symbolBounds

theorem gevrey_regularity_closed_from_evidence (G : GevreyRegularityPackage) (E : GevreyRegularityEvidence G) :
    GevreyRegularityClosed G := by
  exact And.intro E.semigroupEstimatesClosed E.symbolBoundsClosed

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse