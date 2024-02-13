//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TodoList {
    struct Todo {
        uint256 id;
        string task;
        bool undone;
    }

    uint256 TodoCount;

    Todo[] public todos;

    function addTodo(string memory _task) external {
        TodoCount++;
        Todo memory newTodo = Todo(TodoCount, _task, false);
        todos.push(newTodo);
    }

    function getTodoList() external view returns (Todo[] memory) {
        return todos;
    }

    enum Status {
        done,
        undone
    }

    function TodoStatus(uint256 _id) external {
        Todo storage todo = todos[_id];
        todo.undone = !todo.undone;
    }

    function deleteTodo(uint256 index) external {
        require(index < todos.length, "Index out of bounds");

        for (uint256 i = index; i < todos.length - 1; i++) {
            todos[i] = todos[i + 1];
        }

        todos.pop();
    }
}
