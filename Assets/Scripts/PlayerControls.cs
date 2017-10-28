using UnityEngine;
using System.Collections;

[CreateAssetMenu(fileName = "Data", menuName = "Controls/Player", order = 1)]
public class PlayerControls : ScriptableObject
{
    public int player = 0;
    public string horizontalAxis = "Axis 1";
    public string verticalAxis = "Axis 2";
    public string visionButton = "Axis 9";
    public string jumpButton = "Button 4";
    public bool buttonVision = false;
    public bool invertX = false;
    public bool invertY = false;
}