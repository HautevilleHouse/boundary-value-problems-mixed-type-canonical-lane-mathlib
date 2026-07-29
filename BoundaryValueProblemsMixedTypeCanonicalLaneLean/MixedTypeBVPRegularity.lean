import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeRegularityPackage where
  sobolevEmbedding : Prop
  aPrioriEstimate : Prop
  boundaryRegularity : Prop
  interiorRegularity : Prop

structure MixedTypeRegularityEvidence (R : MixedTypeRegularityPackage) where
  sobolevEmbeddingClosed : R.sobolevEmbedding
  aPrioriEstimateClosed : R.aPrioriEstimate
  boundaryRegularityClosed : R.boundaryRegularity
  interiorRegularityClosed : R.interiorRegularity

def MixedTypeRegularityClosed (R : MixedTypeRegularityPackage) : Prop :=
  R.sobolevEmbedding ∧ R.aPrioriEstimate ∧ R.boundaryRegularity ∧ R.interiorRegularity

theorem mixed_type_regularity_closed_from_evidence
    (R : MixedTypeRegularityPackage) (E : MixedTypeRegularityEvidence R) :
    MixedTypeRegularityClosed R := by
  exact And.intro E.sobolevEmbeddingClosed
    (And.intro E.aPrioriEstimateClosed
      (And.intro E.boundaryRegularityClosed E.interiorRegularityClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
