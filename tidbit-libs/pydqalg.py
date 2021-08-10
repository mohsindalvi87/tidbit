


import sympy as sym
sym.init_printing() # for LaTeX formatted output

import numpy as np
np.set_printoptions(suppress=True)

import scipy as sp


##########################################


def C(p):  return np.cos(p);

def S(p):  return np.sin(p);

def D2R(p): return p * np.pi / 180

def R2D(p): return p * 180 / np.pi

def v2mskew(v):
    return np.array([ [0, -v[2],v[1]], [v[2],0,-v[0]], [-v[1],v[0],0] ])


##########################################


class Quat:
    def __init__( self, in_s=1, in_v=[0,0,0] ):
        self.s = in_s
        self.v = np.copy(in_v).T

    def __repr__(self):
        return 'Quat(%f, [%f, %f, %f])' % \
            ( self.s, self.v[0], self.v[1], self.v[2] )
        
    def __str__(self): # for printing
        return 'Quat(%f, [%f, %f, %f])' % \
            ( self.s, self.v[0], self.v[1], self.v[2] )

    def __getitem__(self, i): # for indexing
        return Quat([ self.s[i], [self.v[i,0],self.v[i,1],self.v[i,2]] ])
   
    def __add__(self, p):
        return Quat( self.s+p.s, self.v+p.v )
    
    def __sub__(self, p):
        return Quat( self.s-p.s, self.v-p.v )
    
    def __mul__(self, p):
        scal = self.s*p.s - np.inner(self.v,p.v)
        vect = self.s*p.v + p.s*self.v + np.cross(self.v,p.v)
        return Quat( scal, vect )
    
    def __rmul__(self, scalar):
        return Quat( scalar*self.s, scalar * self.v )

    def conj(self):
        return Quat( self.s, -self.v )
    
    def norm(self):
        return np.sqrt( self.s*self.s + np.sum(self.v*self.v) )
    
    def unit(self):
        qnorm = self.norm()
        if qnorm > 1e-5:
#             return Quat( self.s/qnorm, self.v/qnorm )
            return (1/qnorm) * self
        else:
            return Quat( 0, [0,0,0] )
    
    def inv(self):
        sumsquare = self.s*self.s + np.sum(self.v*self.v)
        if sumsquare > 1e-9:
            return (1/sumsquare) * self.conj()
        else:
            return Quat( 0, [0,0,0] )

    def dot(p):
        return 0.5 * ( p.conj()*q + q.conj()*p )
        
    def iden():
        return Quat([1, 0, 0, 0])
    
    def q2axisangle(self):
        u = self.unit()
        angle = np.arccos( 2*u.s*u.s - 1 )  # cos(2a) = 2(cos a)^2 - 1
        is_eps = np.sin(angle/2) ** 2 < 1e-8
        axis = np.array([0,0,0]) if is_eps==True  else u.v / np.sin(angle/2)
        return axis, angle
    
    def q2rotmat(self):
        u = self.unit()
        return 2 * np.dot(u.v.T, u.v) + (2*u.s*u.s - 1) * np.eye(3) \
                + (2 * u.s * v2mskew(u.v))
    
    def q2rollpitchyaw(self):
        R = self.q2rotmat()
        return rotmat2rollpitchyaw(R)


##########################################


def rotmat2q(R):
    s = np.sqrt( R[0,0] + R[1,1] + R[2,2] + 1 ) / 2
    v0 = (R[2,1] - R[1,2] ) / 2
    v1 = (R[0,2] - R[2,0] ) / 2
    v2 = (R[1,0] - R[0,1] ) / 2
    return Quat(s, [v0, v1, v2])

def rotmat2rollpitchyaw(R):
    r = np.arctan2( R[1,0], R[0,0] )
    y = np.arctan2( R[2,1], R[2,2] )
    p = np.arcsin( -R[2,0])
    return r, p, y
    
def rollpitchyaw2q(r, p, y):
    Cr = np.cos(r) ;  Cp = np.cos(p) ;  Cy = np.cos(y)
    Sr = np.sin(r) ;  Sp = np.sin(p) ;  Sy = np.sin(y)    
    return Quat( Cy*Cp*Cr-Sy*Sp*Sr, [ Sy*Cp*Cr-Cy*Sp*Sr, \
                  Cy*Sp*Cr-Sy*Cp*Sr,  Cy*Cp*Sr-Sy*Sp*Cr ] ) 

def rollpitchyaw2rotmat(r, p, y):
    Cr = np.cos(r) ; Cp = np.cos(p) ; Cy = np.cos(y)
    Sr = np.sin(r) ; Sp = np.sin(p) ; Sy = np.sin(y)
    return np.array([ [Cr*Cp, Cr*Sp*Sy-Sr*Cy, Cr*Sp*Cy+Sr*Sy],
                      [Sr*Cp, Sr*Sp*Sy+Cr*Cy, Sr*Sp*Cy-Cr*Sy],
                      [  -Sp,          Cp*Sy,          Cp*Cy] ]) - np.eye(3)

# def scal2quat(scalar):
#     return Quat(scalar*np.eye(4))

# def quat2htm(q):
#     q = np.array(q).T
#     return  0 - np.eye(3) + 2 * np.array( [
#         [ q[1]*q[1]+q[0]*q[0], q[1]*q[2]-q[0]*q[3], q[1]*q[3]+q[0]*q[2] ],
#         [ q[2]*q[1]+q[0]*q[3], q[2]*q[2]+q[0]*q[0], q[2]*q[3]-q[0]*q[1] ],
#         [ q[3]*q[1]-q[0]*q[2], q[3]*q[2]+q[0]*q[1], q[3]*q[3]+q[0]*q[0] ] ] )


##########################################


class DualQuat:
    def __init__( self, p = [1, 0, 0, 0, 0, 0, 0, 0] ):
        self.q = np.array(p, dtype=float)
        self.R = Quat(p[0:4])
        self.D = Quat(p[4:8])
    
    def __repr__(self):
        return 'DualQuat[%f, %f, %f, %f; %f, %f, %f, %f]' % \
            (self.q[0], self.q[1], self.q[2], self.q[3], \
             self.q[4], self.q[5], self.q[6], self.q[7],)
        
    def __str__(self):
        return 'DualQuat[%f, %f, %f, %f; %f, %f, %f, %f]' % \
            (self.q[0], self.q[1], self.q[2], self.q[3], \
             self.q[4], self.q[5], self.q[6], self.q[7],)
        
    def __add__(self, p):
        return DualQuat(self.q + p.q)
        
    def __sub__(self, p):
        return DualQuat(self.q - p.q)
        
    def __mul__(self, p):
        real = self.R * p.R
        dual = self.R * p.D + self.D * p.R
        return DualQuat(np.hstack(( real.q, dual.q )))
    
    def __rmul__(self, scalar):
        return DualQuat( scalar * self.q )
        
    def dconj(self):
        return DualQuat( np.hstack(( self.R.q, -self.D.q )) )
    
    def qconj(self):
        return DualQuat( np.hstack(( self.R.q, self.D.conj().q )) )
    
    def dqconj(self):
        return DualQuat( np.hstack(( self.R.q, -self.D.conj().q )) )
    
    def inv(self):
        Rpart = self.R.inv()
        Dpart = Rpart.smult(-1) * self.D * Rpart
        return DualQuat( np.hstack(( Rpart.q, Dpart.q )) )
    
    def swap(self):
        return DualQuat( np.hstack(( self.D.q, self.R.q )) )
    
    def angleaxistran(self):
        angle, axis = self.R.angleaxis()
        tran = Quat( 2 * self.D.q * self.R.conj() ).q[1:4]
        return angle, axis, tran
    
#     def norm(self):
#         return np.sqrt(sum(self.q*self.q))
#     
#     def unit(self):
#         return DualQuat(self.q / self.norm())
    
    def dq2htm(self):
        tv = Quat( 2 * self.D.q * self.R.conj() ).q[1:4]
        row_123 = np.hstack(( np.self.R.q2rotmat(), tv ))
        return np.vstack(( row_123, np.array([0, 0, 0, 1]) ))
        
    def dqiden():
        return DualQuat([1, 0, 0, 0, 0, 0, 0, 0])

    
##########################################

    
def join(Rpart, Dpart):
    return DualQuat( np.hstack(( Rpart, Dpart )) )
    
def rqtq2dq(rotq, transq):
    dualpart = (0.5 * transq) * rotq.conj()
    return join( Rotq.q, dualpart.q )
    
def htm2dq(T):
    tq = Quat(np.hstack(( 0, T[0:4,3] )))
    R = Quat.rot2q( T[0:4,0:4] )
    return DualQuat.rottrans2dq( R, tq )


##########################################


def JHTM(p): #(a, alpha, d, theta):
    Ca = np.cos(p[1]) ; Ct = np.cos(p[3])
    Sa = np.sin(p[1]) ; St = np.sin(p[3])
    return np.array([ [Ct, -St*Ca,  St*Sa, p[0]*Ct], \
                      [St,  Ct*Ca, -Ct*Sa, p[0]*St], \
                      [ 0,     Sa,     Ca,    p[2]], \
                      [ 0,      0,      0,       1] ])

def JDQ(p): #(a, alpha, d, theta):
    B1 = sym.cos(p[3]/2)*sym.cos(p[1]/2)
    B2 = sym.cos(p[3]/2)*sym.sin(p[1]/2)
    B3 = sym.sin(p[3]/2)*sym.sin(p[1]/2)
    B4 = sym.sin(p[3]/2)*sym.cos(p[1]/2)
    return DualQuat([ B1, B2, B3, B4, (-p[2]*B4-p[0]*B2)/2, (-p[2]*B3 
           +p[0]*B1)/2, (p[2]*B2+p[0]*B4)/2, (p[2]*B1-p[0]*B3)/2 ])
    
class SerialRobot:
    def __init__(self, A):
        AA =  np.array(A)
        self.DH_homepos = np.array(AA[:,1:], dtype=float)
        self.N = np.shape(self.DH_homepos)[0]
        self.jtflags = np.array([ [0, 0, AA[i,0]=='P', AA[i,0]=='R'] \
                        for i in range(self.N) ]) #[0,0,0,1] for revolute
# #         self.JPI = np.array([[2,3][AA[i,0]=='R'] for i in range(self.N)])
        self.modifyJP(np.zeros(self.N))

        
    def modifyJP(self, newjtparams):
#         for i in range(N):
#             self.DH[self,JPI] = self.DH_homepos[i, self.JPI[i]] + newjtparams[i]
        self.DH = self.DH_homepos + np.diag(newjtparams) @ self.jtflags
        self.FKDQ()
        self.FKHTM()

    def FKDQ(self):
#        self.DQ_iprev = np.array(JDQ(self.DH[0,:]).q, dtype=float)
#        for i in range(1,self.N):
#            self.DQ_iprev = np.vstack(( self.DQ_iprev, \
#                        JDQ(self.DH[i,:]).q ))
        self.DQ_iprev = np.array([JDQ(self.DH[i,:]).q for i in range(self.N)])
        self.DQ_i0 = np.array([self.DQ_iprev[0]])
        for i in range(self.N-1):
            temp = DualQuat(self.DQ_i0[i,:]) * DualQuat(self.DQ_iprev[i+1,:])
            self.DQ_i0 = np.concatenate( (self.DQ_i0, np.array([temp.q], \
                        dtype=float)), axis=0)

        self.DQ_Ni = np.array([self.DQ_i0[-1]])
        for i in range(self.N-1):
            temp = DualQuat(self.DQ_i0[i,:]).inv() * DualQuat(self.DQ_Ni[i,:])
            self.DQ_Ni = np.concatenate(( self.DQ_Ni, np.array([temp.q], \
                        dtype=float)), axis=0)
        #np.array([self.DQ_iprev[0]])

    def FKHTM(self):
#        self.T_iprev = np.array([ JHTM(self.DH[0,:]) ])
#        for i in range(1,self.N):
#            self.T_iprev = np.concatenate(( self.T_iprev, \
#                        np.array([JHTM(self.DH[i,:])]) ), axis=0)
        self.T_iprev = np.array([ JHTM(self.DH[i,:]) for i in range(self.N) ])

#        self.T_i0 = np.array([ self.T_i0[- 1] for i in range(self.N) ])
        self.T_i0 = np.array([self.T_iprev[0,:,:]])
        for i in range(self.N-1):
            temp = self.T_i0[i,:,:] @ self.T_iprev[i+1,...]
            self.T_i0 = np.concatenate( (self.T_i0, np.array([temp])), axis=0)

        self.T_Ni = np.array([self.T_i0[-1,:,:]])
        for i in range(self.N-1):
            temp = np.linalg.inv(self.T_iprev[i,:,:]) @ self.T_Ni[i,:,:]
            self.T_Ni = np.concatenate( ( self.T_Ni, np.array([temp])), axis=0)
        
            
            
            

