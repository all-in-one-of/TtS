using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConeCollisionInfo : MonoBehaviour {

    [SerializeField]
    private GameObject thisGameObject;

    public bool viewActive = false;

    private void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Player" && other.gameObject.name != thisGameObject.name)
        {
            SingleCharaterController singleCharaterController = other.gameObject.GetComponent<SingleCharaterController>();
            if (singleCharaterController && singleCharaterController.dead == true && viewActive == true)
                singleCharaterController.dead = false;
        }
    }
    
}
