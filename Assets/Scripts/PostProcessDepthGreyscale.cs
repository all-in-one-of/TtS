using UnityEngine;
using System.Collections;

//so that we can see changes we make without having to run the game

public class PostProcessDepthGreyscale : MonoBehaviour
{
    private RenderTexture outputTexture;
    public Material mat;

    [SerializeField]
    private int world;

    void Start()
    {
        outputTexture = new RenderTexture(Screen.width, Screen.height, 24);
        //GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth;
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination);
        Graphics.Blit(source, outputTexture, mat);

        if (world == 0)
        {
            Shader.SetGlobalTexture("_UniverseAColorTexture", destination);
            Shader.SetGlobalTexture("_UniverseADepthTexture", outputTexture);
        } else
        {
            Shader.SetGlobalTexture("_UniverseBColorTexture", destination);
            Shader.SetGlobalTexture("_UniverseBDepthTexture", outputTexture);
        }
    }
    
}