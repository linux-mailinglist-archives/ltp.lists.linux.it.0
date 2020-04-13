Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEFE1A64B6
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Apr 2020 11:30:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E26683C2B84
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Apr 2020 11:30:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id DF3C23C2B7B
 for <ltp@lists.linux.it>; Mon, 13 Apr 2020 11:30:19 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id CA51E600EAA
 for <ltp@lists.linux.it>; Mon, 13 Apr 2020 11:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586770217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AD7iomC6ziVL3v+Uzl8xsnKKo9795D2ayU91oupLt4A=;
 b=fJxrq3LGugcH0ZtZlHkPj7ZDVQyobnHndevIuVxQtQn+/H2LCxG0w0Q+2vGLHJw9iHBlSZ
 u/x4YlJtP/hDkb/MIm38QPo4J5/qtfY2FfpufDv60KJUUJ/9bLFSFr5hktdFdIxE34PugJ
 OPeSXYIfrhB6oDA32q9e9G1lmZ8RdCc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-d6aNcHL1O52_q1DpAA2bRw-1; Mon, 13 Apr 2020 05:30:15 -0400
X-MC-Unique: d6aNcHL1O52_q1DpAA2bRw-1
Received: by mail-lf1-f70.google.com with SMTP id a14so3560746lfl.15
 for <ltp@lists.linux.it>; Mon, 13 Apr 2020 02:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wsc+6vdb0x3KJn6LV4FvUMWA219C9R7LgEITUfUWZrM=;
 b=oHti8CGULAwxJeFgCsdtzt5qaFfVc+lCmkznmlnFg9M4eULv1qVI7FAdKYLcD7rgWe
 rYdsMYxk38R8fWPYDIKpsaaDGcrZZrvFL2CK2Cp+Sauw1EwzmeeyvXsaxvfE9QzrAzyx
 HLfru0mK8AjhcV6Sw/RAFM74cjVF+xZywYRWRXDl1H0LzTcwK2foKfM5IXezaWIRvKut
 ULBfwVyJufj0LFJDYtoDFbtvdVWTvhYLivVkxBjAvQao3jYlu63PLYuy+kadrliMzoSw
 wrCXIjWXPdW4jLIXmnk1hNaAM4onQfZolqiEliVS9m9yxWTU3gAorgvlKwSQuHve4GzV
 wSIA==
X-Gm-Message-State: AGi0PubQMLjXRYFLKzDl/IeYsAEEhtQ3kdL2u4zmQ+AJIUFqr2QDPnmq
 eFvvKaPzF5Jrva5+oY+jd0RF5aY+aZrj5hLCQRZwwLS6ynjRqkTXkwIKuYIAO7oH1ZetAW0FpNo
 +ebrXo7xj2bwQxi/sP0wHL5kH2EI=
X-Received: by 2002:a2e:a584:: with SMTP id m4mr10167329ljp.194.1586770213467; 
 Mon, 13 Apr 2020 02:30:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypIIPBtQXPwdtyWEUYT5zeDX3XRQomYoenxxtc1XwFgUKv1+PN+56Cd+A3dHUj5C5S9pOiInj+WnG1MNZlbOXLg=
X-Received: by 2002:a2e:a584:: with SMTP id m4mr10167318ljp.194.1586770213262; 
 Mon, 13 Apr 2020 02:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200409170239.13618-1-rpalethorpe@suse.com>
 <9439db89-016f-a498-cc28-fdcd73255f85@cn.fujitsu.com>
In-Reply-To: <9439db89-016f-a498-cc28-fdcd73255f85@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 13 Apr 2020 17:30:01 +0800
Message-ID: <CAEemH2dEF995WQQzS6ML4LAxX9+MurS+0=ai=Jos3xtjsqPAXQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] add_key05: Avoid race with key garbage
 collection
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1006072234=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1006072234==
Content-Type: multipart/alternative; boundary="000000000000e6e90205a328ba71"

--000000000000e6e90205a328ba71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:


> > The key subsystem independently tracks user info against UID. If a user
> is
> > deleted and the UID reused for a new user then the key subsystem will
> mistake
> > the new user for the old one.
> >
> > The keys/keyrings may not be accessible to the new user, but if they ar=
e
> not
> > yet garbage collected (which happens asynchronously) then the new user
> may be
> > exceeding its quota limits.
> >
> > This results in a race condition where this test can fail because the o=
ld
> > thread keyring is taking up the full quota. We can avoid this by creati=
ng
> > multiple users in parallel.
> >
> > This means when -i is used many users will be created. The number of ne=
w
> users
> > is limited to 10 and after the first 10 we begin reusing them. It seems
> best
> > to avoid creating a very large number of users as this may stress the
> system
> > in ways that doesn't make sense for this test. There is a one second
> delay
> > after every 10 iterations to give the system time to free keys. This
> won't be
> > enough on some systems, but I doubt running this test with -i and
> expecting a
> > consistent result is sane.
> >
> > Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > Acked-by: Jan Stancek <jstancek@redhat.com>
> ...
> > +
> > +     if (SAFE_FORK()) {
> > +             tst_reap_children();
> > +             useri++;
> > +             return;
> > +     }
> > +
> It looks strange. Maybe only I think it is strange. Can we use old style?
>
> if (!SAFE_FORK()) {
>       ....
>       ....
>       test
>       exit
> }
>     tst_reap_children();
>     useri++;
>

Nice work, applied V3 with Xu's suggestion.


> > +             verify_max_btyes();
> It is typo(I introduced), I guess maintainer can fix this when merging
> this patch. btyes->bytes
>

Good eyesight!
--=20
Regards,
Li Wang

--000000000000e6e90205a328ba71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@=
cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; The key subsystem independently tracks user info against UID. If a use=
r is<br>
&gt; deleted and the UID reused for a new user then the key subsystem will =
mistake<br>
&gt; the new user for the old one.<br>
&gt; <br>
&gt; The keys/keyrings may not be accessible to the new user, but if they a=
re not<br>
&gt; yet garbage collected (which happens asynchronously) then the new user=
 may be<br>
&gt; exceeding its quota limits.<br>
&gt; <br>
&gt; This results in a race condition where this test can fail because the =
old<br>
&gt; thread keyring is taking up the full quota. We can avoid this by creat=
ing<br>
&gt; multiple users in parallel.<br>
&gt; <br>
&gt; This means when -i is used many users will be created. The number of n=
ew users<br>
&gt; is limited to 10 and after the first 10 we begin reusing them. It seem=
s best<br>
&gt; to avoid creating a very large number of users as this may stress the =
system<br>
&gt; in ways that doesn&#39;t make sense for this test. There is a one seco=
nd delay<br>
&gt; after every 10 iterations to give the system time to free keys. This w=
on&#39;t be<br>
&gt; enough on some systems, but I doubt running this test with -i and expe=
cting a<br>
&gt; consistent result is sane.<br>
&gt; <br>
&gt; Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@su=
se.com" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
&gt; Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br><span class=3D"gmail_default" s=
tyle=3D"font-size:small">...</span><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (SAFE_FORK()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_reap_children();<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0useri++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
It looks strange. Maybe only I think it is strange. Can we use old style?<b=
r>
<br>
if (!SAFE_FORK()) {<br>
=C2=A0 =C2=A0 =C2=A0 ....<br>
=C2=A0 =C2=A0 =C2=A0 ....<br>
=C2=A0 =C2=A0 =C2=A0 test<br>
=C2=A0 =C2=A0 =C2=A0 exit<br>
}<br>
=C2=A0 =C2=A0 tst_reap_children();<br>
=C2=A0 =C2=A0 useri++;<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">Nice work, applied V3 with Xu&#39;s =
suggestion.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0verify_max_btyes();<b=
r>
It is typo(I introduced), I guess maintainer can fix this when merging <br>
this patch. btyes-&gt;bytes<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Good eyesight!</div><div class=3D"gm=
ail_default" style=3D"font-size:small"></div></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li W=
ang<br></div></div></div></div>

--000000000000e6e90205a328ba71--


--===============1006072234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1006072234==--

