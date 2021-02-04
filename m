Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2817A30F453
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 14:57:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E498A3C7356
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 14:57:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 860263C7349
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 14:57:03 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 00F8E200DAC
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 14:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1NPhpU0ITXiLsgzOoaSMOeTUcFMoB1xnIflgk6xjY/M=;
 b=dO7kKlayeb3lZrFQ8X66ZwyTAdxj+oX+HJ+4+brsmzgHe6dVOyv9v73nFaCXm7ntzGB062
 6lEQ+QHT9wgqbOGBTsOZic5XcdzTfWrg7Q9UUTr1HNOG7IN0WbrulN5Cc/3JToFWXbFnsV
 7PzDgGFq2km47vAiA+BcGRONxzovUQY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-dzuJfKEBPBWE4bHNMeVfCw-1; Thu, 04 Feb 2021 08:56:59 -0500
X-MC-Unique: dzuJfKEBPBWE4bHNMeVfCw-1
Received: by mail-yb1-f199.google.com with SMTP id l197so3375548ybf.17
 for <ltp@lists.linux.it>; Thu, 04 Feb 2021 05:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NPhpU0ITXiLsgzOoaSMOeTUcFMoB1xnIflgk6xjY/M=;
 b=fklQbdmsASUCh2z/8XZ9Ed5BL2dU5b9pyOveu1JLMs13SJk4RX5ww9xrEyfKBYcaDV
 IAEmWJngaUxNlY+atFkGqQu6b4XTBRCWT5ncWK4JHpPWgNJVCryOK1grdG8hDjSWY2yG
 AwkCAoyScwrPW/mn39gQgGfHD2YKiQCGyc8N+JnTF7mweu5hBzHgRI2kSO8iNsF6/8kq
 RdF5thvOUUTXBAS98o08Zw8ZCmjJvKdmy1kMpNhEPko5LCqCMne0kkECM2KhcR5X0BIB
 o0JbpQaUOm6yneiLSihxZnlGlru8J8qnPk2te2ta+CnljhFm6bRj5eHmPzQoVKE/99+m
 r0Ew==
X-Gm-Message-State: AOAM533hvhURoFa4k7HY6jWRZXh1GRAtUcg6lFR1KlM246d7Gs/0Ydo+
 BuECxHwUl8PCtA7TPX8WmGMxpMb9b7oWK0/VZvNuZtoSOUVC5hlAXQwnYttCe2GtqSbXpZvnpfK
 sw5XtXbVY1F3H6JMA87wQGVbfWSw=
X-Received: by 2002:a25:b992:: with SMTP id r18mr12341715ybg.86.1612447018677; 
 Thu, 04 Feb 2021 05:56:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfhTcOuKhff9zf39L1uMb/Aew1uVSEgCMv/EJzbEPb6tllfnFKCVKSfI+XrwdJ7alI4/4KXDq5e4OP5XsMBhI=
X-Received: by 2002:a25:b992:: with SMTP id r18mr12341697ybg.86.1612447018515; 
 Thu, 04 Feb 2021 05:56:58 -0800 (PST)
MIME-Version: 1.0
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1611654925-8994-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <601BC5DE.506@cn.fujitsu.com>
In-Reply-To: <601BC5DE.506@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Feb 2021 21:56:46 +0800
Message-ID: <CAEemH2c01CEkm-S667xUL3J=nRVsEhEYK6yFFQXdNt5+dWA7Mw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/3] syscalls/mallinfo03: Add an overflow test
 when setting 2G size
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
Content-Type: multipart/mixed; boundary="===============1102777124=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1102777124==
Content-Type: multipart/alternative; boundary="000000000000c20d0705ba8313b4"

--000000000000c20d0705ba8313b4
Content-Type: text/plain; charset="UTF-8"

> >     + tst_res(TFAIL, "The member of struct mallinfo overflow, we should
> >     use mallinfo2");
> >
> > TPASS?
> >
> >     + } else {
> >     + /*We will never get here*/
> >     + tst_res(TPASS, "The member of struct mallinfo doesn't overflow");
> >
> >
> > TFAIL?
> >
> >     + }
> >     + free(buf);
> >     +}
>
> It is a "always" fail test.  We should use mallinfo2 in the future. I
> guess failure may attract user's attention than pass.
>

Sorry, I don't understand the intention here. I got failures like below,
allow it to report FAIL each time in CI/CD system?

# ./mallinfo03
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
tst_mallinfo.c:15: TINFO: Test malloc 2G...
tst_mallinfo.c:17: TINFO: arena: 135168
tst_mallinfo.c:18: TINFO: ordblks: 1
tst_mallinfo.c:19: TINFO: smblks: 0
tst_mallinfo.c:20: TINFO: hblks: 1
tst_mallinfo.c:21: TINFO: hblkhd: -2147479552
tst_mallinfo.c:22: TINFO: usmblks: 0
tst_mallinfo.c:23: TINFO: fsmblks: 0
tst_mallinfo.c:24: TINFO: uordblks: 848
tst_mallinfo.c:25: TINFO: fordblks: 134320
tst_mallinfo.c:26: TINFO: keepcost: 134320
mallinfo03.c:36: TFAIL: The member of struct mallinfo overflow, we should
use mallinfo2

Summary:
passed   0
failed   1
broken   0
skipped  0
warnings 0

-- 
Regards,
Li Wang

--000000000000c20d0705ba8313b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0+ tst_res(TFAIL, &quot;The member of struct mallinf=
o overflow, we should<br>
&gt;=C2=A0 =C2=A0 =C2=A0use mallinfo2&quot;);<br>
&gt;<br>
&gt; TPASS?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ /*We will never get here*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ tst_res(TPASS, &quot;The member of struct mallinf=
o doesn&#39;t overflow&quot;);<br>
&gt;<br>
&gt;<br>
&gt; TFAIL?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ free(buf);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
<br>
It is a &quot;always&quot; fail test.=C2=A0 We should use mallinfo2 in the =
future. I <br>
guess failure may attract user&#39;s attention than pass.<br></blockquote><=
div><br></div><div class=3D"gmail_default" style=3D"font-size:small">Sorry,=
 I don&#39;t understand the intention here. I got failures like below, allo=
w it to report FAIL each time in CI/CD system?</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div># ./mallinfo03 <br>tst_test.c:126=
3: TINFO: Timeout per run is 0h 05m 00s<br>tst_mallinfo.c:15: TINFO: Test m=
alloc 2G...<br>tst_mallinfo.c:17: TINFO: arena: 135168<br>tst_mallinfo.c:18=
: TINFO: ordblks: 1<br>tst_mallinfo.c:19: TINFO: smblks: 0<br>tst_mallinfo.=
c:20: TINFO: hblks: 1<br>tst_mallinfo.c:21: TINFO: hblkhd: -2147479552<br>t=
st_mallinfo.c:22: TINFO: usmblks: 0<br>tst_mallinfo.c:23: TINFO: fsmblks: 0=
<br>tst_mallinfo.c:24: TINFO: uordblks: 848<br>tst_mallinfo.c:25: TINFO: fo=
rdblks: 134320<br>tst_mallinfo.c:26: TINFO: keepcost: 134320<br>mallinfo03.=
c:36: TFAIL: The member of struct mallinfo overflow, we should use mallinfo=
2<br><br>Summary:<br>passed =C2=A0 0<br>failed =C2=A0 1<br>broken =C2=A0 0<=
br>skipped =C2=A00<br>warnings 0</div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000c20d0705ba8313b4--


--===============1102777124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1102777124==--

