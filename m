Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E39A16FB4A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:51:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C97F3C254F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:51:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 638593C237A
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:51:12 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A863420145C
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582710665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ieZsYl65Zp3KBlo4UNXeQhsyIoEKC6aDk13LG9L1Ww=;
 b=Zw1sbqmbskm7ZbxIZRuhoyOv4gmByygt4QFrmiR2yLBQo7H50J8LDUIQC2s+bTQJAja01U
 qwj8oWuxxOEjjNYGCVFwXckl/30rvr1CRZGQxcT2sMgcv9lYiQSEw8nfDzBDgJSwTKpv9x
 JhFpyh8sLsRG4wfSz1fxDUES9nRkRZ0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253--olAtHMsOeOENECg_yugUg-1; Wed, 26 Feb 2020 04:51:01 -0500
X-MC-Unique: -olAtHMsOeOENECg_yugUg-1
Received: by mail-oi1-f197.google.com with SMTP id e22so1159995oig.1
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 01:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ah4aXsxNVuxb4vXPxny6scY8f7tUMgKZSMwZn4nay00=;
 b=Z5iH70CfrvJNN8zTmvqKVK/nhmY0mXOOo+uNLj2INUidkL1NtwwXZ4C9K+63+C8/XK
 UCT8TjVkXbfTo3DH/6OguWLxucKgW4hh0Vk3w4lx0bAFgXhKOVIiqRpBAhaf38B2v+zh
 tY8e/ekkaO5VoLgTNBNUfiEanS04BbcbrwAZJel+ZOHrGggtrjrFEakefRFSQUXYGipF
 hmHjUmI1BrxHNLOJbZo8eCU0dTLa3pHim6fGpF3WD/Gjjn20Vu8jw6QortnsEdnYOytI
 tl0T49Oh60ThptkNacKmsFhANhtO6yyLOSzaGM/b/Bjyg6pXSR8BmptNLh39HFfkt4eG
 JhZQ==
X-Gm-Message-State: APjAAAUpW/EDxm2/vvb+5fHRAv4WRJQi8CQoEo+1ItTvSqDHJGWiEXIb
 rcR/8hsOEnTwDOwTrSdyoU020bXbmVXK4Brbc7tq/wwTnvH7C4vi2/ZmrnjNEsyXsS7DuBAEcZ4
 VH1XpZe9jbqSylDjDUg2MMJMQ87Y=
X-Received: by 2002:aca:1913:: with SMTP id l19mr2227221oii.47.1582710660400; 
 Wed, 26 Feb 2020 01:51:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5R1XSzvu8t5USBkxTkF8tzLS6A8LiLL9JYXyMiWrqODEMdHe+ulBLITzUtcScyNaJ0y8VdRxvpecy9YXiR8g=
X-Received: by 2002:aca:1913:: with SMTP id l19mr2227206oii.47.1582710660174; 
 Wed, 26 Feb 2020 01:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20200226084249.29561-1-pvorel@suse.cz>
 <CAEemH2cMBtVV-1_RZb_UHN9rQF3sD2w-H2gS11BD2WHPTPzvgQ@mail.gmail.com>
 <20200226091824.GA2215@dell5510>
In-Reply-To: <20200226091824.GA2215@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Wed, 26 Feb 2020 17:50:49 +0800
Message-ID: <CAEemH2cXGOh=MX28kYvhFaHspHGXiVdGuNZeyN97+O3+bt1jGg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] request_key04: Use TFAIL instead of TBROK
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
Content-Type: multipart/mixed; boundary="===============1442278720=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1442278720==
Content-Type: multipart/alternative; boundary="000000000000aeaaf0059f778a7e"

--000000000000aeaaf0059f778a7e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 5:18 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> ...
> > > obvious fix which I'd normally merge without sending to ML.
> > > But there are 19 tests which use tst_res(TBROK, and at least some of
> > > them are affected by this (i.e. don't unconditionally report any resu=
lt
> > > before tst_res(TBROK), so we might want to fix it different way.
>
> > +1 for this fix.
> Thanks for your review.
>
> > By the way, do you think it makes sense to add build check parameters f=
or
> > tst_res() too? Just like what we do for tst_brk() in commit 0738e3753c5=
1.
>
> IMHO if we agree that tst_res(TBROK) is harmful and should be avoided
> entirely,
>
I agree.


> I'd be for adding this check.
>

In personally, I'd let tst_res() only accept 'TPASS, TFAIL, TINFO, TCONF,
TWARN'.

--=20
Regards,
Li Wang

--000000000000aeaaf0059f778a7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 5:18 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
...<br>
&gt; &gt; obvious fix which I&#39;d normally merge without sending to ML.<b=
r>
&gt; &gt; But there are 19 tests which use tst_res(TBROK, and at least some=
 of<br>
&gt; &gt; them are affected by this (i.e. don&#39;t unconditionally report =
any result<br>
&gt; &gt; before tst_res(TBROK), so we might want to fix it different way.<=
br>
<br>
&gt; +1 for this fix.<br>
Thanks for your review.<br>
<br>
&gt; By the way, do you think it makes sense to add build check parameters =
for<br>
&gt; tst_res() too? Just like what we do for tst_brk() in commit 0738e3753c=
51.<br>
<br>
IMHO if we agree that tst_res(TBROK) is harmful and should be avoided entir=
ely,<br></blockquote><div><span class=3D"gmail_default" style=3D"font-size:=
small">I agree.</span></div><div><span class=3D"gmail_default" style=3D"fon=
t-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
I&#39;d be for adding this check.<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">In personally, I&#39;d le=
t tst_res() only accept &#39;TPASS, TFAIL, TINFO, TCONF, TWARN&#39;.</div><=
/div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Reg=
ards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000aeaaf0059f778a7e--


--===============1442278720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1442278720==--

