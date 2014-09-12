edittextoverlaybug
==================

This is a sample XCode 6 project that demonstrates the IOS 8 issue with adding an edit text overlay to a table view. This project has a simple table and when you click on a cell it opens a UITextField as an overlay on the table for editting.  This works fine in IOS 7.1 but fails on IOS 8 GM with the following error:

edittextoverlaybug[13268:852731] *** Terminating app due to uncaught exception 'UIViewControllerHierarchyInconsistency', reason: 'child view controller:<UICompatibilityInputViewController: 0x7ff33ae82860> should have parent view controller:<addTaskViewController: 0x7ff33ae55c40> but requested parent is:<UIInputWindowController: 0x7ff33c875600>'
*** First throw call stack:
(
	0   CoreFoundation                      0x00000001107183f5 __exceptionPreprocess + 165
	1   libobjc.A.dylib                     0x00000001103b1bb7 objc_exception_throw + 45
	2   CoreFoundation                      0x000000011071832d +[NSException raise:format:] + 205
	3   UIKit                               0x0000000110c2bf6d -[UIViewController _addChildViewController:performHierarchyCheck:notifyWillMove:] + 184
	4   UIKit                               0x00000001111d49b1 -[UIInputWindowController changeToInputViewSet:] + 1172
	5   UIKit                               0x00000001111d52bd __43-[UIInputWindowController setInputViewSet:]_block_invoke + 85
	6   UIKit                               0x0000000110b74eae +[UIView(Animation) performWithoutAnimation:] + 65
	7   UIKit                               0x00000001111d508e -[UIInputWindowController setInputViewSet:] + 291
	8   UIKit                               0x00000001111d0e9a -[UIInputWindowController performOperations:withAnimationStyle:] + 50
	9   UIKit                               0x0000000110fc2bfe -[UIPeripheralHost(UIKitInternal) setInputViews:animationStyle:] + 1054
	10  UIKit                               0x0000000110c7a89d -[UIResponder becomeFirstResponder] + 468
	11  UIKit                               0x0000000110b706b3 -[UIView(Hierarchy) becomeFirstResponder] + 99
	12  UIKit                               0x0000000111232adf -[UITextField becomeFirstResponder] + 51
	13  UIKit                               0x0000000110b706eb -[UIView(Hierarchy) deferredBecomeFirstResponder] + 49
	14  UIKit                               0x0000000110b709f4 __45-[UIView(Hierarchy) _postMovedFromSuperview:]_block_invoke + 175
	15  UIKit                               0x0000000110b70936 -[UIView(Hierarchy) _postMovedFromSuperview:] + 437
	16  UIKit                               0x0000000110b7a835 -[UIView(Internal) _addSubview:positioned:relativeTo:] + 1550
	17  UIKit                               0x0000000110bd2ce2 -[UITableView _addSubview:positioned:relativeTo:] + 50
	18  edittextoverlaybug                  0x000000010fe7cc42 -[addTaskViewController showCustomTextInputViewInView:withText:andWithTitle:] + 1618
	19  edittextoverlaybug                  0x000000010fe7eff4 -[taskViewController tableView:didSelectRowAtIndexPath:] + 244
	20  UIKit                               0x0000000110bebbb3 -[UITableView _selectRowAtIndexPath:animated:scrollPosition:notifyDelegate:] + 1293
	21  UIKit                               0x0000000110bebcf4 -[UITableView _userSelectRowAtPendingSelectionIndexPath:] + 219
	22  UIKit                               0x0000000110b27461 _applyBlockToCFArrayCopiedToStack + 314
	23  UIKit                               0x0000000110b272db _afterCACommitHandler + 516
	24  CoreFoundation                      0x000000011064d347 __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
	25  CoreFoundation                      0x000000011064d2a0 __CFRunLoopDoObservers + 368
	26  CoreFoundation                      0x00000001106430d3 __CFRunLoopRun + 1123
	27  CoreFoundation                      0x0000000110642a06 CFRunLoopRunSpecific + 470
	28  GraphicsServices                    0x0000000113ce09f0 GSEventRunModal + 161
	29  UIKit                               0x0000000110b04550 UIApplicationMain + 1282
	30  edittextoverlaybug                  0x000000010fe7f953 main + 115
	31  libdyld.dylib                       0x0000000112c90145 start + 1
)
libc++abi.dylib: terminating with uncaught exception of type NSException

