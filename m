Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E00221A7795
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E8F73C2B43
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 11:47:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EFD643C2B34
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 11:47:09 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 3EB891000D30
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 11:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586857627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQCClLJA6rbEA3Hm4+NestLpmg9DNCRKbswrWxgPpr0=;
 b=U6W1kGzvpJTmZvHhMGKFIpJGS91LyhUI+zvHOxeD3M8NGD8SZSNFf1EUvO7xz5p055WV48
 lOTyIsLAA1mWag4v/dHQRSuIGsuodddArpJXx081BsJn58xUCasjjUGIE8VhYkdArJiASQ
 DNwHtj6g9e1z40gwnfn/vDLmxWd5TMI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-DoZfzLlFPZW2di_ewhIk-g-1; Tue, 14 Apr 2020 05:47:04 -0400
X-MC-Unique: DoZfzLlFPZW2di_ewhIk-g-1
Received: by mail-lj1-f199.google.com with SMTP id h3so966079lja.1
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 02:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SlvJJ9r5+LtkVfagQrZBRAu5rFWoOnXv+skHxcOo3y0=;
 b=YzS2X8wr6JQZsdEUqhX1wKfobFDN4WwT4MY9Og0HXmEISpsxSZlzS/7qWv7B/OxM2Y
 JOPwHjHrRyh3I122fruHQGo1CaRoucbtyfAZRPxfaittXZg9sdT4jPp2eRMLU64zJrED
 DFDm3UiCF9Yyd3dCzBCZHR/Q1IF+GY+olmwDJShX7pEnwDYzOS/FAEGeuMdsxzg9PJrh
 sufnkuLfJ3ImrOZJZIlNi8UFf4RdTbKDFTPUd/uxIrgiUvIYOLY/kQtStptf0PKG2sZu
 1HhMSZ7Is49lG79MFrj2yetSJhlJmWDDuaEykvfMTC+fe9tG42RRK4PS3R90skLxjhvp
 eeDg==
X-Gm-Message-State: AGi0PuY82V6Vm8KwNCltrt+d7HJUp+qUmpOWvOzJR/fzdp5nITas414H
 LLiPaeEeRMbg91anTVLTowCDCZGa7NyQ4eU9ysp8cm8JHXdxHAgodp2Fp8Yt7tqrcskMiBhEkT7
 EmZ3ITmiL8BavovcInYCAtY8QNs0=
X-Received: by 2002:a2e:a36c:: with SMTP id i12mr8273449ljn.24.1586857623327; 
 Tue, 14 Apr 2020 02:47:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypKCR4yFvb1WA1YgzVhqUnLdDpeuvJrYktKpksNNiXJkRU14y1EtiGnC3dx1Ns6dnT2aSgPx6HDXXm3x8kiu2wc=
X-Received: by 2002:a2e:a36c:: with SMTP id i12mr8273441ljn.24.1586857623131; 
 Tue, 14 Apr 2020 02:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <MAXPR0101MB14684E021A23A6B00ED69DC0EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
 <CAEemH2dB5tz-GMoFzRniQhtBJyDg9wfGoEWZSBU2Nz=e14jeiw@mail.gmail.com>
 <MAXPR0101MB14680DF141378F7038F0CA88EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR0101MB14680DF141378F7038F0CA88EEDA0@MAXPR0101MB1468.INDPRD01.PROD.OUTLOOK.COM>
From: Li Wang <liwang@redhat.com>
Date: Tue, 14 Apr 2020 17:46:51 +0800
Message-ID: <CAEemH2ff696xw1WcGW9CcvPy0X4E5WnD1xtZ=kFXZ2y1_sCFaQ@mail.gmail.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0096828806=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0096828806==
Content-Type: multipart/alternative; boundary="000000000000efb16105a33d14c9"

--000000000000efb16105a33d14c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pankaj,

[We'd better cc LTP ML to regard everyone on the list :), this is the way
upstream working in]

I mean you'd better provide the test log(i.e. oom01,futex_wait05, select04)
which output to your console, people need to read the message before
analysis problem at least.

On Tue, Apr 14, 2020 at 5:26 PM Pankaj Vinadrao Joshi <
Pankaj.VJ@exaleapsemi.com> wrote:

> Hi,
> Want kind of log can help us to resolve??Because not only this x86 i foun=
d
> same kind of issue on other arch also...if its happening like so whether =
we
> should consider that test as validated or not?
>
> Thanks!
> ------------------------------
> *From:* Li Wang <liwang@redhat.com>
> *Sent:* Tuesday, April 14, 2020 2:52 PM
> *To:* Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
> *Cc:* Yang Xu <xuyang2018.jy@cn.fujitsu.com>; Cyril Hrubis <
> chrubis@suse.cz>; ltp@lists.linux.it <ltp@lists.linux.it>
> *Subject:* Re: [LTP] LTP testcase analysis
>
> Hi Pankaj,
>
> On Tue, Apr 14, 2020 at 4:45 PM Pankaj Vinadrao Joshi <
> Pankaj.VJ@exaleapsemi.com> wrote:
>
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
>
> I understand sometimes test failures depress us but, it's impossible to
> know what happened without any detailed test log provided:).
>
> --
> Regards,
> Li Wang
> [EXT]
>


--=20
Regards,
Li Wang

--000000000000efb16105a33d14c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Pankaj,</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">[We&#39;d better cc LTP ML to regard everyone on the list :), this is =
the way upstream working in]</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"">I mean you&=
#39;d better=C2=A0provide the test log(i.e. oom01,futex_wait05, select04) w=
hich=C2=A0output to your console, people need to read the message before an=
alysis problem at least.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Apr 14, 2020 at 5:26 PM Pankaj  Vinad=
rao Joshi &lt;<a href=3D"mailto:Pankaj.VJ@exaleapsemi.com">Pankaj.VJ@exalea=
psemi.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Want kind of log can help us to resolve??Because not only this x86 i found =
same kind of issue on other arch also...if its happening like so whether we=
 should consider that test as validated or not?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Thanks!</div>
<div id=3D"gmail-m_3903122028763413546appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_3903122028763413546divRplyFwdMsg" dir=3D"ltr"><font face=
=3D"Calibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From=
:</b> Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">li=
wang@redhat.com</a>&gt;<br>
<b>Sent:</b> Tuesday, April 14, 2020 2:52 PM<br>
<b>To:</b> Pankaj Vinadrao Joshi &lt;<a href=3D"mailto:Pankaj.VJ@exaleapsem=
i.com" target=3D"_blank">Pankaj.VJ@exaleapsemi.com</a>&gt;<br>
<b>Cc:</b> Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" targ=
et=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;; Cyril Hrubis &lt;<a hre=
f=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;; <a =
href=3D"mailto:ltp@lists.linux.it" target=3D"_blank">ltp@lists.linux.it</a>=
 &lt;<a href=3D"mailto:ltp@lists.linux.it" target=3D"_blank">ltp@lists.linu=
x.it</a>&gt;<br>
<b>Subject:</b> Re: [LTP] LTP testcase analysis</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small">Hi=C2=A0Pankaj,</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Tue, Apr 14, 2020 at 4:45 PM Pankaj Vinadrao Joshi &lt;=
<a href=3D"mailto:Pankaj.VJ@exaleapsemi.com" target=3D"_blank">Pankaj.VJ@ex=
aleapsemi.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
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
div>
</div>
</blockquote>
<div><br>
</div>
<div>
<div style=3D"font-size:small">I understand sometimes test failures depress=
 us but, it&#39;s impossible to know what happened without any detailed tes=
t log provided:).</div>
</div>
</div>
<div><br>
</div>
-- <br>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div>Regards,<br>
</div>
<div>Li Wang<br>
</div>
</div>
</div>
</div>
[EXT] </div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000efb16105a33d14c9--


--===============0096828806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0096828806==--

