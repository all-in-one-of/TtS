using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

public class CameraRenderScript : MonoBehaviour {

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
    private Renderer visionConeMaterialA;
    [SerializeField]
    private Renderer visionConeMaterialB;


    public RenderTexture renderTextureA;
    public RenderTexture renderTextureB;

    private void Awake()
    {
        renderTextureA = new RenderTexture(Screen.width, Screen.height, 32, RenderTextureFormat.ARGBFloat);
        renderTextureB = new RenderTexture(Screen.width, Screen.height, 32, RenderTextureFormat.ARGBFloat);

        renderTextureA.name = "Render Texture A";
        renderTextureB.name = "Render Texture B";

        cameraA.targetTexture = renderTextureA;
        cameraB.targetTexture = renderTextureB;

        visionConeMaterialA.material.SetTexture("_UniverseTexture", renderTextureA);
        visionConeMaterialB.material.SetTexture("_UniverseTexture", renderTextureB);
        
        /*
        depthHackBufferA = new CommandBuffer();
        depthHackBufferA.ClearRenderTarget(true, true, Color.black, 0);
        depthHackBufferA.name = "Vision Cone Depth Hack Buffer A";
        depthHackBufferA.DrawRenderer(visionConeA, new Material(Shader.Find("Hidden/DepthHack")));

        cameraA.AddCommandBuffer(CameraEvent.BeforeDepthTexture, depthHackBufferA);
        
        depthHackBufferB = new CommandBuffer();
        depthHackBufferB.ClearRenderTarget(true, true, Color.black, 0);
        depthHackBufferB.name = "Vision Cone Depth Hack Buffer B";
        depthHackBufferB.DrawRenderer(visionConeB, new Material(Shader.Find("Hidden/DepthHack")));

        cameraB.AddCommandBuffer(CameraEvent.BeforeDepthTexture, depthHackBufferB);
        */
    }

    private void Update()
    {
        //renderTextureA.width = Screen.width;
        //renderTextureA.height = Screen.height;

        //renderTextureB.width = Screen.width;
        //renderTextureB.height = Screen.height;
    }

}
