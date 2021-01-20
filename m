Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B91502FCD8C
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:47:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 885493C5DBE
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:47:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 455523C53D7
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:47:10 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D2B5B600BB6
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611136028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6vAh2uxEWBoK357cAeQl/bc83ejYu8pkOWo8CAy7ASU=;
 b=cQMU8XO3c/5XWfin/PC5F/h4OA0DGlu7rNyyNEFJNLX1BJiXPu/2g/ASGfKk1xBaYwT2TJ
 XKva3wnxjM6y7jAUEYB+roPuIKQ8KTJPt4klzZLuZ1hwlTM7dAp1kitKo/ONdXJqYr2qKz
 y9O3Ulg9/hbqTwX2CcgafQab6yXfBXs=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-tMb7IchpO4ShgeXudwpH-g-1; Wed, 20 Jan 2021 04:47:05 -0500
X-MC-Unique: tMb7IchpO4ShgeXudwpH-g-1
Received: by mail-yb1-f197.google.com with SMTP id k7so29780480ybm.13
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 01:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vAh2uxEWBoK357cAeQl/bc83ejYu8pkOWo8CAy7ASU=;
 b=czJsyRYIZAZ6pgU7C5gTX4XElex0QGbLNSl4aIZ6yvjqeHGGqVrPdhVXkYdOKy7iLP
 VdZo0UVayRsi2DlfHAwA/Czf0ux1PaR86hz9qzuTbSulrk3HFbrF5Jb4wqwezTTnSc28
 +H7Stv90rzh3sRSQaw0I8MpK7BOaFVMOC15YYD5ZTQcSnTgZGEJwRFHy4T25bMAk8Los
 YUyrEzTEREXIZMm132lm6HkPq1gU3SKkEaLcgcEcDdajEEWkA9mKhl0VVi4VsuTQRPiO
 r42vsnfn6KaE2dc9fPMmwYSeXRC85o19ITRUA79lIRRbBTWSvln4ZKFIcytbjeUZT/s0
 9LAA==
X-Gm-Message-State: AOAM532VPTZ3h7L/nZ3BmspzdhY0syIyHDHVJi6ld1faAYPjR2+/k/kg
 Ehgom88pZKls8ukolNVLu+Cmjx+n8xISXRIHd9f0M3C7SIPw08NUmKlDhPuErDOF05jeU13Z3ex
 Gqk+XUGfWztL3dfxNp2NesxFJF20=
X-Received: by 2002:a25:2554:: with SMTP id l81mr12147921ybl.243.1611136025296; 
 Wed, 20 Jan 2021 01:47:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRkeNP1k83Bsd4vd5BdsaRL5/IEq8Jdox3aT+75SduGfEmg8dgGjovQ9JlaopLY8SrakoltF0fiAKF0jVuZIk=
X-Received: by 2002:a25:2554:: with SMTP id l81mr12147909ybl.243.1611136025128; 
 Wed, 20 Jan 2021 01:47:05 -0800 (PST)
MIME-Version: 1.0
References: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
 <CAEemH2dj2KGi6dmYoJaxsvvG1wvecbM8GrpBshHh8CTkm7pe+A@mail.gmail.com>
 <1542162728.33692863.1611135179166.JavaMail.zimbra@redhat.com>
In-Reply-To: <1542162728.33692863.1611135179166.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 Jan 2021 17:46:53 +0800
Message-ID: <CAEemH2fKG3DHHaLn2CLbt37bO5wByfSYkO1VZS=nVL=CiWg1Rg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
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
Subject: Re: [LTP] [PATCH] mlock_8-1,
 munlock_10-1: don't use LONG_MAX as invalid pointer
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
Content-Type: multipart/mixed; boundary="===============0833841491=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0833841491==
Content-Type: multipart/alternative; boundary="00000000000076895c05b951d6e6"

--00000000000076895c05b951d6e6
Content-Type: text/plain; charset="UTF-8"

Jan Stancek <jstancek@redhat.com> wrote:

...
> > I propose to reorg this patch with review comments (maybe apply it after
> > the new release).
> >
> > Any thought?
>
> This has been fixed in kernel by:
>   597399d0cb91 ("arm64: tags: Preserve tags for addresses translated via
> TTBR1")
>   d0022c0ef29b ("arm64: memory: Add missing brackets to untagged_addr()
> macro")
>

Thanks for the info, then we could filter this FAIL by kernel version.


>
> I'd keep the test as is, maybe add comment with above commits as a hint
> for future.
>
+1

-- 
Regards,
Li Wang

--00000000000076895c05b951d6e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com">=
jstancek@redhat.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail=
_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; I propose to reorg this patch with review comments (maybe apply it aft=
er<br>
&gt; the new release).<br>
&gt; <br>
&gt; Any thought?<br>
<br>
This has been fixed in kernel by:<br>
=C2=A0 597399d0cb91 (&quot;arm64: tags: Preserve tags for addresses transla=
ted via TTBR1&quot;)<br>
=C2=A0 d0022c0ef29b (&quot;arm64: memory: Add missing brackets to untagged_=
addr() macro&quot;)<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Thanks for the info, then we could filt=
er this FAIL by kernel version.</div></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
I&#39;d keep the test as is, maybe add comment with above commits as a hint=
 for future.<br></blockquote><div class=3D"gmail_default" style=3D"font-siz=
e:small">+1</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--00000000000076895c05b951d6e6--


--===============0833841491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0833841491==--

