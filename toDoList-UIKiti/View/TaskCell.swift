//
//  TaskCell.swift
//  toDoList-UIKiti
//
//  Created by İlknur Tulgar on 28.11.2025.
//

import UIKit

class TaskCell: UITableViewCell {
    let icon = UIImageView()
    let taskLabel = UILabel()

    var toggleHandler: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(icon)
        contentView.addSubview(taskLabel)

        icon.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 22),
            icon.heightAnchor.constraint(equalToConstant: 22),

            taskLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12),
            taskLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])

        icon.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(iconTapped))
        icon.addGestureRecognizer(tap)
    }

    @objc private func iconTapped() {
        toggleHandler?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
