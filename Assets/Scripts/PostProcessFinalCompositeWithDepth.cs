using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PostProcessFinalCompositeWithDepth : MonoBehaviour {

    public Material mat;
    private RenderTexture outputTexture;
    /*
    void Start()
    {
        outputTexture = new RenderTexture(Screen.width, Screen.height, 24);
        //GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth;
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, outputTexture);
        Shader.SetGlobalTexture("_MainCameraColorTexture", outputTexture);
        Graphics.Blit(source, destination, mat);
        //mat is the material which contains the shader
        //we are passing the destination RenderTexture to
    }
    */
}
