Shader "Unlit/Cube"
{
   Properties
    {
    }
    SubShader
    {   
       Tags { "RenderType"="Opaque" "Queue"="Geometry+1"} // queue order here for cube drawing always in front of quad
  
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
				GRT0 = float4(0,1,0,1);
                GRTDepth = 0.5;
			}
            ENDCG
        }

        Pass // object gemo shape written into rt
        {

            Tags { "LightMode"="ObjectB" }

            ZTest Off // a must have - for shape


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
            out half4 GRT3:SV_TARGET3
            )
			{                
				GRT3 = float4(0,0,0,1);
			}
            ENDCG
        }
     }
}