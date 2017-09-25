function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

/*
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 *
 * 
 */

var _constantsMarkers = require('../../constants/markers');

var _constantsMarkers2 = _interopRequireDefault(_constantsMarkers);

var _wrappersSimpleWrapStatement = require('../../wrappers/simple/wrapStatement');

var _wrappersSimpleWrapStatement2 = _interopRequireDefault(_wrappersSimpleWrapStatement);

function printTryStatement(print, node) {
  var wrap = function wrap(x) {
    return (0, _wrappersSimpleWrapStatement2['default'])(print, node, x);
  };

  var parts = [_constantsMarkers2['default'].hardBreak, 'try', _constantsMarkers2['default'].noBreak, _constantsMarkers2['default'].space, print(node.block)];

  if (node.handler) {
    var handler = node.handler;
    parts = parts.concat([_constantsMarkers2['default'].noBreak, _constantsMarkers2['default'].space, print(handler)]);
  }

  if (node.finalizer) {
    var finalizer = node.finalizer;
    parts = parts.concat([_constantsMarkers2['default'].noBreak, _constantsMarkers2['default'].space, 'finally', _constantsMarkers2['default'].noBreak, _constantsMarkers2['default'].space, print(finalizer)]);
  }

  return wrap(parts);
}

module.exports = printTryStatement;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9yZXByaW50LWpzL3ByaW50ZXJzL3NpbXBsZS9wcmludFRyeVN0YXRlbWVudC5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Z0NBYW9CLHlCQUF5Qjs7OzsyQ0FDbkIscUNBQXFDOzs7O0FBRS9ELFNBQVMsaUJBQWlCLENBQUMsS0FBWSxFQUFFLElBQWtCLEVBQVM7QUFDbEUsTUFBTSxJQUFJLEdBQUcsU0FBUCxJQUFJLENBQUcsQ0FBQztXQUFJLDhDQUFjLEtBQUssRUFBRSxJQUFJLEVBQUUsQ0FBQyxDQUFDO0dBQUEsQ0FBQzs7QUFFaEQsTUFBSSxLQUFLLEdBQUcsQ0FDViw4QkFBUSxTQUFTLEVBQ2pCLEtBQUssRUFDTCw4QkFBUSxPQUFPLEVBQ2YsOEJBQVEsS0FBSyxFQUNiLEtBQUssQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDLENBQ2xCLENBQUM7O0FBRUYsTUFBSSxJQUFJLENBQUMsT0FBTyxFQUFFO0FBQ2hCLFFBQU0sT0FBTyxHQUFHLElBQUksQ0FBQyxPQUFPLENBQUM7QUFDN0IsU0FBSyxHQUFHLEtBQUssQ0FBQyxNQUFNLENBQUMsQ0FDbkIsOEJBQVEsT0FBTyxFQUNmLDhCQUFRLEtBQUssRUFDYixLQUFLLENBQUMsT0FBTyxDQUFDLENBQ2YsQ0FBQyxDQUFDO0dBQ0o7O0FBRUQsTUFBSSxJQUFJLENBQUMsU0FBUyxFQUFFO0FBQ2xCLFFBQU0sU0FBUyxHQUFHLElBQUksQ0FBQyxTQUFTLENBQUM7QUFDakMsU0FBSyxHQUFHLEtBQUssQ0FBQyxNQUFNLENBQUMsQ0FDbkIsOEJBQVEsT0FBTyxFQUNmLDhCQUFRLEtBQUssRUFDYixTQUFTLEVBQ1QsOEJBQVEsT0FBTyxFQUNmLDhCQUFRLEtBQUssRUFDYixLQUFLLENBQUMsU0FBUyxDQUFDLENBQ2pCLENBQUMsQ0FBQztHQUNKOztBQUVELFNBQU8sSUFBSSxDQUFDLEtBQUssQ0FBQyxDQUFDO0NBQ3BCOztBQUVELE1BQU0sQ0FBQyxPQUFPLEdBQUcsaUJBQWlCLENBQUMiLCJmaWxlIjoicHJpbnRUcnlTdGF0ZW1lbnQuanMiLCJzb3VyY2VzQ29udGVudCI6WyIvKlxuICogQ29weXJpZ2h0IChjKSAyMDE1LXByZXNlbnQsIEZhY2Vib29rLCBJbmMuXG4gKiBBbGwgcmlnaHRzIHJlc2VydmVkLlxuICpcbiAqIFRoaXMgc291cmNlIGNvZGUgaXMgbGljZW5zZWQgdW5kZXIgdGhlIGxpY2Vuc2UgZm91bmQgaW4gdGhlIExJQ0VOU0UgZmlsZSBpblxuICogdGhlIHJvb3QgZGlyZWN0b3J5IG9mIHRoaXMgc291cmNlIHRyZWUuXG4gKlxuICogQGZsb3dcbiAqL1xuXG5pbXBvcnQgdHlwZSB7TGluZXMsIFByaW50fSBmcm9tICcuLi8uLi90eXBlcy9jb21tb24nO1xuaW1wb3J0IHR5cGUge1RyeVN0YXRlbWVudH0gZnJvbSAnYXN0LXR5cGVzLWZsb3cnO1xuXG5pbXBvcnQgbWFya2VycyBmcm9tICcuLi8uLi9jb25zdGFudHMvbWFya2Vycyc7XG5pbXBvcnQgd3JhcFN0YXRlbWVudCBmcm9tICcuLi8uLi93cmFwcGVycy9zaW1wbGUvd3JhcFN0YXRlbWVudCc7XG5cbmZ1bmN0aW9uIHByaW50VHJ5U3RhdGVtZW50KHByaW50OiBQcmludCwgbm9kZTogVHJ5U3RhdGVtZW50KTogTGluZXMge1xuICBjb25zdCB3cmFwID0geCA9PiB3cmFwU3RhdGVtZW50KHByaW50LCBub2RlLCB4KTtcblxuICBsZXQgcGFydHMgPSBbXG4gICAgbWFya2Vycy5oYXJkQnJlYWssXG4gICAgJ3RyeScsXG4gICAgbWFya2Vycy5ub0JyZWFrLFxuICAgIG1hcmtlcnMuc3BhY2UsXG4gICAgcHJpbnQobm9kZS5ibG9jayksXG4gIF07XG5cbiAgaWYgKG5vZGUuaGFuZGxlcikge1xuICAgIGNvbnN0IGhhbmRsZXIgPSBub2RlLmhhbmRsZXI7XG4gICAgcGFydHMgPSBwYXJ0cy5jb25jYXQoW1xuICAgICAgbWFya2Vycy5ub0JyZWFrLFxuICAgICAgbWFya2Vycy5zcGFjZSxcbiAgICAgIHByaW50KGhhbmRsZXIpLFxuICAgIF0pO1xuICB9XG5cbiAgaWYgKG5vZGUuZmluYWxpemVyKSB7XG4gICAgY29uc3QgZmluYWxpemVyID0gbm9kZS5maW5hbGl6ZXI7XG4gICAgcGFydHMgPSBwYXJ0cy5jb25jYXQoW1xuICAgICAgbWFya2Vycy5ub0JyZWFrLFxuICAgICAgbWFya2Vycy5zcGFjZSxcbiAgICAgICdmaW5hbGx5JyxcbiAgICAgIG1hcmtlcnMubm9CcmVhayxcbiAgICAgIG1hcmtlcnMuc3BhY2UsXG4gICAgICBwcmludChmaW5hbGl6ZXIpLFxuICAgIF0pO1xuICB9XG5cbiAgcmV0dXJuIHdyYXAocGFydHMpO1xufVxuXG5tb2R1bGUuZXhwb3J0cyA9IHByaW50VHJ5U3RhdGVtZW50O1xuIl19