# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Example
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    r = ListNode.new 0
    y = 0
    cur1 = l1
    cur2 = l2
    curr = r
    while curr do
        v1 = cur1.nil? ? 0 : cur1.val
        v2 = cur2.nil? ? 0 : cur2.val

        sum = v1 + v2 + y
        curr.val = sum % 10
        y = sum / 10

        cur1 = cur1.nil? ? nil : cur1.next
        cur2 = cur2.nil? ? nil : cur2.next

        if cur1 || cur2 || y > 0
            curr.next = ListNode.new 0
            curr = curr.next
        else
            curr = nil
        end
    end

    return r
end
