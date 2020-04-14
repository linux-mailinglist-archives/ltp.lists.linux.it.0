Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC711A773D
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:22:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85B8A3C2B43
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:22:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EDAE53C2B34
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 11:22:35 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2B8501401181
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 11:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586856153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kyCldO7xK/zQO/o3p+HPRtHxAsP66D0ivw8w9mIQDMI=;
 b=fWNIYbWQyu+H/JsTK1jmo1X8GTXULNeZqtupRZiyaMZoEGWmqdzeLTtRX9x0oZSnwc5S8V
 My62lsHCi2G7q1Pmut2/msxFR4FLCpp1YUyu3BqyFH6ghATHoQf/GMrD0yZUmhsWdX0JIW
 sSsHMS7jJ3stfkzYB7/7nEcae80lpvw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-TD1Xj4zaNsuRI6164q2GgA-1; Tue, 14 Apr 2020 05:22:29 -0400
X-MC-Unique: TD1Xj4zaNsuRI6164q2GgA-1
Received: by mail-lf1-f70.google.com with SMTP id v22so4753402lfa.1
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 02:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+sh8nEDn5B5JTkleaqa02ZZpPV10oLJvUTCc6tUzAw=;
 b=j947/LQppOo5hgDiAC5fw/eR+oTv/EU5YBgKhidd+WpuUFGtN0C2BEKxiapuGFTLj0
 MfuSp9LQq6OCj2XIGqk03WhZfsPsSLlrqlh9MSYEilfEcnX1uireQNCk9CImxwht2nOB
 viNrGrPqQc2JFX30Uafl7TUnkodqRmY7gBR4N6XEpaS3OgL6rJFH3bV/iM5Lw6k09qHZ
 EIIv8dwIN7ZE77ArxfwCDRGo4pj3fIGBWjZ2VNGt9g4Dp8TfVMvWPNXE8i94ZDrW8iYu
 gdp5NYjJc+B96/vvFj9K+ewvZivDYGbsW3obu4q3rp+taFPeI8IhufJb/HvybqG6K1ly
 53Pg==
X-Gm-Message-State: AGi0PuaayitYSQwL6jkqKPq+viutw+NNS+k2zMqRW96ousg9MyLbkh5/
 YfrB8JLZU4Z/b6pmfU1XtDyO8gsXSK8B83v8IwjxIWcAscDUkoSyxIeTfDLk3aEovekZ3VxJMpn
 ekb/s9zlNel9VhTGsbVgudK9aYQQ=
X-Received: by 2002:a05:651c:8a:: with SMTP id 10mr8598948ljq.6.1586856147786; 
 Tue, 14 Apr 2020 02:22:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ4XP/V31AELlNIG6CGbg/sblVANA0gBeYsLnTYJ7hfhE9rJbuOYcDPVK6+EYhintJD4eCKop4NcwAmlDxJ8gc=
X-Received: by 2002:a05:651c:8a:: with SMTP id 10mr8598937ljq.6.1586856147564; 
 Tue, 14 Apr 2020 02:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
From: Li Wang <liwang@redhat.com>
Date: Tue, 14 Apr 2020 17:22:16 +0800
Message-ID: <CAEemH2dB5tz-GMoFzRniQhtBJyDg9wfGoEWZSBU2Nz=e14jeiw@mail.gmail.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] LTP testcase analysis
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
Content-Type: multipart/mixed; boundary="===============1158143755=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1158143755==
Content-Type: multipart/alternative; boundary="000000000000fc5b5305a33cbc0c"

--000000000000fc5b5305a33cbc0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pankaj,

On Tue, Apr 14, 2020 at 4:45 PM Pankaj Vinadrao Joshi <
Pankaj.VJ@exaleapsemi.com> wrote:

> Hi,
> i am running LTP on x86 with 5.4.3 kernel.i gave $ ./runltp command to ru=
n
> the complete LTP but found some failures,like oom01,futex_wait05,select04
> etc.
>
> When i tried to run single test some of them turns into PASS which earlie=
r
> got failed.like oom01 was failed then i gave coomand $./runltp -s oom01 a=
nd
> after that it got pass.
>
> why it could be happened,any specific reason,if you know please suggest??
>

I understand sometimes test failures depress us but, it's impossible to
know what happened without any detailed test log provided:).

--=20
Regards,
Li Wang

--000000000000fc5b5305a33cbc0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Pankaj,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 14, 2020 at 4:45 PM Pankaj  =
Vinadrao Joshi &lt;<a href=3D"mailto:Pankaj.VJ@exaleapsemi.com">Pankaj.VJ@e=
xaleapsemi.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
i am running LTP on x86 with 5.4.3 kernel.i gave $ ./runltp command to run =
the complete LTP but found some failures,like oom01,futex_wait05,select04 e=
tc.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
When i tried to run single test some of them turns into PASS which earlier =
got failed.like oom01 was failed then i gave coomand $./runltp -s oom01 and=
 after that it got pass.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
why it could be happened,any specific reason,if you know please suggest??</=
div></div></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">I understand sometimes test failures depress us but,=
 it&#39;s impossible to know what happened without any detailed test log pr=
ovided:).</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--000000000000fc5b5305a33cbc0c--


--===============1158143755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1158143755==--

