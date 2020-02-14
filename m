Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDF15D1C2
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 06:48:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A82133C23B2
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Feb 2020 06:48:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0E2683C2379
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 06:48:48 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 383A66005FD
 for <ltp@lists.linux.it>; Fri, 14 Feb 2020 06:48:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581659325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hRwXZ4oEMLfJdRnkN5wGf7HacP/QMwxIkbKjGrS/jao=;
 b=H4JGs2if8lMfZ37DJ0KWNSSyzFUiJFFpZYEBnkPD667vaWKcnqwLZxtjdQ7KoAMtl3LP+Q
 sy9t6XlZtS7RYWCE1n66FXqkoRyb1VeoKpV4w5QLl+nMbRkUv7X7uGEKRy5Zis7VdBHMaE
 JIHeEOQSnRD7CLy+pHggUB/TfM+dgAA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-I4OiHBf8NLGdvAXRDvD0Pw-1; Fri, 14 Feb 2020 00:48:41 -0500
Received: by mail-ot1-f70.google.com with SMTP id m13so4281868otl.2
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 21:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k/3RKFZH8m+7f4pr2+a5go1WTDntgL5rauTCovx2v1Y=;
 b=WHU/NLBEwYrgrcKqKA7hjcI605Gu1tPIXHXsU12rC5/l5kxljJguD/xjFwEz4YLtI2
 7veoZYUMorjVnDWR7hsrHSFaoKB1SPqMlko4Jb5gzpiR4w3vk5tIyq5K481qKWIVuR/4
 vuFjoifhqMaFSppbVzXeIODcq8GaY1x8q9sPEhVIZHiDyGyjotJECnyXN7CF2de23R+s
 kbChCU/JpEPJfzRdhIYh3yqzx/YdB2A4/8vht9VsVmWTmTzlrT/RwhxXfmDNrjKdVn5X
 VKTLWgHHHzzBHIUp6ulXEyPqduM048gdLIWe3iOYAzu0VuvYMJt2LGhB3nLuPO7JL9AC
 PIjQ==
X-Gm-Message-State: APjAAAWlZTMRvWAy9FDVpFW+r5XNm8PULrdXZBmC/reTE+/MDG230w5A
 B1d8QJ6OAO5oAmMPApIYDQyB0Mvx+v+JmxfSrArSt8pJW6np/E/SLTarEw4PxX6WUz+IjyVAEo9
 ERjzRmDUsVFaPib6O52YYgVcMp5Y=
X-Received: by 2002:a9d:7:: with SMTP id 7mr934939ota.26.1581659320237;
 Thu, 13 Feb 2020 21:48:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEiONifC0Z8c6/vX2tDHjrGIK6ZuX9+ra7xizQzcszxMACxV+IPDMnwRes4kBdlkN8eIFw+OPJpkBylR3plwI=
X-Received: by 2002:a9d:7:: with SMTP id 7mr934921ota.26.1581659319853; Thu,
 13 Feb 2020 21:48:39 -0800 (PST)
MIME-Version: 1.0
References: <1581590121-4626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1581590121-4626-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1420373308.7517416.1581597644001.JavaMail.zimbra@redhat.com>
In-Reply-To: <1420373308.7517416.1581597644001.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 14 Feb 2020 13:48:28 +0800
Message-ID: <CAEemH2e8WwgE+LkVPoUtoH6EhUS=9PhCPRc8_x=ZU8D=8FAF7g@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: I4OiHBf8NLGdvAXRDvD0Pw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/kill11,
 abort01: lower MIN_RLIMIT_CORE size
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
Content-Type: multipart/mixed; boundary="===============1492948657=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1492948657==
Content-Type: multipart/alternative; boundary="000000000000ea7619059e82c1b0"

--000000000000ea7619059e82c1b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 8:41 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > From ulimit manpage, ulimit -c options used 512-bytes-block in posix mo=
de
> > and used 1024-bytes-block in common mode. Usually, this case used "ulim=
it
> >  -c 1024" to test, but it will report TCONF in posix mode under
> unprivileged
> >  user.
> > Since these two cases only check correct signal, lower this size doesn'=
t
> > affect
> > this result. This also can avoid github issue(640[1],83[2]).
> >
> > [1]https://github.com/linux-test-project/ltp/issues/640
> > [2]https://github.com/linux-test-project/ltp/issues/83
> >
> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>
> both look good to me, ack
>

Tested and pushed. Thanks!

--=20
Regards,
Li Wang

--000000000000ea7619059e82c1b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Feb 13, 2020 at 8:41 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; From ulimit manpage, ulimit -c options used 512-bytes-block in posix m=
ode<br>
&gt; and used 1024-bytes-block in common mode. Usually, this case used &quo=
t;ulimit<br>
&gt;=C2=A0 -c 1024&quot; to test, but it will report TCONF in posix mode un=
der unprivileged<br>
&gt;=C2=A0 user.<br>
&gt; Since these two cases only check correct signal, lower this size doesn=
&#39;t<br>
&gt; affect<br>
&gt; this result. This also can avoid github issue(640[1],83[2]).<br>
&gt; <br>
&gt; [1]<a href=3D"https://github.com/linux-test-project/ltp/issues/640" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/linux-test-project/lt=
p/issues/640</a><br>
&gt; [2]<a href=3D"https://github.com/linux-test-project/ltp/issues/83" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/linux-test-project/ltp=
/issues/83</a><br>
&gt; <br>
&gt; Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.=
com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
<br>
both look good to me, ack<br></blockquote><div><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Tested and pushed. Thanks!</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br><=
/div><div>Li Wang<br></div></div></div></div>

--000000000000ea7619059e82c1b0--


--===============1492948657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1492948657==--

