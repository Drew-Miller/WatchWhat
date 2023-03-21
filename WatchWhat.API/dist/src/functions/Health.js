"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Health = void 0;
const functions_1 = require("@azure/functions");
function Health(request, context) {
    return __awaiter(this, void 0, void 0, function* () {
        return { body: `Hello, world!` };
    });
}
exports.Health = Health;
;
functions_1.app.http('Health', {
    methods: ['GET', 'POST'],
    authLevel: 'anonymous',
    handler: Health
});
//# sourceMappingURL=Health.js.map