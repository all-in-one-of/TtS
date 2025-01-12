﻿Shader "Custom/GenerateStencil" {
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100
	
		Pass
		{
			ZTest Always
			Cull Off
	
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
				o.vertex.z = 0;
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return fixed4(1,1,1,1);
			}
			ENDCG
		}
	}
}
