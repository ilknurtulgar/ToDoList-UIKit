//
//  TaskListViewController.swift
//  toDoList-UIKiti
//
//  Created by İlknur Tulgar on 26.11.2025.
//

import UIKit

class TaskListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    private let viewModel = TaskViewModel()
    
    private let tableView = UITableView()
    private let textField = UITextField()
    private let addButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ToDo List"
        
        setupTextFieldAndButton()
        setupTableView()
        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        
        tableView.reloadData()

    }
    
    private func setupTextFieldAndButton() {
        textField.placeholder = "New task added"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(10)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = .systemPink
        addButton.tintColor = .white
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: addButton.leadingAnchor,constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            addButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .systemBackground
        tableView.layer.cornerRadius = 10
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -20)
        ])
    }
    
    @objc private func addTask() {
        guard let text = textField.text, !text.isEmpty else { return }
        viewModel.addTask(title: text)
        textField.text = ""
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
           let task = viewModel.tasks[indexPath.row]

           cell.taskLabel.text = task.title
           cell.icon.image = UIImage(systemName: task.isDone ? "circle.inset.filled" : "circle")
           cell.icon.tintColor = .systemPink

           cell.toggleHandler = { [weak self] in
               guard let self = self else { return }
               let task = self.viewModel.tasks[indexPath.row]
               self.viewModel.toggleTask(task: task)
               tableView.reloadRows(at: [indexPath], with: .automatic)
           }

           return cell
       }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            viewModel.deleteTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.automatic)
        }
    }
    
}

extension UITextField{
    func setLeftPaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
