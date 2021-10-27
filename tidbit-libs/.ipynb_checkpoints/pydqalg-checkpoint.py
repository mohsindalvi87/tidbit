


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
    def __init__( self, s=0.0, v=[0.0,0.0,0.0] ):
        self.s = float(s)
        self.v = np.copy(v).astype(float)

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
    
    def mmatL(self):
        return np.vstack(( np.hstack(( self.s, -self.v.T )), np.hstack(( \
               self.v.reshape(3,1), self.s*np.eye(3) + v2mskew(self.v) )) ))
    
    def mmatR(self):
        return np.vstack(( np.hstack(( self.s, -self.v.T )), np.hstack(( \
               self.v.reshape(3,1), self.s*np.eye(3) - v2mskew(self.v) )) ))

    def conj(self):
        return Quat( self.s, -self.v )
    
    def norm(self):
        return np.sqrt( self.s*self.s + np.sum(self.v*self.v) )
    
    def unit(self):
        qnorm = self.norm()
        is_eps = qnorm < 1e-5
        return Quat(0, [0,0,0]) if is_eps==True else (1/qnorm)*self
    
    def inv(self):
        sumsquare = self.s*self.s + np.sum(self.v*self.v)
        is_eps = sumsquare < 1e-9
        return Quat(0, [0,0,0]) if is_eps==True else (1/sumsquare)*self.conj()

    def dot(self, p):
#         return 0.5 * ( p.conj()*q + q.conj()*p )
        return (self.p*p.s + np.dot(self.v,p.v), np.zeros(3) )
        
    def cross(self, p):
#         return 0.5 * ( p*q - q.conj()*p.conj() )
        return (0, self.s*p.v + p.s*self.v + np.cross(self.v,p.v) )
    
    def adj(self, pvec):
        return self * Quat(0, pvec) * self.conj()
    
    def q2axisangle(self):
        u = self.unit()
        angle = np.arccos( 2*u.s*u.s - 1 )  # cos(2a) = 2(cos a)^2 - 1
        is_eps = np.sin(angle/2) ** 2 < 1e-8
        axis = np.array([0,0,0]) if is_eps==True  else u.v / np.sin(angle/2)
        return axis, angle
    
    def q2rotmat(self):
        u = self.unit();    uvT, uv = np.meshgrid(u.v, u.v)
#         ra=2*(uvT*uv);  rb=(2*u.s*u.s-1)*np.eye(3);  rc=2*u.s*v2mskew(u.v)
#         print(ra, rb, rc)
        return 2 * np.multiply(uvT, uv) + (2*u.s*u.s - 1) * np.eye(3) \
                + (2 * u.s * v2mskew(u.v))
    
    def q2YPR(self):
        R = self.q2rotmat()
        return rotmat2YPR(R)
    

    def getpolar(self):
        # from https://math.stackexchange.com/questions/1496308/how-can-i-express-a-quaternion-in-polar-form
        qnorm = self.norm()  # quatnorm
        if qnorm > 1e-6: 
            vnorm = Quat(v=self.v).norm()  # vecnorm
            theta = np.arctan2(vnorm/qnorm, self.s/qnorm)
            vec = np.array([0,0,0]) if vnorm < 1e-9 else 1/vnorm * self.v
            return theta, vec
        else:
            return 0, [0,0,0]
    
    def exp(self):
        qnorm = self.norm()  # quatnorm
        if qnorm > 1e-6: 
            vnorm = Quat(v=self.v).norm()  # vecnorm
            es = np.exp(self.s) # scalexp
            s = np.cos(vnorm/qnorm)
            v = [0,0,0] if vnorm < 1e-9 else np.sin(vnorm/qnorm)/vnorm*self.v
            return es * Quat(s, v)
        else:
            return Quat(0, [0,0,0])
        
    def power(self,m):
        qnorm = self.norm()  # quatnorm
        if qnorm > 1e-6: 
            theta, vec = self.unit().getpolar()
            s = np.cos(m * theta)
            v = np.sin(m * theta) * vec  # vec is already self.v/vnorm
#             print(qnorm**m, theta, vec, s, v)
            return (qnorm ** m) * Quat(s, v)
        else:
            return Quat(0, [0,0,0])
        
    def log(self):
        qnorm = self.norm()  # quatnorm
        if qnorm > 1e-6: 
            theta, vec = getpolar(self.unit())
            return Quat(np.log(qnorm), theta*vec)
        else:
            return Quat(0, [0,0,0])
        

        
def q_iden():
    return Quat( s=1 )


##########################################


def axisangle2q(axis, angle):
#     axis = np.array(axis).astype(float)
#     print(axis, axis*axis, sum(axis*axis))
#     axis *= 1/np.sqrt(sum(axis*axis))
#     print(axis, angle/2)
#     return Quat(np.cos(angle/2), np.sin(angle/2)*axis)
    return (Quat(s=np.cos(angle/2)) + np.sin(angle/2)*(Quat(v=axis).unit()) )

def rotmat2q(R):
    R = np.array(R)
    s = np.sqrt( R[0,0] + R[1,1] + R[2,2] + 1 ) / 2
    print(s)
    v0 = (R[2,1]-R[1,2]) / (2*s)
    v1 = (R[0,2]-R[2,0]) / (2*s)
    v2 = (R[1,0]-R[0,1]) / (2*s)
    return Quat(s, [v0,v1,v2])
    
def YPR2q(y, p, r):
    Cr = np.cos(r) ;  Cp = np.cos(p) ;  Cy = np.cos(y)
    Sr = np.sin(r) ;  Sp = np.sin(p) ;  Sy = np.sin(y)    
    return Quat( Cy*Cp*Cr-Sy*Sp*Sr, [ Sy*Cp*Cr-Cy*Sp*Sr, \
                  Cy*Sp*Cr-Sy*Cp*Sr, Cy*Cp*Sr-Sy*Sp*Cr ] ) 

def YPR2rotmat(y, p, r):
    Cr = np.cos(r) ; Cp = np.cos(p) ; Cy = np.cos(y)
    Sr = np.sin(r) ; Sp = np.sin(p) ; Sy = np.sin(y)
    return np.array([ [Cr*Cp, Cr*Sp*Sy-Sr*Cy, Cr*Sp*Cy+Sr*Sy],
                      [Sr*Cp, Sr*Sp*Sy+Cr*Cy, Sr*Sp*Cy-Cr*Sy],
                      [  -Sp,          Cp*Sy,          Cp*Cy] ]) - np.eye(3)

def rotmat2YPR(R):
    y = np.arctan2( R[2,1], R[2,2] )
    p = np.arctan2( -R[2,0], np.sin(y)*R[2,1] + np.cos(y)*R[2,2] )
    r = np.arctan2( R[1,0], R[0,0] )
#     p = np.arcsin( -R[2,0])
    return y, p, r



##########################################


class DualQuat(Quat):
    def __init__( self, Re = Quat(1, [0,0,0]), Du = Quat(0, [0,0,0]) ):
        self.Re = Re  # super().__init__(in_Re)
        self.Du = Du  # super().__init__(in_Du)
    
    def __repr__(self):
        return 'DualQuat(Quat(%f, [%f, %f, %f])\n \
        + \u03B5 Quat(%f, [%f, %f, %f]))' % \
            (self.Re.s, self.Re.v[0], self.Re.v[1], self.Re.v[2], \
             self.Du.s, self.Du.v[0], self.Du.v[1], self.Du.v[2],)
        
    def __str__(self):
        return 'DualQuat(Quat(%f, [%f, %f, %f])\n \
        + \u03B5 Quat(%f, [%f, %f, %f]))' % \
            (self.Re.s, self.Re.v[0], self.Re.v[1], self.Re.v[2], \
             self.Du.s, self.Du.v[0], self.Du.v[1], self.Du.v[2],)
        
    def __add__(self, p):
        return DualQuat(self.Re+p.Re, self.Du+p.Du)
        
    def __sub__(self, p):
        return DualQuat(self.Re-p.Re, self.Du-p.Du)
        
    def __mul__(self, p):
        real = self.Re*p.Re
        dual = self.Re*p.Du + self.Du*p.Re
        return DualQuat( real, dual )
    
    def __rmul__(self, scalar):
        return DualQuat( scalar*self.Re, scalar*self.Du )
        
    def dconj(self):
        return DualQuat( self.Re, -1*self.Du )
    
    def qconj(self):
        return DualQuat( self.Re.conj(), self.Du.conj() )
    
    def dqconj(self):
        return DualQuat( self.Re.conj(), -1*self.Du.conj() )
    
    def inv(self):
        Rpart = self.Re.inv()
        Dpart = -1 * Rpart * self.Du * Rpart
        return DualQuat( Rpart, Dpart )

    def adj(self, pvec):
        return self * Dual( q_iden(), Quat(0, pvec) ) * self.qconj()

    def swap(self):
        return DualQuat( self.Du, self.Re )
    
    def dq2angleaxisdist(self):
        angle, axis = self.Re.angleaxis()
        tran = Quat( 2 * self.Du * self.Re.conj() ).v
        return angle, axis, tran
    
#     def norm(self):
#         return np.sqrt(sum(self.q*self.q))
#     
#     def unit(self):
#         return DualQuat(self.q / self.norm())
    
    def dq2htm(self):
        tv = Quat( 2 * self.Du * self.Re.conj() ).v
        row_123 = np.hstack(( self.Re.q2rotmat(), tv ))
        return np.vstack(( row_123, np.array([0, 0, 0, 1]) ))
    
def dq_iden():
    return DualQuat( q_iden(), Quat(0, [0,0,0]) )

    
##########################################

def rqtq2dq(rotq, transq):
    dualpart = (0.5 * transq) * rotq.conj()
    return DualQuat( Rotq, dualpart )
    
def htm2dq(T):
    tq = Quat(np.hstack(( 0, T[0:4,3] )))
    rq = Quat.rot2q( T[0:4,0:4] )
    return DualQuat.rqtq2dq( rq, tq )



















##########################################



# class SensorModel(DualQuat):
#     def __init__(self, ):
#         self.q=0
#         self.b=0
#         self.p_dt2=0
        
#     def make_cov_mat(self, file):
#         temp=file
#         # add code for making cov matrix from stationary sensor csv data
    
#     def make_state_vec(self, dT):
# #         return hstack(( self.p(dT), self.p_dt(dT), self.p_dt2(dT), q))
#         return hstack(( self.q(dT), self.b(dT), self.p_dt2(dT), q))
    
#     def make_noise_covmat(self, acc_covvec, gyr_covvec):
#         diag = np.stack(( acc_covvec, acc_covvec, gyr_covvec ))
#         a = np.eye(len(diag))
#         return np.fill_diagonal(a, diag )

    
    
    
# class EKF(SensorModel):
#     def __init__(self, in_Gcov, in_Acov, ):
#         return in_Gcov
    
#     def make_F_mat(self, T):
    
#     def time_update():
        
        
#     def meas_update():























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
        
            
            
            

            
            
            