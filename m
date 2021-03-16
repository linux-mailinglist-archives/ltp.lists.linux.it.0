Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF733CEAB
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 08:33:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFA913C2DAE
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 08:33:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 569A63C2D51
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 08:33:53 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id ED3341A00E32
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 08:33:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615880030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+9Rb2/aZ0LOfZp+kgj7Iyl96aFT/7CoAEDU4zfWYfQs=;
 b=L2q7LEImTO5g0hRSn4YNYUVa4iMHAhLypArE4hwvJAHXwh+GbrTUbG7D/h5rSWPLlYm7h6
 LCDPIKwnyALJQIpMo3Jax50JiXj7wS9NFK1kBNgZIKZS/RRFqfVkaP9AzYi2Y44YkJPRiI
 91brwstwKLuQp7bRVKYsL3sfhLnQENk=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-WYs04ftBM2G95wRS_87O4Q-1; Tue, 16 Mar 2021 03:33:44 -0400
X-MC-Unique: WYs04ftBM2G95wRS_87O4Q-1
Received: by mail-yb1-f198.google.com with SMTP id s187so41235325ybs.22
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 00:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+9Rb2/aZ0LOfZp+kgj7Iyl96aFT/7CoAEDU4zfWYfQs=;
 b=MIjFPXQf0ImVQwhw8vA13bNTdPWQGtdNvlYbNV2Q94jAzlW9uj+jW8YC6bBQeWEQcO
 28pfdeQ4JVC0H3X1Yx2U38paut03somEk9UKvyH5pFh0cRZWvZ4Y4zSXf+EoDzlON3lc
 ZUTzsi2Wl9ui8ArYbkiNtOkFF366kmKc2stK3Xftn/BtVAJLfS5hdGRthF4iMT5s0XaM
 r6gemY66jdVmtBcD9wB0E5BYFYf42myjRyBjwchAqRoBjc7Y+bj+FE47+Te+7zb2j9GX
 4VcxNclHZ8IOPwvQ+uYocH5bmKn6vTbByXhSm3QSFufVgI8v/R6t6/hOfhpkv3QZjZPd
 eT3w==
X-Gm-Message-State: AOAM533hnsnjshOSbl6j4/16z4qMSbHWrqdFqP63snV+WPzgmlQNE6q2
 8gGl5sHmkyBt2fy9yUn3Rk2FM2qIE2rVZSXUvtglWd3pJlA9TYWB6Zh361AQueuJkJ5lWc7iapm
 b1IZb5Ib57pvKRLqUKWKZhyJi/ok=
X-Received: by 2002:a25:af05:: with SMTP id a5mr5224901ybh.86.1615880024394;
 Tue, 16 Mar 2021 00:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8X/IYP0CToANwSvXms99xwtWG55QbxpI4vhX/RX/Uop+LMy1tavb1Es8R79uWVtn00F1NiNO7Oq+/1fzm/M0=
X-Received: by 2002:a25:af05:: with SMTP id a5mr5224885ybh.86.1615880024194;
 Tue, 16 Mar 2021 00:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210316033837.7813-1-xieziyao@huawei.com>
In-Reply-To: <20210316033837.7813-1-xieziyao@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 16 Mar 2021 15:33:32 +0800
Message-ID: <CAEemH2de1anhbvgbR-2j=w4diAqqCUbQEYEp-BmeYnu5fL5RjA@mail.gmail.com>
To: Xie Ziyao <xieziyao@huawei.com>
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
Subject: Re: [LTP] [PATCH] kernel/syscalls/brk: Update file list for
 .gitignore
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
Content-Type: multipart/mixed; boundary="===============0404084652=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0404084652==
Content-Type: multipart/alternative; boundary="000000000000d7995d05bda26258"

--000000000000d7995d05bda26258
Content-Type: text/plain; charset="UTF-8"

Hi Ziyao,

I have mergeed the two fixes, thanks!

On Tue, Mar 16, 2021 at 11:39 AM Xie Ziyao <xieziyao@huawei.com> wrote:

> Add brk02 to .gitignore, which was previously ignored by the author.
>
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
> ---
>  testcases/kernel/syscalls/brk/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/testcases/kernel/syscalls/brk/.gitignore
> b/testcases/kernel/syscalls/brk/.gitignore
> index b16ea36c7..60e16e591 100644
> --- a/testcases/kernel/syscalls/brk/.gitignore
> +++ b/testcases/kernel/syscalls/brk/.gitignore
> @@ -1 +1,2 @@
>  /brk01
> +/brk02
> --
> 2.17.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--000000000000d7995d05bda26258
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
Ziyao,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">I have mergeed the=
 two fixes, thanks!</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Mar 16, 2021 at 11:39 AM Xie Ziyao &lt;<a =
href=3D"mailto:xieziyao@huawei.com">xieziyao@huawei.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Add brk02 to .gitign=
ore, which was previously ignored by the author.<br>
<br>
Signed-off-by: Xie Ziyao &lt;<a href=3D"mailto:xieziyao@huawei.com" target=
=3D"_blank">xieziyao@huawei.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/brk/.gitignore | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/testcases/kernel/syscalls/brk/.gitignore b/testcases/kernel/sy=
scalls/brk/.gitignore<br>
index b16ea36c7..60e16e591 100644<br>
--- a/testcases/kernel/syscalls/brk/.gitignore<br>
+++ b/testcases/kernel/syscalls/brk/.gitignore<br>
@@ -1 +1,2 @@<br>
=C2=A0/brk01<br>
+/brk02<br>
--<br>
2.17.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div>

--000000000000d7995d05bda26258--


--===============0404084652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0404084652==--

