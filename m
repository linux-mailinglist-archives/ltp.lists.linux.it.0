Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F94B54F
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Apr 2019 07:26:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 144913EAB0E
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Apr 2019 07:26:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9BCF53EAAEA
 for <ltp@lists.linux.it>; Sun, 28 Apr 2019 07:26:06 +0200 (CEST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5622C1000AC3
 for <ltp@lists.linux.it>; Sun, 28 Apr 2019 07:26:03 +0200 (CEST)
Received: by mail-vs1-f45.google.com with SMTP id r12so3247708vsp.7
 for <ltp@lists.linux.it>; Sat, 27 Apr 2019 22:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8oQBwnRLzY6Flm8yg0MQ7RmRUt7VqNJWcOAS36Rg6Tk=;
 b=OmCjvetQVoWBgoXJC9PBaxSwIEQUI1eqThFHgl5A3CiPcG0Cw2I/gtg7vZ94dVqDp3
 t7F5KzPnwA0Sp9CYsTgFCw+1xplacfdrr5h9JA6/frf1eLgmG2BV84CY4RSVrrPzrgVm
 EVIU/pdrJy89itbbhuj9z10VSiUmnIdMkR8Pf6K5ex65/5B4wxG+PeNdWiYZ6zHJlXXC
 Lf+WlAXBcnNbp02z6ON6u8JE4Xd4bRuWTwlNxmyr+f3thEHMgc8vVsXe1Ww+7jVrR9CF
 HSTgSyrnh26SDunRHdbHTbMjGMZz0V+eKUsJwcrl+LxFjjCJUTACIZamiCCSodNRoFqP
 0ntg==
X-Gm-Message-State: APjAAAW5N/9pBw2bnprfcHwM0oIO//J3o+QGZAVpbS5DCmqPAK2AqsTR
 Nz4/9z/9I5u4sUsszNIL0UF8feiYlXv8ywuRgKWshATqQqw=
X-Google-Smtp-Source: APXvYqyWQ65s83fGFGYtggrSp8ffB2xocTg/a2oxZoGz6BcxOJIbnbAcksrUWapR2cpIweJec9gVjGOu88fDhag6Xx4=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr8322499vso.130.1556429164759; 
 Sat, 27 Apr 2019 22:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190418111812.GB3073@rei.lan> <20190426131258.GA18760@rei>
In-Reply-To: <20190426131258.GA18760@rei>
From: Li Wang <liwang@redhat.com>
Date: Sun, 28 Apr 2019 13:25:53 +0800
Message-ID: <CAEemH2ezD-diAYeG0=pbgUgdMtSFxs+dWYo4CnDNdHQT=SOEaQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] LTP Release
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1179647554=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1179647554==
Content-Type: multipart/alternative; boundary="0000000000007bf86005879067c2"

--0000000000007bf86005879067c2
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 26, 2019 at 9:13 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > So as usually please go ahead and point out anything that should go in
> > before the release.
>
> Only Peter replied so far, so I suppose that we are ready to freeze git
> starting next week and start the pre-release testing.
>
> Or is there anything that has to be considered to be included before we
> do that?
>

Here is a simple fix for hugepage test broken with memory shortage.
Consider merging?
http://lists.linux.it/pipermail/ltp/2019-April/011714.html

-- 
Regards,
Li Wang

--0000000000007bf86005879067c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 26, 2019 at 9:13 PM Cy=
ril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis=
@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi!<br>
&gt; So as usually please go ahead and point out anything that should go in=
<br>
&gt; before the release.<br>
<br>
Only Peter replied so far, so I suppose that we are ready to freeze git<br>
starting next week and start the pre-release testing.<br>
<br>
Or is there anything that has to be considered to be included before we<br>
do that?<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Here is a simple fix for hugepage test broken with mem=
ory shortage. Consider merging?</div><div class=3D"gmail_default"><a href=
=3D"http://lists.linux.it/pipermail/ltp/2019-April/011714.html" target=3D"_=
blank">http://lists.linux.it/pipermail/ltp/2019-April/011714.html</a></div>=
</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"m_-658254797222657513=
0gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br><=
/div></div></div></div></div>

--0000000000007bf86005879067c2--

--===============1179647554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1179647554==--
