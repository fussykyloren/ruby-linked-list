require_relative "node.rb"

class LinkedList

    attr_accessor :size, :head, :tail
    def initialize
         @head = nil
         @tail = nil
         @size = 0
    end

    def append(value)
        node_to_add = Node.new(value)
        if @head.nil?
            @head = node_to_add
        else
            @tail.next_node = node_to_add
        end

        @tail = node_to_add
        @size += 1
    end

    def prepend(value)
        node_to_add = Node.new(value, @head)
        @head = node_to_add
        @size += 1
    end

    def size
        @size
    end

    def head
        @head
    end

    def tail
        @tail
    end

    def at(index)
        return @head if index == 0
        return nil if index > (@size - 1)
        check = @head
        i = index - 1
        i.times do 
            check = check.next_node
        end
        check
    end

    def pop
        if !head.next_node.nil?
            check = @head
            i = @size - 2
            i.times do
                check = check.next_node
            end
            check.next_node = nil
            @tail = check
            @size -= 1
        end
    end

    def contains?(value)
        check = @head
        @size.times do
            if check.value == value
                return true
            end
            check = check.next_node
        end
        return false
    end

    def find(value)
        if self.contains?(value)
            i = 0
            check = @head
            @size.times do
                i += 1
                if check.value == value
                    return i
                end
                check = check.next_node
            end
        else
            return -1
        end
    end

    def to_s
        check = @head
        str = ""
        @size.times do
            str += "( #{check.value} ) -> "
            check = check.next_node
        end
        str += "nil"
        str
    end

    def insert_at(value, index)
        return false if index > @size

        node_to_insert = Node.new(value)

        @tail = node_to_insert if index == @size

        if index == 1
            @size += 1
            node_to_insert = Node.new(value, @head)
            @head = node_to_insert
            return
        end

        check = @head
        (index - 2).times do 
            check = check.next_node
        end

        next_node = check.next_node
        check.next_node = node_to_insert
        node_to_insert.next_node = next_node
        @size += 1
    end

    def remove_at(index)
        return false if index > @size

        check = @head

        if index == 1
            @head = check.next_node
            @size -= 1
            return
        end

        (index - 2).times do
            check = check.next_node
        end

        next_next_node = check.next_node.next_node
        check.next_node = next_next_node

        @tail = check if index == @size
        @size -= 1
    end
end