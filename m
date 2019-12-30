Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0C12D02C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Dec 2019 14:14:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 806CF3C24D3
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Dec 2019 14:14:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C37103C229A
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 14:14:15 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6D53510011DC
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 14:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577711652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J1EGp0sqPAqM7xB5JmUPE3Zk2T6ViROx+0anVXaI8PI=;
 b=DSAZxZi+FHYLIBdAoiMkJlQ6wQbXpziOybXNifiD58S/es2VO8H+BdQhYlDdMmZOAfgbbu
 04CWhyoP7szuEzuY/OGG/P0uvmQ08rCtwSVK3IVgr1aEELK7IFBSChCVeHnhSnba6HNDYb
 6mB1+DIUf0sp2YUYWbo9PuecvyeyPT0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-zqz-waANP16nz1_uOCy1Lw-1; Mon, 30 Dec 2019 08:14:05 -0500
Received: by mail-ot1-f71.google.com with SMTP id 73so17023766otj.10
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 05:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEebt5zcOe3rBTuzzjBzptQjrkicLK0JLFuYZfKEqEo=;
 b=oFQzncQSxN88eDQAzBm4z9Io6Dnkd1ZHPmLmAggNqHcd5PU7c73GQmUVdxh1M83ZxQ
 gR7SJnIrnTXFkeSkWvhTNVZZcgpBb1dOzIkpXwPkFXRn4ipRq4HgMSAymiYdUi1V8DrB
 AjGeJS/Is4VhQUkyAQQlM3TGfofUIoBW9vpz4hF62fUVDlbuJ3zes4YRGaOu3g38ne2f
 TsH7DGfjK2frlWmsc9RymTiY5I5vF9llVC3Z5/kaKJPlbi0KgqaqLejrDFrWtpT3QzN3
 3RLYaNHnhNLs6YTIcIqxSDjTRYjwFZgoMsySYib0n/YPTUdxl/lNcExG/ItXeq6PGezV
 WnzQ==
X-Gm-Message-State: APjAAAWZzxzSIrCh/8CxBXPMRLD+V2x3jxH8CII7IGCh9nrKIErwuRR1
 T60+zv8LgYM5FOLNhtNPDdawlTSauDkYZkAaQcxgjU+ydQp96mwRbJbtlI0c11RVShUHRuxqq5+
 LJQAfA+XTSeEi8xIasnsdqahnMw4=
X-Received: by 2002:a54:4602:: with SMTP id p2mr3440522oip.138.1577711643110; 
 Mon, 30 Dec 2019 05:14:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHOoBh/Z8taGYHgLYFumZfgoaM3rr2ER1n5VizowxMMkwqCT+CWguxUYEh18JlRMKdAoMw4pB5ZcoAB8aSpK8=
X-Received: by 2002:a54:4602:: with SMTP id p2mr3440510oip.138.1577711642698; 
 Mon, 30 Dec 2019 05:14:02 -0800 (PST)
MIME-Version: 1.0
References: <1577257063-246792-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1577257063-246792-1-git-send-email-zhe.he@windriver.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 30 Dec 2019 21:13:51 +0800
Message-ID: <CAEemH2fAwMjPoVX17ydSJ3jchpiLgsXQwr=PN6t77Kpq12puHQ@mail.gmail.com>
To: zhe.he@windriver.com
X-MC-Unique: zqz-waANP16nz1_uOCy1Lw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] nm01: Remove prefix zeros of the addresses output
 by nm before comparing
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
Content-Type: multipart/mixed; boundary="===============1789069136=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1789069136==
Content-Type: multipart/alternative; boundary="000000000000058caa059aeb9e40"

--000000000000058caa059aeb9e40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhe,

On Wed, Dec 25, 2019 at 2:58 PM <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> The latest nm v2.33.1.20191208 outputs symbols addresses without prefix
> zeros
> for "nm -f posix", which causes the following error.
> nm01 5 TFAIL: Got wrong format with -f bsd
>
> Let's remove the prefix zeros before comparing.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  testcases/commands/nm/nm01.sh | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.s=
h
> index 30c41bd..29b6bd7 100755
> --- a/testcases/commands/nm/nm01.sh
> +++ b/testcases/commands/nm/nm01.sh
> @@ -84,6 +84,9 @@ test5()
>         EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \> nm_bsd.out
>         EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \> nm_posix.out
>
> +       ROD awk '{print gensub(/(0+)([0-9a-fA-F]+)/, "\\2", "g")}'
> nm_bsd.out \> nm_bsd.out
>

AWK is base on stream editing, maybe we need the output to a new log file.

> +       ROD awk '{print gensub(/(0+)([0-9a-fA-F]+)/, "\\2", "g")}'
> nm_posix.out \> nm_posix.out
>

The regex is not fit for nm_posix.out since this format of address does not
start with 0000000000, e.g.

# cat nm_posix.out | grep 40108f
.annobin_init.c t 40108f
.annobin_init.c_end t 40108f

# echo 40108f | awk '{print gensub(/(0+)([0-9a-fA-F]+)/, "\\2", "g")}'
4108f


> +
>         ROD awk '{print $3 $2 $1}' nm_bsd.out \> nm1.out
>         ROD awk '{print $1 $2 $3}' nm_posix.out \> nm2.out
>
> --
> 2.7.4
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--000000000000058caa059aeb9e40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Zhe,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Dec 25, 2019 at 2:58 PM &lt;<a href=3D"m=
ailto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: He Zhe &lt;<a href=3D=
"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt=
;<br>
<br>
The latest nm v2.33.1.20191208 outputs symbols addresses without prefix zer=
os<br>
for &quot;nm -f posix&quot;, which causes the following error.<br>
nm01 5 TFAIL: Got wrong format with -f bsd<br>
<br>
Let&#39;s remove the prefix zeros before comparing.<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br>
---<br>
=C2=A0testcases/commands/nm/nm01.sh | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.sh<=
br>
index 30c41bd..29b6bd7 100755<br>
--- a/testcases/commands/nm/nm01.sh<br>
+++ b/testcases/commands/nm/nm01.sh<br>
@@ -84,6 +84,9 @@ test5()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \&gt; n=
m_bsd.out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \&gt;=
 nm_posix.out<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print gensub(/(0+)([0-9a-fA-F]+)/=
, &quot;\\2&quot;, &quot;g&quot;)}&#39; nm_bsd.out \&gt; nm_bsd.out<br></bl=
ockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">AWK is base on stream editing, maybe we need the output to=C2=A0a new l=
og file.</div><div class=3D"gmail_default" style=3D"font-size:small"></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print gensub(/(0+)([0-9a-fA-F]+)/=
, &quot;\\2&quot;, &quot;g&quot;)}&#39; nm_posix.out \&gt; nm_posix.out<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">The regex is not fit for nm_posix.out since this format=C2=A0o=
f address does not start with 0000000000, e.g.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small"># cat nm_posix.out | grep 40108f<br>.annobin_init.c t=
 40108f <br>.annobin_init.c_end t 40108f=C2=A0<br></div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div># echo 40108f |<span class=3D=
"gmail_default" style=3D"font-size:small"> </span>awk &#39;{print gensub(/(=
0+)([0-9a-fA-F]+)/, &quot;\\2&quot;, &quot;g&quot;)}&#39;<br>4108f<br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ROD awk &#39;{print $3 $2 $1}&#39; nm_bsd.out \=
&gt; nm1.out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ROD awk &#39;{print $1 $2 $3}&#39; nm_posix.out=
 \&gt; nm2.out<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000058caa059aeb9e40--


--===============1789069136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1789069136==--

