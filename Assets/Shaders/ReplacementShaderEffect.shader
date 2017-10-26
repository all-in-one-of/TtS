Shader "Hidden/ReplacementShaderEffect" {
	SubShader {
		Tags { 
			"Queue" = "Transparent"
			"RenderPlayer"="P"
		}

		ZTest Always
		ZWrite Off
		Blend One One

		Pass{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"
		
			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			fixed4 frag (v2f i) : SV_TARGET
			{
				return fixed4(1,0,0,1);
			}

			ENDCG
		}
	}

	SubShader {

		Tags { 
			"Queue" = "Transparent"
			"RenderPlayer"="W"
		}

		ZTest Always
		ZWrite Off
		Blend One One

		Pass{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"
		
			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			fixed4 frag (v2f i) : SV_TARGET
			{
				return fixed4(0,1,0,1);
			}

			ENDCG
		}
	}
}