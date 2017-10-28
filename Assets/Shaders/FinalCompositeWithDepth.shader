// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/FinalCompositeWithDepth" {
	SubShader {

		Tags { "RenderType"="Opaque" }

		Pass{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			sampler2D _CameraDepthTexture;
			sampler2D _MainCameraColorTexture;
			sampler2D _UniverseAColorTexture;
			sampler2D _UniverseADepthTexture;
			sampler2D _UniverseBColorTexture;
			sampler2D _UniverseBDepthTexture;
			sampler2D _VisionConeCutoutTexture;

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f {
				float4 pos : SV_POSITION;
				float4 scrPos:TEXCOORD1;
				float2 uv : TEXCOORD0;
			};



			//Vertex Shader
			v2f vert (appdata v){
				v2f o;
				o.pos = UnityObjectToClipPos (v.vertex);
				o.scrPos=ComputeScreenPos(o.pos);
				o.uv = v.uv;
				
				#if UNITY_UV_STARTS_AT_TOP
					//o.scrPos.y = 1 - o.scrPos.y;
					v.uv.y = 1 - v.uv.y;
				#endif
				
				return o;
			}

			//Fragment Shader
			half4 frag (v2f i) : COLOR{

				float mainCamDepthValue = Linear01Depth (tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.scrPos)).r);
				
				float2 inverseUV = float2(i.uv.x, 1-i.uv.y);

				half4 mainCamColorPixel = tex2D(_MainCameraColorTexture, i.uv);
				float mainCamDepthPixel = 1-half4(mainCamDepthValue,mainCamDepthValue,mainCamDepthValue,1).r;

				half4 universeAColorPixel = tex2D(_UniverseAColorTexture, i.uv);
				float universeADepthPixel = tex2D(_VisionConeCutoutTexture, i.uv).r * (1-tex2D(_UniverseADepthTexture, inverseUV).r);
				
				half4 universeBColorPixel = tex2D(_UniverseBColorTexture, i.uv);
				float universeBDepthPixel = tex2D(_VisionConeCutoutTexture, i.uv).g * (1-tex2D(_UniverseBDepthTexture, inverseUV).r);

				//float3 closestPixel = float3(mainCamDepthPixel>universeADepthPixel, mainCamDepthPixel>universeBDepthPixel, universeADepthPixel>universeBDepthPixel);
				/*
				float m = max(mainCamDepthPixel, universeADepthPixel);

				float stepMainA = step(mainCamDepthPixel, universeADepthPixel);
				half4 lerpMainA = lerp(mainCamColorPixel, universeAColorPixel, stepMainA);
				
				float t = step(m, universeBDepthPixel);
				half4 col = lerp(lerpMainA, universeBColorPixel, t);
				*/

				float maxAB = max(universeADepthPixel, universeBDepthPixel);

				float stepAB = step(universeADepthPixel, universeBDepthPixel);
				half4 lerpAB = lerp(universeAColorPixel, universeBColorPixel, stepAB);
				
				float stepABMain = step(maxAB, mainCamDepthPixel);
				half4 col = lerp(lerpAB, mainCamColorPixel, stepABMain);
				

				return col;
				//return half4(universeBDepthPixel,universeBDepthPixel,universeBDepthPixel,1);
				//return half4(mainCamDepthPixel,mainCamDepthPixel,mainCamDepthPixel,1);;
				//return half4(t,t,t,1);
				//return mainCamColorPixel;
				//return tex2D(_VisionConeCutoutTexture, inverseUV);
				//return universeAColorPixel;
				//return half4(mainCamDepthPixel,mainCamDepthPixel,mainCamDepthPixel,1);
				//return universeBColorPixel*half4(universeBDepthPixel,universeBDepthPixel,universeBDepthPixel,1);
				//return half4(universeBDepthPixel,universeBDepthPixel,universeBDepthPixel,1);
			}
			ENDCG
		}
	}
	FallBack "Diffuse"
}
