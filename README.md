# 11.RenderPipeline---stencil-mrt
This is a experimental stencil integration with SRP and MRT.

### Stencil does not work well with MRT and drawMesh from some experiments:

Was trying to achieve below with standard stencil:

Shader 1 (color passes) : Writing value into render targets (write stencil ref 2).

Shader 2 (combine pass) : Getting render targets value as 2D textures -> sample them -> output to screen (might loosing stencil information here, and that might be why it output black screen).

### Mimic Stencil technique by writing object geometry information in color to a specific render target
Some cautions here:
1. Each object should have its own render target to store geometry information. 
 -> Failed to do so, it will casue all object information mixed together (color stacking/overwritten).
2. Do ```ZTest Off``` for these passes which writting geom information to render targets. -> Otherwise, color stacking/overwritten
3. Be sure to check object rendering order by checking queue order

![555](https://user-images.githubusercontent.com/73683515/147043958-26b4e763-73cb-432f-9916-01544d71093b.JPG)
