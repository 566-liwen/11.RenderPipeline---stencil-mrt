# 11.RenderPipeline---stencil-mrt
This is a experimental stencil integration with SRP and MRT.

(WIP)

Stencil ref value is 2.

Shader 1: Writing value into render targets (write stencil ref 2).

Shader 2: Getting render targets value as 2D textures -> sample them -> output to screen (might loosing stencil information here, and that might be why it output black screen).
