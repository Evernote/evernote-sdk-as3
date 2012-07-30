/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 */
package com.evernote.edam.userstore {

import org.apache.thrift.Set;
import org.apache.thrift.type.BigInteger;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import org.apache.thrift.*;
import org.apache.thrift.meta_data.*;
import org.apache.thrift.protocol.*;

import com.evernote.edam.error.EDAMUserException;
import com.evernote.edam.error.EDAMSystemException;
import com.evernote.edam.type.User;
import com.evernote.edam.error.EDAMNotFoundException;

  /**
   * Service:  UserStore
   * <p>
   * The UserStore service is primarily used by EDAM clients to establish
   * authentication via username and password over a trusted connection (e.g.
   * SSL).  A client's first call to this interface should be checkVersion() to
   * ensure that the client's software is up to date.
   * </p>
   * All calls which require an authenticationToken may throw an
   * EDAMUserException for the following reasons:
   *  <ul>
   *   <li> AUTH_EXPIRED "authenticationToken" - token has expired
   *   <li> BAD_DATA_FORMAT "authenticationToken" - token is malformed
   *   <li> DATA_REQUIRED "authenticationToken" - token is empty
   *   <li> INVALID_AUTH "authenticationToken" - token signature is invalid
   * </ul>
   */
  public interface IUserStore {

    /**
     * This should be the first call made by a client to the EDAM service.  It
     * tells the service what protocol version is used by the client.  The
     * service will then return true if the client is capable of talking to
     * the service, and false if the client's protocol version is incompatible
     * with the service, so the client must upgrade.  If a client receives a
     * false value, it should report the incompatibility to the user and not
     * continue with any more EDAM requests (UserStore or NoteStore).
     * 
     * @param clientName
     *   This string provides some information about the client for
     *   tracking/logging on the service.  It should provide information about
     *   the client's software and platform.  The structure should be:
     *   application/version; platform/version; [ device/version ]
     *   E.g.   "Evernote Windows/3.0.1; Windows/XP SP3" or
     *   "Evernote Clipper/1.0.1; JME/2.0; Motorola RAZR/2.0;
     * 
     * @param edamVersionMajor
     *   This should be the major protocol version that was compiled by the
     *   client.  This should be the current value of the EDAM_VERSION_MAJOR
     *   constant for the client.
     * 
     * @param edamVersionMinor
     *   This should be the major protocol version that was compiled by the
     *   client.  This should be the current value of the EDAM_VERSION_MINOR
     *   constant for the client.
     * 
     * @param clientName
     * @param edamVersionMajor
     * @param edamVersionMinor
     */
    //function onError(Error):void;
    //function onSuccess(Boolean):void;
    function checkVersion(clientName:String, edamVersionMajor:int, edamVersionMinor:int, onError:Function, onSuccess:Function):void;

    /**
     * This provides bootstrap information to the client. Various bootstrap
     * profiles and settings may be used by the client to configure itself.
     * 
     * @param locale
     *   The client's current locale, expressed in language[_country]
     *   format. E.g., "en_US". See ISO-639 and ISO-3166 for valid
     *   language and country codes.
     * 
     * @return
     *   The bootstrap information suitable for this client.
     * 
     * @param locale
     */
    //function onError(Error):void;
    //function onSuccess(BootstrapInfo):void;
    function getBootstrapInfo(locale:String, onError:Function, onSuccess:Function):void;

    /**
     * This is used to check a username and password in order to create an
     * authentication session that could be used for further actions.
     * 
     * This function is only availabe to Evernote's internal applications.
     * Third party applications must authenticate using OAuth as
     * described at
     * <a href="http://dev.evernote.com/documentation/cloud/">dev.evernote.com</a>.
     * 
     * @param username
     *   The username (not numeric user ID) for the account to
     *   authenticate against.  This function will also accept the user's
     *   registered email address in this parameter.
     * 
     * @param password
     *   The plaintext password to check against the account.  Since
     *   this is not protected by the EDAM protocol, this information must be
     *   provided over a protected transport (e.g. SSL).
     * 
     * @param consumerKey
     *   A unique identifier for this client application, provided by Evernote
     *   to developers who request an API key.  This must be provided to identify
     *   the client.
     * 
     * @param consumerSecret
     *   If the client was given a "consumer secret" when the API key was issued,
     *   it must be provided here to authenticate the application itself.
     * 
     * @return
     *   The result of the authentication.  If the authentication was successful,
     *   the AuthenticationResult.user field will be set with the full information
     *   about the User.
     * 
     * @throws EDAMUserException <ul>
     *   <li> DATA_REQUIRED "username" - username is empty
     *   <li> DATA_REQUIRED "password" - password is empty
     *   <li> DATA_REQUIRED "consumerKey" - consumerKey is empty
     *   <li> INVALID_AUTH "username" - username not found
     *   <li> INVALID_AUTH "password" - password did not match
     *   <li> INVALID_AUTH "consumerKey" - consumerKey is not authorized
     *   <li> INVALID_AUTH "consumerSecret" - consumerSecret is incorrect
     *   <li> PERMISSION_DENIED "User.active" - user account is closed
     *   <li> PERMISSION_DENIED "User.tooManyFailuresTryAgainLater" - user has
     *     failed authentication too often
     * </ul>
     * 
     * @param username
     * @param password
     * @param consumerKey
     * @param consumerSecret
     */
    //function onError(Error):void;
    //function onSuccess(AuthenticationResult):void;
    function authenticate(username:String, password:String, consumerKey:String, consumerSecret:String, onError:Function, onSuccess:Function):void;

    /**
     * This is used to take an existing authentication token (returned from
     * 'authenticate') and exchange it for a newer token which will not expire
     * as soon.  This must be invoked before the previous token expires.
     * 
     * This function is only availabe to Evernote's internal applications.
     * 
     * @param authenticationToken
     *   The previous authentication token from the authenticate() result.
     * 
     * @return
     *   The result of the authentication, with the new token in
     *   the result's "authentication" field.  The User field will
     *   not be set in the reply.
     * 
     * @param authenticationToken
     */
    //function onError(Error):void;
    //function onSuccess(AuthenticationResult):void;
    function refreshAuthentication(authenticationToken:String, onError:Function, onSuccess:Function):void;

    /**
     * Returns the User corresponding to the provided authentication token,
     * or throws an exception if this token is not valid.
     * The level of detail provided in the returned User structure depends on
     * the access level granted by the token, so a web service client may receive
     * fewer fields than an integrated desktop client.
     * 
     * @param authenticationToken
     */
    //function onError(Error):void;
    //function onSuccess(User):void;
    function getUser(authenticationToken:String, onError:Function, onSuccess:Function):void;

    /**
     * Asks the UserStore about the publicly available location information for
     * a particular username.
     * 
     * @throws EDAMUserException <ul>
     *   <li> DATA_REQUIRED "username" - username is empty
     * </ul>
     * 
     * @param username
     */
    //function onError(Error):void;
    //function onSuccess(PublicUserInfo):void;
    function getPublicUserInfo(username:String, onError:Function, onSuccess:Function):void;

    /**
     * Returns information regarding a user's Premium account corresponding to the
     * provided authentication token, or throws an exception if this token is not
     * valid.
     * 
     * @param authenticationToken
     */
    //function onError(Error):void;
    //function onSuccess(PremiumInfo):void;
    function getPremiumInfo(authenticationToken:String, onError:Function, onSuccess:Function):void;

    /**
     * Returns the URL that should be used to talk to the NoteStore for the
     * account represented by the provided authenticationToken.
     * This method isn't needed by most clients, who can retrieve the correct
     * NoteStore URL from the AuthenticationResult returned from the authenticate
     * or refreshAuthentication calls. This method is typically only needed
     * to look up the correct URL for a long-lived session token (e.g. for an
     * OAuth web service).
     * 
     * @param authenticationToken
     */
    //function onError(Error):void;
    //function onSuccess(String):void;
    function getNoteStoreUrl(authenticationToken:String, onError:Function, onSuccess:Function):void;

  }

}