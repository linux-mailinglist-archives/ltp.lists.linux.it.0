Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1B4156FF0
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 08:38:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BB8C3C2530
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 08:38:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 702553C24C9
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 08:38:51 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 73615140114E
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 08:38:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581320328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f4CHSbb35934eOsBCMxzHIhlMoMDyQX/6lvB6mOY4Io=;
 b=ML2E8QnMh778WnEOw7y5IyJQrKTkjA6qR3/3U8/yRjlmDbnKaeF08xzstnOt6SiWkMyztA
 K4HQkE4v+m5upNYxaHQLjvpdpxE3WtlSg+5TPqxbUtyUtSIUSpTXlA/fLFLouLpiPD96Na
 1OEmXI07vAukmroo0Zfte3r85VuTX6s=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-oHNda5t9MFyQ4OtmFhdcMw-1; Mon, 10 Feb 2020 02:38:46 -0500
Received: by mail-oi1-f198.google.com with SMTP id n4so3897868oih.12
 for <ltp@lists.linux.it>; Sun, 09 Feb 2020 23:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSden0IUDVziNmhNIrTpRDv3BVcbPrz02aum1JPi3MA=;
 b=cYVmrrAINEPFeTCALUl1mMrLicxeBhlpu27BIulFEESUsKnLLbKkWjHfh2BINum8ep
 Wa50VS20sN+eS0mGjL/VvFY1ygzvWXlJyseatJ8+ID/eMch/e0/4cha3C127EHdTyXab
 bKhSfkuLqI/mULvy+/c8l5E49HKqKhwuPcAR5D0C4T0ELgezfqR/rIARM1hmgV/oUPSg
 Vq4d63QXTfR+8/Pmkvx5WUw7BXSmhkkKkyZUj5wh5jd/AMdEt74RNKj8eyQ7WkHCQ6jM
 7tXh1TxQjj/s/0inLIMGpCtHVQWiA+Vco4YI4ZOkwexLK/jT9xyMoOwGmwuLHTLtd3/v
 P12A==
X-Gm-Message-State: APjAAAWp9MD99/LALpD4iEjl6182QX3jL6H6wmkYCGcDFnXdaweNwkcR
 a894zzAY9n6iEN/dErQ971y9QZV1Is6rGKPknU/M822eS+eUTZsw++U36XfChjPPDeCCk7V4LK9
 G1J9gIAXFZ1UdASDcUnT2uUaFrag=
X-Received: by 2002:a9d:67c9:: with SMTP id c9mr128367otn.67.1581320325079;
 Sun, 09 Feb 2020 23:38:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwB7kbRZsfcs0e+k6B0+Uvp+zVfelCqBsDlcPDno/lI3kcbBL52YrnlaSC6Q51s1/gO4S8/oySQAHINnhGSyT4=
X-Received: by 2002:a9d:67c9:: with SMTP id c9mr128350otn.67.1581320324774;
 Sun, 09 Feb 2020 23:38:44 -0800 (PST)
MIME-Version: 1.0
References: <BMXPR01MB299944A5CB7B89E2F51B71D8EE190@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
 <BMXPR01MB299909AAA91463BB4254C091EE190@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB299909AAA91463BB4254C091EE190@BMXPR01MB2999.INDPRD01.PROD.OUTLOOK.COM>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 Feb 2020 15:38:33 +0800
Message-ID: <CAEemH2cuXyACFnJbCUwPid7RiCTENZZgtCsSGctE=ph-MN8DUg@mail.gmail.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
X-MC-Unique: oHNda5t9MFyQ4OtmFhdcMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] running aio02 test in ltp giving CONF: test requires
 libaio and its development packages
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
Content-Type: multipart/mixed; boundary="===============1704911158=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1704911158==
Content-Type: multipart/alternative; boundary="0000000000003c1d9a059e33d480"

--0000000000003c1d9a059e33d480
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pankaj,

On Mon, Feb 10, 2020 at 3:19 PM Pankaj Vinadrao Joshi <
Pankaj.VJ@exaleapsemi.com> wrote:

>
> ------------------------------
>
> Hi,
> with reference to the above subject i am testing aio02 in ltp in ltp,when
> i am trying to run that test it is giving  *CONF: test requires libaio
> and its development packages*
> as o/p how i can work around the problem?
> i have already installed some libaio packages through
>
> $apt-get install libaio1 && $apt-get install libaio-dev
>
> anything else that needs to be installed?
>

I'm not using ubuntu distro, but from my experience, you probably need to
rebuild your LTP after the packages(libaio1, libaio-dev) install.

--=20
Regards,
Li Wang

--0000000000003c1d9a059e33d480
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Pankaj,</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 10, 2020 at 3:19 PM Pankaj  =
Vinadrao Joshi &lt;<a href=3D"mailto:Pankaj.VJ@exaleapsemi.com">Pankaj.VJ@e=
xaleapsemi.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">




<div dir=3D"ltr">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_-5541437718851841974appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-5541437718851841974divRplyFwdMsg" dir=3D"ltr">
<div>=C2=A0</div>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi,
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif">
with reference to the above subject i am testing aio02 in ltp in ltp,when i=
 am trying to run that test it is giving=C2=A0
<b>CONF: test requires libaio and its development packages</b></div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif">
as o/p how i can work around the problem?<br>
</div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif">
i have already installed some libaio packages through <br>
</div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif">
<br>
</div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif">
$<span>apt-get install libaio1 &amp;&amp; $apt-get install libaio-dev<br>
</span><span></span></div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif">
<br>
</div>
<div style=3D"color:black;font-size:12pt;font-family:Calibri,Arial,Helvetic=
a,sans-serif">
anything else that needs to be installed?<br></div></div></div></div></div>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">I&#39;m not using ubuntu distro, but from my experience, you p=
robably need to rebuild your LTP after the packages(libaio1, libaio-dev) in=
stall.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div=
></div></div></div>

--0000000000003c1d9a059e33d480--


--===============1704911158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1704911158==--

