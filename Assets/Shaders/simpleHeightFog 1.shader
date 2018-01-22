// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33095,y:32697,varname:node_4013,prsc:2|diff-2883-OUT,emission-3520-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32092,y:32648,ptovrint:False,ptlb:Surface Color,ptin:_SurfaceColor,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3520,x:32841,y:32810,varname:node_3520,prsc:2|A-4996-OUT,B-6502-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6502,x:32570,y:32865,ptovrint:False,ptlb:Emission,ptin:_Emission,varname:node_6502,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:1024,x:32092,y:32832,ptovrint:False,ptlb:Depth Color,ptin:_DepthColor,varname:node_1024,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:4996,x:32402,y:32764,varname:node_4996,prsc:2|A-1304-RGB,B-1024-RGB,T-186-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:9165,x:32092,y:33015,varname:node_9165,prsc:2;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:6310,x:32459,y:33096,varname:node_6310,prsc:2|IN-9165-Y,IMIN-6269-OUT,IMAX-9924-OUT,OMIN-4372-OUT,OMAX-7201-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6269,x:32243,y:33130,ptovrint:False,ptlb:Surface Position,ptin:_SurfacePosition,varname:node_6269,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:9924,x:32243,y:33208,ptovrint:False,ptlb:Depth Position,ptin:_DepthPosition,varname:node_9924,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:4372,x:32243,y:33274,varname:node_4372,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:7201,x:32243,y:33341,varname:node_7201,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:2883,x:32790,y:32674,varname:node_2883,prsc:2|A-4996-OUT,B-186-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:186,x:32718,y:33027,varname:node_186,prsc:2,min:0,max:1|IN-6310-OUT;proporder:1304-6502-1024-6269-9924;pass:END;sub:END;*/

Shader "shaders/simpleHeightFog" {
    Properties {
        _SurfaceColor ("Surface Color", Color) = (1,1,1,1)
        _Emission ("Emission", Float ) = 0
        _DepthColor ("Depth Color", Color) = (0.5,0.5,0.5,1)
        _SurfacePosition ("Surface Position", Float ) = 0
        _DepthPosition ("Depth Position", Float ) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _SurfaceColor;
            uniform float _Emission;
            uniform float4 _DepthColor;
            uniform float _SurfacePosition;
            uniform float _DepthPosition;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float node_4372 = 0.0;
                float node_186 = clamp((node_4372 + ( (i.posWorld.g - _SurfacePosition) * (1.0 - node_4372) ) / (_DepthPosition - _SurfacePosition)),0,1);
                float3 node_4996 = lerp(_SurfaceColor.rgb,_DepthColor.rgb,node_186);
                float3 diffuseColor = (node_4996*node_186);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (node_4996*_Emission);
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _SurfaceColor;
            uniform float _Emission;
            uniform float4 _DepthColor;
            uniform float _SurfacePosition;
            uniform float _DepthPosition;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float node_4372 = 0.0;
                float node_186 = clamp((node_4372 + ( (i.posWorld.g - _SurfacePosition) * (1.0 - node_4372) ) / (_DepthPosition - _SurfacePosition)),0,1);
                float3 node_4996 = lerp(_SurfaceColor.rgb,_DepthColor.rgb,node_186);
                float3 diffuseColor = (node_4996*node_186);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
