using UnityEngine;
using System.Collections;

//so that we can see changes we make without having to run the game

public class PostProcessDepthGreyscale : MonoBehaviour
{
    public RenderTexture colorTexture;
    public RenderTexture depthTexture;
    public Material mat;

    [SerializeField]
    private int world;

    void Start()
    {
        colorTexture = new RenderTexture(Screen.width, Screen.height, 32, RenderTextureFormat.ARGBFloat);
        colorTexture.name = gameObject.name + "_ColorTexture";

        GetComponent<Camera>().depthTextureMode = DepthTextureMode.Depth;

        depthTexture = new RenderTexture(Screen.width, Screen.height, 32, RenderTextureFormat.Depth);
        depthTexture.name = gameObject.name + "_DepthTexture";
    }

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, depthTexture, mat);
        Graphics.Blit(source, colorTexture);

        if (world == 0)
        {
            Shader.SetGlobalTexture("_UniverseAColorTexture", depthTexture);
            Shader.SetGlobalTexture("_UniverseADepthTexture", colorTexture);
        } else
        {
            Shader.SetGlobalTexture("_UniverseBColorTexture", depthTexture);
            Shader.SetGlobalTexture("_UniverseBDepthTexture", colorTexture);
        }

        Graphics.Blit(source, destination);


    }

}