# 生图提示词模板

每张图单独生成。根据正文内容替换变量，不要把多张图拼在一起。

## 变量填充指南

| 变量 | 来源 | 要求 |
|------|------|------|
| `{正文配图主题}` | 从段落核心观点提炼 | 一句话，不超过 15 字 |
| `{结构类型}` | 根据 composition-patterns.md 选择指引决定 | 8 种中选 1 种 |
| `{核心意思}` | 提炼这张图要传递的一个判断或关系 | 一句话，不超过 20 字 |
| `{具体画面}` | 用原创隐喻生成法发明 | 写清 Leohang 位置、动作、主要物件、信息流向 |
| `{元素}` | 从画面中提取 3-4 个具象物件 | 每个元素用短语描述 |
| `{标注词}` | 从正文中提取关键词 | 每个 2-8 字，最多 5-8 个，优先中文 |

```text
Generate one standalone 16:9 horizontal Chinese article illustration.

Visual DNA:
Pure white background. Minimalist black hand-drawn line art. Slightly wobbly pen lines. Lots of empty white space. Sparse red/orange/blue handwritten Chinese annotations. Clean absurd product-sketch feeling. No gradients, no shadows, no paper texture, no complex background, no commercial vector style, no PPT infographic look, no cute mascot poster, no children's illustration, no realistic UI.

Recurring IP character required:
Leohang, a young man with short black hair, rectangular black-framed glasses (always visible, core visual identifier), wearing a black high-collar zip-up jacket, black trousers, and white sneakers. Hand-drawn line art style with slightly exaggerated proportions (slightly large head, simplified hands and feet). Calm, focused, serious expression — like a hands-on engineer deeply absorbed in a problem. Leohang must perform the core conceptual action, not decorate the scene. Make him focused, methodical, and slightly deadpan, not cute or cartoonish.

Theme:
{正文配图主题}

Structure type:
{结构类型：Workflow / 系统局部 / 前后对比 / 角色状态 / 概念隐喻 / 方法分层 / 地图路线 / 小漫画分镜}

Core idea:
{这张图要表达的核心意思}

Composition:
{具体画面：Leohang 在哪里、正在做什么、主要物件是什么、信息如何流动}

Suggested elements:
{元素1} / {元素2} / {元素3} / {元素4}

Chinese handwritten labels:
{标注词1} / {标注词2} / {标注词3} / {标注词4} / {可选标注词5}

Color use:
Black for main line art and Leohang. Orange for main flow/path/arrows. Red only for key warnings/problems/results. Blue only for secondary notes or feedback/system state.

Constraints:
One image explains only one core structure. Keep the main subject around 40%-60% of the canvas. Preserve at least 35% blank white space. Use at most 5-8 short handwritten Chinese labels. Do not write a title in the top-left corner. Do not write the structure type on the image. Do not make it a formal diagram, course slide, or dense explainer. Do not copy prior examples or reuse known case compositions unless explicitly requested; invent a fresh visual metaphor for this specific article. It should be clear but not instructional, interesting but not childish, strange but clean.
```

## 图像编辑提示

去掉左上角标题：

```text
Edit the provided image. Remove only the handwritten title "{要删除的文字}" and its underline from the top-left corner. Fill that area with the same clean white background, matching the surrounding blank paper. Preserve everything else exactly: characters, labels, paths, line style, composition, aspect ratio, and image quality. Do not add any new text or objects.
```

增强角色参与感：

```text
Regenerate this illustration with the same core meaning and simple layout, but make Leohang more central to the conceptual action. Leohang should be doing the hands-on work that explains the idea — debugging, connecting, building, filtering — not standing beside the diagram. Keep it clean, sparse, hand-drawn, and focused. Remember: rectangular black-framed glasses must be visible.
```
