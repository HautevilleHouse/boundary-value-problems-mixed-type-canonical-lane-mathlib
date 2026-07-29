import BoundaryValueProblemsMixedTypeCanonicalLaneLean.SobolevSpaces

/-!
# Elliptic Regularity Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure EllipticRegularityPackage where
  operator : Type u
  coercivity : Prop
  fredholmAlternative : Prop
  regularityEstimates : Prop
  maximumPrinciple : Prop

structure EllipticRegularityEvidence (E : EllipticRegularityPackage) where
  coercivityClosed : E.coercivity
  fredholmAlternativeClosed : E.fredholmAlternative
  regularityEstimatesClosed : E.regularityEstimates
  maximumPrincipleClosed : E.maximumPrinciple

def EllipticRegularityClosed (E : EllipticRegularityPackage) : Prop :=
  E.coercivity ∧ E.fredholmAlternative ∧ E.regularityEstimates ∧ E.maximumPrinciple

theorem elliptic_regularity_closed_from_evidence (E : EllipticRegularityPackage) (Ev : EllipticRegularityEvidence E) :
    EllipticRegularityClosed E := by
  exact And.intro Ev.coercivityClosed (And.intro Ev.fredholmAlternativeClosed (And.intro Ev.regularityEstimatesClosed Ev.maximumPrincipleClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
