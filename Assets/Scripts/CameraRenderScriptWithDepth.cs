using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

public class CameraRenderScriptWithDepth : MonoBehaviour {

    [SerializeField]
    private Camera cameraA;
    [SerializeField]
    private Camera cameraB;

    private CommandBuffer depthHackBufferA;
    private CommandBuffer depthHackBufferB;

    [SerializeField]
    private Renderer visionConeA;
    [SerializeField]
    private Renderer visionConeB;

    [SerializeField]
    private Renderer depthHackA;
    [SerializeField]
    private Renderer depthHackB;

    private void Awake()
    {
        var renderTextureA = new RenderTexture(Screen.width, Screen.height, 24);
        var renderTextureB = new RenderTexture(Screen.width, Screen.height, 24);

        cameraA.targetTexture = renderTextureA;
        cameraB.targetTexture = renderTextureB;

        visionConeA.material.SetTexture("_UniverseTexture", renderTextureA);
        visionConeB.material.SetTexture("_UniverseTexture", renderTextureB);
        
        depthHackBufferA = new CommandBuffer();
        depthHackBufferA.ClearRenderTarget(true, true, Color.black, 0);
        depthHackBufferA.name = "Vision Cone Depth Hack Buffer A";
        depthHackBufferA.DrawRenderer(depthHackA, new Material(Shader.Find("Hidden/DepthHack")));

        cameraA.AddCommandBuffer(CameraEvent.BeforeDepthTexture, depthHackBufferA);
        
        depthHackBufferB = new CommandBuffer();
        depthHackBufferB.ClearRenderTarget(true, true, Color.black, 0);
        depthHackBufferB.name = "Vision Cone Depth Hack Buffer B";
        depthHackBufferB.DrawRenderer(depthHackB, new Material(Shader.Find("Hidden/DepthHack")));

        cameraB.AddCommandBuffer(CameraEvent.BeforeDepthTexture, depthHackBufferB);
        
    }
    
}
