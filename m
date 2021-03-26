Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD034A2FC
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 09:11:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E94CC3C5FCB
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 09:11:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9CA533C27AC
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 09:11:32 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id CB9476003CF
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 09:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616746289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JbkaNZYJUI3RvkSHCAJKXu4hbciE+Nu6qGX+bjKsNzw=;
 b=ZEe/w4lBxtZMUfjJWXbFD9UsXtWKRX+IK8iyw+mN7wn3V4njRj+J3H0DtgzgpirWgwb1Ji
 qU1EOuQ8OXSuffUmUidGj4wdz/L+b2ROn00LCduDaFR7Wfw8UeP9W7yp5bUsz0VnkzV0wn
 qDbogbYnZAmIu8KP2jiS0cn7kOZh5xE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-c6f7uKxpMzOJ6MN9QXpE_Q-1; Fri, 26 Mar 2021 04:11:24 -0400
X-MC-Unique: c6f7uKxpMzOJ6MN9QXpE_Q-1
Received: by mail-yb1-f198.google.com with SMTP id e129so9138923yba.3
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 01:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JbkaNZYJUI3RvkSHCAJKXu4hbciE+Nu6qGX+bjKsNzw=;
 b=E+cay4azorgew6TQARYnFK/0bI3rKynkeRHQo1s9zWnmlBCUThT7Yb6qQfd92WkRE1
 GVq5QSOGlc5vdMhs9cnEG75c08sCOEPy1FXRAJ9lpZmd/8CM3C4mMU3OoEwglD4nFBv1
 OH1FdcBN56jbxjv1HpdCzye7/9tzzF5iqLREbZsWqfhmM8leZ0AO6dymLEieVGbZJTzR
 hIcfyXUrtsj6sXFHJOQCB+/SxfUO2Wplzabfp/xPciqJikI/vsu5NIdKAN+kFagv9iOw
 BTg0P5+zOF46Wu5ogYW+MVU/Me2Owm2r5IuZWkDbXSN793wIoTe8iewrTU61TmSqipTQ
 utag==
X-Gm-Message-State: AOAM532I0igqbHtyy+X3WhZw8PXhHO+ZIAhC/1ulUG9RUW2LRmqzVqEi
 3sdCM6AWysygkbi7y4r6biq5n0Xmjwo3CIk+ixwMqGaY5130+E3sFRDtoZSYOyOhIB2JPrp7Hg5
 Q+mXjDO8zhcfbdO6onGdDLa3jCoY=
X-Received: by 2002:a25:d194:: with SMTP id
 i142mr18009879ybg.110.1616746283759; 
 Fri, 26 Mar 2021 01:11:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+3Y1tSlTSdT9duMMTYmVk13oVT2GwKouvuGI5l8CY9ZHFkV2L8s7+WM9XlUx+HRsj2MXE8vJZYTMyjQXH5V4=
X-Received: by 2002:a25:d194:: with SMTP id
 i142mr18009851ybg.110.1616746283425; 
 Fri, 26 Mar 2021 01:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
 <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
 <20210323162714.t5dm5vbo35vl4t2l@revolver>
 <CAEemH2fnyB_dGzQWUb7SBi9S01vYGXaZBczj2ZwaYF-Rqv9UsA@mail.gmail.com>
 <20210325131545.jwrzhdy474utqjpa@revolver>
In-Reply-To: <20210325131545.jwrzhdy474utqjpa@revolver>
From: Li Wang <liwang@redhat.com>
Date: Fri, 26 Mar 2021 16:11:11 +0800
Message-ID: <CAEemH2fOBjn-HkcrDZAam1YZkKLm1rLwOnG-KoGGjRQH59e3Pg@mail.gmail.com>
To: Liam Howlett <liam.howlett@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0108562603=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0108562603==
Content-Type: multipart/alternative; boundary="000000000000ea7cb305be6c13a2"

--000000000000ea7cb305be6c13a2
Content-Type: text/plain; charset="UTF-8"

Hi Liam,

On Thu, Mar 25, 2021 at 9:16 PM Liam Howlett <liam.howlett@oracle.com>
wrote:

> * Li Wang <liwang@redhat.com> [210325 04:37]:
> > Hi Liam,
> >
> > On Wed, Mar 24, 2021 at 12:27 AM Liam Howlett <liam.howlett@oracle.com>
> > wrote:
> >
> > > Hello Li,
> > >
> > > Thank you for looking at this testcase.
> > >
> > > * Li Wang <liwang@redhat.com> [210317 07:08]:
> > > > Hi Liam, Petr,
> > > >
> > > > Liam Howlett <liam.howlett@oracle.com> wrote:
> > > >
> > > >
> > > > > ...
> > > > > +       if (mprotect(addr - page_size, page_size,
> > > > > +                    PROT_READ|PROT_WRITE|PROT_EXEC)) {
> > > > > +               tst_res(TFAIL, "Cannot mprotect new VMA.");
> > > > > +               return;
> > > > > +       }
> > > > >
> > > >
> > > > We got permission denied here while performing the brk02 on
> > > > x86_64/s390x(kernel-4.18~). After looking at the manual page of
> > > > mprotect(), seems the access issue caused by PROT_EXEC.
> > > >
> > > > "
> > > > POSIX says that the behavior of mprotect() is unspecified if it is
> > > applied
> > > > to a region of memory that was not obtained via mmap(2).
> > > > ...
> > > > Whether  PROT_EXEC has any effect different from PROT_READ
> > > > depends on processor architecture, kernel version, and process state.
> > > > If READ_IMPLIES_EXEC is set in the process's personality flags
> > > > (see personality(2)), specifying PROT_READ will implicitly add
> PROT_EXEC.
> > > > "
> > >
> > >
> > > Unforntunately, dropping the PROT_EXEC causes the VMA behaviour to
> > > change and does not test what this testcase is intended to test.
> > >
> >
> > Yes, I agree with this. But am not sure if Linux take some action on
> > security
> > side to prevent setting PROT_EXEC permission arbitrary.
> >
> >
> > >
> > > Removing the PROT_EXEC and the PROT_WRITE does test what is supposed to
> > > be tested.  Can you verify that this works on the s390x?
> > >
> >
> > Actually just removing the PROT_EXEC then the brk02 can be passed on all
> my
> > platforms.
>
> Just removing the PROT_EXEC invalidates the test.  However, if both
> PROT_EXEC and PROT_WRITE are removed, then the test still does what is
> intended.


> >
> >
> > >
> > > Are you using real hardware to test this or can I use some sort of
> > > emulation to test on my side?
> > >
> >
> > It looks like easily to reproduce.
> >
> > I get failed with both virtual system and bare metal, e.g. the first one
> > is on my Fedora33-workstation. But the worth to say, brk02 passed
> > with raspberry pi3 and pi4.
> >
> > x86_64
> > -------------
> > # virt-what
> > # echo $?
> > 0
> > # uname -r
> > 5.10.22-200.fc33.x86_64
> > # ./brk02
> > tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> > brk02.c:41: TFAIL: Cannot mprotect new VMA
>
>
> This was my test platform.  I also sent it to the Travis CI which passed
> for x86_64.  I will re-examine the accepted code to ensure the cosmetic
> changes didn't invalidate my testing.
>

FWIK, the Travis CI does not run test case, it just compiles/builds LTP
across
many arches/platforms.



>
>
> >
> > x86_64
> > -------------
> > # virt-what
> > kvm
> > # ./brk02
> > tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> > brk02.c:41: TFAIL: Cannot mprotect new VMA
> >
> > s390x
> > -------------
> > # uname -r
> > 5.12.0-rc4.vdso+
> > # virt-what
> > ibm_systemz
> > ibm_systemz-zvm
> > # ./brk02
> > tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> > brk02.c:41: TFAIL: Cannot mprotect new VMA
> >
> >
> > armv7l -- raspberry-pi3
> > -----------------------------
> > # uname  -r
> > 5.4.96-v7.1.el7
> > # ./brk02
> > tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> > brk02.c:56: TPASS: munmap at least two VMAs of brk() passed
> > armv7l -- raspberry-pi4
> > -----------------------------
> > # uname  -rm
> > 5.10.17-v7l+ armv7l
> > # ./brk02
> > tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> > brk02.c:56: TPASS: munmap at least two VMAs of brk() passed
> >
>
> Would you be willing to re-run the tests without both PROT_EXEC and
> PROT_WRITE?
>

Yes, it will always PASS without 'PROT_EXEC|PROT_WRITE'.

-- 
Regards,
Li Wang

--000000000000ea7cb305be6c13a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Liam,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 25, 2021 at 9:16 PM Liam Howlett =
&lt;<a href=3D"mailto:liam.howlett@oracle.com">liam.howlett@oracle.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* Li =
Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redh=
at.com</a>&gt; [210325 04:37]:<br>
&gt; Hi Liam,<br>
&gt; <br>
&gt; On Wed, Mar 24, 2021 at 12:27 AM Liam Howlett &lt;<a href=3D"mailto:li=
am.howlett@oracle.com" target=3D"_blank">liam.howlett@oracle.com</a>&gt;<br=
>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hello Li,<br>
&gt; &gt;<br>
&gt; &gt; Thank you for looking at this testcase.<br>
&gt; &gt;<br>
&gt; &gt; * Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_bla=
nk">liwang@redhat.com</a>&gt; [210317 07:08]:<br>
&gt; &gt; &gt; Hi Liam, Petr,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Liam Howlett &lt;<a href=3D"mailto:liam.howlett@oracle.com" =
target=3D"_blank">liam.howlett@oracle.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ...<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mprotect(addr - page_si=
ze, page_size,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 PROT_READ|PROT_WRITE|PROT_EXEC)) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tst_res(TFAIL, &quot;Cannot mprotect new VMA.&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We got permission denied here while performing the brk02 on<=
br>
&gt; &gt; &gt; x86_64/s390x(kernel-4.18~). After looking at the manual page=
 of<br>
&gt; &gt; &gt; mprotect(), seems the access issue caused by PROT_EXEC.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &quot;<br>
&gt; &gt; &gt; POSIX says that the behavior of mprotect() is unspecified if=
 it is<br>
&gt; &gt; applied<br>
&gt; &gt; &gt; to a region of memory that was not obtained via mmap(2).<br>
&gt; &gt; &gt; ...<br>
&gt; &gt; &gt; Whether=C2=A0 PROT_EXEC has any effect different from PROT_R=
EAD<br>
&gt; &gt; &gt; depends on processor architecture, kernel version, and proce=
ss state.<br>
&gt; &gt; &gt; If READ_IMPLIES_EXEC is set in the process&#39;s personality=
 flags<br>
&gt; &gt; &gt; (see personality(2)), specifying PROT_READ will implicitly a=
dd PROT_EXEC.<br>
&gt; &gt; &gt; &quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Unforntunately, dropping the PROT_EXEC causes the VMA behaviour t=
o<br>
&gt; &gt; change and does not test what this testcase is intended to test.<=
br>
&gt; &gt;<br>
&gt; <br>
&gt; Yes, I agree with this. But am not sure if Linux take some action on<b=
r>
&gt; security<br>
&gt; side to prevent setting PROT_EXEC permission arbitrary.<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Removing the PROT_EXEC and the PROT_WRITE does test what is suppo=
sed to<br>
&gt; &gt; be tested.=C2=A0 Can you verify that this works on the s390x?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Actually just removing the PROT_EXEC then the brk02 can be passed on a=
ll my<br>
&gt; platforms.<br>
<br>
Just removing the PROT_EXEC invalidates the test.=C2=A0 However, if both<br=
>
PROT_EXEC and PROT_WRITE are removed, then the test still does what is<br>
intended.=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Are you using real hardware to test this or can I use some sort o=
f<br>
&gt; &gt; emulation to test on my side?<br>
&gt; &gt;<br>
&gt; <br>
&gt; It looks like easily to reproduce.<br>
&gt; <br>
&gt; I get failed with both virtual system and bare metal, e.g. the first o=
ne<br>
&gt; is on my Fedora33-workstation. But the worth to say, brk02 passed<br>
&gt; with raspberry pi3 and pi4.<br>
&gt; <br>
&gt; x86_64<br>
&gt; -------------<br>
&gt; # virt-what<br>
&gt; # echo $?<br>
&gt; 0<br>
&gt; # uname -r<br>
&gt; 5.10.22-200.fc33.x86_64<br>
&gt; # ./brk02<br>
&gt; tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s<br>
&gt; brk02.c:41: TFAIL: Cannot mprotect new VMA<br>
<br>
<br>
This was my test platform.=C2=A0 I also sent it to the Travis CI which pass=
ed<br>
for x86_64.=C2=A0 I will re-examine the accepted code to ensure the cosmeti=
c<br>
changes didn&#39;t invalidate my testing.<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">FWIK, the Travis =
CI does not run test case, it just compiles/builds LTP across</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">many arches/platforms.</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
<br>
&gt; <br>
&gt; x86_64<br>
&gt; -------------<br>
&gt; # virt-what<br>
&gt; kvm<br>
&gt; # ./brk02<br>
&gt; tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s<br>
&gt; brk02.c:41: TFAIL: Cannot mprotect new VMA<br>
&gt; <br>
&gt; s390x<br>
&gt; -------------<br>
&gt; # uname -r<br>
&gt; 5.12.0-rc4.vdso+<br>
&gt; # virt-what<br>
&gt; ibm_systemz<br>
&gt; ibm_systemz-zvm<br>
&gt; # ./brk02<br>
&gt; tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s<br>
&gt; brk02.c:41: TFAIL: Cannot mprotect new VMA<br>
&gt; <br>
&gt; <br>
&gt; armv7l -- raspberry-pi3<br>
&gt; -----------------------------<br>
&gt; # uname=C2=A0 -r<br>
&gt; 5.4.96-v7.1.el7<br>
&gt; # ./brk02<br>
&gt; tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s<br>
&gt; brk02.c:56: TPASS: munmap at least two VMAs of brk() passed<br>
&gt; armv7l -- raspberry-pi4<br>
&gt; -----------------------------<br>
&gt; # uname=C2=A0 -rm<br>
&gt; 5.10.17-v7l+ armv7l<br>
&gt; # ./brk02<br>
&gt; tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s<br>
&gt; brk02.c:56: TPASS: munmap at least two VMAs of brk() passed<br>
&gt; <br>
<br>
Would you be willing to re-run the tests without both PROT_EXEC and<br>
PROT_WRITE?<br></blockquote><div><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Yes, it will always PASS without &#39;PROT_EXEC|PROT=
_WRITE&#39;.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--000000000000ea7cb305be6c13a2--


--===============0108562603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0108562603==--

