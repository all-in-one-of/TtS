using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReplacementShaderScript : MonoBehaviour {

    public Shader replacementShader;

    void OnEnable()
    {
        if (replacementShader != null)
            GetComponent<Camera>().SetReplacementShader(replacementShader, "RenderPlayer");

        GameObject[] pList = GameObject.FindGameObjectsWithTag("P");
        foreach (var p in pList)
        {
            Material[] materials = p.GetComponent<Renderer>().materials;
            foreach (var material in materials)
            {
                material.SetOverrideTag("RenderPlayer", "P");
            }
        }

        GameObject[] wList = GameObject.FindGameObjectsWithTag("W");
        foreach (var w in wList)
        {
            Material[] materials = w.GetComponent<Renderer>().materials;
            foreach (var material in materials)
            {
                material.SetOverrideTag("RenderPlayer", "W");
            }
        }
    }

    void OnDisable()
    {
        GetComponent<Camera>().ResetReplacementShader();
    }
}
