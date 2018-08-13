using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GenerateVisionConeTexture : MonoBehaviour {

    private RenderTexture visionConeRenderTexture;

	// Use this for initialization
	void Start () {
        visionConeRenderTexture = new RenderTexture(Screen.width, Screen.height, 16);
        visionConeRenderTexture.name = gameObject.name + "_VisionConeRT";
        GetComponent<Camera>().targetTexture = visionConeRenderTexture;
        Shader.SetGlobalTexture("_VisionConeCutoutTexture", visionConeRenderTexture);
    }
}
