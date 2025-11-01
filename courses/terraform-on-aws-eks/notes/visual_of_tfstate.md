```powershell
# -----------------------------------------
# 🧭 Terraform Graph Visualization (Windows Guide)
# -----------------------------------------

# --- 1️⃣ Generate Graphviz DOT file ---
# Run from your Terraform project directory: (cmd  / bash)

terraform graph > terraform_graph.dot
#powershel equiv:

terraform graph | Out-File -Encoding ASCII terraform_graph.dot

# --- 2️⃣ Install Graphviz on Windows ---
# Option A: via Chocolatey (recommended)
scoop install graphviz

# Option B: manual install
#   1. Go to https://graphviz.gitlab.io/download/
#   2. Download the Windows installer (EXE)
#   3. Run it and let it add Graphviz to your PATH
#   4. Reopen PowerShell or Command Prompt

# --- 3️⃣ Convert DOT to Image ---
# Open PowerShell or cmd in your Terraform directory:
dot -Tpng terraform_graph.dot -o terraform_graph.png

# You can also export SVG (scalable):
dot -Tsvg terraform_graph.dot -o terraform_graph.svg

# --- 4️⃣ Open the Image ---
# Double-click 'terraform_graph.png' in File Explorer
# or open directly via PowerShell:
start terraform_graph.png

# --- 5️⃣ Optional: Prettify the Graph ---
# You can replace terraform_graph.dot content with your custom DOT style:

# --- 6️⃣ (Optional) Use Online Viewer ---
# If you don’t want to install Graphviz locally:
# Copy the DOT content and paste it here:
# 👉 https://dreampuf.github.io/GraphvizOnline/

```