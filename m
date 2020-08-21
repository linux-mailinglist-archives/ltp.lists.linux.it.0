Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C381124CB39
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:16:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67CCD3C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:16:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A688A3C2F97
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:16:53 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 72E2F600691
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597979811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WEyuSIPoSNp7DTzUJMCaVLzRjuTHT4MTS6X19T588Jk=;
 b=OWUiSNFlE+OoXVWD1hhYqJGFdNtmAquxuMj9yMQO3m51dEr3/bOt3lfUoxgmQeUqEieSL0
 /RjTdzNUUU8ZQKBrL4MInVtZV83GjyLSmYo3TDZ70RXCxt3FyRCPcC7zxtRK1PkqgTeM84
 vB5HbkODQexBxkSfbn84GcV4KdbSBQU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-ar1_IosBNju2JVTt36dlqA-1; Thu, 20 Aug 2020 23:16:46 -0400
X-MC-Unique: ar1_IosBNju2JVTt36dlqA-1
Received: by mail-yb1-f199.google.com with SMTP id b127so720182ybh.21
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WEyuSIPoSNp7DTzUJMCaVLzRjuTHT4MTS6X19T588Jk=;
 b=LAI/QpZoE2nsZFJp0YneGKyLtFNcRidnpE1XFbrjCR5TUK5dR5a3KYbjyfIqeCxx7j
 N4dtVmtJgx0JBdC5lg13invA4njEjAlFPnLZKiQSq96XrFQ4t33W8bSB8oVnDdxqKHvq
 Ipx112GzuzV1lrSt8og9edS5kqz4DPp+Q0TxcdDu1urtYlmTqVreSTbvdhMCtc3pT5V0
 PmvZIwhuoDk/3Vx7lrn298Lj5Sh3MVxyavBBnGUugPLye0Nw2z6SKd1XucOg8hvUMi3o
 pRQtaqR2TaJ4FdBGXmiyt6R5dYWh0yX67dlk1+ZAQZdIqWFhWjutgivNxa6s5+KqQOMI
 5jkQ==
X-Gm-Message-State: AOAM533i32ruBqmKKMchXSZaU/DB2XTRmDyBDh2tjYskMZD5rf2sNIWk
 IVcpflpFlexTc9I1y5j2jXu6+dPzwxo3xMjWyNHYAjFrnwE68r3G93SmuTLrnVBZMfOqzcXtEeS
 FSkEIawbEhAiroWunzJ8DxmHkY+Y=
X-Received: by 2002:a25:da82:: with SMTP id n124mr1100872ybf.366.1597979806382; 
 Thu, 20 Aug 2020 20:16:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvRbeDbb/2lvA+kv5vf2cDMVncdIwm0MluUOv5rPk8vWr+3LSRl2aX4dLdGnceOtYLi2HU/5OmebwIN7s7AHk=
X-Received: by 2002:a25:da82:: with SMTP id n124mr1100856ybf.366.1597979806142; 
 Thu, 20 Aug 2020 20:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
 <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
 <43a404a1-dd4b-d091-5723-e756604fbbc8@cn.fujitsu.com>
 <CAEemH2fjgYGLD0+JozNcMqv3Eo0eAwK8+BKOCo0QZihUPiP6eg@mail.gmail.com>
 <ebb95886-a352-ab26-2d40-8a3e2e7fa62f@cn.fujitsu.com>
In-Reply-To: <ebb95886-a352-ab26-2d40-8a3e2e7fa62f@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 21 Aug 2020 11:16:34 +0800
Message-ID: <CAEemH2dzPyHYdnMJa1A15dLrLrt2m5q5HKo6PY+nrVzBuJjv0g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/kill03,
 04: Cleanup && Convert to new library
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
Content-Type: multipart/mixed; boundary="===============1101034647=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1101034647==
Content-Type: multipart/alternative; boundary="000000000000b4319105ad5aaa0c"

--000000000000b4319105ad5aaa0c
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 21, 2020 at 10:22 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> ...
> >     Also, we can use the current process id but it may has unexpected
> >     result
> >     when kill succeed. So fork a child to test maybe a better solution.
> >
> >
> > Hmm, sorry for the uncleared description, actually I meant, to use
> real_pid
> > instead of the tc->child_flag directly, then start to reclaim the child
> > when the
> > real_pid test finishing.
> >
> > Does this below diff work for you?
> It looks well. But the real_pid only valid when the first sub test and
> the real pid is equals to 0 when using -i parameters because we have
> killed this children.
>

Yes, you're right.
How about moving up the real_pid creator to the main process? does it work
for you?

static void verify_kill(unsigned int n)
{
        if (!real_pid) {
                real_pid = SAFE_FORK();
                if (!real_pid)
                        pause();
        }

        TEST(kill(*tc->pid, tc->test_sig));
        ...

        if (real_pid) {
                cleanup();
                real_pid = 0;
        }

}


>
> For pid = 0, it means  then sig is sent to every process in the process
> group of the calling process.  So it looks like we test different thing
> when using -i parameters.  What do you think about this?
>

I even think it is a good idea for code simplification:). In this case, the
first
the subtest is just to verify invalid signal for kill(), it doesn't matter
to go with
kill(0, invalid_signal), that only tries to kill the current main process.
isn't it?

If we go this way, not only the tc->child_flag is no needed, but also not
necessary
to fork a new child to be killed.

-- 
Regards,
Li Wang

--000000000000b4319105ad5aaa0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 21, 2020 at 10:22 AM Yang Xu &lt;<a hre=
f=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, we can use the current process id but it may =
has unexpected<br>
&gt;=C2=A0 =C2=A0 =C2=A0result<br>
&gt;=C2=A0 =C2=A0 =C2=A0when kill succeed. So fork a child to test maybe a =
better solution.<br>
&gt; <br>
&gt; <br>
&gt; Hmm, sorry for the uncleared description, actually I meant, to use rea=
l_pid<br>
&gt; instead of the=C2=A0tc-&gt;child_flag directly, then start to reclaim =
the child <br>
&gt; when the<br>
&gt; real_pid test finishing.<br>
&gt; <br>
&gt; Does this below diff work for you?<br>
It looks well. But the real_pid only valid when the first sub test and <br>
the real pid is equals to 0 when using -i parameters because we have <br>
killed this children.<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">Yes, you&#39;re right.=C2=A0</div><di=
v><div class=3D"gmail_default">How about moving up the real_pid creator to =
the main process? does it work for you?</div><br></div><div><div class=3D"g=
mail_default">static void verify_kill(unsigned int n)</div>{<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (!real_pid) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 real_pid =3D SAFE_FORK();<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!real_pid)<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pause();<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(kill(*tc=
-&gt;pid, tc-&gt;test_sig));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"=
gmail_default">...</span><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (real_pid) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cleanup();<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 real_pid =3D 0;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">}</div></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
For pid =3D 0, it means=C2=A0 then sig is sent to every process in the proc=
ess <br>
group of the calling process.=C2=A0 So it looks like we test different thin=
g <br>
when using -i parameters.=C2=A0 What do you think about this?<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I even think it is a good idea for code simplification:). In this case, =
the first</div></div><div class=3D"gmail_default" style=3D"font-size:small"=
>the subtest is just to verify invalid signal for kill(), it doesn&#39;t ma=
tter to go with</div><div class=3D"gmail_default" style=3D"font-size:small"=
>kill(0, invalid_signal), that only tries to kill the current main process.=
 isn&#39;t it?</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">If we go t=
his way, not only the=C2=A0tc-&gt;child_flag is no needed, but also not nec=
essary</div><div class=3D"gmail_default" style=3D"font-size:small">to fork =
a new child to be killed.</div><div><br></div></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000b4319105ad5aaa0c--


--===============1101034647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1101034647==--

