import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeBVPSobolevSpace where
  domain : Type u
  boundary : Type v
  sobolevIndex : ℕ
  weightFunction : Type w
  domainOpen : Prop
  boundarySmooth : Prop
  sobolevEmbedding : Prop
  weightedNormDefined : Prop

structure MixedTypeBVPSobolevSpaceEvidence (S : MixedTypeBVPSobolevSpace) where
  domainOpenClosed : S.domainOpen
  boundarySmoothClosed : S.boundarySmooth
  sobolevEmbeddingClosed : S.sobolevEmbedding
  weightedNormDefinedClosed : S.weightedNormDefined

def MixedTypeBVPSobolevSpaceClosed (S : MixedTypeBVPSobolevSpace) : Prop :=
  S.domainOpen ∧ S.boundarySmooth ∧ S.sobolevEmbedding ∧ S.weightedNormDefined

theorem mixed_type_bvp_sobolev_space_closed_from_evidence
    (S : MixedTypeBVPSobolevSpace) (E : MixedTypeBVPSobolevSpaceEvidence S) :
    MixedTypeBVPSobolevSpaceClosed S := by
  exact And.intro E.domainOpenClosed
    (And.intro E.boundarySmoothClosed
      (And.intro E.sobolevEmbeddingClosed E.weightedNormDefinedClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse