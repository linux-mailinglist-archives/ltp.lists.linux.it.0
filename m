Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D02573C4617
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:43:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DD903C6740
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:43:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E2983C1DD9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:43:14 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8B42E1A00CC1
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:43:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626079389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1s3CEVCt0WJkYc3sUEyJDssVYvnJAIhvD8fnJ6hoY9k=;
 b=ZsfhXVrGalry7ja52ss8fzOg0ZVDrJVW1cw8s8/qDhxMevWerdDJmuHxI1X8RLsS/CODhv
 3fd3q53+3LUhBdBNeKDtZM26ns0RYZMgKuI8c4wI3vbiNmUoJv7cFjTAiT7KQGh+7/vTxR
 KurBIgbLaeQILsfPp3PJcAxqMqm8lOc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-cXKHKYV_NYe2T07JNPivMw-1; Mon, 12 Jul 2021 04:43:07 -0400
X-MC-Unique: cXKHKYV_NYe2T07JNPivMw-1
Received: by mail-yb1-f199.google.com with SMTP id
 k32-20020a25b2a00000b0290557cf3415f8so21728947ybj.1
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1s3CEVCt0WJkYc3sUEyJDssVYvnJAIhvD8fnJ6hoY9k=;
 b=oXdzaJ6+0OgFtw6C1lh6oRrIAV53djp04IJyiOw5s9BZBdq77jCQ2glr3W8+sFdUjn
 FIRRzIXMZUwcFf2GGe/51xDAbrnhn8IuCGYlq8+BpmK4nJzN1VfVdAZJ7MKMhCaq17hh
 TczoS2QM8EvnFE2+1zT7VX2I1gN2yIN5jYWbqghEYmWZLYa9M9OO4nBy275vvqydJ/SX
 ezuFLWT2PlrReq8rdAWFJQrOs/sUcPOnBLtd0G3gH8dx4O4yCqXgyqRRw4aqm37ZWhvx
 qac4W1LxYAv4WEcvx4WKyTSY1wOvmIGuAxwOMTC1/ldM3o5QfsAtZn+YZIi5B5PDj5GH
 bhgQ==
X-Gm-Message-State: AOAM5313A75QnWykCz1wsW6jqXiALYHT+wydq/CkSCKzumaYQysoKmDe
 qSZgMr8HlEIRK4tf4s3ZRqARfL6Sn9oxvP/+sc9g6DK2TzQeOMAnIhkZmqC3HiovE+EsrjIR6Gs
 Mon7jthVRm1IFdVuOJIN3F7i9qNk=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr63696359ybi.366.1626079386757; 
 Mon, 12 Jul 2021 01:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgqqA/3iAZhWKM9lDK3TCOAaHXPGF4g4IwI7mNiQDDkDlUm6c4Pgy4PUi46XM9+dLLvvlb6K/QuS/nB3r6Ji4=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr63696345ybi.366.1626079386566; 
 Mon, 12 Jul 2021 01:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2ehOzddTbDqZBcbyZcnUy3899u_U81XGtckf1Gs_LJGMA@mail.gmail.com>
 <af9eb653-4c75-938e-71b1-2e4050b39d26@bell-sw.com>
In-Reply-To: <af9eb653-4c75-938e-71b1-2e4050b39d26@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 12 Jul 2021 16:42:55 +0800
Message-ID: <CAEemH2d9gYfTE28m9bzXstSLWes36bbBo3EuoVvJa2AQpC2DXQ@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============0807868265=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0807868265==
Content-Type: multipart/alternative; boundary="00000000000036991405c6e91cc0"

--00000000000036991405c6e91cc0
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 12, 2021 at 4:37 PM Alexey Kodanev <aleksei.kodanev@bell-sw.com>
wrote:

> On 12.07.2021 11:28, Li Wang wrote:
> >
> >
> > On Mon, Jul 12, 2021 at 3:54 PM Alexey Kodanev <
> aleksei.kodanev@bell-sw.com <mailto:aleksei.kodanev@bell-sw.com>> wrote:
> >
> >     It's unlikely, but still possible that some of them could be
> >     created/released during the test as well, so the patch only
> >     checks errno.
> >
> >     Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com <mailto:
> aleksei.kodanev@bell-sw.com>>
> >     ---
> >     v2: * Move the loop to the test run function and try to get
> >           ENOSPC errno there.
> >
> >
> > I'm fine to go with this but move the loop to test run without any
> > limit will bring new fail if running with parameter '-i 2'.
> >
> > We have to handle that situation (maybe add a judgment to skip
> > test for run more times) in case someone uses it like:
>
> Or just release them asap after tpass?


Sure, but looks a bit redundant.

Or we can just adding a global varible for saving num:

--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -22,7 +22,7 @@
 #include "libnewipc.h"

 static int *segments;
-static int maxshms, segments_cnt;
+static int number = 0, maxshms, segments_cnt;
 static key_t shmkey;

 static void verify_shmget(void)
@@ -30,7 +30,7 @@ static void verify_shmget(void)
        int res = 0, num;

        errno = 0;
-       for (num = 0; num <= maxshms; ++num) {
+       for (num = number; num <= maxshms; ++num) {
                res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL |
SHM_RW);
                if (res == -1)
                        break;
@@ -42,6 +42,8 @@ static void verify_shmget(void)

        tst_res(TPASS, "Maximum number of segments reached (%d), used by
test %d",
                maxshms, segments_cnt);
+
+       number = num;
 }

 static void setup(void)


-- 
Regards,
Li Wang

--00000000000036991405c6e91cc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 4:37 PM Alexey Kodanev &lt;=
<a href=3D"mailto:aleksei.kodanev@bell-sw.com">aleksei.kodanev@bell-sw.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n 12.07.2021 11:28, Li Wang wrote:<br>
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
Or just release them asap after tpass?</blockquote><div><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Sure, but looks a bit redunda=
nt.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Or we can just adding=
 a global varible for saving num:</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div>--- a/testcases/kernel/syscalls/ipc/shmget/s=
hmget03.c<br>+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c<br>@@ -2=
2,7 +22,7 @@<br>=C2=A0#include &quot;libnewipc.h&quot;<br>=C2=A0<br>=C2=A0s=
tatic int *segments;<br>-static int maxshms, segments_cnt;<br>+static int n=
umber =3D 0, maxshms, segments_cnt;<br>=C2=A0static key_t shmkey;<br>=C2=A0=
<br>=C2=A0static void verify_shmget(void)<br>@@ -30,7 +30,7 @@ static void =
verify_shmget(void)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int res =3D 0, num;<br>=
=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>- =C2=A0 =C2=A0 =C2=
=A0 for (num =3D 0; num &lt;=3D maxshms; ++num) {<br>+ =C2=A0 =C2=A0 =C2=A0=
 for (num =3D number; num &lt;=3D maxshms; ++num) {<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D shmget(shmkey + num, SHM_SIZE, =
IPC_CREAT | IPC_EXCL | SHM_RW);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (res =3D=3D -1)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>@@ -42,6 +42,8 @=
@ static void verify_shmget(void)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tst_res(TPASS, &quot;Maximum number of segments reached (%d), used by test =
%d&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxshm=
s, segments_cnt);<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 number =3D num;<br>=C2=A0}=
<br>=C2=A0<br>=C2=A0static void setup(void)<br><div class=3D"gmail_default"=
 style=3D"font-size:small"></div></div><br clear=3D"all"><div><br></div>-- =
<br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regard=
s,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000036991405c6e91cc0--


--===============0807868265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0807868265==--

