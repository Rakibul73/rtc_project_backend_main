from flask import Blueprint, send_from_directory
from flask_jwt_extended import jwt_required
from auth_utils import role_required

download_blueprint = Blueprint('download', __name__)

@download_blueprint.route('/seal/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_seal(filename):
    # Logic for downloading the seal
    return send_from_directory('upload/seal', filename)

@download_blueprint.route('/signature/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_signature(filename):
    # Logic for downloading the signature
    return send_from_directory('upload/signature', filename)

@download_blueprint.route('/profile-pic/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_profile_pic(filename):
    # Logic for downloading the profile pic
    return send_from_directory('upload/profile_pic', filename)

@download_blueprint.route('/methodology/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_methodology(filename):
    # Logic for downloading the methodology
    return send_from_directory('upload/methodology', filename)

@download_blueprint.route('/nid/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_nid(filename):
    # Logic for downloading the methodology
    return send_from_directory('upload/nid', filename)

@download_blueprint.route('/project_softcopy/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_project_softcopy(filename):
    # Logic for downloading the methodology
    return send_from_directory('upload/project_softcopy', filename)

@download_blueprint.route('/notice/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_notice(filename):
    return send_from_directory('upload/notices', filename)


@download_blueprint.route('/monitoringreportfile/download/<filename>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def download_monitoring_report_file(filename):
    return send_from_directory('upload/monitoringreportfile', filename)
