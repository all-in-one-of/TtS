// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:False,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:1,qpre:4,rntp:5,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:32892,y:33343,varname:node_2865,prsc:2|emission-496-OUT;n:type:ShaderForge.SFN_TexCoord,id:4219,x:31849,y:33267,cmnt:Default coordinates,varname:node_4219,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Relay,id:8397,x:32105,y:33333,cmnt:Refract here,varname:node_8397,prsc:2|IN-4219-UVOUT;n:type:ShaderForge.SFN_Relay,id:4676,x:32523,y:33354,cmnt:Modify color here,varname:node_4676,prsc:2|IN-7542-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:4430,x:31849,y:33488,ptovrint:False,ptlb:MainTex,ptin:_MainTex,cmnt:MainTex contains the color of the scene,varname:node_9933,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7542,x:32229,y:33333,varname:node_1672,prsc:2,ntxv:0,isnm:False|UVIN-8397-OUT,TEX-4430-TEX;n:type:ShaderForge.SFN_ChannelBlend,id:5639,x:32493,y:33480,varname:node_5639,prsc:2,chbt:1|R-7542-RGB,BTM-5267-RGB;n:type:ShaderForge.SFN_Tex2d,id:5267,x:32040,y:33605,ptovrint:False,ptlb:node_5267,ptin:_node_5267,varname:node_5267,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7358,x:32201,y:33712,ptovrint:False,ptlb:node_7358,ptin:_node_7358,varname:node_7358,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5022,x:32119,y:34003,ptovrint:False,ptlb:node_5022,ptin:_node_5022,varname:node_5022,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:7221,x:32506,y:33898,varname:node_7221,prsc:2|A-7358-R,B-5022-R;n:type:ShaderForge.SFN_Tex2d,id:6605,x:31993,y:33939,ptovrint:False,ptlb:node_6605,ptin:_node_6605,varname:node_6605,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:496,x:32535,y:33711,varname:node_496,prsc:2|A-5267-RGB,B-6605-RGB,T-7221-OUT;proporder:4430-5267-7358-5022-6605;pass:END;sub:END;*/

Shader "Shader Forge/visionCompositeSketch" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _node_5267 ("node_5267", 2D) = "white" {}
        _node_7358 ("node_7358", 2D) = "white" {}
        _node_5022 ("node_5022", 2D) = "white" {}
        _node_6605 ("node_6605", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Overlay+1"
            "RenderType"="Overlay"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_5267; uniform float4 _node_5267_ST;
            uniform sampler2D _node_7358; uniform float4 _node_7358_ST;
            uniform sampler2D _node_5022; uniform float4 _node_5022_ST;
            uniform sampler2D _node_6605; uniform float4 _node_6605_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 _node_5267_var = tex2D(_node_5267,TRANSFORM_TEX(i.uv0, _node_5267));
                float4 _node_6605_var = tex2D(_node_6605,TRANSFORM_TEX(i.uv0, _node_6605));
                float4 _node_7358_var = tex2D(_node_7358,TRANSFORM_TEX(i.uv0, _node_7358));
                float4 _node_5022_var = tex2D(_node_5022,TRANSFORM_TEX(i.uv0, _node_5022));
                float3 emissive = lerp(_node_5267_var.rgb,_node_6605_var.rgb,step(_node_7358_var.r,_node_5022_var.r));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
