Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF09D14EA3B
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:47:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AACB93C247D
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:47:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 999013C2460
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:47:21 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id EA24A600102
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580464039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EoEzYLBc4jgxZzLBnIOqDL4Lv6RDZnQQPrEaX51VbCk=;
 b=WzrNAu8URgZV7cHhlCK2bGotOPtV5Fnssyz23UDAt0LctD6HfUf4L8kX8eLxa0KWVbDxLP
 Vw7fnbyXeqGGYCA8gge2/VEEhswfpzoeLoRb8xCw3MDJLSIlJSBoPwn1+E6j43cZ0b7iL2
 12TS244D6xf+eEMDCIuoljBRgPKcb7Q=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-vc90UpPiOa-WbEQl4yzCEA-1; Fri, 31 Jan 2020 04:47:15 -0500
Received: by mail-oi1-f198.google.com with SMTP id s25so1982584oic.17
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 01:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FEvW/UiesO//7CWcNTP+9vs3WL/HITMXJrnXnt2EJ6k=;
 b=SBIrX9iaO0O6o89lBuTBKcXlUk9Q0c7m3R4Q3oA7i6pgw6KPF/JW7tyFhHWRmE4HSp
 JSBUZ/YNcLG8+sDt4EXRKlrP8JyMLA9fw7bHBlHWTrXg6W3dcPPs5FAO3tdeSTP45qJk
 kg8o1+y0iaqOnL6N+QFggbBn69+mhKALgEj5jG/h2IfcQKggU5RNnB7TIsxXuWCkkcU5
 o9clO6esVPXdLN0amHO16KSONH9sOG9Evc1fZ421YoimIcC/+NGMWKyBZeh9DO4r0kOd
 Fo0baWnNVx3CRoI+8S3TWtSK+gJNk2OzNznof8UNJLRr7zcyriA6i0V+X5D8wnYFEaff
 dMVw==
X-Gm-Message-State: APjAAAWxSzEsUaHpu56QDwiyqLxaUnnlXiqJsoJJ94/40Oeqq5QFlMV4
 DPeka2LYvIpOb0gQMBJwvEQoRk83RbVsi3VJYFXGp57Wa3tKo8F588+2syMaMuiLeIgkFy8J/8R
 Chhb+L9bibxvapzcdvA91w4hpaPw=
X-Received: by 2002:a9d:7:: with SMTP id 7mr6619847ota.26.1580464034585;
 Fri, 31 Jan 2020 01:47:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrK7KLN+JVZpvBdvvVrjhq/N4I+LHu1pS/QfRuQjcp3NsUeASoynPCBc3YTTeef3J7UMCV0Vn+U9cTRFyuM6A=
X-Received: by 2002:a9d:7:: with SMTP id 7mr6619834ota.26.1580464034385; Fri,
 31 Jan 2020 01:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20200130161337.31614-1-mdoucha@suse.cz>
 <CAEemH2f7s+q1upnaikCnQZSqxb-xgdN73aPxhKhLo2i5_M7FkA@mail.gmail.com>
 <1041474174.5093428.1580463462902.JavaMail.zimbra@redhat.com>
In-Reply-To: <1041474174.5093428.1580463462902.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 Jan 2020 17:47:03 +0800
Message-ID: <CAEemH2ftRvWTbx5DpuoaYiP_iZmb0O2NQwFi2bya2_VweB7=-A@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: vc90UpPiOa-WbEQl4yzCEA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Taunt OOM killer in fork12 setup()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2087262258=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2087262258==
Content-Type: multipart/alternative; boundary="00000000000059ad3c059d6c7520"

--00000000000059ad3c059d6c7520
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 5:37 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> >
> >
> > On Fri, Jan 31, 2020 at 12:13 AM Martin Doucha < mdoucha@suse.cz >
> wrote:
> >
> >
> > On a system with low memory, fork12 can trigger OOM killer before it hi=
ts
> > any fork() limits. The OOM killer might accidentally kill e.g. the pare=
nt
> > shell and external testing tools will assume the test failed.
> >
> > Set high oom_score_adj on the fork12 process so that the OOM killer
> focuses
> > on it and its children.
> >
> > It sounds more like the OOM-Killer defect but not fork12.
>
> Badness score is based on proportion of rss/swap. It doesn't seem like
> defect to me, we just quickly spawn many small tasks.
>

Ok, but killing the parent shell is not what we wanted anyway. Though oom
killer does the right evaluation and gives a high score to the whole test
framework, that will break ltp reporting.


>
> > What we do for that
> > is to protect the parent shell and its harness to avoid
> oom_kill_process()
> > acting on them.
> >
> > On the other side, if we do raise the oom score of fork12, that would n=
ot
> > guarantee OOM-Killer do right evaluation but just makes fork12 easily t=
o
> be
> > killed in testing.
>
> fork12 is not an OOM test, so I don't see problem with this. We only need
> OOM
> to kill something we don't care about, in case it triggers.
>
> I'd move oom_score_adj after fork, so only child processes are better
> target,
> not the parent.
>

Exactly, I agree with this. At least only target for the child process.

--=20
Regards,
Li Wang

--00000000000059ad3c059d6c7520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jan 31, 2020 at 5:37 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Jan 31, 2020 at 12:13 AM Martin Doucha &lt; <a href=3D"mailto:=
mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.cz</a> &gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; On a system with low memory, fork12 can trigger OOM killer before it h=
its<br>
&gt; any fork() limits. The OOM killer might accidentally kill e.g. the par=
ent<br>
&gt; shell and external testing tools will assume the test failed.<br>
&gt; <br>
&gt; Set high oom_score_adj on the fork12 process so that the OOM killer fo=
cuses<br>
&gt; on it and its children.<br>
&gt; <br>
&gt; It sounds more like the OOM-Killer defect but not fork12.<br>
<br>
Badness score is based on proportion of rss/swap. It doesn&#39;t seem like<=
br>
defect to me, we just quickly spawn many small tasks.<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ok, b=
ut killing the parent shell is not what we wanted anyway. Though oom killer=
 does the right evaluation and gives a high score to the whole test framewo=
rk, that will break ltp reporting.</div></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; What we do for that<br>
&gt; is to protect the parent shell and its harness to avoid oom_kill_proce=
ss()<br>
&gt; acting on them.<br>
&gt; <br>
&gt; On the other side, if we do raise the oom score of fork12, that would =
not<br>
&gt; guarantee OOM-Killer do right evaluation but just makes fork12 easily =
to be<br>
&gt; killed in testing.<br>
<br>
fork12 is not an OOM test, so I don&#39;t see problem with this. We only ne=
ed OOM<br>
to kill something we don&#39;t care about, in case it triggers.<br>
<br>
I&#39;d move oom_score_adj after fork, so only child processes are better t=
arget,<br>
not the parent.<br></blockquote><div><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Exactly, I agree with this. At least only target=
 for the child process.</div></div><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--00000000000059ad3c059d6c7520--


--===============2087262258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2087262258==--

