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

var _commonPrintCommaSeparatedNodes = require('../common/printCommaSeparatedNodes');

var _commonPrintCommaSeparatedNodes2 = _interopRequireDefault(_commonPrintCommaSeparatedNodes);

var _wrappersSimpleWrapExpression = require('../../wrappers/simple/wrapExpression');

var _wrappersSimpleWrapExpression2 = _interopRequireDefault(_wrappersSimpleWrapExpression);

function printArrowFunctionExpression(print, node) {
  var wrap = function wrap(x) {
    return (0, _wrappersSimpleWrapExpression2['default'])(print, node, x);
  };
  return wrap(['(', (0, _commonPrintCommaSeparatedNodes2['default'])(print, node.params), ') =>', _constantsMarkers2['default'].noBreak, _constantsMarkers2['default'].space, print(node.body), _constantsMarkers2['default'].noBreak]);
}

module.exports = printArrowFunctionExpression;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uL3NyYy9yZXByaW50LWpzL3ByaW50ZXJzL3NpbXBsZS9wcmludEFycm93RnVuY3Rpb25FeHByZXNzaW9uLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7OztnQ0Fhb0IseUJBQXlCOzs7OzhDQUNSLG9DQUFvQzs7Ozs0Q0FDOUMsc0NBQXNDOzs7O0FBRWpFLFNBQVMsNEJBQTRCLENBQ25DLEtBQVksRUFDWixJQUE2QixFQUN0QjtBQUNQLE1BQU0sSUFBSSxHQUFHLFNBQVAsSUFBSSxDQUFHLENBQUM7V0FBSSwrQ0FBZSxLQUFLLEVBQUUsSUFBSSxFQUFFLENBQUMsQ0FBQztHQUFBLENBQUM7QUFDakQsU0FBTyxJQUFJLENBQUMsQ0FDVixHQUFHLEVBQ0gsaURBQXlCLEtBQUssRUFBRSxJQUFJLENBQUMsTUFBTSxDQUFDLEVBQzVDLE1BQU0sRUFDTiw4QkFBUSxPQUFPLEVBQ2YsOEJBQVEsS0FBSyxFQUNiLEtBQUssQ0FBQyxJQUFJLENBQUMsSUFBSSxDQUFDLEVBQ2hCLDhCQUFRLE9BQU8sQ0FDaEIsQ0FBQyxDQUFDO0NBQ0o7O0FBRUQsTUFBTSxDQUFDLE9BQU8sR0FBRyw0QkFBNEIsQ0FBQyIsImZpbGUiOiJwcmludEFycm93RnVuY3Rpb25FeHByZXNzaW9uLmpzIiwic291cmNlc0NvbnRlbnQiOlsiLypcbiAqIENvcHlyaWdodCAoYykgMjAxNS1wcmVzZW50LCBGYWNlYm9vaywgSW5jLlxuICogQWxsIHJpZ2h0cyByZXNlcnZlZC5cbiAqXG4gKiBUaGlzIHNvdXJjZSBjb2RlIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSBsaWNlbnNlIGZvdW5kIGluIHRoZSBMSUNFTlNFIGZpbGUgaW5cbiAqIHRoZSByb290IGRpcmVjdG9yeSBvZiB0aGlzIHNvdXJjZSB0cmVlLlxuICpcbiAqIEBmbG93XG4gKi9cblxuaW1wb3J0IHR5cGUge0Fycm93RnVuY3Rpb25FeHByZXNzaW9ufSBmcm9tICdhc3QtdHlwZXMtZmxvdyc7XG5pbXBvcnQgdHlwZSB7TGluZXMsIFByaW50fSBmcm9tICcuLi8uLi90eXBlcy9jb21tb24nO1xuXG5pbXBvcnQgbWFya2VycyBmcm9tICcuLi8uLi9jb25zdGFudHMvbWFya2Vycyc7XG5pbXBvcnQgcHJpbnRDb21tYVNlcGFyYXRlZE5vZGVzIGZyb20gJy4uL2NvbW1vbi9wcmludENvbW1hU2VwYXJhdGVkTm9kZXMnO1xuaW1wb3J0IHdyYXBFeHByZXNzaW9uIGZyb20gJy4uLy4uL3dyYXBwZXJzL3NpbXBsZS93cmFwRXhwcmVzc2lvbic7XG5cbmZ1bmN0aW9uIHByaW50QXJyb3dGdW5jdGlvbkV4cHJlc3Npb24oXG4gIHByaW50OiBQcmludCxcbiAgbm9kZTogQXJyb3dGdW5jdGlvbkV4cHJlc3Npb24sXG4pOiBMaW5lcyB7XG4gIGNvbnN0IHdyYXAgPSB4ID0+IHdyYXBFeHByZXNzaW9uKHByaW50LCBub2RlLCB4KTtcbiAgcmV0dXJuIHdyYXAoW1xuICAgICcoJyxcbiAgICBwcmludENvbW1hU2VwYXJhdGVkTm9kZXMocHJpbnQsIG5vZGUucGFyYW1zKSxcbiAgICAnKSA9PicsXG4gICAgbWFya2Vycy5ub0JyZWFrLFxuICAgIG1hcmtlcnMuc3BhY2UsXG4gICAgcHJpbnQobm9kZS5ib2R5KSxcbiAgICBtYXJrZXJzLm5vQnJlYWssXG4gIF0pO1xufVxuXG5tb2R1bGUuZXhwb3J0cyA9IHByaW50QXJyb3dGdW5jdGlvbkV4cHJlc3Npb247XG4iXX0=