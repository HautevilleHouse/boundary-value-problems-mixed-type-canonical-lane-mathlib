import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypePDEPackage where
  domainType : Type u
  topOrder : Nat
  ellipticPart : String
  hyperbolicPart : String
  couplingCondition : String
  ellipticityCondition : Prop
  hyperbolicityCondition : Prop
  couplingWellPosed : Prop

structure MixedTypePDEEvidence (P : MixedTypePDEPackage) where
  ellipticityConditionClosed : P.ellipticityCondition
  hyperbolicityConditionClosed : P.hyperbolicityCondition
  couplingWellPosedClosed : P.couplingWellPosed

def MixedTypePDEClosed (P : MixedTypePDEPackage) : Prop :=
  P.ellipticityCondition ∧ P.hyperbolicityCondition ∧ P.couplingWellPosed

theorem mixed_type_pde_closed_from_evidence (P : MixedTypePDEPackage) (E : MixedTypePDEEvidence P) :
    MixedTypePDEClosed P := by
  exact And.intro E.ellipticityConditionClosed (And.intro E.hyperbolicityConditionClosed E.couplingWellPosedClosed)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse