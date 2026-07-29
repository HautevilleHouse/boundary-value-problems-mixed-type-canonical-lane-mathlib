import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsMixedTypeCanonicalLaneLean.MixedTypeDomain

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypePDEOperator (D : MixedTypeDomain) where
  ellipticPart : (D.underlyingSet → ℝ) → (D.underlyingSet → ℝ)
  hyperbolicPart : (D.underlyingSet → ℝ) → (D.underlyingSet → ℝ)
  operatorDefined : Prop

structure PDEOperatorEvidence {D : MixedTypeDomain} (Op : MixedTypePDEOperator D) where
  ellipticPartLinear : Prop
  hyperbolicPartLinear : Prop
  operatorDefinedClosed : Op.operatorDefined

def PDEOperatorClosed {D : MixedTypeDomain} (Op : MixedTypePDEOperator D) : Prop :=
  Op.operatorDefined ∧ (∀ f g, Op.ellipticPart (f + g) = Op.ellipticPart f + Op.ellipticPart g) ∧
  (∀ f g, Op.hyperbolicPart (f + g) = Op.hyperbolicPart f + Op.hyperbolicPart g)

theorem pde_operator_closed_from_evidence {D : MixedTypeDomain} (Op : MixedTypePDEOperator D)
    (E : PDEOperatorEvidence Op) : PDEOperatorClosed Op := by
  exact And.intro E.operatorDefinedClosed (And.intro E.ellipticPartLinear E.hyperbolicPartLinear)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse