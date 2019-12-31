Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B131212D743
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 10:05:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C8F33C238F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 10:05:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 75FC93C180B
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 10:05:43 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 78A6810028B5
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 10:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577783139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nQzD2u47FgrI28vmHUQzuJs0A9fTD8GvW9Vl/nRECac=;
 b=MUuMjZaQpTqeP/1BfPmzG/YoKtQgtCz560iZvjp0jzk4wJVepW+myUpXTkAcX/PnMJvgYl
 dlvWQ/gBCOio3Agz9S283L+xDU4TqfTxXfsu7fZLyKWglZsxi8yCghZTogQoAFDilPHCn2
 RO2MCcLjfkkRbLJe8ZDZ7J96qGHkKUg=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-EcwxeFXMOsG2rTRPs_ByPg-1; Tue, 31 Dec 2019 04:05:36 -0500
Received: by mail-oi1-f200.google.com with SMTP id m127so4368330oig.19
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 01:05:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MjZhMW4xzHrJjSy4XQwQJHZpe2w7rVUOB8fke+HXjUs=;
 b=pgF9HJDVobUsz+eVv5ImeFony+7vjC/yV7Dfs4Hd08DHiY4qhBGKNZf93kws7YWjpV
 38IY1T7KpNreRr1qmDXGU+rXPQbQ3aXc7zmBZrRVBg3GQCoWwtJSpLGYzIitDV55e8p+
 P4MDw0Geq35cLt3mRJ2o4pGcoXVhOffVU+j2OrqJhzN7lTpt7lugReChM0Y2moM1vqHC
 VkufzsmDFmplCk0M83P77Zevgb7rlNIV3AVznOUQt85FPcPEOYxu7K5SFob7teYvyW+g
 2coDYJ4hx7qqtqR+fFSd5+4q64AQae1qF8VqG40WAPEmG81s8lf/JJHkux7gx2sgKeVi
 JmgQ==
X-Gm-Message-State: APjAAAWodyJXSTCx1NjsXhNgkfXq8Q2yqBsW8IqIOQKOTwZ/o7plmPKz
 28+kl7ZawHZ2zj8giB0m6lvLMhOTofXUyC5SDUo7AbKIaxZDlBEsLsbtmTyaTo6rP3WELo4292C
 5S1XKJahMNKkUnCRgCxWS63fK0f0=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr75145832otg.118.1577783135647; 
 Tue, 31 Dec 2019 01:05:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNhvVUNiRqNGRkXIv+IBAiOFnpcHGiyjsISvGbdzoNGUGAYkColBTocg7MfhCImud7HBQ+P5PQX8dgPuZyPbY=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr75145809otg.118.1577783135453; 
 Tue, 31 Dec 2019 01:05:35 -0800 (PST)
MIME-Version: 1.0
References: <1577775768-134223-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1577775768-134223-1-git-send-email-zhe.he@windriver.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Dec 2019 17:05:24 +0800
Message-ID: <CAEemH2fjzJmerA+_BvGnGKBpStw9YAWWdze8RW4fzahg+NoTMw@mail.gmail.com>
To: zhe.he@windriver.com
X-MC-Unique: EcwxeFXMOsG2rTRPs_ByPg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] nm01: Remove prefix zeros of the addresses
 output by nm before comparing
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
Content-Type: multipart/mixed; boundary="===============1393148435=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1393148435==
Content-Type: multipart/alternative; boundary="00000000000052b510059afc43b7"

--00000000000052b510059afc43b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2019 at 3:03 PM <zhe.he@windriver.com> wrote:

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
>
Reviewed-by: Li Wang <liwang@redhat.com>


> ---
> v2:
> Add boundary mark to RE pattern to exactly cover the prefix zeros
> Add one more temp file to contain trimmed output
>
>  testcases/commands/nm/nm01.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.s=
h
> index 30c41bd..fd9d3d9 100755
> --- a/testcases/commands/nm/nm01.sh
> +++ b/testcases/commands/nm/nm01.sh
> @@ -84,8 +84,11 @@ test5()
>         EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \> nm_bsd.out
>         EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \> nm_posix.out
>
> -       ROD awk '{print $3 $2 $1}' nm_bsd.out \> nm1.out
> -       ROD awk '{print $1 $2 $3}' nm_posix.out \> nm2.out
> +       ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}'
> nm_bsd.out \> trimmed_nm_bsd.out
> +       ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}'
> nm_posix.out \> trimmed_nm_posix.out
> +
> +       ROD awk '{print $3 $2 $1}' trimmed_nm_bsd.out \> nm1.out
> +       ROD awk '{print $1 $2 $3}' trimmed_nm_posix.out \> nm2.out
>
>         if diff nm1.out nm2.out > /dev/null; then
>                 tst_res TPASS "Got BSD format with -f bsd"
> --
> 2.7.4
>
>

--=20
Regards,
Li Wang

--00000000000052b510059afc43b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 31, 2019 at 3:03 PM &lt;<a href=3D"mail=
to:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">From: He Zhe &lt;<a href=3D"ma=
ilto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;<b=
r>
<br>
The latest nm v2.33.1.20191208 outputs symbols addresses without prefix zer=
os<br>
for &quot;nm -f posix&quot;, which causes the following error.<br>
nm01 5 TFAIL: Got wrong format with -f bsd<br>
<br>
Let&#39;s remove the prefix zeros before comparing.<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D=
"_blank">zhe.he@windriver.com</a>&gt;<br></blockquote><div><span class=3D"g=
mail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D=
"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span=
 class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v2:<br>
Add boundary mark to RE pattern to exactly cover the prefix zeros<br>
Add one more temp file to contain trimmed output<br>
<br>
=C2=A0testcases/commands/nm/nm01.sh | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.sh<=
br>
index 30c41bd..fd9d3d9 100755<br>
--- a/testcases/commands/nm/nm01.sh<br>
+++ b/testcases/commands/nm/nm01.sh<br>
@@ -84,8 +84,11 @@ test5()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \&gt; n=
m_bsd.out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \&gt;=
 nm_posix.out<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print $3 $2 $1}&#39; nm_bsd.out \=
&gt; nm1.out<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print $1 $2 $3}&#39; nm_posix.out=
 \&gt; nm2.out<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print gensub(/\y(0+)([0-9a-fA-F]+=
)\y/, &quot;\\2&quot;, &quot;g&quot;)}&#39; nm_bsd.out \&gt; trimmed_nm_bsd=
.out<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print gensub(/\y(0+)([0-9a-fA-F]+=
)\y/, &quot;\\2&quot;, &quot;g&quot;)}&#39; nm_posix.out \&gt; trimmed_nm_p=
osix.out<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print $3 $2 $1}&#39; trimmed_nm_b=
sd.out \&gt; nm1.out<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ROD awk &#39;{print $1 $2 $3}&#39; trimmed_nm_p=
osix.out \&gt; nm2.out<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if diff nm1.out nm2.out &gt; /dev/null; then<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TPASS &quot=
;Got BSD format with -f bsd&quot;<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000052b510059afc43b7--


--===============1393148435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1393148435==--

