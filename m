Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F42B59A4
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 07:17:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F5463C4BF6
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 07:17:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9194A3C3023
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 07:17:57 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 242EF1400450
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 07:17:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605593874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n4v0uoaaWhnJkJ0Yquy3nOOOgayz0Xkmh8CEjXvJycY=;
 b=c5Y2H7TPkqiZLwOI1z0yE3ptjra4Tk49UPn29uuB5Ef9qkWKtg+8HAvWY3lSnWHf3x/PO6
 sgvwu1ttEN5kb5bWgV8QjvGUfG/JM4YZmP77+gwLQTVk3NyJuUdoUJZeWtJp0vMC9480KB
 wzMvU0SGzklGzL/zAFCJK7LIyW8xtEI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-r7D_8Mw-OTqNSmcnwf2Mxg-1; Tue, 17 Nov 2020 01:17:50 -0500
X-MC-Unique: r7D_8Mw-OTqNSmcnwf2Mxg-1
Received: by mail-yb1-f200.google.com with SMTP id c9so23679216ybs.8
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 22:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4v0uoaaWhnJkJ0Yquy3nOOOgayz0Xkmh8CEjXvJycY=;
 b=BUHlfNNh5USzdUij2DTrnZrAv3oIrkyCZsL0VzZLKcRKdgXPHWd1fUS+RbNuMimI7b
 xerfzPsKlD5o+WFhQf3+xpC1SVKdsLxOM0RHCblkkMCHGFXKsNhHh7hAUk9G/ktfBuM7
 N7U/LWRfcQB1xGR8uvuIKMl4s5+TiWAyt+/ZQYtrgHb9n6yif7ryygXY5TA34Yp4rBld
 K4o0qr7Xc6awba2HJ7bB0+Sjcg0QcTwLgFaiFWaIKAxKz4BhM5nzZO5KQvxNzR5mQoQv
 QR0k8JvceEu6Y4MiLM3XOOBsBeuwde+7FMhsyXF2M3/yixmmMdunG4b7RYJ0uHZzBpsy
 x5fw==
X-Gm-Message-State: AOAM530V8YsiJYvESCGrcdN6UAM5jCsgNcSpsJFh09ubN0FdkQeSbhdg
 Im21WRqwgVmRz5GqDpJHfHtzroj4O250HiL4t350uI0nbuBDiJJcEQcTPHGT8AFi58iY1Nt5gup
 0VZWZJ/ItdirfjPH+VpXbzwLWM4w=
X-Received: by 2002:a25:7243:: with SMTP id n64mr33568509ybc.86.1605593870169; 
 Mon, 16 Nov 2020 22:17:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVBKOmoEL2HTjkfe8CYfw/8iG/8GP+Pg5SB7zYhVPymNG9EH6hZmdxYOE5omKM51YIoVPosVcmV7WczF4aT9s=
X-Received: by 2002:a25:7243:: with SMTP id n64mr33568334ybc.86.1605593868507; 
 Mon, 16 Nov 2020 22:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20201116085844.29499-1-rpalethorpe@suse.com>
In-Reply-To: <20201116085844.29499-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Nov 2020 14:17:36 +0800
Message-ID: <CAEemH2frY_yJhm1sh6YQFH84J6CzTr0z2UzW-Ofz4fnod1O3fA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
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
Subject: Re: [LTP] [PATCH] madvise06: Do no set swap limit
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
Content-Type: multipart/mixed; boundary="===============0794936488=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0794936488==
Content-Type: multipart/alternative; boundary="0000000000002fb38405b447746d"

--0000000000002fb38405b447746d
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Mon, Nov 16, 2020 at 4:59 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> Setting the swap limit is unnecessary for this test. By default it
> appears to be set to some large value which is OK. Setting it may fail
> for reasons unrelated to the test's purpose making the test less
> reliable.
>

Generally, this is right. And if the 'memory.limit_in_bytes' has been set
successfully, that means the default value of 'memory.memsw.limit_in_bytes'
is bigger than or equal to it.
(an invalid argument error will occur if not like this)

But in this madvise06, set 'memory.memsw.limit_in_bytes' will safer to test.

The reason is to make sure memsw.limit_in_bytes' is bigger(twifold) than
'memory.limit_in_bytes' otherwise it can't be finished as we expected.
(madvise06 will be stuck when memsw.limit_in_bytes < 2 *
memory.limit_in_bytes)


>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>
> I should not have included this in the first update to the test. It
> appears that it fails with EACCES on at least one configuration, where
> the test ran previously. Also it could fail with EBUSY in theory.
>
> I don't know why limit_in_bytes can be set, but memsw.limit_in_bytes
> results in EACCES. This is interesting, however should be the focus of
> a different test IMO.
>

This sounds like a cgroup issue or related configuration caused.


>
>  testcases/kernel/syscalls/madvise/madvise06.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/madvise/madvise06.c
> b/testcases/kernel/syscalls/madvise/madvise06.c
> index 817faae39..2ba2bac6f 100644
> --- a/testcases/kernel/syscalls/madvise/madvise06.c
> +++ b/testcases/kernel/syscalls/madvise/madvise06.c
> @@ -46,7 +46,6 @@
>
>  #define CHUNK_SZ (400*1024*1024L)
>  #define MEM_LIMIT (CHUNK_SZ / 2)
> -#define MEMSW_LIMIT (2 * CHUNK_SZ)
>  #define PASS_THRESHOLD (CHUNK_SZ / 4)
>  #define PASS_THRESHOLD_KB (PASS_THRESHOLD / 1024)
>
> @@ -124,8 +123,6 @@ static void setup(void)
>         SAFE_FILE_PRINTF("/proc/self/oom_score_adj", "%d", -1000);
>         SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.limit_in_bytes",
> "%ld\n",
>                          MEM_LIMIT);
> -       SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes",
> "%ld\n",
> -                        MEMSW_LIMIT);
>         SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.swappiness", "60");
>         SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/tasks", "%d\n", getpid());
>
> --
> 2.29.1
>
>

-- 
Regards,
Li Wang

--0000000000002fb38405b447746d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Nov 16, 2020 at 4:59 PM Richard Pale=
thorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com">rpalethorpe@suse.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sett=
ing the swap limit is unnecessary for this test. By default it<br>
appears to be set to some large value which is OK. Setting it may fail<br>
for reasons unrelated to the test&#39;s purpose making the test less<br>
reliable.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Generally, this is right. And if the <span class=
=3D"gmail_default">&#39;</span>memory.limit_in_bytes&#39; has been set</div=
><div class=3D"gmail_default">successfully, that means the default value of=
 &#39;memory.memsw.limit_in_bytes&#39;</div><div class=3D"gmail_default">is=
 bigger than or equal to it.</div><div class=3D"gmail_default">(an invalid =
argument error will occur if not like this)</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">But in this madvise06, set &#39;memory.memsw.limit_in_=
bytes&#39; will safer to test.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div>The reason is to make sure memsw.limit_in_bytes&#=
39; is bigger(twifold) than<div class=3D"gmail_default" style=3D"font-size:=
small"><span class=3D"gmail_default">&#39;</span>memory.limit_in_bytes&#39;=
 otherwise it can&#39;t be finished=C2=A0as we expected.</div><div class=3D=
"gmail_default" style=3D"font-size:small">(madvise06 will be stuck when mem=
sw.limit_in_bytes &lt; 2 * memory.limit_in_bytes)</div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Richard Palethorpe &lt;<a href=3D"mailto:rpalethorpe@suse.co=
m" target=3D"_blank">rpalethorpe@suse.com</a>&gt;<br>
---<br>
<br>
I should not have included this in the first update to the test. It<br>
appears that it fails with EACCES on at least one configuration, where<br>
the test ran previously. Also it could fail with EBUSY in theory.<br>
<br>
I don&#39;t know why limit_in_bytes can be set, but memsw.limit_in_bytes<br=
>
results in EACCES. This is interesting, however should be the focus of<br>
a different test IMO.<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">This sounds like a cgroup issue or re=
lated configuration caused.</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
=C2=A0testcases/kernel/syscalls/madvise/madvise06.c | 3 ---<br>
=C2=A01 file changed, 3 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kern=
el/syscalls/madvise/madvise06.c<br>
index 817faae39..2ba2bac6f 100644<br>
--- a/testcases/kernel/syscalls/madvise/madvise06.c<br>
+++ b/testcases/kernel/syscalls/madvise/madvise06.c<br>
@@ -46,7 +46,6 @@<br>
<br>
=C2=A0#define CHUNK_SZ (400*1024*1024L)<br>
=C2=A0#define MEM_LIMIT (CHUNK_SZ / 2)<br>
-#define MEMSW_LIMIT (2 * CHUNK_SZ)<br>
=C2=A0#define PASS_THRESHOLD (CHUNK_SZ / 4)<br>
=C2=A0#define PASS_THRESHOLD_KB (PASS_THRESHOLD / 1024)<br>
<br>
@@ -124,8 +123,6 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(&quot;/proc/self/oom_score_adj=
&quot;, &quot;%d&quot;, -1000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(MNT_NAME&quot;/&quot;GROUP_NAM=
E&quot;/<span class=3D"gmail_default" style=3D"font-size:small"></span>memo=
ry.limit_in_bytes&quot;, &quot;%ld\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MEM_LIMIT);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(MNT_NAME&quot;/&quot;GROUP_NAM=
E&quot;/<span class=3D"gmail_default" style=3D"font-size:small"></span>memo=
ry.memsw.limit_in_bytes&quot;, &quot;%ld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MEMSW_LIMIT);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(MNT_NAME&quot;/&quot;GROUP_NAM=
E&quot;/memory.swappiness&quot;, &quot;60&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(MNT_NAME&quot;/&quot;GROUP_NAM=
E&quot;/tasks&quot;, &quot;%d\n&quot;, getpid());<br>
<br>
-- <br>
2.29.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000002fb38405b447746d--


--===============0794936488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0794936488==--

