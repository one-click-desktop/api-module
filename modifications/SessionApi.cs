/*
 * Overseer
 *
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: 1.0.4
 * 
 * Generated by: https://openapi-generator.tech
 */

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using OneClickDesktop.Api.Attributes;
using OneClickDesktop.Api.Models;

namespace OneClickDesktop.Api.Controllers
{ 
    /// <summary>
    /// 
    /// </summary>
    [ApiController]
    public abstract class SessionApiController : ControllerBase
    { 
        /// <summary>
        /// Cancel session
        /// </summary>
        /// <param name="sessionId">The id of session to retrieve</param>
        /// <response code="200">Response containing acknowledgment</response>
        /// <response code="401">Unauthorized</response>
        /// <response code="0">Generic error</response>
        [HttpDelete]
        [Route("/session/{sessionId}")]
        [ValidateModelState]
        [ProducesResponseType(statusCode: 200, type: typeof(string))]
        [ProducesResponseType(statusCode: 401, type: typeof(Error))]
        [ProducesResponseType(statusCode: 0, type: typeof(Error))]
        public abstract IActionResult DeleteSession([FromRoute (Name = "sessionId")][Required]string sessionId);

        /// <summary>
        /// Get new session of selected type
        /// </summary>
        /// <param name="body">Used to send requested session type</param>
        /// <response code="200">Response containing session status</response>
        /// <response code="401">Unauthorized</response>
        /// <response code="0">Generic error</response>
        [HttpPost]
        [Route("/session")]
        [Consumes("application/json")]
        [ValidateModelState]
        [ProducesResponseType(statusCode: 200, type: typeof(Session))]
        [ProducesResponseType(statusCode: 401, type: typeof(Error))]
        [ProducesResponseType(statusCode: 0, type: typeof(Error))]
        public abstract IActionResult GetSession([FromBody]string body);

        /// <summary>
        /// Get session status
        /// </summary>
        /// <param name="sessionId">The id of session to retrieve</param>
        /// <response code="200">Response containing session status</response>
        /// <response code="401">Unauthorized</response>
        /// <response code="0">Generic error</response>
        [HttpGet]
        [Route("/session/{sessionId}")]
        [ValidateModelState]
        [ProducesResponseType(statusCode: 200, type: typeof(Session))]
        [ProducesResponseType(statusCode: 401, type: typeof(Error))]
        [ProducesResponseType(statusCode: 0, type: typeof(Error))]
        public abstract IActionResult GetSessionStatus([FromRoute (Name = "sessionId")][Required]string sessionId);
    }
}
