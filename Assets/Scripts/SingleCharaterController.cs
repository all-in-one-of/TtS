using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SingleCharaterController : MonoBehaviour {

    private Vector3 startPosition;

    public PlayerControls playerControls;

    [Header("Movement variables")]
    [SerializeField]
    private float speed = 0.2f;
    [SerializeField]
    private float floorStickDistance = 1.0f;

    [Header("Jumping variables")]
    [SerializeField]
    private float gravity = 0.98f;
    
    private bool inAir = true;
    private Vector3 velocity;

    [SerializeField]
    private GameObject visionConeContainer;

    [SerializeField]
    private GameObject visionCone;
    [SerializeField]
    private GameObject visionCone2;
    
    private Vector3 lastLivingPoint;

    [SerializeField]
    private GameObject playerModel;
    [SerializeField]
    private GameObject deathEffect;

    [HideInInspector]
    public bool dead = false;

    [SerializeField]
    private LayerMask collisionMask;
    [SerializeField]
    private ConeCollisionInfo collisionInfo;

    // Use this for initialization
    void Start () {
        velocity = Vector3.zero;
        lastLivingPoint = transform.position;
        dead = false;
        startPosition = transform.position;
    }
	
	// Update is called once per frame
	void Update () {

        if(Input.GetKeyDown(KeyCode.Escape))
        {
            returnToMenu();
        }
        if(Input.GetKeyDown(KeyCode.R))
        {
            restartCurrentScene();
        }

        if (dead) {
            playerModel.SetActive(false);
            deathEffect.SetActive(true);

            visionConeContainer.SetActive(false);

        } else {

            playerModel.SetActive(true);
            deathEffect.SetActive(false);

            visionConeContainer.SetActive(true);

            float horizontal = Input.GetAxisRaw(playerControls.horizontalAxis);
            float vertical = Input.GetAxisRaw(playerControls.verticalAxis);

            if (playerControls.invertY)
                vertical = -vertical;
            if (playerControls.invertX)
                horizontal = -horizontal;

            bool usingVision;

            if (playerControls.buttonVision)
                usingVision = Input.GetButton(playerControls.visionButton);
            else
            {
                if (Input.GetAxis(playerControls.visionButton) > 0.1f)
                    usingVision = true;
                else
                    usingVision = false;
            }

            /* Raycast downwards */


            RaycastHit raycastHitInfo;
            float raycastDistance = floorStickDistance - velocity.y;
            if (Physics.Raycast(transform.position + Vector3.up * raycastDistance / 2f, Vector3.down, out raycastHitInfo, raycastDistance, collisionMask))
            {
                transform.position = new Vector3(transform.position.x, raycastHitInfo.point.y, transform.position.z);
                inAir = false;
                velocity = Vector3.zero;
                if (raycastHitInfo.collider.gameObject.tag == "DeathZone")
                {
                    dead = true;
                    transform.position = lastLivingPoint+Vector3.up*2.0f;
                }
                else
                {
                    lastLivingPoint = transform.position;
                }
            }
            else
            {
                inAir = true;
            }

            if (inAir)
                velocity.y -= gravity;




            Vector3 movementVector = new Vector3(0, velocity.y, 0) * speed;
            Vector3 lookVector = new Vector3(horizontal, 0, vertical);

            collisionInfo.viewActive = false;

            if (usingVision && !inAir)
            {
                visionCone.SetActive(true);
                if (visionCone2 != null)
                    visionCone2.SetActive(true);

                collisionInfo.viewActive = true;
            }
            else
            {
                movementVector = new Vector3(horizontal, velocity.y, vertical) * speed;
                visionCone.SetActive(false);
                if (visionCone2 != null)
                    visionCone2.SetActive(false);
            }
        
            /* Raycast forwards */

            /*
            if (Physics.Raycast(transform.position + Vector3.up, movementVector, out raycastHitInfo, floorStickDistance))
            {
                transform.position = new Vector3(transform.position.x, raycastHitInfo.point.y, transform.position.z);
                inAir = false;
                velocity = Vector3.zero;
            }
            else
            {
                inAir = true;
            }
            */

            transform.position += movementVector;

            if (lookVector.magnitude > 0)
            {
                transform.rotation = Quaternion.LookRotation(lookVector, Vector3.up);
            }
        }

    }

    public void restartCurrentScene()
    {
        /*
        int scene = SceneManager.GetActiveScene().buildIndex;
        SceneManager.LoadScene(scene, LoadSceneMode.Single);
        */
        transform.position = startPosition;
        dead = false;
    }

    public void returnToMenu()
    {
        SceneManager.LoadScene(0);
    }

}

