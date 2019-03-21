// MainView.swift
// Copyright © 2019 Adrian Kashivskyy. All rights reserved.

import QuartzCore
import UIKit

/// Main view of the playground.
internal final class MainView: UIView {

    // MARK: Initializers

    /// Initialize an instance.
    internal init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    internal required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Hierarchy

    private lazy var comparisonView: ComparisonView = {
        with(ComparisonView()) {
            $0.layer.cornerRadius = 8
            $0.layer.masksToBounds = true
        }
    }()

    internal private(set) lazy var leftView: SightView = {
        SightView()
    }()

    internal private(set) lazy var rightView: SightView = {
        SightView()
    }()

    internal private(set) lazy var selectionView: SelectionView = {
        SelectionView()
    }()

    // MARK: Lifecycle

    /// Set up view hierarchy.
    private func setup() {

        backgroundColor = .black

        comparisonView.leftView = leftView
        comparisonView.rightView = rightView

        addSubview(comparisonView)
        addSubview(selectionView)

        comparisonView.translatesAutoresizingMaskIntoConstraints = false
        selectionView.translatesAutoresizingMaskIntoConstraints = false

        addConstraints([
            comparisonView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            comparisonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            comparisonView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            comparisonView.rightAnchor.constraint(equalTo: selectionView.leftAnchor, constant: -8),
        ])

        addConstraints([
            selectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            selectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            selectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
        ])

    }

}
