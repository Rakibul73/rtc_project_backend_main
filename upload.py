from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required
from auth_utils import role_required

upload_blueprint = Blueprint('upload', __name__)

@upload_blueprint.route('/seal/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_seal():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file' ,"statuscode" : 400}), 400
    
    # Save the file to the seal folder
    file.save('upload/seal/' + file.filename)
    
    return jsonify({'message': 'Seal uploaded successfully' , "statuscode" : 200 }), 200

@upload_blueprint.route('/signature/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_signature():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    # Save the file to the signature folder
    file.save('upload/signature/' + file.filename)
    
    return jsonify({'message': 'Signature uploaded successfully' , "statuscode" : 200}), 200

@upload_blueprint.route('/profile-pic/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_profile_pic():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    # Save the file to the profile_pic folder
    file.save('upload/profile_pic/' + file.filename)
    
    return jsonify({'message': 'Profile picture uploaded successfully' , "statuscode" : 200 ,  "statuscode" : 200}), 200

@upload_blueprint.route('/methodology/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_methodology():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    # Save the file to the methodology folder
    file.save('upload/methodology/' + file.filename)
    
    return jsonify({'message': 'Methodology file uploaded successfully' , "statuscode" : 200}), 200
