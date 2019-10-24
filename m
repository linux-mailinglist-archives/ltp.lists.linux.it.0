Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5545BE286A
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 04:45:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3B8B3C1CB4
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 04:45:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9D0EC3C1C89
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 04:45:47 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E94C3140133B
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 04:45:44 +0200 (CEST)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9460737E79
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 02:45:42 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id r5so12464045otn.22
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 19:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x2kNTHKFOIib4OVm/LiaoANG1CMMNKoT1rU53YRamNU=;
 b=dRrS3/fecJfU6uhO7831rbzkwxGC+WdIwnaGA+OTCqKjmWLpm2Lhb0mDLNpWUyb1wS
 Uj9VcxCchFUNKayfv5AyOPbM+lc3f8kE6Sz8KAhzz4MjAtuZSkBOc3CyeTn2blff3Zi5
 SE95A9noX95o3gfs18f/gZuxnoEIwd81ARBqm8LaMS8jkvmkGB914fOURnKpLBAD18Fn
 mGg2Xc3r9+HyIdc4YswjXlGnkkfjU4q4ip1tTJdFJhGghIeoWrW9iUiaHgwbYHsVl8+I
 d7gOPqehSdj67uhK/DTU1IhF9eUaVyC/PaCGsXQ9g4eIL4p/JxhmB41PyKO7jztMdPTi
 pH5w==
X-Gm-Message-State: APjAAAVE1mnQA7SUMGpf1BE8zRzqOlejx3uKMaooyNsJQjW0mcOQxtXZ
 Iui4PGK5SR1Lww4QozTIQyPjoLL1rmOOLEo9tKxGqJhRH9xCusv6ObCKAkHw59BJjWCQ2BAPCQI
 obGGNwHfzfOGQRNEJE4DLKujKono=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr9379226oth.118.1571885141953; 
 Wed, 23 Oct 2019 19:45:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHI9EIbkF2wFmz5BR9WkPC9wFcpuZY2YXDd8QaOrXEq5Az2K/YKhPJrL6m8eTJTZTj6tVHcgIownfFiFSH4lQ=
X-Received: by 2002:a9d:5907:: with SMTP id t7mr9379204oth.118.1571885141394; 
 Wed, 23 Oct 2019 19:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191022140757.29713-1-chrubis@suse.cz>
 <20191022140757.29713-2-chrubis@suse.cz>
 <CAEemH2eCpbAuU2xYNtiv9Wq4VwHJE2dZRXnO9v+2H=1=JQJUXQ@mail.gmail.com>
 <1270016842.8517878.1571817492480.JavaMail.zimbra@redhat.com>
 <CAEemH2f2D4PjaMaOE_ADUqg5igEi97nHBsH6A7qXtO-2KO7btg@mail.gmail.com>
 <20191023160640.GA17663@rei>
In-Reply-To: <20191023160640.GA17663@rei>
From: Li Wang <liwang@redhat.com>
Date: Thu, 24 Oct 2019 10:45:30 +0800
Message-ID: <CAEemH2fFhEwuDXbmJ7mN-L_wjidz0XX1wXhMMVX1o_UPcQnjHA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add support for test tags
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
Content-Type: multipart/mixed; boundary="===============2000430007=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2000430007==
Content-Type: multipart/alternative; boundary="0000000000007b289b05959f07c7"

--0000000000007b289b05959f07c7
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 24, 2019 at 12:06 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > Sorry, thanks for the reminder.
> > [I copied the below code to gmail, it always lost the indent]
> >
> > static void print_failure_hints(void)
> > {
> >         unsigned int i;
> >         int hint_printed = 0;
> >         const struct tst_tag *tags = tst_test->tags;
> >
> >         if (!tags)
> >                 return;
> >
> >         for (i = 0; tags[i].name; i++) {
> >                 if (!strcmp(tags[i].name, "linux-git")) {
> >                         if (hint_printed != 1) {
> >                                 hint_printed = 1;
> >                                 print_colored("\nHINT: ");
> >                                 printf("You _MAY_ be missing kernel
> fixes,
> > see:\n\n");
> >                         }
> >
> >                         printf(LINUX_GIT_URL "%s\n", tags[i].value);
> >                 } else if (!strcmp(tags[i].name, "CVE")) {
> >                          if (hint_printed != 2) {
> >                                  hint_printed = 2;
> >                                  print_colored("\nHINT: ");
> >                                  printf("You _MAY_ be vunerable to
> CVE(s),
> > see:\n\n");
> >                           }
> >
> >                         printf(CVE_DB_URL "%s\n", tags[i].value);
>
> This would produce intermixed CVE and linux-git lines unless the tags
> are sorted correctly in the source code, I do not want to depend on the
> order hence the two loops.
>

Yes. But personally I suggest the tags sorted in order. I'm OK with two
loops, it depends on you.


>
> >                 } else {
> >                         print_colored("\nERROR: ");
> >                         printf("tags[%d].name should be linux-git or
> > CVE\n", i);
> >                         return;
>
> I've tried to explain to pvorel already that this is a wrong place to
> assert the tag names. If nothing else this piece of code will be rarely
> triggered and the error would end up ignored.
>

Agree, it seems like too late to see this error in a test fails.


>
> I plan to assert the tag names in the docparse tool that will build the
> test metadata during the LTP build, so that wrong metadata will actually
> fail the LTP build.
>

Cool~ That sounds better.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000007b289b05959f07c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 24, 2019 at 12:06 AM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; Sorry, thanks for the reminder.<br>
&gt; [I copied the below code to gmail, it always lost the indent]<br>
&gt; <br>
&gt; static void print_failure_hints(void)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int hint_printed =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct tst_tag *tags =3D tst_te=
st-&gt;tags;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; tags[i].name; i++) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strc=
mp(tags[i].name, &quot;linux-git&quot;)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (hint_printed !=3D 1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hint_printed =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print_colored(&quot;\nHINT:=
 &quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;You _MAY_ be m=
issing kernel fixes,<br>
&gt; see:\n\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0printf(LINUX_GIT_URL &quot;%s\n&quot;, tags[i].value);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if=
 (!strcmp(tags[i].name, &quot;CVE&quot;)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (hint_printed !=3D 2) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hint_printed =3D 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_colored(&quot;\nHINT=
: &quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;You _MAY_ be =
vunerable to CVE(s),<br>
&gt; see:\n\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0printf(CVE_DB_URL &quot;%s\n&quot;, tags[i].value);<br>
<br>
This would produce intermixed CVE and linux-git lines unless the tags<br>
are sorted correctly in the source code, I do not want to depend on the<br>
order hence the two loops.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Yes. But personally I suggest =
the tags sorted in order. I&#39;m OK with two loops, it depends on you.</di=
v></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0print_colored(&quot;\nERROR: &quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0printf(&quot;tags[%d].name should be linux-git or<br>
&gt; CVE\n&quot;, i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return;<br>
<br>
I&#39;ve tried to explain to pvorel already that this is a wrong place to<b=
r>
assert the tag names. If nothing else this piece of code will be rarely<br>
triggered and the error would end up ignored.<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">Agree, it see=
ms like too late to see this error in a test fails.</div></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I plan to assert the tag names in the docparse tool that will build the<br>
test metadata during the LTP build, so that wrong metadata will actually<br=
>
fail the LTP build.<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Cool~ That sounds better.</div></div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a hr=
ef=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div></div><div><=
br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007b289b05959f07c7--

--===============2000430007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2000430007==--
