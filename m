Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B73C4625
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:56:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C0C33C6741
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:56:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0C313C1DD9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:56:03 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 62BC61400BC2
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626080161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FQPnH2jOfifVLO+Ja5fYIKjbF5I3PIwaYgAfIDT4wzM=;
 b=E8LqXeRvEwKTltnZ0Zh/4D93ZMx2+NGVGzHB4aHLNiVMjp8oD19KdE89vpbR0BAiZ79wdF
 qBaZbz4OuYO/VCTEhke4tKG0H+rDR4/ApB5Ds+XEzSrAZDyeHXNQymZMB0enbHfsb0lyCB
 /rHbAA8ZgqWcXQQumsHyIqz15fyN6Ms=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-NABmv-N1P-S4CdF1X8Vxng-1; Mon, 12 Jul 2021 04:55:59 -0400
X-MC-Unique: NABmv-N1P-S4CdF1X8Vxng-1
Received: by mail-yb1-f200.google.com with SMTP id
 a4-20020a25f5040000b029054df41d5cceso21560692ybe.18
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 01:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FQPnH2jOfifVLO+Ja5fYIKjbF5I3PIwaYgAfIDT4wzM=;
 b=gg94RR5DXqD/MieSDtx6rokrIHDyLGHZs88Lp9ibQlr1Cg9tSpnRW9Vj1T3Zp+oMen
 oZrHycsD43XHbjjXFT1FoYc20OXUhGUS+1wUDJHKU69HNZdgAaLgKrfAouP7CGhM1Vb/
 IO06SyY23PlzVe3hTkgFe5TJIg46Vsl9bMH+deWNGItlfe6CdjO7VLRFqdpO0za5BtH4
 Y8wd69HqZfO7Ff6YUHh42DGXiObMl0c7xJLgJeHFnciRRR0Zdi+UPkcnLzBUWEP2U4Z0
 hHv1Nj2v0T4mNPHEhVOtuNLOlUb5q7beY2H51zrhkhcGFTrSlfxnEsis03VHWiNWoDz1
 1KDw==
X-Gm-Message-State: AOAM530c6ExCy1HL8YjJVV7qrEutyCVzfXErDnDKV5YyzxoIr3IAvepT
 ihEbinEwbkaVh4feTzei5NoOJBN4hyYsVoLH/Mm1vANA8r8qqAp99fp3YMAHlb7hdSFHwg4tAWc
 dUc5RgC6mHeKvcdjOQD+74tkB+Qw=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr66312839yba.243.1626080158943; 
 Mon, 12 Jul 2021 01:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiQNxvxL17otNtA5IOCGYxqKhBxRDWfNx99tLYw+wPHVBbCLMJo4YDLntL4TEguzi3LOfqR3ig92uLQ5ERQkI=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr66312822yba.243.1626080158751; 
 Mon, 12 Jul 2021 01:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2ehOzddTbDqZBcbyZcnUy3899u_U81XGtckf1Gs_LJGMA@mail.gmail.com>
 <af9eb653-4c75-938e-71b1-2e4050b39d26@bell-sw.com>
 <CAEemH2d9gYfTE28m9bzXstSLWes36bbBo3EuoVvJa2AQpC2DXQ@mail.gmail.com>
In-Reply-To: <CAEemH2d9gYfTE28m9bzXstSLWes36bbBo3EuoVvJa2AQpC2DXQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Jul 2021 16:55:46 +0800
Message-ID: <CAEemH2djOOVXQCfhgMcz6Wgn=F+UvqDA0OvVm+45wjMwMUR9DQ@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
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
Subject: Re: [LTP] [PATCH v2 1/2] shmget03: don't depend on existed shared
 resources
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
Content-Type: multipart/mixed; boundary="===============1892184683=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1892184683==
Content-Type: multipart/alternative; boundary="0000000000003d3afd05c6e94af3"

--0000000000003d3afd05c6e94af3
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 12, 2021 at 4:42 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Mon, Jul 12, 2021 at 4:37 PM Alexey Kodanev <
> aleksei.kodanev@bell-sw.com> wrote:
>
>> On 12.07.2021 11:28, Li Wang wrote:
>> >
>> >
>> > On Mon, Jul 12, 2021 at 3:54 PM Alexey Kodanev <
>> aleksei.kodanev@bell-sw.com <mailto:aleksei.kodanev@bell-sw.com>> wrote:
>> >
>> >     It's unlikely, but still possible that some of them could be
>> >     created/released during the test as well, so the patch only
>> >     checks errno.
>> >
>> >     Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com <mailto:
>> aleksei.kodanev@bell-sw.com>>
>> >     ---
>> >     v2: * Move the loop to the test run function and try to get
>> >           ENOSPC errno there.
>> >
>> >
>> > I'm fine to go with this but move the loop to test run without any
>> > limit will bring new fail if running with parameter '-i 2'.
>> >
>> > We have to handle that situation (maybe add a judgment to skip
>> > test for run more times) in case someone uses it like:
>>
>> Or just release them asap after tpass?
>
>
> Sure, but looks a bit redundant.
>
> Or we can just adding a global varible for saving num:
>
> --- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
> @@ -22,7 +22,7 @@
>  #include "libnewipc.h"
>
>  static int *segments;
> -static int maxshms, segments_cnt;
> +static int number = 0, maxshms, segments_cnt;
>  static key_t shmkey;
>
>  static void verify_shmget(void)
> @@ -30,7 +30,7 @@ static void verify_shmget(void)
>         int res = 0, num;
>
>         errno = 0;
> -       for (num = 0; num <= maxshms; ++num) {
> +       for (num = number; num <= maxshms; ++num) {
>

Oh, this method is thoughtless, because if the test gets ENOSPC at
the last looping time, which means num == maxshms, then the global
number will be larger than maxshms, so the test won't fall into
for() loop next time and report FAIL again.

So, let's go with your way: release them after TPASS. This is safer.



>                 res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL
> | SHM_RW);
>                 if (res == -1)
>                         break;
> @@ -42,6 +42,8 @@ static void verify_shmget(void)
>
>         tst_res(TPASS, "Maximum number of segments reached (%d), used by
> test %d",
>                 maxshms, segments_cnt);
> +
> +       number = num;
>  }
>
>  static void setup(void)
>
>
> --
> Regards,
> Li Wang
>


-- 
Regards,
Li Wang

--0000000000003d3afd05c6e94af3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 4:42 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 4:37=
 PM Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw.com" targe=
t=3D"_blank">aleksei.kodanev@bell-sw.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 12.07.2021 11:28, Li Wang wrote:=
<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jul 12, 2021 at 3:54 PM Alexey Kodanev &lt;<a href=3D"mailto:a=
leksei.kodanev@bell-sw.com" target=3D"_blank">aleksei.kodanev@bell-sw.com</=
a> &lt;mailto:<a href=3D"mailto:aleksei.kodanev@bell-sw.com" target=3D"_bla=
nk">aleksei.kodanev@bell-sw.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It&#39;s unlikely, but still possible that some of =
them could be<br>
&gt;=C2=A0 =C2=A0 =C2=A0created/released during the test as well, so the pa=
tch only<br>
&gt;=C2=A0 =C2=A0 =C2=A0checks errno.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Alexey Kodanev &lt;<a href=3D"mailto=
:aleksei.kodanev@bell-sw.com" target=3D"_blank">aleksei.kodanev@bell-sw.com=
</a> &lt;mailto:<a href=3D"mailto:aleksei.kodanev@bell-sw.com" target=3D"_b=
lank">aleksei.kodanev@bell-sw.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0v2: * Move the loop to the test run function and tr=
y to get<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 ENOSPC errno there.<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m fine to go with this but move=C2=A0the loop to test run withou=
t any<br>
&gt; limit will bring new fail if running with parameter &#39;-i 2&#39;.<br=
>
&gt; <br>
&gt; We have to handle that situation (maybe add a judgment to skip<br>
&gt; test for run=C2=A0more times) in case someone uses it like:<br>
<br>
Or just release them asap after tpass?</blockquote><div><br></div><div styl=
e=3D"font-size:small">Sure, but looks a bit redundant.</div><div style=3D"f=
ont-size:small"><br></div><div style=3D"font-size:small">Or we can just add=
ing a global varible for saving num:</div><div style=3D"font-size:small"><b=
r></div>--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c<br>+++ b/test=
cases/kernel/syscalls/ipc/shmget/shmget03.c<br>@@ -22,7 +22,7 @@<br>=C2=A0#=
include &quot;libnewipc.h&quot;<br>=C2=A0<br>=C2=A0static int *segments;<br=
>-static int maxshms, segments_cnt;<br>+static int number =3D 0, maxshms, s=
egments_cnt;<br>=C2=A0static key_t shmkey;<br>=C2=A0<br>=C2=A0static void v=
erify_shmget(void)<br>@@ -30,7 +30,7 @@ static void verify_shmget(void)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int res =3D 0, num;<br>=C2=A0<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 errno =3D 0;<br>- =C2=A0 =C2=A0 =C2=A0 for (num =3D 0; num &l=
t;=3D maxshms; ++num) {<br>+ =C2=A0 =C2=A0 =C2=A0 for (num =3D number; num =
&lt;=3D maxshms; ++num) {<br></div></div></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Oh, this method is th=
oughtless, because if the test gets ENOSPC at</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">the last looping time, which means num =3D=
=3D maxshms, then the global</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">number will be larger than maxshms, so the test won&#39;t fal=
l into</div><div class=3D"gmail_default" style=3D"font-size:small">for() lo=
op next time and report FAIL again.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">So, let&#39;s go with your way: release them after TPASS. This i=
s safer.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D shmget(shmkey + num, SHM_=
SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if (res =3D=3D -1)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>@@ -42,6 +42=
,8 @@ static void verify_shmget(void)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_res(TPASS, &quot;Maximum number of segments reached (%d), used by t=
est %d&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ma=
xshms, segments_cnt);<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 number =3D num;<br>=C2=
=A0}<br>=C2=A0<br>=C2=A0static void setup(void)<br><div style=3D"font-size:=
small"></div></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000003d3afd05c6e94af3--


--===============1892184683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1892184683==--

