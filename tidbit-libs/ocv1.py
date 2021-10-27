##########################################



import threading
# import time, io
import os, glob


import numpy as np
import pandas as pd

import cv2
from cv2 import aruco # if error, then do: pip install opencv-contrib-python

import matplotlib.pyplot as plt



class MDcharuco:
    
    def __init__(self, rows, cols, sqr_len, marker_len, aruco_dict):
        self.dict = aruco_dict
        self.board = aruco.CharucoBoard_create(cols, rows, \
                                       sqr_len, marker_len, self.dict)
        

    def save_board(self, filename):
        imboard = self.board.draw((4*5*3*7*self.cols, 4*5*3*7*self.rows))
        cv2.imwrite(filename, imboard)
        
        
    def view_board():
        imboard = self.board.draw((4*5*3*7*self.cols, 4*5*3*7*self.rows))
        fig = plt.figure(figsize=(self.cols, self.rows)) 
        ax = fig.add_subplot(1,1,1) 
        plt.imshow(imboard, cmap = mpl.cm.gray, interpolation = "nearest") 
#         plt.savefig(img_name) ; 
        ax.axis("off") ;  plt.grid() ;  plt.show() 


    
    
    
    
    
# GET IMAGE FRAMES FROM VIDEO
def jpgs_from_vid(video, skips, imgs_loc, img_prefix):
    if os.path.isfile(video):
        vidcap = cv2.VideoCapture(video)
        print("Video", video, "obtained.")
        if imgs_loc[-1] != "/":  # add / at end of imgs_loc string if absent
            imgs_loc += "/";
        if not os.path.isdir(imgs_loc):  # create imgs_loc if it doesn't exist 
            os.mkdir(imgs_loc) ;  print("Created", imgs_loc, "folder.")

        frameN = 0;  imgN = 0
        ret, image = vidcap.read()
        while ret:
            ret, image = vidcap.read()
            if frameN % skips == 0:  
                cv2.imwrite("%s%s_%04d.jpg" % (imgs_loc, img_prefix, \
                                               frameN), image)
                imgN += 1
            if cv2.waitKey(10) == 27:  # exit if Escape is hit
                break
                print("'ESC' key pressed. Aborting frame extraction.")
            frameN += 1
        
        print(imgN, "/", frameN, "frames placed in", imgs_loc, "folder.")
        vidcap.release()
        cv2.destroyAllWindows()
    else:
        print("Video", video, "not found.")





class MDcamera:
    
    def __init__(self, cam_id, cam_name, img_w, img_h):
        self.id = cam_id  # Cam ID used while connecting thru usb
        self.name = cam_name  # cam name string (prefix for Cam param CSVs)
        self.w = img_w  # frame image width
        self.h = img_h  # frame image height
        
        
    def capture(self, mirror=False, saveparams=0):
        # put saveparams=0 if you don't want to save video
        # otherwise put saveparams[0]=fourcc code, 
        # saveparams[1]=video name, saveparams[2]=frame rate
        if type(saveparams) == list:
            fourcc = cv2.VideoWriter_fourcc(*saveparams[0])
            out = cv2.VideoWriter( saveparams[1], fourcc, saveparams[2], \
                                   (self.w,self.h) )
        
        cap = cv2.VideoCapture(self.id)
        print("Starting camera", self.name, "with id", self.id, "...")
        while(cap.isOpened()):
            ret, frame = cap.read()
            if ret==True:
                if mirror==True:
                    frame = cv2.flip(frame, 1)
                cv2.imshow('frame',frame)
                if type(saveparams) == list:
                    out.write(cv2.flip(frame,1))
                if cv2.waitKey(1) & 0xFF == ord('q'):
                    break
            else:
                break
        cap.release()
        if type(saveparams)== list:
            out.release()
            print("Saved video file", saveparams[1])
        cv2.destroyAllWindows()
    

    def charuco_calib(self, charu, imgs_loc, name_start, name_end):
        # code adapted from https://mecaruco2.readthedocs.io/en/latest/
        # notebooks_rst/Aruco/sandbox/ludovic/aruco_calibration_rotation.html
        print("Calibrating camera", self.name, "with id", self.id, "...")
        imglist = [ imgs_loc + f for f in os.listdir(imgs_loc) if \
                    f.startswith(name_start) and f.endswith(name_end) ]
        # imgsize = cv2.imread(imglist[0]).shape[:2]
        print("collected", len(imglist), "images from", imgs_loc)
        
        # Identify charuco ids and corners
        allCorners = [] ;  allIds = [] ;  decimator = 0
        criteria = (cv2.TERM_CRITERIA_EPS+cv2.TERM_CRITERIA_MAX_ITER, 100,1e-5)
        for im in imglist:
            gray = cv2.cvtColor(cv2.imread(im), cv2.COLOR_BGR2GRAY)
            corners, ids, rej_pts = cv2.aruco.detectMarkers(gray, charu.dict)
            if len(corners) > 0:
                for c in corners:  # subpixel detection
                    cv2.cornerSubPix(gray, c, winSize=(3,3),
                                     zeroZone=(-1,-1), criteria=criteria)
                chRet, chCorners, chIDs = cv2.aruco.interpolateCornersCharuco( \
                                corners, ids, gray, charu.board)
                if ( chCorners is not None and chIDs is not None and \
                     len(chCorners) > 3 and decimator % 1 == 0 ) :
                    allCorners.append( chCorners )
                    allIds.append( chIDs )
            decimator+=1
        print("found", len(allIds), "charuco sets for calibration.")
        
        # Calibrate camera using detected corners
        camMatInit = np.array([ [2000, 0, self.w/2], \
                                [0, 2000, self.h/2], [0, 0, 1] ])
        distorInit = np.zeros((5,1))
        flags = (cv2.CALIB_USE_INTRINSIC_GUESS + cv2.CALIB_RATIONAL_MODEL)     
        criteria = (cv2.TERM_CRITERIA_EPS & cv2.TERM_CRITERIA_COUNT,10000,1e-9)
        
        (ret, self.camMat, self.distor, rvecs, tvecs, stdevIntr, stdevExtr, \
         perViewErrors)  =  cv2.aruco.calibrateCameraCharucoExtended( \
                allCorners, allIds, charu.board, (self.w,self.h), \
                camMatInit, distorInit, flags=flags, criteria=criteria)
        
#         print("distCoeffs =\n", np.ravel(self.distor)) # k1,k2,p1,p2,k3
        np.savetxt(self.name+"_camMat.csv", self.camMat)
        np.savetxt(self.name+"_distor.csv", self.distor)
        print("Saved", self.name+"_camMat.csv and", self.name+"_camMat.csv")
#         return cam_mtrx, distor_coefs



    def check_calib(img):
        plt.figure()
        frame = cv2.imread(img)
        img_undist = cv2.undistort(frame, self.camMat, self.distor, None)
        plt.subplot(121)
        plt.imshow(frame);  plt.title("Raw image");  plt.axis("off")
        plt.subplot(212)
        plt.imshow(img_undist);  plt.title("Corrected image");  plt.axis("off")
        plt.show()


    def get_aruco_pose(img, aruco_dict, aruco_len, show_axis=False):
        frame = cv2.imread(img)
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
#         aruco_dict = aruco.Dictionary_get(aruco.DICT_6X6_250)
        params =  aruco.DetectorParameters_create()
        
        corners, ids, rejPts = aruco.detectMarkers(gray, aruco_dict, \
                                                   parameters=params)
        rvecs, tvecs, trash = aruco.estimatePoseSingleMarkers( \
                                 corners, aruco_len, self.camMat, self.distor)
        print(rvecs, tvecs)
        imaxis = aruco.drawDetectedMarkers(frame.copy(), corners, ids)
        axis_len = 0.75 * aruco_len
        for i in range(len(tvecs)):
            imaxis = aruco.drawAxis(imaxis, self.camMat, self.distor, \
                                    rvecs[i], tvecs[i], axis_len)
        
        data=pd.DataFrame( data=tvecs.reshape(-1,3), \
                           columns=["tx","ty","tz"], 
                           index=ids.flatten() )
        data.index.name="markers"
        data.sort_index(inplace=True)

        if show_axis == True:
            plt.figure()
            ax= fig.add_subplot(1,3,1) ;  plt.imshow(frame)
            ax= fig.add_subplot(1,3,2) ;  plt.imshow(imaxis)
            ax= fig.add_subplot(1,3,3) ;  ax.set_aspect("equal")
            plt.plot(data.tx[:10], data.ty[:10],"or-");  plt.grid()
            plt.show()

            
            
            
            
            
            
            
            
            
if __name__ == '__main__':
#     main()
#     play_vid('./ches-cali-leno-1/output.mp4')
#     jpgs_from_vid('./flow.mp4', 1, './flow', 'im')
    cam1 = MDcamera( 0, "Qu1", 640, 480 )
    print(cam1)
