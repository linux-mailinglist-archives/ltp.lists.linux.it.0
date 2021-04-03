Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A0B3532D5
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Apr 2021 08:37:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC30C3C7748
	for <lists+linux-ltp@lfdr.de>; Sat,  3 Apr 2021 08:37:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78C113C2178
 for <ltp@lists.linux.it>; Sat,  3 Apr 2021 08:37:50 +0200 (CEST)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EDA58601CC5
 for <ltp@lists.linux.it>; Sat,  3 Apr 2021 08:37:49 +0200 (CEST)
Received: by mail-qv1-xf36.google.com with SMTP id o19so3404152qvu.0
 for <ltp@lists.linux.it>; Fri, 02 Apr 2021 23:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JtSN5jZTwv615jJ7CF2MxZx7DZlEyoC42Gbw0hSzLq0=;
 b=utX5PDp1aSxI5FI/yPWvV7kCS0gZ8KRIn4oZhSyzY/3lWQTbpeXTuUS04YTXcv3dRF
 uNX8mhWA/HKcnzY7gujhZCxudgGy+nyxl8op7Xf96Ppnfljb+meIXg3bWj30/5U28COu
 vknkdHfGA07LXPoYF4QpIehgYOf2rxTPDG7wTA4kJPMN1otFFYQWOeMBmb+HSeVYPzkb
 erBMRlhPnaN+QdY8sLcUVsJMdYvHML8JNZOy2Cu3yMjhDw1i00Ygelo20a6J7IPdcJx2
 3XSzPExWBGW1/+ht8pOBDko0VvNH85jQy0xqJ5D/h/+ctsZFuP5h3c79Lr/Y+DNWHwgQ
 ONGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JtSN5jZTwv615jJ7CF2MxZx7DZlEyoC42Gbw0hSzLq0=;
 b=GY81lEC25SVCdPvTUApmtwZNw7i3Pr3f9h8JNc1YG8iv9qiho577MJCqaay0cYw3I6
 bhvN4BfqVP2c5fGap0kMl3kot9Mrcxv4wlsenfWg3siooAU5e0YdAhbgHCP4XVg7FVBV
 K1Uhss0Dv7NY3RUqamiqpk6JOP6mklpVW2oFmihrZTAJSimo6CsWR4eEvRb3ZPUTwjMp
 jeTjIle8UsfVm9URSHaDOEBavpXhe49SbneOhF6j0eDFmBmLgIXzP+BGq48CNJuP6C8s
 nyiM7FkL2lYVbf5gqutR0EvCCX2+y+qvzwZZJrJ3CCUs02nZrhqeYr1Qg+WrvRTcP+OB
 P1MQ==
X-Gm-Message-State: AOAM530Gk8D28J8s14DaF/PufHcAabrAmHjavZTV+nbdMECYy1ss8i0g
 0hREmRIhBs3KBiSf/b+vhoYQ/W6CcOUpGEqeZ3Kn+rp3umWTeQ==
X-Google-Smtp-Source: ABdhPJzKf8ZbK4BSy1y0nEadiFMNhueCX/zXdaB1UymnxywoqoxhnjsZRNlhJNOag8vMRAMKsBuPyD6AlwqYvynIKyQ=
X-Received: by 2002:a05:6214:1870:: with SMTP id
 eh16mr15796378qvb.23.1617431868499; 
 Fri, 02 Apr 2021 23:37:48 -0700 (PDT)
MIME-Version: 1.0
From: Vinay Kumar <vinay.m.engg@gmail.com>
Date: Sat, 3 Apr 2021 12:07:37 +0530
Message-ID: <CANUMPcXNUv6gBeguaX+rDjr=1uUXs2kuCcZYYuyzufgLn=dbcg@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] TBROK: Test killed by SIGSEGV" with adjtimex02.c
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0508479716=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0508479716==
Content-Type: multipart/alternative; boundary="000000000000f8698105bf0bb333"

--000000000000f8698105bf0bb333
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Below list of tests are failing with error message "BROK: Test killed by
SIGSEGV"


   1.     adjtimex02
   2.     getitimer02
   3.     getrusage02
   4.     msgctl04
   5.     setitimer02
   6.     shmctl02



Further analysis found that the root cause of failures are due to
"Cannot access memory at address 0xffffffff".

$cat getitimer02.c
/* call with a bad address */
TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));

#Debugging on image gives

Breakpoint 2, __getitimer (which=ITIMER_REAL, curr_value=0xffffffff) at
../sysdeps/unix/sysv/linux/getitimer.c:33
33 ../sysdeps/unix/sysv/linux/getitimer.c: No such file or directory.
(gdb) n
50 in ../sysdeps/unix/sysv/linux/getitimer.c
(gdb) p curr_value
$3 = (struct itimerval *) 0xffffffff
(gdb) p *curr_value
Cannot access memory at address 0xffffffff

Please let us know whether we need to handle SIGSEGV in above listed
testcases or we need to work on glibc for the fix.

This behavior is observed with glibc-2.32 version and above.

Regards,
Vinay

--000000000000f8698105bf0bb333
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:trebuchet ms,sans-serif" class=
=3D"gmail_default"><font size=3D"2"></font></div><div class=3D"gmail_defaul=
t" style=3D"font-family:trebuchet ms,sans-serif"><font size=3D"2">Hi Team,<=
br><br>Below list of tests are failing with error message &quot;BROK: Test =
killed by SIGSEGV&quot;<br><br></font><ol><li><font size=3D"2">=C2=A0 =C2=
=A0 adjtimex02</font></li><li><font size=3D"2">=C2=A0 =C2=A0 getitimer02</f=
ont></li><li><font size=3D"2">=C2=A0 =C2=A0 getrusage02</font></li><li><fon=
t size=3D"2">=C2=A0 =C2=A0 msgctl04</font></li><li><font size=3D"2">=C2=A0 =
=C2=A0 setitimer02</font></li><li><font size=3D"2">=C2=A0 =C2=A0 shmctl02</=
font></li></ol><font size=3D"2"><br><br>Further analysis found that the roo=
t cause of failures are due to<br>&quot;Cannot access memory at address 0xf=
fffffff&quot;.<br><br>$cat getitimer02.c =C2=A0<br>/* call with a bad addre=
ss */<br>TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));<br><br>#Debu=
gging on image gives<br><br>Breakpoint 2, __getitimer (which=3DITIMER_REAL,=
 curr_value=3D0xffffffff) at ../sysdeps/unix/sysv/linux/getitimer.c:33<br>3=
3 ../sysdeps/unix/sysv/linux/getitimer.c: No such file or directory.<br>(gd=
b) n<br>50 in ../sysdeps/unix/sysv/linux/getitimer.c<br>(gdb) p curr_value<=
br>$3 =3D (struct itimerval *) 0xffffffff<br>(gdb) p *curr_value<br>Cannot =
access memory at address 0xffffffff<br><br>Please let us know whether we ne=
ed to handle SIGSEGV in above listed testcases or we need to work on glibc =
for the fix.<br><br>This behavior is observed with glibc-2.32 version and a=
bove.<br><br>Regards,<br>Vinay</font></div></div>

--000000000000f8698105bf0bb333--

--===============0508479716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0508479716==--
