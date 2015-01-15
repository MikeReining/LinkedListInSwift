// Started with a generic LinkedList implementation from link below and then implemented custom methods based on tasks assigned
// Source http://waynewbishop.com/swift/generics/#sthash.ztMiOVGT.dpuf

import UIKit

//generic linked list structure

class LLNode<T> {
    var key: T! = nil
    var next: LLNode? = nil
    var previous: LLNode? = nil
}

//generic linked list implementation
public class LinkedList<T: Equatable> {
    
    // create a new LLNode instance
    private var head: LLNode<T> = LLNode<T>()
    
    //MARK: TASK 2 List All Function
    func listAll() {
        println("---------TASK 2------------")
        println("PRINTING ALL ITEMS IN LIST")
        //establish the head node
        if (head.key == nil) {
            println("The List is Empty")
            return
        }
        
        //establish the trailer, current and new items
        var current: LLNode! = head
        
        //iterate through the list to print each item
        while (current != nil) {
            println("Link item is: \(current!.key!)")
            //iterate through to the next item
            current = current?.next
        } //end while
        
    }
    
    //MARK: TASK 3 Search Function: return index to the first list item with a specified value
    func findIndexForKey (searchForKey: T) -> Int? {
        println("---------TASK 3------------")
        //check if head node exists
        if (head.key == nil) {
            println("Nothing Found: LinkedList is Empty")
            return nil
        }
        var listIndex: Int = 0

        // check if value is at the head
        if head.key == searchForKey {
            println("Found value \(searchForKey) at index \(listIndex)")
            return listIndex
        }
        
        var current = head
        var previousNode = LLNode<T>()
        
        // If value found, exit the loop and print values
        while (current.next != nil) {
            if current.key == searchForKey {
                println("Found value \(searchForKey) at index \(listIndex)")
                return listIndex
            }
            previousNode = current
            current = current.next!
            listIndex += 1
        }
        
        return nil
    }
    
    //MARK: TASK 4 Insert Function
    //add generic nodes at index 0
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

linkedList.addLinkAtIndex(10, index: 0)
linkedList.addLinkAtIndex(20, index: 0)
linkedList.addLinkAtIndex(30, index: 0)

// TASK 2: Run List All Function

linkedList.listAll()

//MARK: TASK 3 Search Function: return index to the first list item with a specified value

linkedList.findIndexForKey(10)
linkedList.findIndexForKey(20)
linkedList.findIndexForKey(30)


let stringList = LinkedList<String>()

stringList.addLinkAtIndex("hello", index: 0)
stringList.addLinkAtIndex("hi", index: 0)
stringList.addLinkAtIndex("yes", index: 0)
stringList.addLinkAtIndex("tacos", index: 0)

stringList.listAll()

stringList.findIndexForKey("yes")
stringList.findIndexForKey("not in list")


