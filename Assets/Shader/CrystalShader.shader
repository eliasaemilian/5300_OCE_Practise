Shader "Unlit/CrystalShader"
{
    Properties {
        _CrystalColor ("Crystal Color", Color) = (1,1,1,1)
    }
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            // Vertex To Fragment Shader Stage Data Struct
            struct v2f {
                float4 vertex : SV_POSITION;
            };

            // Variables
            float4 _CrystalColor;

            // I am the Vertex Shader Stage
            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            // I am the Fragment Shader Stage
            fixed4 frag (v2f i) : SV_Target {

                fixed4 col = _CrystalColor;
                return col;
            }
            ENDCG
        }
    }
}
