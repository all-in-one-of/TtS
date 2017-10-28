// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32936,y:32719,varname:node_3138,prsc:2|normal-9710-RGB,emission-7241-RGB,alpha-5192-OUT,refract-7276-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32463,y:32776,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9710,x:32463,y:32599,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_9710,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-5723-UVOUT;n:type:ShaderForge.SFN_Slider,id:5192,x:32346,y:32975,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_5192,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_NormalVector,id:7910,x:32256,y:33091,prsc:2,pt:True;n:type:ShaderForge.SFN_ComponentMask,id:6152,x:32489,y:33091,varname:node_6152,prsc:2,cc1:0,cc2:2,cc3:-1,cc4:-1|IN-7910-OUT;n:type:ShaderForge.SFN_Multiply,id:7276,x:32695,y:33131,varname:node_7276,prsc:2|A-6152-OUT,B-3049-OUT;n:type:ShaderForge.SFN_Slider,id:3049,x:32313,y:33295,ptovrint:False,ptlb:Refraction,ptin:_Refraction,varname:node_3049,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_FragmentPosition,id:4863,x:31486,y:32562,varname:node_4863,prsc:2;n:type:ShaderForge.SFN_Append,id:1817,x:31733,y:32595,varname:node_1817,prsc:2|A-4863-X,B-4863-Z;n:type:ShaderForge.SFN_ValueProperty,id:5481,x:31704,y:32959,ptovrint:False,ptlb:Tiling,ptin:_Tiling,varname:node_5481,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_UVTile,id:806,x:31916,y:32595,varname:node_806,prsc:2|UVIN-1817-OUT,WDT-9316-OUT,HGT-4800-OUT,TILE-5481-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9316,x:31704,y:32787,ptovrint:False,ptlb:Tile Width,ptin:_TileWidth,varname:node_9316,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:4800,x:31704,y:32870,ptovrint:False,ptlb:Tile Height,ptin:_TileHeight,varname:node_4800,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Panner,id:5723,x:32152,y:32595,varname:node_5723,prsc:2,spu:1,spv:1|UVIN-806-UVOUT,DIST-5431-OUT;n:type:ShaderForge.SFN_Time,id:3677,x:31916,y:32787,varname:node_3677,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:7051,x:31916,y:32959,ptovrint:False,ptlb:Panning,ptin:_Panning,varname:node_7051,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:5431,x:32119,y:32787,varname:node_5431,prsc:2|A-3677-TSL,B-7051-OUT;proporder:7241-9710-5192-3049-5481-9316-4800-7051;pass:END;sub:END;*/

Shader "shaders/refractor" {
    Properties {
        _Color ("Color", Color) = (0.07843138,0.3921569,0.7843137,1)
        _Normal ("Normal", 2D) = "bump" {}
        _Opacity ("Opacity", Range(0, 1)) = 0
        _Refraction ("Refraction", Range(0, 1)) = 0
        _Tiling ("Tiling", Float ) = 1
        _TileWidth ("Tile Width", Float ) = 0
        _TileHeight ("Tile Height", Float ) = 0
        _Panning ("Panning", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float4 _Color;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Opacity;
            uniform float _Refraction;
            uniform float _Tiling;
            uniform float _TileWidth;
            uniform float _TileHeight;
            uniform float _Panning;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float3 tangentDir : TEXCOORD2;
                float3 bitangentDir : TEXCOORD3;
                float4 projPos : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float4 node_3677 = _Time;
                float2 node_806_tc_rcp = float2(1.0,1.0)/float2( _TileWidth, _TileHeight );
                float node_806_ty = floor(_Tiling * node_806_tc_rcp.x);
                float node_806_tx = _Tiling - _TileWidth * node_806_ty;
                float2 node_1817 = float2(i.posWorld.r,i.posWorld.b);
                float2 node_806 = (node_1817 + float2(node_806_tx, node_806_ty)) * node_806_tc_rcp;
                float2 node_5723 = (node_806+(node_3677.r*_Panning)*float2(1,1));
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_5723, _Normal)));
                float3 normalLocal = _Normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 sceneUVs = (i.projPos.xy / i.projPos.w) + (normalDirection.rb*_Refraction);
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float3 emissive = _Color.rgb;
                float3 finalColor = emissive;
                return fixed4(lerp(sceneColor.rgb, finalColor,_Opacity),1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
