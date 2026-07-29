import BoundaryValueProblemsMixedTypeCanonicalLaneLean.MixedTypePDE

/-!
# Sobolev Spaces Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure SobolevSpacesPackage where
  spaceType : Type u
  norm : Type v
  embeddingTheorems : Prop
  traceTheorems : Prop
  compactness : Prop

structure SobolevSpacesEvidence (S : SobolevSpacesPackage) where
  embeddingTheoremsClosed : S.embeddingTheorems
  traceTheoremsClosed : S.traceTheorems
  compactnessClosed : S.compactness

def SobolevSpacesClosed (S : SobolevSpacesPackage) : Prop :=
  S.embeddingTheorems ∧ S.traceTheorems ∧ S.compactness

theorem sobolev_spaces_closed_from_evidence (S : SobolevSpacesPackage) (E : SobolevSpacesEvidence S) :
    SobolevSpacesClosed S := by
  exact And.intro E.embeddingTheoremsClosed (And.intro E.traceTheoremsClosed E.compactnessClosed)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
