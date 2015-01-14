// Started with a generic LinkedList implementation from link below and then implemented custom methods based on tasks assigned
// Source http://waynewbishop.com/swift/generics/#sthash.ztMiOVGT.dpuf

import UIKit

//generic linked list structure

class LLNode<T> {
    var key: T? = nil
    var next: LLNode? = nil
    var previous: LLNode? = nil
}

//generic linked list implementation
public class LinkedList<T: Equatable> {
    private var head: LLNode<T> = LLNode<T>()
    
    //MARK: TASK 2 List All Function
    func listAll() {
        //establish the head node
        if (head.key == nil) {
            println("The List is Empty")
            return
        }
        
        //establish the trailer, current and new items
        var current: LLNode<T>? = head
        var trailer: LLNode<T>? = nil
        var listIndex: Int = 0
        
        //iterate through the list to print each item
        while (current != nil) {
            println("\(current!.key!)")
            //iterate through to the next item
            trailer = current
            current = current?.next
            listIndex += 1
        } //end while
        
    }
    
    //MARK: TASK 3 Search Function
    func findIndexForKey (searchFor: LLNode<T>) -> Int? {
        //establish the head node
        if (head.key == nil) {
            println("Nothing Found: LinkedList is Empty")
            return nil
        }
        
        //establish the trailer, current and new items
        var current: LLNode<T>? = head
        var trailer: LLNode<T>? = nil
        var listIndex: Int = 0
        
        //iterate through the list to search for item
        while (current != nil) {
            if current!.key == searchFor.key {
                println("Found item at index: \(listIndex)")
            }
            println("\(current!.key!)")
            //iterate through to the next item
            trailer = current
            current = current?.next
            listIndex += 1
        } //end while
        
        return 1
    }
    
    
    //MARK: TASK 4 Insert Function
    //add generic nodes at a specified index
    func addLinkAtIndex(key: T, index: Int) {
        
        //establish the head node
        if (head.key == nil) { head.key = key; return; }
        
        //establish the trailer, current and new items
        var current: LLNode<T>? = head
        var trailer: LLNode<T>? = nil
        var listIndex: Int = 0
        
        //iterate through the list to find the insertion point
        while (current != nil) {
            if (index == listIndex) {
                var childToUse: LLNode = LLNode<T>()
                
                //create the new node
                childToUse.key = key;
                
                //connect the node infront of the current node
                childToUse.next = current
                childToUse.previous = trailer
                
                //use optional binding for ading the trailer
                if let linktrailer = trailer {
                    linktrailer.next = childToUse
                    childToUse.previous = linktrailer }
                
                //point new node to the current / previous
                current!.previous = childToUse
                
                //replace the head node if required
                if (index == 0) {
                    head = childToUse
                }
                break
            } //end if
            
            //iterate through to the next item
            trailer = current
            current = current?.next
            listIndex += 1
        } //end while
    }
}

// MARK: Run Methods for Linked List Class

// Setup instance of Linked List

let linkedList = LinkedList () as LinkedList<Int>

// TASK 4: Insert items into linked list object

linkedList.addLinkAtIndex(1, index: 0)
linkedList.addLinkAtIndex(10, index: 0)

// TASK 2: Run List All Function

let myLLNode = LLNode

linkedList.listAll()


