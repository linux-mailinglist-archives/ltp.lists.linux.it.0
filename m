Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9061CD1E2
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 08:34:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C64243C55F2
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 08:34:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EA2CD3C268F
 for <ltp@lists.linux.it>; Mon, 11 May 2020 08:34:17 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id DDB4D1000D34
 for <ltp@lists.linux.it>; Mon, 11 May 2020 08:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589178855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qF1eLHZJrh9WKoo0Rii6oxzY5FkTv++0TnvKevOZPo8=;
 b=i/Rf2LMqB3LEperY4SUKlbHe1Rrs/fQ6zkOElP1Vn2J3xKpi0pqkZjqmMyY0qB1hEJJ27F
 opU8ci/eW2BF/YHx86A5tUdM85p+TeV3/YFJaXk1YAzURKt5Hp5zVISQdCiI7ZGccakM2G
 +rI7p/P1FeKqVk/oUQ3uLtzuXZMz28Y=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-eWMzjA3lMKam26wVsEjrzQ-1; Mon, 11 May 2020 02:34:11 -0400
X-MC-Unique: eWMzjA3lMKam26wVsEjrzQ-1
Received: by mail-lj1-f200.google.com with SMTP id q2so1078006ljq.16
 for <ltp@lists.linux.it>; Sun, 10 May 2020 23:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qF1eLHZJrh9WKoo0Rii6oxzY5FkTv++0TnvKevOZPo8=;
 b=miAoUg6itL07PSknhg+6mhVYF4DWfa47j1dGx3SeSwnerGE5ta8VacpipBOw3EMvYf
 n55V4iIjIXGHnn9fmaS25ozdG/jfG4e3OomTi2Exr8F5hX/iwXMuOftIGCoFPUqlfx0C
 cScslqbfHXy+cY6evsPGdW8cXPEnob3Mbo/I1OHup/gulbmwsC75mHPijNCnA77YDo6W
 MVyVwj0i/np+Xbjg7sb8PVoQ42dpsMWzVJOeWKYxhlq98Rl80gUk/ac+ulTtcFKwhifh
 4Rw870+jI1Ipp4UYmRaibQ84U8wzEwB6iSiuv1e+RvbRrBVR75CmEGknk4bDEXr514MX
 NV6Q==
X-Gm-Message-State: AOAM532jvqV8ojhKR/U7sEV2rbfl67uCDx0iXO1gIMRxHjtpUMg6pBV9
 MYviXQf17DGo6OlXxZ1qPJP1aLrnBuM+DAIA++V5gUHlpYlUt3iH6ogXadOsBIB07UAvzn7vNii
 dz955i81Wzg8y8X85A3mR99V1l+Q=
X-Received: by 2002:a2e:8753:: with SMTP id q19mr9314400ljj.6.1589178849178;
 Sun, 10 May 2020 23:34:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/vp2EeBIIrTlatQjakPMHrCnnK/2oQzTT+yEI6KDm7CfWiGbkJ+PwkVov2CJFsgrRReA0A8BR0W559/PcTLY=
X-Received: by 2002:a2e:8753:: with SMTP id q19mr9314390ljj.6.1589178848971;
 Sun, 10 May 2020 23:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <797dd5eeadd81fae30635dd66d0a715cc213c51e.1588942651.git.jstancek@redhat.com>
 <20200510082151.GA13961@x230>
In-Reply-To: <20200510082151.GA13961@x230>
From: Li Wang <liwang@redhat.com>
Date: Mon, 11 May 2020 14:33:57 +0800
Message-ID: <CAEemH2dj0mGsxfWkVzLZDPftiQiiAMbJ03S_uhvL6VBduiRShA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] nm01: fix regex matching internal symbols
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
Content-Type: multipart/mixed; boundary="===============1389781782=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1389781782==
Content-Type: multipart/alternative; boundary="000000000000c727c805a55988d1"

--000000000000c727c805a55988d1
Content-Type: text/plain; charset="UTF-8"

On Sun, May 10, 2020 at 4:22 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Current regex matches any word character followed by space
> > and one of letters "abdft". So it doesn't match only symbol type,
> > but can match for example value and size:
> >   $ grep "\w [a,b,d,f,t]" nm.out
> >   __libc_csu_init T 10000640 b4
> >                    matches ^ ^
>
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Good catch, Jan.
>

Tested and pushed.

-- 
Regards,
Li Wang

--000000000000c727c805a55988d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, May 10, 2020 at 4:22 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt; Current regex matches any =
word character followed by space<br>
&gt; and one of letters &quot;abdft&quot;. So it doesn&#39;t match only sym=
bol type,<br>
&gt; but can match for example value and size:<br>
&gt;=C2=A0 =C2=A0$ grep &quot;\w [a,b,d,f,t]&quot; nm.out<br>
&gt;=C2=A0 =C2=A0__libc_csu_init T 10000640 b4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
atches ^ ^<br>
<br>
&gt; Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" =
target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br>
Good catch, Jan.<br></blockquote><div>=C2=A0</div></div><div class=3D"gmail=
_default" style=3D"font-size:small">Tested and pushed.</div><div><br></div>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Reg=
ards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000c727c805a55988d1--


--===============1389781782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1389781782==--

