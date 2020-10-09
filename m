Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7828859D
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Oct 2020 10:58:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50C0C3C3343
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Oct 2020 10:58:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0BCEA3C24F5
 for <ltp@lists.linux.it>; Fri,  9 Oct 2020 10:58:01 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C8EC11400BDD
 for <ltp@lists.linux.it>; Fri,  9 Oct 2020 10:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602233879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RtRDuIOgXXOq+LhW2nKH2i8ytAczah0LSika28iJOqk=;
 b=ICs72u/Prq19n53kNhMi86pKveCvOelqW5xZTFROXV9yms6SY7HwJ+MspkYu2uTmr8yuPI
 KGd2OquYxicvB6D/dQ6N8BMeAluwzqHrulqYHRalgwTJFxCbM8AaOHqJLBKW4bm4rC2JGQ
 BwtY+iihExQ3sCVvJeNKv5OxMaQ/ZCc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-Rmz_H6-zOgy68J_Zaw7UsA-1; Fri, 09 Oct 2020 04:57:57 -0400
X-MC-Unique: Rmz_H6-zOgy68J_Zaw7UsA-1
Received: by mail-yb1-f199.google.com with SMTP id j10so8110489ybl.19
 for <ltp@lists.linux.it>; Fri, 09 Oct 2020 01:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RtRDuIOgXXOq+LhW2nKH2i8ytAczah0LSika28iJOqk=;
 b=tMH+GaVQ83IxVrvHyb2tOKvgRYdmqDw0pLvuuj+VRco5VDEiNgMVpZ36QrQFnadhTT
 Jo4atq2d0z2vSYz6p/wF/BZ3L441N4UT3b4koOpNbibsSSL0dvjCsnkfspPZavunVZ/J
 BHzvwRltBAvllUZzp1Q5Vab/pfC4CYbaxJBZhEcyiAYzkjSQkJuYWnfYml7GsITu0bCc
 hKf5TrCXjBsc3Sj8axQo/hFq6OPUJBnqkpO46/YThtr0dqgAUtOupc6zFpvMKhegzas0
 kGdheFgb6DRvuKUebQNkz615RVP7+uSh7RZyveBhKGMa8Pi9wXOLWE9aSXUw9VmVtHQH
 HMtw==
X-Gm-Message-State: AOAM530AQ3wqgMUz1lciWMeFR4/AopsmOfpMolgqPT3RKWfHZHzvoKaM
 CwtRLM4DGDUC/E9Eg0nifSWwFlAmEcfYV4wTIlmyHYcZrxR1/akcJq8nVQFn3oKYfRIK2j3WSgF
 pRf/MBs6V8ELGtLtaa0BLfvOYttQ=
X-Received: by 2002:a25:606:: with SMTP id 6mr16574257ybg.86.1602233876771;
 Fri, 09 Oct 2020 01:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQPiyU8WzcyglF/lwmiGJIoTW17KCfEogRroE/1aaW89sD9lW53qRjXDkRL22J4BH3jpm2jwDhivVC9j8aW2s=
X-Received: by 2002:a25:606:: with SMTP id 6mr16574245ybg.86.1602233876582;
 Fri, 09 Oct 2020 01:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <4bec407cc82038233c8977104ccd03b97ae3fc4c.1602048976.git.viresh.kumar@linaro.org>
 <888008428.17133303.1602068791070.JavaMail.zimbra@redhat.com>
In-Reply-To: <888008428.17133303.1602068791070.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 9 Oct 2020 16:57:44 +0800
Message-ID: <CAEemH2eeFAiKXbP_shjz_8q5qp1-fQijLU2ZDQSUgojGevNYoA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>, Rachel Sibley <rasibley@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: semop: Increase timeout for semop03
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, will@kernel.org,
 LTP List <ltp@lists.linux.it>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: multipart/mixed; boundary="===============1793013566=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1793013566==
Content-Type: multipart/alternative; boundary="0000000000000fad2405b1392520"

--0000000000000fad2405b1392520
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 7, 2020 at 7:06 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > Sometimes the timeout happens before the signal is received and it
> > causes the test to fail with following error:
> >
> >  semop03.c:55: TFAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)
> >
> > Fix this by increasing the timeout to a sufficiently large value.
> >
> > Reported-by: Rachel Sibley <rasibley@redhat.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  testcases/kernel/syscalls/ipc/semop/semop03.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c
> > b/testcases/kernel/syscalls/ipc/semop/semop03.c
> > index 89603f19d651..3a79ed38a904 100644
> > --- a/testcases/kernel/syscalls/ipc/semop/semop03.c
> > +++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
> > @@ -71,7 +71,7 @@ static void setup(void)
> >       semop_supported_by_kernel(tv);
> >
> >       timeout.type = tv->ts_type;
> > -     tst_ts_set_sec(&timeout, 0);
> > +     tst_ts_set_sec(&timeout, 2);
> >       tst_ts_set_nsec(&timeout, 10000000);
> >
> >       SAFE_SIGNAL(SIGHUP, sighandler);
> > --
> > 2.25.0.rc1.19.g042ed3e048af
>
> Acked-by: Jan Stancek <jstancek@redhat.com>
>

Patch applied.


-- 
Regards,
Li Wang

--0000000000000fad2405b1392520
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Oct 7, 2020 at 7:06 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
----- Original Message -----<br>
&gt; Sometimes the timeout happens before the signal is received and it<br>
&gt; causes the test to fail with following error:<br>
&gt; <br>
&gt;=C2=A0 semop03.c:55: TFAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)=
<br>
&gt; <br>
&gt; Fix this by increasing the timeout to a sufficiently large value.<br>
&gt; <br>
&gt; Reported-by: Rachel Sibley &lt;<a href=3D"mailto:rasibley@redhat.com" =
target=3D"_blank">rasibley@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.=
org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 testcases/kernel/syscalls/ipc/semop/semop03.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c<br>
&gt; b/testcases/kernel/syscalls/ipc/semop/semop03.c<br>
&gt; index 89603f19d651..3a79ed38a904 100644<br>
&gt; --- a/testcases/kernel/syscalls/ipc/semop/semop03.c<br>
&gt; +++ b/testcases/kernel/syscalls/ipc/semop/semop03.c<br>
&gt; @@ -71,7 +71,7 @@ static void setup(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0semop_supported_by_kernel(tv);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout.type =3D tv-&gt;ts_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0tst_ts_set_sec(&amp;timeout, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_ts_set_sec(&amp;timeout, 2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_ts_set_nsec(&amp;timeout, 10000000);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_SIGNAL(SIGHUP, sighandler);<br>
&gt; --<br>
&gt; 2.25.0.rc1.19.g042ed3e048af<br>
<br>
Acked-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"=
_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">Patch applied.</div><br=
></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--0000000000000fad2405b1392520--


--===============1793013566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1793013566==--

