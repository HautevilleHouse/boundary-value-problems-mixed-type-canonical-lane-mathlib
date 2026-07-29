import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure RegularityPackage where
  solutionDifferentiability : Prop
  weightedNormEstimate : Prop
  regularityIndex : Nat
  boundaryRegularity : Prop

structure RegularityEvidence (R : RegularityPackage) where
  solutionDifferentiabilityClosed : R.solutionDifferentiability
  weightedNormEstimateClosed : R.weightedNormEstimate
  boundaryRegularityClosed : R.boundaryRegularity

def RegularityClosed (R : RegularityPackage) : Prop :=
  R.solutionDifferentiability ∧ R.weightedNormEstimate ∧ R.boundaryRegularity

theorem regularity_closed_from_evidence (R : RegularityPackage) (E : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro E.solutionDifferentiabilityClosed (And.intro E.weightedNormEstimateClosed E.boundaryRegularityClosed)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse