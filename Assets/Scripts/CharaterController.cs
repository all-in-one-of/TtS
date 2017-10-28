using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharaterController : MonoBehaviour {

    public PlayerControls playerControls;
    [SerializeField]
    private bool buttonJump = false;

    [Header("Movement variables")]
    [SerializeField]
    private float speed = 0.2f;
    [SerializeField]
    private float floorStickDistance = 1.0f;

    [SerializeField]
    private bool invertX = false;
    [SerializeField]
    private bool invertY = false;
    

    [Header("Jumping variables")]
    [SerializeField]
    private float gravity = 0.98f;
    
    private bool inAir = true;
    private Vector3 velocity;

    [SerializeField]
    private GameObject visionCone;
    [SerializeField]
    private GameObject visionCone2;

    // Use this for initialization
    void Start () {
        velocity = Vector3.zero;

    }
	
	// Update is called once per frame
	void Update () {
        float horizontal = Input.GetAxisRaw(playerControls.horizontalAxis);
        float vertical = Input.GetAxisRaw(playerControls.verticalAxis);

        if (invertY)
            vertical = -vertical;
        if (invertX)
            horizontal = -horizontal;

        bool usingVision;

        if (buttonJump)
            usingVision = Input.GetButton(playerControls.visionButton);
        else
        {
            if (Input.GetAxis(playerControls.visionButton) > 0.1f)
                usingVision = true;
            else
                usingVision = false;
        }
        
        RaycastHit raycastHitInfo;
        if(Physics.Raycast(transform.position + Vector3.up, Vector3.down, out raycastHitInfo, floorStickDistance))
        {
            transform.position = new Vector3(transform.position.x, raycastHitInfo.point.y, transform.position.z);
            inAir = false;
            velocity = Vector3.zero;
        } else
        {
            inAir = true;
        }

        if (inAir)
            velocity.y -= gravity;



        Vector3 movementVector = new Vector3(0, velocity.y, 0) * speed;
        Vector3 lookVector = new Vector3(horizontal, 0, vertical);

        if (usingVision && !inAir)
        {
            visionCone.SetActive(true);
            if (visionCone2 != null)
                visionCone2.SetActive(true);
        } else {
            movementVector = new Vector3(horizontal, velocity.y, vertical) * speed;
            visionCone.SetActive(false);
            if (visionCone2 != null)
                visionCone2.SetActive(false);
        }

        transform.position += movementVector;

        if (lookVector.magnitude > 0)
        {
            transform.rotation = Quaternion.LookRotation(lookVector, Vector3.up);
        }

    }
}
