from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required
from auth_utils import role_required
from db import get_db # local module

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

@upload_blueprint.route('/nid/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_nid():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    # Save the file to the methodology folder
    file.save('upload/nid/' + file.filename)
    
    return jsonify({'message': 'Nid file uploaded successfully' , "statuscode" : 200}), 200

@upload_blueprint.route('/project_softcopy/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_project_softcopy():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    # Save the file to the methodology folder
    file.save('upload/project_softcopy/' + file.filename)
    
    return jsonify({'message': 'project_softcopy file uploaded successfully' , "statuscode" : 200}), 200

@upload_blueprint.route('/notice/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def upload_notice():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    file = request.files['file']
    
    if file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    file.save('upload/notices/' + file.filename)
    
    return jsonify({'message': 'notice file uploaded successfully' , "statuscode" : 200}), 200



@upload_blueprint.route('/monitoring_report_feedback/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_monitoring_report_feedback():
    if 'pdf' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    pdf_file = request.files['pdf']
    feedbackId = request.form.get('projectMonitoringReportID')
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE ProjectMonitoringFeedback SET MonitoringFeedbackFileLocation = %s WHERE ProjectMonitoringFeedbackID = %s"
    user_data = (pdf_file.filename , feedbackId)
    print(user_data)
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    
    if pdf_file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    pdf_file.save('upload/monitoringreportfile/' + pdf_file.filename)
    
    return jsonify({'message': 'Monitoring report file uploaded successfully' , "statuscode" : 200}), 200


@upload_blueprint.route('/monitoring_report/upload', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def upload_monitoring_report():
    if 'pdf' not in request.files:
        return jsonify({'error': 'No file part' , "statuscode" : 400}), 400
    
    pdf_file = request.files['pdf']
    projectMonitoringReportID = request.form.get('projectMonitoringReportID')
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE ProjectMonitoringReport SET ReportFileLocation = %s WHERE ProjectMonitoringReportID = %s"
    user_data = (pdf_file.filename , projectMonitoringReportID)
    print(user_data)
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    
    if pdf_file.filename == '':
        return jsonify({'error': 'No selected file' , "statuscode" : 400}), 400
    
    pdf_file.save('upload/monitoringreportfile/' + pdf_file.filename)
    
    return jsonify({'message': 'Monitoring report file uploaded successfully' , "statuscode" : 200}), 200