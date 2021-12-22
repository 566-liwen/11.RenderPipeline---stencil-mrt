Shader "Unlit/Quad"
{
   Properties
    {
    }
    SubShader
    {   
       Tags { "RenderType"="Opaque" "Queue"="Geometry"}
  
        Pass
        {
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
            out float GRTDepth:SV_Depth
            )
			{                
				GRT0 = float4(1,0,0,1);
                GRTDepth = 0.5;
			}
            ENDCG
        }

        Pass // object gemo shape written into rt
        {

            Tags { "LightMode"="ObjectB" }

            ZTest Off // a must have - to have complete shape of the object


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
            out half4 GRT1:SV_TARGET1
            )
			{                
				GRT1 = float4(0,0,0,1);
			}
            ENDCG
        }
     }
}
