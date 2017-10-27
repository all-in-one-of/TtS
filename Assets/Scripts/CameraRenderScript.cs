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

    private void Awake()
    {
        var renderTextureA = new RenderTexture(Screen.width, Screen.height, 24);
        var renderTextureB = new RenderTexture(Screen.width, Screen.height, 24);

        cameraA.targetTexture = renderTextureA;
        cameraB.targetTexture = renderTextureB;

        visionConeMaterialA.material.SetTexture("_UniverseTexture", renderTextureA);
        visionConeMaterialB.material.SetTexture("_UniverseTexture", renderTextureB);

        depthHackBufferA = new CommandBuffer();
        depthHackBufferA.ClearRenderTarget(true, true, Color.black, 0);
        depthHackBufferA.name = "Vision Cone Depth Hack Buffer A";
        depthHackBufferA.DrawRenderer(visionConeA, new Material(Shader.Find("Hidden/DepthHack")));

        cameraA.AddCommandBuffer(CameraEvent.BeforeDepthTexture, depthHackBufferA);

        depthHackBufferB = new CommandBuffer();
        depthHackBufferB.ClearRenderTarget(true, true, Color.black, 0);
        depthHackBufferB.name = "Vision Cone Depth Hack Buffer A";
        depthHackBufferB.DrawRenderer(visionConeB, new Material(Shader.Find("Hidden/DepthHack")));

        cameraB.AddCommandBuffer(CameraEvent.AfterDepthTexture, depthHackBufferB);
    }
}
