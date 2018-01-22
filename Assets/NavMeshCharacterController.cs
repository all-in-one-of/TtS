using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


[RequireComponent(typeof(NavMeshAgent))]
public class NavMeshCharacterController : MonoBehaviour
{
    private NavMeshAgent navMeshAgent;
	// Use this for initialization
	void Start ()
    {
        navMeshAgent = GetComponent<NavMeshAgent>();

    }
	
	// Update is called once per frame
	void Update ()
    {

        Vector3 movementDirection = new Vector3(Input.GetAxisRaw("HorizontalWASD"), 0, Input.GetAxisRaw("VerticalWASD"));


            navMeshAgent.SetDestination(transform.position + movementDirection.normalized * 1);
		
	}
}
