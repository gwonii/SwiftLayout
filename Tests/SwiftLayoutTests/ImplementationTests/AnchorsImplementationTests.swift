//
//  AnchorsImplementationTests.swift
//  
//
//  Created by aiden_h on 2022/04/03.
//

import XCTest
@testable import SwiftLayout

final class AnchorsImplementationTests: XCTestCase {
    var superview: UIView = UIView()
    var subview: UIView = UIView()
    var siblingview: UIView = UIView()
    
    var tags: [UIView: String] {
        [
            superview: "superview",
            subview: "subview",
            siblingview: "siblingview"
        ]
    }
    
    override func setUp() {
        superview = UIView()
        subview = UIView()
        siblingview = UIView()
    }
    
    override func tearDown() {
    }
}

// MARK: - Attribute
extension AnchorsImplementationTests {
    func testAttributes() {
        XCTAssertEqual(AnchorsXAxisAttribute.left.attribute, .left)
        XCTAssertEqual(AnchorsXAxisAttribute.right.attribute, .right)
        XCTAssertEqual(AnchorsXAxisAttribute.leading.attribute, .leading)
        XCTAssertEqual(AnchorsXAxisAttribute.trailing.attribute, .trailing)
        XCTAssertEqual(AnchorsXAxisAttribute.centerX.attribute, .centerX)
        XCTAssertEqual(AnchorsXAxisAttribute.leftMargin.attribute, .leftMargin)
        XCTAssertEqual(AnchorsXAxisAttribute.rightMargin.attribute, .rightMargin)
        XCTAssertEqual(AnchorsXAxisAttribute.leadingMargin.attribute, .leadingMargin)
        XCTAssertEqual(AnchorsXAxisAttribute.trailingMargin.attribute, .trailingMargin)
        XCTAssertEqual(AnchorsXAxisAttribute.centerXWithinMargins.attribute, .centerXWithinMargins)
        
        XCTAssertEqual(AnchorsYAxisAttribute.top.attribute, .top)
        XCTAssertEqual(AnchorsYAxisAttribute.bottom.attribute, .bottom)
        XCTAssertEqual(AnchorsYAxisAttribute.centerY.attribute, .centerY)
        XCTAssertEqual(AnchorsYAxisAttribute.lastBaseline.attribute, .lastBaseline)
        XCTAssertEqual(AnchorsYAxisAttribute.firstBaseline.attribute, .firstBaseline)
        XCTAssertEqual(AnchorsYAxisAttribute.topMargin.attribute, .topMargin)
        XCTAssertEqual(AnchorsYAxisAttribute.bottomMargin.attribute, .bottomMargin)
        XCTAssertEqual(AnchorsYAxisAttribute.centerYWithinMargins.attribute, .centerYWithinMargins)
        
        XCTAssertEqual(AnchorsDimensionAttribute.width.attribute, .width)
        XCTAssertEqual(AnchorsDimensionAttribute.height.attribute, .height)
        
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .left), .left)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .right), .right)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .leading), .leading)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .trailing), .trailing)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .centerX), .centerX)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .leftMargin), .leftMargin)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .rightMargin), .rightMargin)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .leadingMargin), .leadingMargin)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .trailingMargin), .trailingMargin)
        XCTAssertEqual(AnchorsXAxisAttribute(attribute: .centerXWithinMargins), .centerXWithinMargins)
        
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .top), .top)
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .bottom), .bottom)
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .centerY), .centerY)
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .lastBaseline), .lastBaseline)
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .firstBaseline), .firstBaseline)
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .topMargin), .topMargin)
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .bottomMargin), .bottomMargin)
        XCTAssertEqual(AnchorsYAxisAttribute(attribute: .centerYWithinMargins), .centerYWithinMargins)
        
        XCTAssertEqual(AnchorsDimensionAttribute(attribute: .width), .width)
        XCTAssertEqual(AnchorsDimensionAttribute(attribute: .height), .height)
    }
}

// MARK: - Expression
extension AnchorsImplementationTests {
    func testExpressionXAxisConstraints() {
        let constant: CGFloat = 11.0
        func toAttribute(attribute: AnchorsXAxisAttribute) -> AnchorsXAxisAttribute {
            switch attribute {
            case .left, .right, .leftMargin, .rightMargin:
                return .left
            default:
                return .leading
            }
        }
        
        @AnchorsBuilder
        func anchors(attribute: AnchorsXAxisAttribute) -> Anchors {
            AnchorsExpression(xAxis: attribute)
            
            AnchorsExpression(xAxis: attribute).equalToSuper()
            AnchorsExpression(xAxis: attribute).equalToSuper(attribute: toAttribute(attribute: attribute))
            AnchorsExpression(xAxis: attribute).equalToSuper(attribute: toAttribute(attribute: attribute), constant: constant)
            AnchorsExpression(xAxis: attribute).equalToSuper(attribute: toAttribute(attribute: attribute), inwardOffset: constant)
            
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualToSuper()
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualToSuper(attribute: toAttribute(attribute: attribute))
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualToSuper(attribute: toAttribute(attribute: attribute), constant: constant)
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualToSuper(attribute: toAttribute(attribute: attribute), inwardOffset: constant)
            
            AnchorsExpression(xAxis: attribute).lessThanOrEqualToSuper()
            AnchorsExpression(xAxis: attribute).lessThanOrEqualToSuper(attribute: toAttribute(attribute: attribute))
            AnchorsExpression(xAxis: attribute).lessThanOrEqualToSuper(attribute: toAttribute(attribute: attribute), constant: constant)
            AnchorsExpression(xAxis: attribute).lessThanOrEqualToSuper(attribute: toAttribute(attribute: attribute), inwardOffset: constant)
            
            AnchorsExpression(xAxis: attribute).equalTo(siblingview)
            AnchorsExpression(xAxis: attribute).equalTo(siblingview, attribute: toAttribute(attribute: attribute))
            AnchorsExpression(xAxis: attribute).equalTo(siblingview, attribute: toAttribute(attribute: attribute), constant: constant)
            AnchorsExpression(xAxis: attribute).equalTo(siblingview, attribute: toAttribute(attribute: attribute), inwardOffset: constant)
            
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualTo(siblingview)
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualTo(siblingview, attribute: toAttribute(attribute: attribute))
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualTo(siblingview, attribute: toAttribute(attribute: attribute), constant: constant)
            AnchorsExpression(xAxis: attribute).greaterThanOrEqualTo(siblingview, attribute: toAttribute(attribute: attribute), inwardOffset: constant)
            
            AnchorsExpression(xAxis: attribute).lessThanOrEqualTo(siblingview)
            AnchorsExpression(xAxis: attribute).lessThanOrEqualTo(siblingview, attribute: toAttribute(attribute: attribute))
            AnchorsExpression(xAxis: attribute).lessThanOrEqualTo(siblingview, attribute: toAttribute(attribute: attribute), constant: constant)
            AnchorsExpression(xAxis: attribute).lessThanOrEqualTo(siblingview, attribute: toAttribute(attribute: attribute), inwardOffset: constant)
            
            switch attribute {
            case .left, .right, .leftMargin, .rightMargin:
                AnchorsExpression(xAxis: attribute)
            default:
                AnchorsExpression(xAxis: attribute).equalTo(siblingview.leadingAnchor)
                AnchorsExpression(xAxis: attribute).equalTo(siblingview.leadingAnchor, constant: constant)
                AnchorsExpression(xAxis: attribute).equalTo(siblingview.leadingAnchor, inwardOffset: constant)
                AnchorsExpression(xAxis: attribute).greaterThanOrEqualTo(siblingview.leadingAnchor)
                AnchorsExpression(xAxis: attribute).greaterThanOrEqualTo(siblingview.leadingAnchor, constant: constant)
                AnchorsExpression(xAxis: attribute).greaterThanOrEqualTo(siblingview.leadingAnchor, inwardOffset: constant)
                AnchorsExpression(xAxis: attribute).lessThanOrEqualTo(siblingview.leadingAnchor)
                AnchorsExpression(xAxis: attribute).lessThanOrEqualTo(siblingview.leadingAnchor, constant: constant)
                AnchorsExpression(xAxis: attribute).lessThanOrEqualTo(siblingview.leadingAnchor, inwardOffset: constant)
            }
        }
        
        for attribute in AnchorsXAxisAttribute.allCases {
            context("testExpressionXAxisConstraints \(attribute)") {
                let constrints = anchors(attribute: attribute).constraints(item: subview, toItem: superview)
                var expected = [
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),

                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: toAttribute(attribute: attribute).attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                ]
                
                switch attribute {
                case .left, .right, .leftMargin, .rightMargin:
                    expected += [
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    ]
                default:
                    expected += [
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: constant),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: constant),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: constant),
                        NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    ]
                }
                
                SLTAssertConstraintsEqual(constrints, expected, tags)
            }
        }
    }
    
    func testExpressionYAxisConstraints() {
        let constant: CGFloat = 11.0

        @AnchorsBuilder
        func anchors(attribute: AnchorsYAxisAttribute) -> Anchors {
            AnchorsExpression(yAxis: attribute)
            
            AnchorsExpression(yAxis: attribute).equalToSuper()
            AnchorsExpression(yAxis: attribute).equalToSuper(attribute: .top)
            AnchorsExpression(yAxis: attribute).equalToSuper(attribute: .top, constant: constant)
            AnchorsExpression(yAxis: attribute).equalToSuper(attribute: .top, inwardOffset: constant)
            
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualToSuper()
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualToSuper(attribute: .top)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualToSuper(attribute: .top, constant: constant)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualToSuper(attribute: .top, inwardOffset: constant)
            
            AnchorsExpression(yAxis: attribute).lessThanOrEqualToSuper()
            AnchorsExpression(yAxis: attribute).lessThanOrEqualToSuper(attribute: .top)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualToSuper(attribute: .top, constant: constant)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualToSuper(attribute: .top, inwardOffset: constant)
            
            AnchorsExpression(yAxis: attribute).equalTo(siblingview)
            AnchorsExpression(yAxis: attribute).equalTo(siblingview, attribute: .top)
            AnchorsExpression(yAxis: attribute).equalTo(siblingview, attribute: .top, constant: constant)
            AnchorsExpression(yAxis: attribute).equalTo(siblingview, attribute: .top, inwardOffset: constant)
            
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualTo(siblingview)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualTo(siblingview, attribute: .top)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualTo(siblingview, attribute: .top, constant: constant)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualTo(siblingview, attribute: .top, inwardOffset: constant)
            
            AnchorsExpression(yAxis: attribute).lessThanOrEqualTo(siblingview)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualTo(siblingview, attribute: .top)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualTo(siblingview, attribute: .top, constant: constant)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualTo(siblingview, attribute: .top, inwardOffset: constant)
            
            AnchorsExpression(yAxis: attribute).equalTo(siblingview.topAnchor)
            AnchorsExpression(yAxis: attribute).equalTo(siblingview.topAnchor, constant: constant)
            AnchorsExpression(yAxis: attribute).equalTo(siblingview.topAnchor, inwardOffset: constant)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualTo(siblingview.topAnchor)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualTo(siblingview.topAnchor, constant: constant)
            AnchorsExpression(yAxis: attribute).greaterThanOrEqualTo(siblingview.topAnchor, inwardOffset: constant)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualTo(siblingview.topAnchor)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualTo(siblingview.topAnchor, constant: constant)
            AnchorsExpression(yAxis: attribute).lessThanOrEqualTo(siblingview.topAnchor, inwardOffset: constant)
        }
        
        for attribute in AnchorsYAxisAttribute.allCases {
            context("testExpressionYAxisConstraints \(attribute)") {
                let constraints = anchors(attribute: attribute).constraints(item: subview, toItem: superview)
                let expected = [
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
                ]
                
                SLTAssertConstraintsEqual(constraints, expected, tags)
            }
        }
    }
    
    func testExpressionDimensionConstraints() {
        let constant: CGFloat = 11.0
        
        @AnchorsBuilder
        func anchors(attribute: AnchorsDimensionAttribute) -> Anchors {
            AnchorsExpression(dimensions: attribute)

            AnchorsExpression(dimensions: attribute).equalToSuper()
            AnchorsExpression(dimensions: attribute).equalToSuper(attribute: .width)
            AnchorsExpression(dimensions: attribute).equalToSuper(attribute: .width, constant: constant)

            AnchorsExpression(dimensions: attribute).greaterThanOrEqualToSuper()
            AnchorsExpression(dimensions: attribute).greaterThanOrEqualToSuper(attribute: .width)
            AnchorsExpression(dimensions: attribute).greaterThanOrEqualToSuper(attribute: .width, constant: constant)

            AnchorsExpression(dimensions: attribute).lessThanOrEqualToSuper()
            AnchorsExpression(dimensions: attribute).lessThanOrEqualToSuper(attribute: .width)
            AnchorsExpression(dimensions: attribute).lessThanOrEqualToSuper(attribute: .width, constant: constant)

            AnchorsExpression(dimensions: attribute).equalTo(siblingview)
            AnchorsExpression(dimensions: attribute).equalTo(siblingview, attribute: .width)
            AnchorsExpression(dimensions: attribute).equalTo(siblingview, attribute: .width, constant: constant)

            AnchorsExpression(dimensions: attribute).greaterThanOrEqualTo(siblingview)
            AnchorsExpression(dimensions: attribute).greaterThanOrEqualTo(siblingview, attribute: .width)
            AnchorsExpression(dimensions: attribute).greaterThanOrEqualTo(siblingview, attribute: .width, constant: constant)

            AnchorsExpression(dimensions: attribute).lessThanOrEqualTo(siblingview)
            AnchorsExpression(dimensions: attribute).lessThanOrEqualTo(siblingview, attribute: .width)
            AnchorsExpression(dimensions: attribute).lessThanOrEqualTo(siblingview, attribute: .width, constant: constant)
            
            AnchorsExpression(dimensions: attribute).equalTo(constant: constant)
            AnchorsExpression(dimensions: attribute).greaterThanOrEqualTo(constant: constant)
            AnchorsExpression(dimensions: attribute).lessThanOrEqualTo(constant: constant)
            
            AnchorsExpression(dimensions: attribute).equalTo(siblingview.widthAnchor)
            AnchorsExpression(dimensions: attribute).equalTo(siblingview.widthAnchor, constant: constant)
            AnchorsExpression(dimensions: attribute).greaterThanOrEqualTo(siblingview.widthAnchor)
            AnchorsExpression(dimensions: attribute).greaterThanOrEqualTo(siblingview.widthAnchor, constant: constant)
            AnchorsExpression(dimensions: attribute).lessThanOrEqualTo(siblingview.widthAnchor)
            AnchorsExpression(dimensions: attribute).lessThanOrEqualTo(siblingview.widthAnchor, constant: constant)
        }

        for attribute in AnchorsDimensionAttribute.allCases {
            context("testExpressionDimensionConstraints \(attribute)") {
                let constraints = anchors(attribute: attribute).constraints(item: subview, toItem: superview)
                let expected = [
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),

                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: constant),

                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: .width, multiplier: 1.0, constant: constant),

                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: .width, multiplier: 1.0, constant: constant),

                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: constant),

                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: constant),

                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: constant),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: constant),
                    
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: constant),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: constant),
                ]

                SLTAssertConstraintsEqual(constraints, expected, tags)
            }
        }
    }
    
    func testExpressionConstantAndMultiplier() {
        let constant: CGFloat = 11.0
        let multiplier: CGFloat = 0.5
        
        @AnchorsBuilder
        var anchors: Anchors {
            AnchorsExpression(xAxis: .leading).equalToSuper(attribute: .trailing, constant: constant)
            AnchorsExpression(xAxis: .leading).equalToSuper(attribute: .trailing, constant: constant).multiplier(multiplier)
            AnchorsExpression(xAxis: .leading).equalTo(siblingview, attribute: .trailing, constant: constant)
            AnchorsExpression(xAxis: .leading).equalTo(siblingview, attribute: .trailing, constant: constant).multiplier(multiplier)
            
            AnchorsExpression(yAxis: .top).equalToSuper(attribute: .bottom, constant: constant)
            AnchorsExpression(yAxis: .top).equalToSuper(attribute: .bottom, constant: constant).multiplier(multiplier)
            AnchorsExpression(yAxis: .top).equalTo(siblingview, attribute: .bottom, constant: constant)
            AnchorsExpression(yAxis: .top).equalTo(siblingview, attribute: .bottom, constant: constant).multiplier(multiplier)
            
            AnchorsExpression(dimensions: .width).equalTo(constant: constant)
            AnchorsExpression(dimensions: .width).equalTo(constant: constant).multiplier(multiplier)
            AnchorsExpression(dimensions: .width).equalToSuper(attribute: .height, constant: constant)
            AnchorsExpression(dimensions: .width).equalToSuper(attribute: .height, constant: constant).multiplier(multiplier)
            AnchorsExpression(dimensions: .width).equalTo(siblingview, attribute: .height, constant: constant)
            AnchorsExpression(dimensions: .width).equalTo(siblingview, attribute: .height, constant: constant).multiplier(multiplier)
        }
        
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: multiplier, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: multiplier, constant: constant),
            
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: multiplier, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: multiplier, constant: constant),
            
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: multiplier, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: multiplier, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: siblingview, attribute: .height, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: siblingview, attribute: .height, multiplier: multiplier, constant: constant),
        ]

        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testExpressionConstantAndPriority() {
        let constant: CGFloat = 11.0
        let priority: UILayoutPriority = .defaultLow
        
        @AnchorsBuilder
        var anchors: Anchors {
            AnchorsExpression(xAxis: .leading).equalToSuper(attribute: .trailing, constant: constant)
            AnchorsExpression(xAxis: .leading).equalToSuper(attribute: .trailing, constant: constant).priority(priority)
            AnchorsExpression(xAxis: .leading).equalTo(siblingview, attribute: .trailing, constant: constant)
            AnchorsExpression(xAxis: .leading).equalTo(siblingview, attribute: .trailing, constant: constant).priority(priority)
            
            AnchorsExpression(yAxis: .top).equalToSuper(attribute: .bottom, constant: constant)
            AnchorsExpression(yAxis: .top).equalToSuper(attribute: .bottom, constant: constant).priority(priority)
            AnchorsExpression(yAxis: .top).equalTo(siblingview, attribute: .bottom, constant: constant)
            AnchorsExpression(yAxis: .top).equalTo(siblingview, attribute: .bottom, constant: constant).priority(priority)
            
            AnchorsExpression(dimensions: .width).equalTo(constant: constant)
            AnchorsExpression(dimensions: .width).equalTo(constant: constant).priority(priority)
            AnchorsExpression(dimensions: .width).equalToSuper(attribute: .height, constant: constant)
            AnchorsExpression(dimensions: .width).equalToSuper(attribute: .height, constant: constant).priority(priority)
            AnchorsExpression(dimensions: .width).equalTo(siblingview, attribute: .height, constant: constant)
            AnchorsExpression(dimensions: .width).equalTo(siblingview, attribute: .height, constant: constant).priority(priority)
        }
        
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: constant),

            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: constant),

            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1.0, constant: constant),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: siblingview, attribute: .height, multiplier: 1.0, constant: constant),
        ].flatMap { constraint -> [NSLayoutConstraint] in
            let priorityed = NSLayoutConstraint(
                item: constraint.firstItem!, attribute: constraint.firstAttribute,
                relatedBy: constraint.relation,
                toItem: constraint.secondItem, attribute: constraint.secondAttribute,
                multiplier: constraint.multiplier, constant: constraint.constant
            )
            priorityed.priority = priority
            return [constraint, priorityed]
        }

        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testExpressionChaining() {
        context("testExpressionChaining xAxis") {
            @AnchorsBuilder
            var anchors: Anchors {
                AnchorsExpression<AnchorsXAxisAttribute>().centerX.leading.trailing.left.right.centerXWithinMargins.leftMargin.rightMargin.leadingMargin.trailingMargin
            }
            let constraints = anchors.constraints(item: subview, toItem: superview)
            let expected = [
                NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leftMargin, relatedBy: .equal, toItem: superview, attribute: .leftMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .rightMargin, relatedBy: .equal, toItem: superview, attribute: .rightMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leadingMargin, relatedBy: .equal, toItem: superview, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .trailingMargin, relatedBy: .equal, toItem: superview, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0),
            ]
            
            SLTAssertConstraintsEqual(constraints, expected, tags)
        }
        
        context("testExpressionChaining yAxis") {
            @AnchorsBuilder
            var anchors: Anchors {
                AnchorsExpression<AnchorsYAxisAttribute>().centerY.top.bottom.firstBaseline.lastBaseline.centerYWithinMargins.topMargin.bottomMargin
                
                
            }
            let constraints = anchors.constraints(item: subview, toItem: superview)
            let expected = [
                NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .firstBaseline, relatedBy: .equal, toItem: superview, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .lastBaseline, relatedBy: .equal, toItem: superview, attribute: .lastBaseline, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .topMargin, relatedBy: .equal, toItem: superview, attribute: .topMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .bottomMargin, relatedBy: .equal, toItem: superview, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0),
            ]
            
            SLTAssertConstraintsEqual(constraints, expected, tags)
        }
        
        context("testExpressionChaining dimension") {
            @AnchorsBuilder
            var anchors: Anchors {
                AnchorsExpression<AnchorsDimensionAttribute>().height.width
            }
            let constraints = anchors.constraints(item: subview, toItem: superview)
            let expected = [
                NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),

            ]

            SLTAssertConstraintsEqual(constraints, expected, tags)
        }

    }

    func testMixedExpressionFromAnchorsExpression() {
        context("testMixExpression from xAxis") {
            @AnchorsBuilder
            var anchors: Anchors {
                AnchorsExpression<AnchorsXAxisAttribute>().centerY
                AnchorsExpression<AnchorsXAxisAttribute>().top
                AnchorsExpression<AnchorsXAxisAttribute>().bottom
                AnchorsExpression<AnchorsXAxisAttribute>().firstBaseline
                AnchorsExpression<AnchorsXAxisAttribute>().lastBaseline
                AnchorsExpression<AnchorsXAxisAttribute>().centerYWithinMargins
                AnchorsExpression<AnchorsXAxisAttribute>().topMargin
                AnchorsExpression<AnchorsXAxisAttribute>().bottomMargin
                AnchorsExpression<AnchorsXAxisAttribute>().height
                AnchorsExpression<AnchorsXAxisAttribute>().width
            }
            let constraints = anchors.constraints(item: subview, toItem: superview)
            let expected = [
                NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .firstBaseline, relatedBy: .equal, toItem: superview, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .lastBaseline, relatedBy: .equal, toItem: superview, attribute: .lastBaseline, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .topMargin, relatedBy: .equal, toItem: superview, attribute: .topMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .bottomMargin, relatedBy: .equal, toItem: superview, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),
            ]

            SLTAssertConstraintsEqual(constraints, expected, tags)
        }

        context("testMixExpression from yAxis") {
            @AnchorsBuilder
            var anchors: Anchors {
                AnchorsExpression<AnchorsYAxisAttribute>().centerX
                AnchorsExpression<AnchorsYAxisAttribute>().leading
                AnchorsExpression<AnchorsYAxisAttribute>().trailing
                AnchorsExpression<AnchorsYAxisAttribute>().left
                AnchorsExpression<AnchorsYAxisAttribute>().right
                AnchorsExpression<AnchorsYAxisAttribute>().centerXWithinMargins
                AnchorsExpression<AnchorsYAxisAttribute>().leftMargin
                AnchorsExpression<AnchorsYAxisAttribute>().rightMargin
                AnchorsExpression<AnchorsYAxisAttribute>().leadingMargin
                AnchorsExpression<AnchorsYAxisAttribute>().trailingMargin
                AnchorsExpression<AnchorsYAxisAttribute>().height
                AnchorsExpression<AnchorsYAxisAttribute>().width
            }
            let constraints = anchors.constraints(item: subview, toItem: superview)
            let expected = [
                NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leftMargin, relatedBy: .equal, toItem: superview, attribute: .leftMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .rightMargin, relatedBy: .equal, toItem: superview, attribute: .rightMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leadingMargin, relatedBy: .equal, toItem: superview, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .trailingMargin, relatedBy: .equal, toItem: superview, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),
            ]

            SLTAssertConstraintsEqual(constraints, expected, tags)
        }

        context("testMixExpression from dimension") {
            @AnchorsBuilder
            var anchors: Anchors {
                AnchorsExpression<AnchorsDimensionAttribute>().centerX
                AnchorsExpression<AnchorsDimensionAttribute>().leading
                AnchorsExpression<AnchorsDimensionAttribute>().trailing
                AnchorsExpression<AnchorsDimensionAttribute>().left
                AnchorsExpression<AnchorsDimensionAttribute>().right
                AnchorsExpression<AnchorsDimensionAttribute>().centerXWithinMargins
                AnchorsExpression<AnchorsDimensionAttribute>().leftMargin
                AnchorsExpression<AnchorsDimensionAttribute>().rightMargin
                AnchorsExpression<AnchorsDimensionAttribute>().leadingMargin
                AnchorsExpression<AnchorsDimensionAttribute>().trailingMargin
                AnchorsExpression<AnchorsDimensionAttribute>().centerY
                AnchorsExpression<AnchorsDimensionAttribute>().top
                AnchorsExpression<AnchorsDimensionAttribute>().bottom
                AnchorsExpression<AnchorsDimensionAttribute>().firstBaseline
                AnchorsExpression<AnchorsDimensionAttribute>().lastBaseline
                AnchorsExpression<AnchorsDimensionAttribute>().centerYWithinMargins
                AnchorsExpression<AnchorsDimensionAttribute>().topMargin
                AnchorsExpression<AnchorsDimensionAttribute>().bottomMargin
            }
            let constraints = anchors.constraints(item: subview, toItem: superview)
            let expected = [
                NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leftMargin, relatedBy: .equal, toItem: superview, attribute: .leftMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .rightMargin, relatedBy: .equal, toItem: superview, attribute: .rightMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .leadingMargin, relatedBy: .equal, toItem: superview, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .trailingMargin, relatedBy: .equal, toItem: superview, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .firstBaseline, relatedBy: .equal, toItem: superview, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .lastBaseline, relatedBy: .equal, toItem: superview, attribute: .lastBaseline, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .topMargin, relatedBy: .equal, toItem: superview, attribute: .topMargin, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: .bottomMargin, relatedBy: .equal, toItem: superview, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0),
            ]

            SLTAssertConstraintsEqual(constraints, expected, tags)
        }
    }

    func testMixedExpressionConstraints() {
        let constant: CGFloat = 11.0
        let attributes: [any AnchorsAttribute] = [
            AnchorsXAxisAttribute.centerX,
            AnchorsXAxisAttribute.leading,
            AnchorsXAxisAttribute.trailing,
            AnchorsXAxisAttribute.left,
            AnchorsXAxisAttribute.right,
            AnchorsXAxisAttribute.centerXWithinMargins,
            AnchorsXAxisAttribute.leftMargin,
            AnchorsXAxisAttribute.rightMargin,
            AnchorsXAxisAttribute.leadingMargin,
            AnchorsXAxisAttribute.trailingMargin,
            AnchorsYAxisAttribute.centerY,
            AnchorsYAxisAttribute.top,
            AnchorsYAxisAttribute.bottom,
            AnchorsYAxisAttribute.firstBaseline,
            AnchorsYAxisAttribute.lastBaseline,
            AnchorsYAxisAttribute.centerYWithinMargins,
            AnchorsYAxisAttribute.topMargin,
            AnchorsYAxisAttribute.bottomMargin,
            AnchorsDimensionAttribute.height,
            AnchorsDimensionAttribute.width,
        ]

        for attribute in attributes {
            let mixedExpression: AnchorsMixedExpression = AnchorsMixedExpression(from: AnchorsExpression<AnchorsXAxisAttribute>(), appendedAttribute: attribute)
            
            @AnchorsBuilder
            var anchors: Anchors {
                mixedExpression.equalToSuper()
                mixedExpression.equalToSuper(constant: constant)
                mixedExpression.equalToSuper(inwardOffset: constant)

                mixedExpression.greaterThanOrEqualToSuper()
                mixedExpression.greaterThanOrEqualToSuper(constant: constant)
                mixedExpression.greaterThanOrEqualToSuper(inwardOffset: constant)

                mixedExpression.lessThanOrEqualToSuper()
                mixedExpression.lessThanOrEqualToSuper(constant: constant)
                mixedExpression.lessThanOrEqualToSuper(inwardOffset: constant)

                mixedExpression.equalTo(siblingview)
                mixedExpression.equalTo(siblingview, constant: constant)
                mixedExpression.equalTo(siblingview, inwardOffset: constant)

                mixedExpression.greaterThanOrEqualTo(siblingview)
                mixedExpression.greaterThanOrEqualTo(siblingview, constant: constant)
                mixedExpression.greaterThanOrEqualTo(siblingview, inwardOffset: constant)

                mixedExpression.lessThanOrEqualTo(siblingview)
                mixedExpression.lessThanOrEqualTo(siblingview, constant: constant)
                mixedExpression.lessThanOrEqualTo(siblingview, inwardOffset: constant)
            }
            
            let constrints = anchors.constraints(item: subview, toItem: superview)
            let expected = [
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: constant),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),

                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: constant),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),

                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: constant),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: superview, attribute: attribute.attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),

                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: constant),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .equal, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),

                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: constant),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .greaterThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),

                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: constant),
                NSLayoutConstraint(item: subview, attribute: attribute.attribute, relatedBy: .lessThanOrEqual, toItem: siblingview, attribute: attribute.attribute, multiplier: 1.0, constant: constant * attribute.inwardDirectionFactor),
            ]

            SLTAssertConstraintsEqual(constrints, expected, tags)
        }
    }

    func testMixedExpressionChaining() {
        @AnchorsBuilder
        var anchors: Anchors {
            AnchorsMixedExpression(from: AnchorsExpression<AnchorsXAxisAttribute>(), appendedAttribute: AnchorsXAxisAttribute.centerX)
                .centerX
                .leading
                .trailing
                .left
                .right
                .centerXWithinMargins
                .leftMargin
                .rightMargin
                .leadingMargin
                .trailingMargin
                .centerY
                .top
                .bottom
                .firstBaseline
                .lastBaseline
                .centerYWithinMargins
                .topMargin
                .bottomMargin
                .height
                .width
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),

            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leftMargin, relatedBy: .equal, toItem: superview, attribute: .leftMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .rightMargin, relatedBy: .equal, toItem: superview, attribute: .rightMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leadingMargin, relatedBy: .equal, toItem: superview, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailingMargin, relatedBy: .equal, toItem: superview, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .firstBaseline, relatedBy: .equal, toItem: superview, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .lastBaseline, relatedBy: .equal, toItem: superview, attribute: .lastBaseline, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .topMargin, relatedBy: .equal, toItem: superview, attribute: .topMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottomMargin, relatedBy: .equal, toItem: superview, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),
        ]

        SLTAssertConstraintsEqual(constraints, expected, tags)
    }

    func testExpressionSafeArea() {
        @AnchorsBuilder
        var anchors: Anchors {
            for attribute in AnchorsXAxisAttribute.allCases {
                AnchorsExpression(xAxis: attribute).equalTo(superview.safeAreaLayoutGuide)
            }
            for attribute in AnchorsYAxisAttribute.allCases {
                AnchorsExpression(yAxis: attribute).equalTo(superview.safeAreaLayoutGuide)
            }
            for attribute in AnchorsDimensionAttribute.allCases {
                AnchorsExpression(dimensions: attribute).equalTo(superview.safeAreaLayoutGuide)
            }
        }
        
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = AnchorsXAxisAttribute.allCases.map {
            NSLayoutConstraint(item: subview, attribute: $0.attribute, relatedBy: .equal, toItem: superview.safeAreaLayoutGuide, attribute: $0.attribute, multiplier: 1.0, constant: 0.0)
        } + AnchorsYAxisAttribute.allCases.map {
            NSLayoutConstraint(item: subview, attribute: $0.attribute, relatedBy: .equal, toItem: superview.safeAreaLayoutGuide, attribute: $0.attribute, multiplier: 1.0, constant: 0.0)
        } + AnchorsDimensionAttribute.allCases.map {
            NSLayoutConstraint(item: subview, attribute: $0.attribute, relatedBy: .equal, toItem: superview.safeAreaLayoutGuide, attribute: $0.attribute, multiplier: 1.0, constant: 0.0)
        }
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
}

// MARK: - static
extension AnchorsImplementationTests {
    func testStaticsSingle() {
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.centerX
            Anchors.leading
            Anchors.trailing
            Anchors.left
            Anchors.right
            Anchors.centerXWithinMargins
            Anchors.leftMargin
            Anchors.rightMargin
            Anchors.leadingMargin
            Anchors.trailingMargin
            Anchors.centerY
            Anchors.top
            Anchors.bottom
            Anchors.firstBaseline
            Anchors.lastBaseline
            Anchors.centerYWithinMargins
            Anchors.topMargin
            Anchors.bottomMargin
            Anchors.height
            Anchors.width
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leftMargin, relatedBy: .equal, toItem: superview, attribute: .leftMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .rightMargin, relatedBy: .equal, toItem: superview, attribute: .rightMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leadingMargin, relatedBy: .equal, toItem: superview, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailingMargin, relatedBy: .equal, toItem: superview, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .firstBaseline, relatedBy: .equal, toItem: superview, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .lastBaseline, relatedBy: .equal, toItem: superview, attribute: .lastBaseline, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerYWithinMargins, relatedBy: .equal, toItem: superview, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .topMargin, relatedBy: .equal, toItem: superview, attribute: .topMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottomMargin, relatedBy: .equal, toItem: superview, attribute: .bottomMargin, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1.0, constant: 0.0),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleHorizontal() {
        let offset: CGFloat = 13
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.horizontal()
            Anchors.horizontal(offset: 13)
            Anchors.horizontal(siblingview)
            Anchors.horizontal(siblingview, offset: 13)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: -offset),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleVertical() {
        let offset: CGFloat = 13
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.vertical()
            Anchors.vertical(offset: offset)
            Anchors.vertical(siblingview)
            Anchors.vertical(siblingview, offset: offset)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: -offset),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleAllSides() {
        let offset: CGFloat = 13
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.allSides()
            Anchors.allSides(offset: offset)
            Anchors.allSides(siblingview)
            Anchors.allSides(siblingview, offset: offset)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: -offset),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleCap() {
        let offset: CGFloat = 13
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.cap()
            Anchors.cap(offset: offset)
            Anchors.cap(siblingview)
            Anchors.cap(siblingview, offset: offset)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: siblingview, attribute: .top, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: -offset),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleShoe() {
        let offset: CGFloat = 13
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.shoe()
            Anchors.shoe(offset: offset)
            Anchors.shoe(siblingview)
            Anchors.shoe(siblingview, offset: offset)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: siblingview, attribute: .bottom, multiplier: 1.0, constant: -offset),
            NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: siblingview, attribute: .leading, multiplier: 1.0, constant: offset),
            NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: siblingview, attribute: .trailing, multiplier: 1.0, constant: -offset),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleSize() {
        let width: CGFloat = 11
        let height: CGFloat = 37
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.size(CGSize(width: width, height: height))
            Anchors.size(width: width, height: height)
            Anchors.size(siblingview, width: width, height: height)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: width),
            NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: height),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: width),
            NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: height),
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: width),
            NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: siblingview, attribute: .height, multiplier: 1.0, constant: height),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleCenter() {
        let offsetX: CGFloat = 11
        let offsetY: CGFloat = 37
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.center()
            Anchors.center(offsetX: offsetX, offsetY: offsetY)
            Anchors.center(siblingview)
            Anchors.center(siblingview, offsetX: offsetX, offsetY: offsetY)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: offsetX),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: offsetY),
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: siblingview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: siblingview, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: siblingview, attribute: .centerX, multiplier: 1.0, constant: offsetX),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: siblingview, attribute: .centerY, multiplier: 1.0, constant: offsetY),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleWithMultiplier() {
        let width: CGFloat = 11
        let height: CGFloat = 37
        let offsetX: CGFloat = 11
        let offsetY: CGFloat = 37
        let multiplier: CGFloat = 0.25
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.size(siblingview, width: width, height: height).multiplier(multiplier)
            Anchors.center(offsetX: offsetX, offsetY: offsetY).multiplier(multiplier)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: siblingview, attribute: .width, multiplier: multiplier, constant: width),
            NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: siblingview, attribute: .height, multiplier: multiplier, constant: height),
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: multiplier, constant: offsetX),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: multiplier, constant: offsetY),
        ]
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
    
    func testStaticsMultipleWithPriority() {
        let width: CGFloat = 11
        let height: CGFloat = 37
        let offsetX: CGFloat = 11
        let offsetY: CGFloat = 37
        let priority: UILayoutPriority = .defaultLow
        
        @AnchorsBuilder
        var anchors: Anchors {
            Anchors.size(siblingview, width: width, height: height).priority(priority)
            Anchors.center(offsetX: offsetX, offsetY: offsetY).priority(priority)
        }
        let constraints = anchors.constraints(item: subview, toItem: superview)
        let expected = [
            NSLayoutConstraint(item: subview, attribute: .width, relatedBy: .equal, toItem: siblingview, attribute: .width, multiplier: 1.0, constant: width),
            NSLayoutConstraint(item: subview, attribute: .height, relatedBy: .equal, toItem: siblingview, attribute: .height, multiplier: 1.0, constant: height),
            NSLayoutConstraint(item: subview, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1.0, constant: offsetX),
            NSLayoutConstraint(item: subview, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1.0, constant: offsetY),
        ].map { constraint -> NSLayoutConstraint in
            constraint.priority = priority
            return constraint
        }
        
        SLTAssertConstraintsEqual(constraints, expected, tags)
    }
}
