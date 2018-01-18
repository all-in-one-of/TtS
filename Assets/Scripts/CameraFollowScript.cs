using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollowScript : MonoBehaviour {

    [SerializeField]
    private GameObject player1;
    [SerializeField]
    private GameObject player2;

    private SingleCharaterController characterController1;
    private SingleCharaterController characterController2;

    [SerializeField]
    private Vector3 lowestCameraPoint = new Vector3(0, 50, 0);
    [SerializeField]
    private Vector3 highestCameraPoint = new Vector3(0, 70, 0);

    // Use this for initialization
    void Start () {
        characterController1 = player1.GetComponent<SingleCharaterController>();
        characterController2 = player2.GetComponent<SingleCharaterController>();
    }
	
	// Update is called once per frame
	void Update () {

        Vector3 point1, point2;
        if(characterController1.dead)
        {
            point1 = player2.transform.position;
            point2 = player2.transform.position;
        } else if (characterController2.dead)
        {
            point1 = player1.transform.position;
            point2 = player1.transform.position;
        } else
        {
            point1 = player1.transform.position;
            point2 = player2.transform.position;
        }

        float distance = (point1 - point2).magnitude;
        Vector3 midPoint = (point1 + point2) /2;
        Vector3 camPos = midPoint;

        if (distance < lowestCameraPoint.y)
            camPos = new Vector3(midPoint.x + lowestCameraPoint.x, lowestCameraPoint.y, midPoint.z + lowestCameraPoint.z);
        else if (distance > highestCameraPoint.y)
            camPos = new Vector3(midPoint.x + lowestCameraPoint.x, highestCameraPoint.y, midPoint.z + lowestCameraPoint.z);
        else
            camPos = new Vector3(midPoint.x + lowestCameraPoint.x, distance, midPoint.z + lowestCameraPoint.z);

        transform.position = Vector3.Lerp(transform.position, camPos, Time.deltaTime*2.0f);
        //transform.LookAt(midPoint);
    }
}
