Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9735F6D
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:40:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFFE83EA69F
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 16:40:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 21F163EA5AC
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:40:16 +0200 (CEST)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 61D681A013B1
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 16:40:15 +0200 (CEST)
Received: by mail-vk1-f196.google.com with SMTP id l73so4277253vkl.8
 for <ltp@lists.linux.it>; Wed, 05 Jun 2019 07:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EhqdqiVKY4HqDclhHKefpxDYd4D5CbwUJEowfQ60/PM=;
 b=HYcNV9TmgFrYKzw3lYLZMA4MR8gbXC2ZfnB/GjWDPYdXz9BIofVc8hpBx8HUk5SqEk
 8ahnVhF0CdjZ3uwh+eGNqPePn/m8DLc5G7OhCxAjgvQsit/OWpACmdRKzn+ruEGXnkv8
 a3aENzIsZlmYfDuaruzXZjg8W0Shqrr2h0ru8ekem+NCv+wPmz0WprM7DPx9/g83bUFQ
 FioqDg9WDdViuwoMqPz+kUWjr6gVucrKvp2h2Jqi7JXmjWYXmHGD7duCMvwqwSnrxq+d
 RfEpSroOW7xHqmJz+nbwC5FmEtQC1V+MrgmIhMAdj3X0ST5bTymHyDWftiP8m3MV4fv9
 yN2w==
X-Gm-Message-State: APjAAAXD2Iyy+M7yKd4JzrqXKfNhzA5h/LmUbDTE2qzOPYtzFTG6eMVZ
 E8JEnjOR5lHB1QjxSLqdO6aFkhC97vU6sAxJhcTM7A==
X-Google-Smtp-Source: APXvYqyuC/gH465PBZEzk3D23niDB7mWCdbGvu+Tce+XYbM0q4K+4+12HCyoiw0vmwV7rI3UZAmwy8ZIgkgFBnbwO/U=
X-Received: by 2002:a1f:23d6:: with SMTP id j205mr15321447vkj.52.1559745614203; 
 Wed, 05 Jun 2019 07:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190605072126.19856-1-pvorel@suse.cz>
 <20190605072126.19856-2-pvorel@suse.cz>
 <CAEemH2doAQ7=b-zutgHnY469rz-JThw0E_3b4o79zx+n2-uX_A@mail.gmail.com>
 <20190605141613.GA3965@dell5510>
In-Reply-To: <20190605141613.GA3965@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Jun 2019 22:40:02 +0800
Message-ID: <CAEemH2fLHFmNL57Hm5oU8MNoUN72brqz7fO-fOY_GGTxrAEpPQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 2/2] inotify: Add SAFE_MYINOTIFY_ADD_WATCH() helper
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
Content-Type: multipart/mixed; boundary="===============1913897002=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1913897002==
Content-Type: multipart/alternative; boundary="000000000000469b7c058a949346"

--000000000000469b7c058a949346
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 5, 2019 at 10:16 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> thanks for your review.
>
> > If test exit with TBROK the reap_wd will never get a chance to set as 1,
> > and the cleanup() also make no sense in tst_brk() calling.
> No, that's a "flag" for cleanup function which is run always (no matter
> whether
> tst_brk() was called). See cleanup() and mount_flag in [1].
>

You are right. And seems the problem is only exist in original code, it put
reap_wd in wrong place and mislead my sight.

       if ((wd = myinotify_add_watch(fd_notify, DIR_PATH, IN_ALL_EVENTS)) <
0) {
               tst_brk(TBROK | TERRNO,
                       "inotify_add_watch (%d, " DIR_PATH ", IN_ALL_EVENTS)
failed",
                       fd_notify);
               reap_wd = 1;
       };


> > > with reap_wd defined in inotify.h there could be also
> > > SAFE_MYINOTIFY_RM_WATCH().
> And my suggestion above was to handle this flag in inotify.h. Than it'd
> make
> sense to add also SAFE_MYINOTIFY_RM_WATCH().
>

You patch set looks good.

Sorry for the error in judgment, that remind me it's time to go to bed
now:).

-- 
Regards,
Li Wang

--000000000000469b7c058a949346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 5, 2019 at 10:16 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
thanks for your review.<br>
<br>
&gt; If test exit with TBROK the reap_wd will never get a chance to set as =
1,<br>
&gt; and the cleanup() also make no sense in tst_brk() calling.<br>
No, that&#39;s a &quot;flag&quot; for cleanup function which is run always =
(no matter whether<br>
tst_brk() was called). See cleanup() and mount_flag in [1].<br></blockquote=
><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">You =
are right. And seems the problem is only exist in original code, it put rea=
p_wd in wrong place and mislead my sight.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((wd =3D myinotify_add_watch=
(fd_notify, DIR_PATH, IN_ALL_EVENTS)) &lt; 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TERRNO,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ino=
tify_add_watch (%d, &quot; DIR_PATH &quot;, IN_ALL_EVENTS) failed&quot;,<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fd_notify);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0reap_wd =3D 1;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; &gt; with reap_wd defined in inotify.h there could be also<br>
&gt; &gt; SAFE_MYINOTIFY_RM_WATCH().<br>
And my suggestion above was to handle this flag in inotify.h. Than it&#39;d=
 make<br>
sense to add also SAFE_MYINOTIFY_RM_WATCH().<br></blockquote><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">You patch set looks=
 good.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Sorry for th=
e error in judgment, that remind me it&#39;s time to go to bed now:).</div>=
</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div=
>

--000000000000469b7c058a949346--

--===============1913897002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1913897002==--
