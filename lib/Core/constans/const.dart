import 'package:tqniaapp/Feature/home/data/model/lead_model/lead.dart';
import 'package:tqniaapp/Feature/home/data/model/metting_model/metting_model.dart';

String? TOKEN;
String? USERID;
String? USERNAME;

Lead? editModel;
MettingModel? METTINGS;

/////////////////////////////////////
///
const LOGINURlEndPoint = 'ApiAuth/login/';
const ADDLEADEndPoint = 'ApiLeads/save';
const getLeadStatusEndPoint = 'ApiLeads/getLeadStatus';
const getLeadSourcesEndPoint = 'ApiLeads/getLeadSources';
const getCurrencyEndPoint = 'ApiLeads/getCurrency';
const getOwnersEndPoint = 'ApiLeads/getOwners';
const sendresetpasswordEndPoint = 'ApiAuth/send_reset_password_mail';
const doresetpasswordEndPoint = 'ApiAuth/do_reset_password';
const getLabalsEndPoint = 'ApiTickets/getLabals';
const getListLeadEndPoint = 'ApiLeads/list_data';
const getClientsEndPoint = 'ApiTickets/getClients';
const getAssginToEndPoint = 'ApiTickets/getAssginTo';
const getProjectsEndPoint = 'ApiTickets/getProjects';

const getRequestedByEndPoint = 'ApiTickets/getRequestedBy';
const getTicketsTypesEndPoint = 'ApiTickets/getTicketsTypes';
const getUserDataEndPoint = 'ApiAuth/getByToken';
const getApiLeadsByIdEndPoint = 'ApiLeads/get_one';
const getticketsByClientEndPoint = 'ApiTickets/ticketsByClient';
const addTicketEndPoint = 'ApiTickets/save';
const getTicketByIdEndPoint = 'ApiTickets/getTicketById';
const getNotesEndPoint = 'ApiNotes/getNotes';
const AddNoteEndPoint = 'ApiNotes/save';
const AddcallEndPoint = 'ApiCalls/save';
const getCallsEndPoint = 'ApiCalls/getCalls';
const DeleteLeadEndPoint = 'ApiLeads/delete';
const getNotificationEndPoint = 'ApiNotifications/get_all_notifications';
const getNotificationCountEndPoint = 'ApiNotifications/getCount';
const showImageurl = 'https://system.tqnia.me/files/profile_images/';
const showProfileImage = 'https://system.tqnia.me/';
const checkPermisionEndPoint = 'ApiTickets/hasPermission';
const getRegionEndPoint = 'ApiLeads/getRegion';

const editProfileEndPoint = 'ApiProfile/editProfile';
const UpdateProfileimageEndPoint = 'ApiProfile/UpdateProfileImage';
const ApiGetAllEventEndPoint = 'ApiEvents/get_all_events';
const CreateEventEndPoint = 'ApiEvents/save';
const saveEventStatusEndPoint = 'ApiEvents/saveEventStatus';
const deleteNotificationEndPoint = 'ApiNotifications/delete';
const getallcontactsEndPoint = 'ApiEvents/get_all_contacts_of_client';
const getCommonColorEndPoint = 'ApiEvents/getCommonColor';
const getMeetingByIdEndPoint = 'ApiEvents/getById';


const showFile = 'https://system.tqnia.me/files/timeline_files/';
const addCommentToTicketEndPoint='ApiTickets/addComment';

const setNotificationAsReedEndPoint =
    'ApiNotifications/set_notification_status_as_read';
