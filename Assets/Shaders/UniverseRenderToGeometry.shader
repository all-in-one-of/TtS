Shader "Special/UniverseRenderToGeometry"
{
	SubShader
	{
		Tags {
			"RenderType"="Opaque"
		}
		ZTest LEqual
		ZWrite On

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"
			#include "UnityStandardUtils.cginc"

			struct VertIn
			{
				float4 vertex : POSITION;
			};

			struct FragIn
			{
				float4 vertex : SV_POSITION;
				float3 screen_uv : TEXCOORD1;
				float depth : DEPTH;
			};
			
			FragIn vert (VertIn v)
			{
				FragIn o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.screen_uv = float3((o.vertex.xy + o.vertex.w) * 0.5, o.vertex.w);
				o.depth = -UnityObjectToViewPos(v.vertex).z *_ProjectionParams.w;

				return o;
			}

			sampler2D _UniverseTexture;

			fixed4 frag (FragIn i) : SV_Target
			{
				// Perspective correction for screen uv coordinate
				float2 screen_uv = i.screen_uv.xy / i.screen_uv.z;
				
				#if UNITY_UV_STARTS_AT_TOP
					screen_uv.y = 1-screen_uv.y;
				#endif
				
				float invert = 1 - i.depth;
				//return fixed4(invert, invert, invert, 1);

				// Do the thing!
				fixed4 col = tex2D(_UniverseTexture, screen_uv);

				return col;
			}
			ENDCG
		}


	}
}
