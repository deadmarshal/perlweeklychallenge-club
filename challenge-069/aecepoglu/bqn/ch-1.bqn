sd←0‿1‿8‿6‿9
sm←0‿1‿8‿9‿6
a←50
b←100
Flip←{⌽⊏⟜sm sd⊐𝕩}
(a⊸≤∧b⊸≥)⊸/(⊣+10×⊢)´∘⌽¨(Flip⊸≡¨)⊸/(∧´sd∊˜⊢)¨⊸/(10 _dc ⊢)¨a↓↕1+b
