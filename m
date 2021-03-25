Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67676348BA3
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 09:37:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFD753C5FC5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 09:37:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5D1F73C27E7
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 09:37:19 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 097D1600832
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 09:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616661436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PFZMjuKNH8D8DeVfTiiCy+1d2IAs3QT19oXXll0MVKU=;
 b=Bp09OYvDfsn9ysODExiU5HoJrB1TnlHJi232Wx96TwHdHTPxkXd57kWFCX6ftA8N6oOPNl
 OYjgqSkOqY4GIesTUDeqrUaZCAYicLrS2HOwpc41xhXVhSduecDivv19+bSCV60LQOijdL
 4dpbeUpQ1HnJsXvIo0lWwb2Uzz9Liy0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-TeTG6NSpO8u83Q4JCX14vg-1; Thu, 25 Mar 2021 04:37:13 -0400
X-MC-Unique: TeTG6NSpO8u83Q4JCX14vg-1
Received: by mail-yb1-f198.google.com with SMTP id a63so5517003yba.2
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 01:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFZMjuKNH8D8DeVfTiiCy+1d2IAs3QT19oXXll0MVKU=;
 b=TM+fPjcZweEiEcWvic+g0X15qbd4d1duO9Lg3vYWYZhlso3yJVQdNTAOqIUb/G8O11
 zgtKS5v/1AUcAkyLp0Z4b5cvj9OOm8K3IPelDs0cn6nY941VH5jlYjWuWfQ3VSjpawWe
 wi74iAd0PpIUQno6UYV6YltJexHCYm3/t6cu1t2eg/AJhk1Spva5xA5p9RNb+OPrRZ0M
 Wz1NnpQsSU5zsoVhCJP53RJ6k91MG0na8t5CmDGwbha99LWcdOR5hnTihR7QLP1Yu0yh
 NKLeiFWGNYW33KReD9FzCDF6o0/jVzjjOJkw7XLMfOduNFfdb8HTBtDk9jhr/0+ML83M
 DTqg==
X-Gm-Message-State: AOAM532WJCBXGnzundNmVAaIl1s9NfFP7XQduiT6SzSaPFwtSWkqtb8l
 jor0sNT9rTgkdSzkSt+W6O7ZCOtDfBa0zUP5Om3XUe4/+AsMRLKzOECRVxdS4YVXwHLc6TRXRTZ
 Q+JrWDbYoZUWRoF+yUqo6bZTf+fE=
X-Received: by 2002:a25:af05:: with SMTP id a5mr11024548ybh.86.1616661433000; 
 Thu, 25 Mar 2021 01:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx66A9hkxeuMAO48zKAo3nlAU4YDKLKGKoy2GoDfr4YIZhvjgKR75vIXNMjJbbkD3iFklsQASq9d0cZj0CL+20=
X-Received: by 2002:a25:af05:: with SMTP id a5mr11024518ybh.86.1616661432654; 
 Thu, 25 Mar 2021 01:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
 <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
 <20210323162714.t5dm5vbo35vl4t2l@revolver>
In-Reply-To: <20210323162714.t5dm5vbo35vl4t2l@revolver>
From: Li Wang <liwang@redhat.com>
Date: Thu, 25 Mar 2021 16:37:01 +0800
Message-ID: <CAEemH2fnyB_dGzQWUb7SBi9S01vYGXaZBczj2ZwaYF-Rqv9UsA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1667183324=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1667183324==
Content-Type: multipart/alternative; boundary="0000000000006a744005be5852fe"

--0000000000006a744005be5852fe
Content-Type: text/plain; charset="UTF-8"

Hi Liam,

On Wed, Mar 24, 2021 at 12:27 AM Liam Howlett <liam.howlett@oracle.com>
wrote:

> Hello Li,
>
> Thank you for looking at this testcase.
>
> * Li Wang <liwang@redhat.com> [210317 07:08]:
> > Hi Liam, Petr,
> >
> > Liam Howlett <liam.howlett@oracle.com> wrote:
> >
> >
> > > ...
> > > +       if (mprotect(addr - page_size, page_size,
> > > +                    PROT_READ|PROT_WRITE|PROT_EXEC)) {
> > > +               tst_res(TFAIL, "Cannot mprotect new VMA.");
> > > +               return;
> > > +       }
> > >
> >
> > We got permission denied here while performing the brk02 on
> > x86_64/s390x(kernel-4.18~). After looking at the manual page of
> > mprotect(), seems the access issue caused by PROT_EXEC.
> >
> > "
> > POSIX says that the behavior of mprotect() is unspecified if it is
> applied
> > to a region of memory that was not obtained via mmap(2).
> > ...
> > Whether  PROT_EXEC has any effect different from PROT_READ
> > depends on processor architecture, kernel version, and process state.
> > If READ_IMPLIES_EXEC is set in the process's personality flags
> > (see personality(2)), specifying PROT_READ will implicitly add PROT_EXEC.
> > "
>
>
> Unforntunately, dropping the PROT_EXEC causes the VMA behaviour to
> change and does not test what this testcase is intended to test.
>

Yes, I agree with this. But am not sure if Linux take some action on
security
side to prevent setting PROT_EXEC permission arbitrary.


>
> Removing the PROT_EXEC and the PROT_WRITE does test what is supposed to
> be tested.  Can you verify that this works on the s390x?
>

Actually just removing the PROT_EXEC then the brk02 can be passed on all my
platforms.


>
> Are you using real hardware to test this or can I use some sort of
> emulation to test on my side?
>

It looks like easily to reproduce.

I get failed with both virtual system and bare metal, e.g. the first one
is on my Fedora33-workstation. But the worth to say, brk02 passed
with raspberry pi3 and pi4.

x86_64
-------------
# virt-what
# echo $?
0
# uname -r
5.10.22-200.fc33.x86_64
# ./brk02
tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
brk02.c:41: TFAIL: Cannot mprotect new VMA

x86_64
-------------
# virt-what
kvm
# ./brk02
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
brk02.c:41: TFAIL: Cannot mprotect new VMA

s390x
-------------
# uname -r
5.12.0-rc4.vdso+
# virt-what
ibm_systemz
ibm_systemz-zvm
# ./brk02
tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
brk02.c:41: TFAIL: Cannot mprotect new VMA


armv7l -- raspberry-pi3
-----------------------------
# uname  -r
5.4.96-v7.1.el7
# ./brk02
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
brk02.c:56: TPASS: munmap at least two VMAs of brk() passed
armv7l -- raspberry-pi4
-----------------------------
# uname  -rm
5.10.17-v7l+ armv7l
# ./brk02
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
brk02.c:56: TPASS: munmap at least two VMAs of brk() passed

-- 
Regards,
Li Wang

--0000000000006a744005be5852fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Liam,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at 12:27 AM Liam Howlett=
 &lt;<a href=3D"mailto:liam.howlett@oracle.com">liam.howlett@oracle.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o Li,<br>
<br>
Thank you for looking at this testcase.<br>
<br>
* Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang=
@redhat.com</a>&gt; [210317 07:08]:<br>
&gt; Hi Liam, Petr,<br>
&gt; <br>
&gt; Liam Howlett &lt;<a href=3D"mailto:liam.howlett@oracle.com" target=3D"=
_blank">liam.howlett@oracle.com</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; &gt; ...<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mprotect(addr - page_size, page_s=
ize,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PROT_READ|PROT_WRITE|PROT_EXEC)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(T=
FAIL, &quot;Cannot mprotect new VMA.&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; <br>
&gt; We got permission denied here while performing the brk02 on<br>
&gt; x86_64/s390x(kernel-4.18~). After looking at the manual page of<br>
&gt; mprotect(), seems the access issue caused by PROT_EXEC.<br>
&gt; <br>
&gt; &quot;<br>
&gt; POSIX says that the behavior of mprotect() is unspecified if it is app=
lied<br>
&gt; to a region of memory that was not obtained via mmap(2).<br>
&gt; ...<br>
&gt; Whether=C2=A0 PROT_EXEC has any effect different from PROT_READ<br>
&gt; depends on processor architecture, kernel version, and process state.<=
br>
&gt; If READ_IMPLIES_EXEC is set in the process&#39;s personality flags<br>
&gt; (see personality(2)), specifying PROT_READ will implicitly add PROT_EX=
EC.<br>
&gt; &quot;<br>
<br>
<br>
Unforntunately, dropping the PROT_EXEC causes the VMA behaviour to<br>
change and does not test what this testcase is intended to test.<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Yes,=C2=A0I agree with this. But am not sure if Linux take some actio=
n on security</div></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">side=C2=A0to prevent setting PROT_EXEC permission arbitrary.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Removing the PROT_EXEC and the PROT_WRITE does test what is supposed to<br>
be tested.=C2=A0 Can you verify that this works on the s390x?<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Actually just removing the PROT_EXEC then the brk02 can be passed on all=
 my platforms.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Are you using real hardware to test this or can I use some sort of<br>
emulation to test on my side?<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">It looks like easily to repro=
duce.</div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I get failed with both virtual system and bare metal, e.g. the first =
one</div><div class=3D"gmail_default" style=3D"font-size:small">is on my Fe=
dora33-workstation. But the worth to say, brk02 passed</div><div class=3D"g=
mail_default" style=3D"font-size:small">with raspberry=C2=A0pi3 and pi4.</d=
iv></div><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">x86_64</div><div class=3D"gmail_default" style=3D"font-size:small"=
>-------------</div></div><div class=3D"gmail_default" style=3D"font-size:s=
mall"># virt-what <br># echo $?<br>0<br></div><div class=3D"gmail_default" =
style=3D"font-size:small"># uname -r<br>5.10.22-200.fc33.x86_64<br># ./brk0=
2 <br>tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s<br>brk02.c:41: =
TFAIL: Cannot mprotect new VMA<br></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><div class=3D"gmail_default">x86_64</div><div class=3D"gmail_def=
ault">-------------</div></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small"># virt-what</div>kvm</div><div># ./brk02 <br>tst_test.c:129=
1: TINFO: Timeout per run is 0h 05m 00s<br>brk02.c:41: TFAIL: Cannot mprote=
ct new VMA<div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">s390x</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">-------------</div></div><div=
 class=3D"gmail_default" style=3D"font-size:small"># uname -r</div>5.12.0-r=
c4.vdso+</div><div class=3D"gmail_quote"># virt-what <br>ibm_systemz<br>ibm=
_systemz-zvm<br></div><div class=3D"gmail_quote"># ./brk02 <br>tst_test.c:1=
289: TINFO: Timeout per run is 0h 05m 00s<br>brk02.c:41: TFAIL: Cannot mpro=
tect new VMA</div><div><br></div><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">armv7l -- raspberry-pi3</div></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">----------------------=
-------</div></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"># uname =C2=A0-r</div>5.4.96-v7.1.el7<br># ./brk02<br>tst_test.c:1291: =
TINFO: Timeout per run is 0h 05m 00s<br>brk02.c:56: TPASS: munmap at least =
two VMAs of brk() passed<br><div class=3D"gmail_default" style=3D"font-size=
:small"></div><div class=3D"gmail_default" style=3D"font-size:small">armv7l=
 -- raspberry-pi4</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">-----------------------------</div><div class=3D"gmail_default" style=3D=
"font-size:small"># uname =C2=A0-rm<br>5.10.17-v7l+ armv7l<br># ./brk02<br>=
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s<br>brk02.c:56: TPASS:=
 munmap at least two VMAs of brk() passed<br></div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div=
><div>Li Wang<br></div></div></div></div>

--0000000000006a744005be5852fe--


--===============1667183324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1667183324==--

