Shader "Unlit/SimpleStencilShader"
{
   Properties
    {
    }
    SubShader
    {   
       Tags { "RenderType"="Opaque" "Queue"="Geometry"}
       Stencil {
            Ref 2          //0-255
            Comp always     //default:always
            Pass replace   //default:keep

        }
        //Name "DEFERRED"

        Pass
        {
            //Name "ObjectA"
            Tags { "LightMode"="ObjectA" }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2ff
            {
                float4 vertex : SV_POSITION;
            };

            v2ff vert (appdata v)
            {
                v2ff o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

			void frag (v2ff i,
            out half4 GRT0:SV_Target0,
            out half4 GRT1:SV_Target1,
            out half4 GRT3:SV_TARGET3,
            out float GRTDepth:SV_Depth
            )
			{                
				GRT0 = float4(1,0,0,1);
				GRT1 = float4(0,1,0,1);
                GRT3 = float4(1,1,1,1);
                GRTDepth = 0.5;
			}
            ENDCG
        }
     }
}
