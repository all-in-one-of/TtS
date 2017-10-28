using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollowScript : MonoBehaviour {

    [SerializeField]
    private Transform player1;
    [SerializeField]
    private Transform player2;

    private Vector3 trackDistance;
    // Use this for initialization
    void Start () {
        trackDistance = new Vector3(0, 40, 0);

    }
	
	// Update is called once per frame
	void Update () {
        float distance = (player1.position - player2.position).magnitude;
        Vector3 midPoint = (player1.position + player2.position) /2;
        float addDistance = 1;
        if (distance > 30)
            addDistance = 1 + (distance - 30) * 0.05f;

        if (distance > 50)
            addDistance = 1 + (50 - 30) * 0.05f;

        transform.position = midPoint + trackDistance * addDistance;

    }
}
