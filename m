Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BDE4000BF
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 15:49:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D6223C959E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 15:49:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9671D3C280F
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:49:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DE67A60103A
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630676974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qaH2xQoROiGhSjKtWXNqxSRLzt8SJVc4p5836Qyx9Ng=;
 b=ObXxBglXAixrkkbeH2ym/abZl2dkacOCkJ8O6a9SjeHtW9cl+uvaeJ8NZb3ZtAAIKAtrSK
 tCE/1tlBPzUhsfhux0FCng9fSQRQ7CuqABsox0gvvF9tMJQzqzEF2cuYxSDfxEHSup92xF
 2fD4S9maxOZKFCHsz57rfe97X/Yd+RM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-lX5jy80YM9iPxmL1AYDiRw-1; Fri, 03 Sep 2021 09:49:31 -0400
X-MC-Unique: lX5jy80YM9iPxmL1AYDiRw-1
Received: by mail-yb1-f200.google.com with SMTP id
 w8-20020a259188000000b0059bf0bed21fso6484661ybl.18
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 06:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaH2xQoROiGhSjKtWXNqxSRLzt8SJVc4p5836Qyx9Ng=;
 b=J3fiJzzQjyEruSkcLWA3QSuM9ezuqxOtEgZ1FEeTrI5M96YqbAY9STLq+/I1pgCYph
 fR+P+T2+e+jw37pqZgyek3uZ6QIPlnA/cqTD1gZ1IsNbcdndLRtmRBpk/gs3eGHbQLKX
 WycnijzOY03ofKIt1BW0HcvusPxdjqLPQK7HJK+X+FLow2//nsRv/PrlNabH07tYr3M5
 uzUq7OMCLBiTr9A9ycyYmX5umCNv9e8bNF2ZNz+nN/Mfrjr3ORNeQA07AYOXytRhkX2a
 0MND/1bnYed1HjHdGQ60Uh1TKMEsqvJQQ9uSNzruaIfK1rkSuBdKJgIRavZrIjSnqSj7
 ZxHg==
X-Gm-Message-State: AOAM533P9NZXs5BTuF62quYga1+6XTt49ajJi0WXnZfa48a1eYfRqHF3
 ew8yA5egcjvO94BCf+Ys9TFVTU2828n+WgJgXnSv9agxLmLo8mZyWZt95wo9hOYSBZwQuQhDotn
 6msp6KKDWSXaii3WIaHfhN8PiG8c=
X-Received: by 2002:a25:4ac6:: with SMTP id x189mr1125734yba.527.1630676970540; 
 Fri, 03 Sep 2021 06:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU9xnhNBdECMTisdiGITubAp6t2unq7wRJy1QWbAXybT9Vbv3uhIrsCwsYSJv5Wi93ppwuGOiNBwFJ+r0HchA=
X-Received: by 2002:a25:4ac6:: with SMTP id x189mr1125694yba.527.1630676970137; 
 Fri, 03 Sep 2021 06:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210902104551.58293-1-liwang@redhat.com>
In-Reply-To: <20210902104551.58293-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 3 Sep 2021 21:49:18 +0800
Message-ID: <CAEemH2fjkZCzY11kGB39W4sSYq2XeoZNHGQ-h8xWn+BwMeymxg@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MANY_SPAN_IN_TEXT,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] copy_file_range03: comparing timestamp with
 tst_timespec_diff
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="===============1405940178=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1405940178==
Content-Type: multipart/alternative; boundary="0000000000008c83ba05cb179159"

--0000000000008c83ba05cb179159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Cc Amir, Thomas if they have better advice on this]

On Thu, Sep 2, 2021 at 6:46 PM Li Wang <liwang@redhat.com> wrote:

> The st_mtime field is defined as st_mtim.tv_sec for backward
> compatibility in struct stat, which might not precise enough
> for timestamp comparing.
>
> Similar issue as:
>   https://lists.linux.it/pipermail/ltp/2020-November/019982.html
>
> Here switch to timespec diff (with compare nanosecond as well) to
> get rid of this kind of rare faliure:
>
>    7    tst_test.c:1345: TINFO: Timeout per run is 0h 05m 00s
>    8    copy_file_range.h:36: TINFO: Testing libc copy_file_range()
>    9    copy_file_range03.c:48: TPASS: copy_file_range sucessfully update=
d
> the timestamp
>    10   tst_test.c:1345: TINFO: Timeout per run is 0h 05m 00s
>    11   copy_file_range.h:39: TINFO: Testing __NR_copy_file_range syscall
>    12   copy_file_range03.c:46: TFAIL: copy_file_range did not update
> timestamp.
>

After digging into syscall copy_file_range (which mainly call
the splice_direct_to_actor), I found it relies on the specific
filesystem (my platform is XFS) to complete the timestamps
updating.

For XFS, the =E2=80=9Cfile_modified=E2=80=9C code path is via
file_update_time() --> current_time() --> timestamp_truncate()
to get a truncated current time for use.

Then, I guess, there is also potential to get a round-down value,
then apply it to the dest_file as timestamp, reflect to the userland,
it shows time no change in 1 second elapsed.

So another improvement is to let it wait a bit more than 1 second
to counteract the rounded-down nanosecond.

I'd add the below change in the patch V2 to make the test more robust.

--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
@@ -32,7 +32,7 @@ static void verify_copy_file_range_timestamp(void)
        struct timespec timestamp1, timestamp2, diff;

        timestamp1 =3D get_timestamp(fd_dest);
-       usleep(1000000);
+       usleep(1500000);

        offset =3D 0;
        TEST(sys_copy_file_range(fd_src, &offset,


>
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  .../syscalls/copy_file_range/copy_file_range03.c  | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.=
c
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> index 253eb57ad..5d055e6ba 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> @@ -12,25 +12,26 @@
>  #define _GNU_SOURCE
>
>  #include "tst_test.h"
> +#include "tst_timer.h"
>  #include "copy_file_range.h"
>
>  static int fd_src;
>  static int fd_dest;
>
> -unsigned long get_timestamp(int fd)
> +struct timespec get_timestamp(int fd)
>  {
>         struct stat filestat;
>
>         fstat(fd, &filestat);
> -       return filestat.st_mtime;
> +       return filestat.st_mtim;
>  }
>
>  static void verify_copy_file_range_timestamp(void)
>  {
>         loff_t offset;
> -       unsigned long timestamp, updated_timestamp;
> +       struct timespec timestamp1, timestamp2, diff;
>
> -       timestamp =3D get_timestamp(fd_dest);
> +       timestamp1 =3D get_timestamp(fd_dest);
>         usleep(1000000);
>
>         offset =3D 0;
> @@ -40,9 +41,11 @@ static void verify_copy_file_range_timestamp(void)
>                 tst_brk(TBROK | TTERRNO,
>                                 "copy_file_range unexpectedly failed");
>
> -       updated_timestamp =3D get_timestamp(fd_dest);
> +       timestamp2 =3D get_timestamp(fd_dest);
>
> -       if (timestamp =3D=3D updated_timestamp)
> +       diff =3D tst_timespec_diff(timestamp1, timestamp2);
> +
> +       if (!diff.tv_sec && !diff.tv_nsec)
>                 tst_brk(TFAIL, "copy_file_range did not update
> timestamp.");
>
>         tst_res(TPASS, "copy_file_range sucessfully updated the
> timestamp");
> --
> 2.31.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--0000000000008c83ba05cb179159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">[Cc Amir, Thomas if they have better advice on this]</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2=
, 2021 at 6:46 PM Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">The st_mtime field is defined as st_mtim.tv_se=
c for backward<br>
compatibility in struct stat, which might not precise enough<br>
for timestamp comparing.<br>
<br>
Similar issue as:<br>
=C2=A0 <a href=3D"https://lists.linux.it/pipermail/ltp/2020-November/019982=
.html" rel=3D"noreferrer" target=3D"_blank">https://lists.linux.it/pipermai=
l/ltp/2020-November/019982.html</a><br>
<br>
Here switch to timespec diff (with compare nanosecond as well) to<br>
get rid of this kind of rare faliure:<br>
<br>
=C2=A0 =C2=A07=C2=A0 =C2=A0 tst_test.c:1345: TINFO: Timeout per run is 0h 0=
5m 00s<br>
=C2=A0 =C2=A08=C2=A0 =C2=A0 copy_file_range.h:36: TINFO: Testing libc copy_=
file_range()<br>
=C2=A0 =C2=A09=C2=A0 =C2=A0 copy_file_range03.c:48: TPASS: copy_file_range =
sucessfully updated the timestamp<br>
=C2=A0 =C2=A010=C2=A0 =C2=A0tst_test.c:1345: TINFO: Timeout per run is 0h 0=
5m 00s<br>
=C2=A0 =C2=A011=C2=A0 =C2=A0copy_file_range.h:39: TINFO: Testing __NR_copy_=
file_range syscall<br>
=C2=A0 =C2=A012=C2=A0 =C2=A0copy_file_range03.c:46: TFAIL: copy_file_range =
did not update timestamp.<br></blockquote><div><br></div>After <span class=
=3D"gmail_default" style=3D"font-size:small">digging</span>=C2=A0into <span=
 class=3D"gmail_default" style=3D"font-size:small">syscall</span>=C2=A0copy=
_file_range<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0</=
span>(<span class=3D"gmail_default">which </span><span class=3D"gmail_defau=
lt">mainly call=C2=A0</span></div><div class=3D"gmail_quote"><span class=3D=
"gmail_default">the=C2=A0</span><span class=3D"gmail_default"></span><span =
style=3D"color:rgb(0,0,0);white-space:pre-wrap">splice_direct_to_actor</spa=
n>),<span class=3D"gmail_default"> </span>I found it relies on=C2=A0<span c=
lass=3D"gmail_default" style=3D"font-size:small">the</span> specific=C2=A0<=
/div><div class=3D"gmail_quote">filesystem (my platform is XFS)<span class=
=3D"gmail_default"> </span><span class=3D"gmail_default">t</span>o<span cla=
ss=3D"gmail_default" style=3D"font-size:small"> </span><span class=3D"gmail=
_default"></span>complete the timestamps</div><div class=3D"gmail_quote"><s=
pan class=3D"gmail_default"> updating.=C2=A0</span></div><div class=3D"gmai=
l_quote"><span class=3D"gmail_default" style=3D"color:rgb(0,0,0);white-spac=
e:pre-wrap"><br></span></div><div class=3D"gmail_quote"><span class=3D"gmai=
l_default" style=3D"color:rgb(0,0,0);white-space:pre-wrap">For XFS, the =E2=
=80=9C</span><span style=3D"color:rgb(0,0,0)"><span class=3D"gmail_default"=
>file_modified=E2=80=9C</span><span class=3D"gmail_default">=C2=A0code path=
=C2=A0</span></span><span style=3D"color:rgb(0,0,0)"><span class=3D"gmail_d=
efault">is via</span></span></div><div class=3D"gmail_quote"><span style=3D=
"color:rgb(0,0,0);white-space:pre-wrap"><span class=3D"gmail_default" style=
=3D"font-size:small">   </span>file_update_time() --&gt; current_time() --&=
gt; timestamp_truncate() </span></div><div class=3D"gmail_quote"><span styl=
e=3D"color:rgb(0,0,0);white-space:pre-wrap">to get <span class=3D"gmail_def=
ault">a truncated </span></span><span style=3D"color:rgb(0,0,0);white-space=
:pre-wrap">current time for <span class=3D"gmail_default" style=3D"font-siz=
e:small">use</span>.</span></div><div class=3D"gmail_quote"><span style=3D"=
color:rgb(0,0,0);white-space:pre-wrap"><br></span></div><div class=3D"gmail=
_quote"><span class=3D"gmail_default" style=3D"font-size:small"><font color=
=3D"#000000"><span style=3D"white-space:pre-wrap">Then, I guess, </span></f=
ont> there is also potential to get a=C2=A0</span><span class=3D"gmail_defa=
ult">round-down value</span><span class=3D"gmail_default"></span>,</div><di=
v class=3D"gmail_quote">then <span class=3D"gmail_default">apply it to the =
dest_file as timestamp, reflect to the=C2=A0</span><span class=3D"gmail_def=
ault">userland,</span></div><div class=3D"gmail_quote"><span class=3D"gmail=
_default">it </span>show<span class=3D"gmail_default">s</span> <span class=
=3D"gmail_default"></span>time no<span class=3D"gmail_default"> </span>chan=
ge in 1<span class=3D"gmail_default"> </span>second<span class=3D"gmail_def=
ault"> </span>elapsed<span class=3D"gmail_default" style=3D"font-size:small=
"></span><span class=3D"gmail_default"></span><span class=3D"gmail_default"=
></span>.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te"><div class=3D"gmail_default" style=3D"font-size:small">So another impro=
vement=C2=A0is to let it wait a bit more than 1 second</div><div class=3D"g=
mail_default" style=3D"font-size:small">to counteract=C2=A0the rounded-down=
 nanosecond.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d add =
the below change in the patch V2 to make the test=C2=A0more robust.</div></=
div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><div cl=
ass=3D"gmail_default" style=3D"font-size:small">--- a/testcases/kernel/sysc=
alls/copy_file_range/copy_file_range03.c</div>+++ b/testcases/kernel/syscal=
ls/copy_file_range/copy_file_range03.c<br>@@ -32,7 +32,7 @@ static void ver=
ify_copy_file_range_timestamp(void)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct t=
imespec timestamp1, timestamp2, diff;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timestamp1 =3D get_timestamp(fd_dest);<br>- =C2=A0 =C2=A0 =C2=A0 usleep=
(1000000);<br>+ =C2=A0 =C2=A0 =C2=A0 usleep(1500000);<br>=C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 offset =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(sys_=
copy_file_range(fd_src, &amp;offset,<br><div class=3D"gmail_default" style=
=3D"font-size:small"></div></div><div><div class=3D"gmail_quote"><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_=
blank">liwang@redhat.com</a>&gt;<br>
---<br>
=C2=A0.../syscalls/copy_file_range/copy_file_range03.c=C2=A0 | 15 +++++++++=
------<br>
=C2=A01 file changed, 9 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c =
b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c<br>
index 253eb57ad..5d055e6ba 100644<br>
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c<br>
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c<br>
@@ -12,25 +12,26 @@<br>
=C2=A0#define _GNU_SOURCE<br>
<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
+#include &quot;tst_timer.h&quot;<br>
=C2=A0#include &quot;copy_file_range.h&quot;<br>
<br>
=C2=A0static int fd_src;<br>
=C2=A0static int fd_dest;<br>
<br>
-unsigned long get_timestamp(int fd)<br>
+struct timespec get_timestamp(int fd)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct stat filestat;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fstat(fd, &amp;filestat);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return filestat.st_mtime;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return filestat.st_mtim;<br>
=C2=A0}<br>
<br>
=C2=A0static void verify_copy_file_range_timestamp(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 loff_t offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timestamp, updated_timestamp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec timestamp1, timestamp2, diff;<b=
r>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0timestamp =3D get_timestamp(fd_dest);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timestamp1 =3D get_timestamp(fd_dest);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 usleep(1000000);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 0;<br>
@@ -40,9 +41,11 @@ static void verify_copy_file_range_timestamp(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK | TTE=
RRNO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;copy_file_range unexpectedly f=
ailed&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0updated_timestamp =3D get_timestamp(fd_dest);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0timestamp2 =3D get_timestamp(fd_dest);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (timestamp =3D=3D updated_timestamp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0diff =3D tst_timespec_diff(timestamp1, timestam=
p2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!diff.tv_sec &amp;&amp; !diff.tv_nsec)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TFAIL, &quo=
t;copy_file_range did not update timestamp.&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;copy_file_range sucessfull=
y updated the timestamp&quot;);<br>
-- <br>
2.31.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div></div>

--0000000000008c83ba05cb179159--


--===============1405940178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1405940178==--

