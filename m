Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6031F56B
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 08:45:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E66DE3C65C3
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 08:45:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 87AAE3C4F09
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 08:45:33 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id ED2DD6014F6
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 08:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613720730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pyoox8Giawx3oy+Ll7P/B4vmAfwKWR9lY1YUp7fUkC4=;
 b=ZFysIjQw/wdKQIhN/xB39knAFRW9zJ8XIl5zBlu8J/gyF58VBL4LAhZSXtrjk5jr6K3aW/
 mFFi5t+u8JlqeyjCxaRB/sJz+dPHRnkg7KoTY17Q2kWQ8cinYMSeGQl9LuAh+mM3xZXyeD
 SiKRyHATyUsWJO2vs11SpAsnO07jOR8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-IPLzChjpP02oBUh7gpKaWQ-1; Fri, 19 Feb 2021 02:45:26 -0500
X-MC-Unique: IPLzChjpP02oBUh7gpKaWQ-1
Received: by mail-yb1-f200.google.com with SMTP id v62so5697492ybb.15
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 23:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pyoox8Giawx3oy+Ll7P/B4vmAfwKWR9lY1YUp7fUkC4=;
 b=iO+pK8I1daBmG0g72HmOPJCfVsgo5ecoVAMTeZxmhrSp0LmlUW++SQOzaFkstZ1yIh
 e/ODCTqyu3o3vsnMVMwVA8ZP72MRBsoOh1lh35m4ZaYvrsbWEDBHip2m3sD5maDNnlpK
 Fby5fiDR16mbMUvru6cTXeGhvbT/iMxmUq2H3cvFkniXgwpvr20/jG7UqvENdHXbfHms
 H+Ygg+mLvo9wYlK2DMn3fIpOPub9WC6qcO2Weuo0rYK/OO6Rh+75i04rcfcwAt11FhJf
 d+Vx8Zd4/mSzNf23ZGhfEKyKMeVWzBI/DhSKY38wT1uvSjZE3jVheTrFpkYGN/P8LBMH
 sTdg==
X-Gm-Message-State: AOAM5329ovQlHvRWDDFdr725S7Js4d4SVI7QS+NJDoLvjU3Zd1eKVU/7
 5DTnHzrvhhspGZ41Ui9x8u5sHpRv4EPYfFozQZRoP+HyULUlLbMT6ov2XzrD5xOuoXhsb2M6N8D
 1A0y9xcuFjIq4+JTlojYJfdJh3WE=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr12979314ybb.252.1613720726013; 
 Thu, 18 Feb 2021 23:45:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+8X0e1qIEf4hZ+FN5kNlUNWxrswKl3Jgfhy48kbz5I4FB1rZ01/g252D26AYHlxBxj8GNElOHWaOjdoNiUeo=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr12979291ybb.252.1613720725771; 
 Thu, 18 Feb 2021 23:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20210219050439.179039-1-zhaogongyi@huawei.com>
In-Reply-To: <20210219050439.179039-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Feb 2021 15:45:13 +0800
Message-ID: <CAEemH2e75x8Jbc=ST5VQdg9i-nJDX8zDp=HCt3HaVhVxsVOA2Q@mail.gmail.com>
To: zhao gongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] openposix/fork/11-1.c: Clean up temporary file
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
Content-Type: multipart/mixed; boundary="===============1201205637=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1201205637==
Content-Type: multipart/alternative; boundary="000000000000a06daf05bbaba2f7"

--000000000000a06daf05bbaba2f7
Content-Type: text/plain; charset="UTF-8"

Hi Gongyi,

On Fri, Feb 19, 2021 at 1:05 PM zhao gongyi <zhaogongyi@huawei.com> wrote:

> We need to clean up temporary file /tmp/fork-11-1-XXXXXX which created by
> mkstemp.
>
> Signed-off-by: zhao gongyi <zhaogongyi@huawei.com>
> ---
>  .../open_posix_testsuite/conformance/interfaces/fork/11-1.c     | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git
> a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> index a43bc274c..e9b18958c 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> @@ -79,6 +79,8 @@ int main(void)
>                 return result;
>         }
>
> +       unlink(path_template);
>

Why do we need to delete the tempfile before acquiring a lock?
Or did you mean doing this after the testing(in the cleanup phase).

BTW, seems the child report a wrong status of the locked file, while
fcntl(fd, F_SETLK, &fl) return -1 and sets errno to EACCES or EAGAIN,
shouldn't that mean the file already been locked by the parent?



> +
>         if (fcntl(fd, F_SETLK, &fl) == -1) {
>                 printf("Could not set initial lock: %s (%d)\n",
>                        strerror(errno), errno);
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

--000000000000a06daf05bbaba2f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 1:05 PM zhao gongyi &=
lt;<a href=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We need to=
 clean up temporary file /tmp/fork-11-1-XXXXXX which created by mkstemp.<br=
>
<br>
Signed-off-by: zhao gongyi &lt;<a href=3D"mailto:zhaogongyi@huawei.com" tar=
get=3D"_blank">zhaogongyi@huawei.com</a>&gt;<br>
---<br>
=C2=A0.../open_posix_testsuite/conformance/interfaces/fork/11-1.c=C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-=
1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c<br>
index a43bc274c..e9b18958c 100644<br>
--- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c<br>
+++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c<br>
@@ -79,6 +79,8 @@ int main(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return result;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(path_template);<br></blockquote><div><br=
></div>Why do we need to delete the tempfile before acquiring a lock?</div>=
<div class=3D"gmail_quote"><div class=3D"gmail_default" style=3D"font-size:=
small">Or did you mean doing this after the testing(in the cleanup phase).<=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">BTW, seems the child report a wrong status of the loc=
ked file, while</div><div class=3D"gmail_default" style=3D"font-size:small"=
>fcntl(fd, F_SETLK, &amp;fl) return -1 and sets errno to EACCES or EAGAIN,<=
/div><div class=3D"gmail_default" style=3D"font-size:small">shouldn&#39;t t=
hat mean the file already been locked by the parent?</div><br><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fcntl(fd, F_SETLK, &amp;fl) =3D=3D -1) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Could =
not set initial lock: %s (%d)\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0strerror(errno), errno);<br>
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
Wang<br></div></div></div></div>

--000000000000a06daf05bbaba2f7--


--===============1201205637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1201205637==--

