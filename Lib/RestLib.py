from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn

_requestsLib = BuiltIn().get_library_instance('RequestsLibrary')

class RestLib():
    def __init__(self,content_type="application/json"):
        self.content_type=content_type
        logger.info("init done with content type" + self.content_type,html=True,also_console=True)
        return

    def create_default_header(self):
        header={}
        header['Content-Type'] = self.content_type
        logger.info("created default header " + str(header),html=True,also_console=True)
        return header

    def check_response_code(self,resp,expectedStatus=200):
        logger.info("checking response code status",True,False)
        if int(resp.status_code) != int(expectedStatus):
            logger.info("response body " + str(resp.text),True,True)
            raise AssertionError("expected resp code "+str(expectedStatus)+" does not match actual " + str(resp.status_code))
        else:
            logger.info("expected resp code "+str(expectedStatus)+" matches actual " + str(resp.status_code),True,True)
            return

    def create_connection(self,remoteaddr):
        session = "testConnection"
        _requestsLib.create_session(session,remoteaddr)
        defaultHeader = self.create_default_header()
        return session

    def send_get_request(self,connection,uri,header,exp_status_code=200):
        resp = _requestsLib.get_request(uri=uri,alias=connection,headers=header);
        self.check_response_code(resp,expectedStatus=exp_status_code);
        logger.info("Got response to request " + str(uri) + " with body " + str(resp.json()),also_console=True, html=True)
        return resp.json()

    def check_json_property(self,resp_json,property,exp_value):
        if str(resp_json[property]) != str(exp_value):
            errmsg = "Property " + str(property) + " actual value " + str(resp_json[property]) + " Does not match expected value " + str(exp_value)
            logger.error(errmsg,html=True)
            raise AssertionError(errmsg)
        else:
            msg = "Property " + str(property) + " actual value " + str(resp_json[property]) + " matches expected value " + str(exp_value)
            logger.info(msg,html=True,also_console=True)
            return


