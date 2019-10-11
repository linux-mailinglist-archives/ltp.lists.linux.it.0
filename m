Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98753D3AFD
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:25:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 571393C1480
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:25:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 424403C1443
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:25:07 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8041D1A017A1
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:25:06 +0200 (CEST)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A753F11A14
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 08:25:04 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id i8so4420723otc.19
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 01:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=21sNzch2eH1zGeL5xXhMpCvRW+e05iqByD9r3Tpk+yE=;
 b=CrFv7aKiCMyLdpPOHc7sSZNECFsq5PejcwFdhbaph8zvO5bwdv9YDqfTvnRVKI91Nf
 3gd466R0jaPlHlOVDlXyrIRwA9l2a3rxCh7cajH4dt2oOliknNRANkRfpL8xKRAOZrPD
 2lqu/e90DI53/yCghJGewMDVv7XngF1xNCi42uv0f8KSvPyTRbttk8iYNZ/OnWWtcaSZ
 yIIg5QlGM4bdNIifWxFq+kVcVnUsRMdIxnBLSEGhyXK46cCxnj0vLjAHjoeczMmUYlBX
 hzWSNs0vWUMHxi5lyW1HvU8XvJ7Y3SfqHAp0Da7Z7VNmmj2D8gR9brXHmXWHXpkN4tll
 zweg==
X-Gm-Message-State: APjAAAUSxeWhAYYP12AXNvAYL3qzA4IrZxlpREyOn1lShG/huRe9QECm
 Y///oE0nUQqa6CGwzfhrNSNtxMUeYEZxVOK+6Oo4rNltWkZyfP0CU6OF0mfh94x6z5tR7LOjeQe
 xmbmUDQWwiGtzsjn93KnQNGOqOZk=
X-Received: by 2002:aca:370b:: with SMTP id e11mr10785036oia.96.1570782304187; 
 Fri, 11 Oct 2019 01:25:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOZ63+isZ4YkE1SkenJo5po8mi8EfH4+edqD8BAA3Us1nGC0fzB6Ss4pRLAd2waAn+KpPXjYBot/u2ABIby3E=
X-Received: by 2002:aca:370b:: with SMTP id e11mr10785026oia.96.1570782303896; 
 Fri, 11 Oct 2019 01:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
In-Reply-To: <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 11 Oct 2019 16:24:52 +0800
Message-ID: <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] read_all: retry to queue work for any worker
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
Content-Type: multipart/mixed; boundary="===============0909568783=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0909568783==
Content-Type: multipart/alternative; boundary="0000000000003e766e05949e412a"

--0000000000003e766e05949e412a
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 9, 2019 at 10:43 PM Jan Stancek <jstancek@redhat.com> wrote:

> read_all is currently retrying only for short time period and it's
> retrying to queue for same worker. If that worker is busy, it easily
> hits timeout.
>
> For example 'kernel_page_tables' on aarch64 can take long time to
> open/read:
>   # time dd if=/sys/kernel/debug/kernel_page_tables of=/dev/null count=1
> bs=1024
>   1+0 records in
>   1+0 records out
>   1024 bytes (1.0 kB, 1.0 KiB) copied, 13.0531 s, 0.1 kB/s
>
>   real    0m13.066s
>   user    0m0.000s
>   sys     0m13.059s
>
> Rather than retrying to queue for specific worker, pick any that can accept
> the work and keep trying until we succeed or hit test timeout.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/fs/read_all/read_all.c | 33
> +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>
> v2: Increase sleep gradually.
>
> diff --git a/testcases/kernel/fs/read_all/read_all.c
> b/testcases/kernel/fs/read_all/read_all.c
> index 3dac20e02638..7beb08ccf712 100644
> --- a/testcases/kernel/fs/read_all/read_all.c
> +++ b/testcases/kernel/fs/read_all/read_all.c
> @@ -282,6 +282,35 @@ static void spawn_workers(void)
>         }
>  }
>
> +static void work_push_retry(int worker, const char *buf)
> +{
> +       int i, ret, worker_min, worker_max, usleep_time = 100;
> +
> +       if (worker < 0) {
> +               /* pick any, try -worker first */
> +               worker_min = worker * (-1);
> +               worker_max = worker_count;
> +       } else {
> +               /* keep trying worker */
> +               worker_min = worker;
> +               worker_max = worker + 1;
> +       }
> +       i = worker_min;
> +
> +       for (;;) {
> +               ret = queue_push(workers[i].q, buf);
> +               if (ret == 1)
> +                       break;
> +
> +               if (++i >= worker_max) {
> +                       i = worker_min;
> +                       if (usleep_time < 100000)
> +                               usleep_time *= 2;
> +                       usleep(usleep_time);
>

At first, I thought of TST_RETRY_FN_EXP_BACKOFF, but it seems not easy to
find the proper value of MAX_DELAY, so you method looks more stable to
read_all.

   Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000003e766e05949e412a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Oct 9, 2019 at 10:43 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">read_all is currentl=
y retrying only for short time period and it&#39;s<br>
retrying to queue for same worker. If that worker is busy, it easily<br>
hits timeout.<br>
<br>
For example &#39;kernel_page_tables&#39; on aarch64 can take long time to o=
pen/read:<br>
=C2=A0 # time dd if=3D/sys/kernel/debug/kernel_page_tables of=3D/dev/null c=
ount=3D1 bs=3D1024<br>
=C2=A0 1+0 records in<br>
=C2=A0 1+0 records out<br>
=C2=A0 1024 bytes (1.0 kB, 1.0 KiB) copied, 13.0531 s, 0.1 kB/s<br>
<br>
=C2=A0 real=C2=A0 =C2=A0 0m13.066s<br>
=C2=A0 user=C2=A0 =C2=A0 0m0.000s<br>
=C2=A0 sys=C2=A0 =C2=A0 =C2=A00m13.059s<br>
<br>
Rather than retrying to queue for specific worker, pick any that can accept=
<br>
the work and keep trying until we succeed or hit test timeout.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/fs/read_all/read_all.c | 33 ++++++++++++++++++++++++=
+++++++--<br>
=C2=A01 file changed, 31 insertions(+), 2 deletions(-)<br>
<br>
v2: Increase sleep gradually.<br>
<br>
diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/=
read_all/read_all.c<br>
index 3dac20e02638..7beb08ccf712 100644<br>
--- a/testcases/kernel/fs/read_all/read_all.c<br>
+++ b/testcases/kernel/fs/read_all/read_all.c<br>
@@ -282,6 +282,35 @@ static void spawn_workers(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
+static void work_push_retry(int worker, const char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret, worker_min, worker_max, usleep_time=
 =3D 100;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (worker &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* pick any, try -w=
orker first */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worker_min =3D work=
er * (-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worker_max =3D work=
er_count;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* keep trying work=
er */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worker_min =3D work=
er;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worker_max =3D work=
er + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D worker_min;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (;;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D queue_push(=
workers[i].q, buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 1)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (++i &gt;=3D wor=
ker_max) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0i =3D worker_min;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (usleep_time &lt; 100000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_time *=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0usleep(usleep_time);<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">At first, I thought of TST_R=
ETRY_FN_EXP_BACKOFF, but it seems not easy to find the proper value of MAX_=
DELAY, so you method looks more stable to read_all.</div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0Acked-by: =
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;<=
/div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--0000000000003e766e05949e412a--

--===============0909568783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0909568783==--
