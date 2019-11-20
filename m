Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3627103412
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 07:02:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CC6D3C2380
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 07:02:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4A9AC3C1361
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 07:02:53 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 69D0E1401126
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 07:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574229770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hsiOGT1cNGr0Lo7z40pZcS1Y8sYJ6AUi6IDXf11bxZE=;
 b=Ok7pDvkXjlqOz+ONLRB5H2fF1a346JiNTxH1XGLGOJjKzQmrDi/b44aNFIt/IZqAVE5Zr9
 220QZWf94l1pZfEE52+UEzLD3hBo2XlzWPJs/cZFkBHjDAShVa4b1ja71mtV15/wtFOZCk
 UpoMGcur72sKhOPdAOx2y8pKvsK9PHE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-QOutje7SNq6qpgPgWNj9XQ-1; Wed, 20 Nov 2019 01:02:46 -0500
Received: by mail-ot1-f72.google.com with SMTP id w9so12144391otj.22
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 22:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wWwRepul4fXB9/m6fXDl81O/qGLEALAi/V6KwnOXSCM=;
 b=NaZMSnaujz0LHp2f4zjOzQQQgbY9essvh79z+dOrFnERoZPmXPT1o9kBr2VoyE8hbt
 Vuj1KZJ/zkYDeEns2bU4j/4dugkABN7lyMrnc/rQi7MJHdpCDj0vIsSUjdh6h1rjYSXR
 xVmEzk8Pqagc6iGwhadBL2XtRtbAHWbvyHN79XRCbMPw9RtaWPPoAxJlLvSc6J/SBR5p
 JHRatlwBehtsd3V0jSxD+WcV6D5JHxKAKecytXCJ867fjxaoOjP9mVorFV7TqvJf2YYm
 lFln72X3qmiWycTweWqSzJFpMiz/tzhqbmZaUudVKwxIpksVUPwlQ68sgodiIYGzKRyy
 Ys2A==
X-Gm-Message-State: APjAAAUhFJwlRjyjrQjX7K1vDatLCxOIecuHRay2J94K4yskS8qrbsdO
 stmtohPAZPBzZ0pRu4xVWayH8QAg9OOx7fiwAehONpJObgDtqeYLzGNEdzvjiGo/pc2VYoUc+wg
 LJkX/WZnGVrsgCbZpZa1C3l+HK2M=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr638447otf.118.1574229765344;
 Tue, 19 Nov 2019 22:02:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwyMrATEEGYRj37SVWeJL+HUePjCfWn+r+fHATNoTKgmybGKUE0A7fV42a/0gwC63lREAHDelqemCd49ewHQ7U=
X-Received: by 2002:a9d:4c85:: with SMTP id m5mr638410otf.118.1574229764892;
 Tue, 19 Nov 2019 22:02:44 -0800 (PST)
MIME-Version: 1.0
References: <1a623a82dfac64c8a6f9805c197fa72cb5e6f046.1574159295.git.jstancek@redhat.com>
In-Reply-To: <1a623a82dfac64c8a6f9805c197fa72cb5e6f046.1574159295.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 Nov 2019 14:02:33 +0800
Message-ID: <CAEemH2fiyODj=FedbVK8xtrgz1T3JWO5dBiSUbA1L24XOx2yqA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: QOutje7SNq6qpgPgWNj9XQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: don't pass NULL to strcmp in safe_mount
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
Content-Type: multipart/mixed; boundary="===============0786131468=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0786131468==
Content-Type: multipart/alternative; boundary="000000000000ee893f0597c0ed60"

--000000000000ee893f0597c0ed60
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 6:29 PM Jan Stancek <jstancek@redhat.com> wrote:

> Rachel reports, that pivot_root01 crashes on latest LTP:
>   Thread 3.1 "pivot_root01" received signal SIGSEGV, Segmentation fault.
>   0x00000000004062c4 in safe_mount (file=3Dfile@entry=3D0x413017
> "pivot_root01.c"
>   733             if (strcmp(filesystemtype, "ntfs")) {
>
> Don't pass NULL ptr to strcmp. Also fix return in unreachable path,
> to suppress warning about returning uninitialized 'rval'.
>

Good catch.

And shouldn't we give a "correct" fs_type in pivot_root01.c too? Otherwise,
the test would be failed on an invalid mounted operation I guess.

--- a/testcases/kernel/syscalls/pivot_root/pivot_root01.c
+++ b/testcases/kernel/syscalls/pivot_root/pivot_root01.c
@@ -107,7 +107,7 @@ static void run(unsigned int test_case)
         * Create an initial root dir. pivot_root doesn't work if the
initial root
         * dir is a initramfs, so use chroot to create a safe environment
         */
-       SAFE_MOUNT("none", "/", NULL, MS_REC|MS_PRIVATE, NULL);
+       SAFE_MOUNT("none", "/", "none", MS_REC|MS_PRIVATE, NULL);
        SAFE_MOUNT("none", CHROOT_DIR, "tmpfs", 0, 0);
        SAFE_CHROOT(CHROOT_DIR);



>
> Fixes: ae52b6f41bf3 ("lib: Fix safe_mount() when mounting NTFS on kernels
> with NTFS support")
> Reported-by: Rachel Sibley <rasibley@redhat.com>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  lib/safe_macros.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> index c725c7d7763f..41fa4ca83004 100644
> --- a/lib/safe_macros.c
> +++ b/lib/safe_macros.c
> @@ -730,7 +730,7 @@ int safe_mount(const char *file, const int lineno,
> void (*cleanup_fn)(void),
>          * Don't try using the kernel's NTFS driver when mounting NTFS,
> since
>          * the kernel's NTFS driver doesn't have proper write support.
>          */
> -       if (strcmp(filesystemtype, "ntfs")) {
> +       if (!filesystemtype || strcmp(filesystemtype, "ntfs")) {
>                 rval =3D mount(source, target, filesystemtype, mountflags=
,
> data);
>                 if (!rval)
>                         return 0;
> @@ -764,7 +764,7 @@ int safe_mount(const char *file, const int lineno,
> void (*cleanup_fn)(void),
>                          mountflags, data);
>         }
>
> -       return rval;
> +       return -1;
>  }
>
>  int safe_umount(const char *file, const int lineno, void
> (*cleanup_fn)(void),
> --
> 1.8.3.1
>
>

--=20
Regards,
Li Wang

--000000000000ee893f0597c0ed60
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 19, 2019 at 6:29 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Rachel reports, that=
 pivot_root01 crashes on latest LTP:<br>
=C2=A0 Thread 3.1 &quot;pivot_root01&quot; received signal SIGSEGV, Segment=
ation fault.<br>
=C2=A0 0x00000000004062c4 in safe_mount (file=3Dfile@entry=3D0x413017 &quot=
;pivot_root01.c&quot;<br>
=C2=A0 733=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(filesy=
stemtype, &quot;ntfs&quot;)) {<br>
<br>
Don&#39;t pass NULL ptr to strcmp. Also fix return in unreachable path,<br>
to suppress warning about returning uninitialized &#39;rval&#39;.<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">Good catch.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">And sh=
ouldn&#39;t we give a &quot;correct&quot; fs_type in pivot_root01.c too? Ot=
herwise, the test would be failed on an=C2=A0invalid=C2=A0mounted operation=
 I guess.</div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">--- a/testcases/kernel/syscalls/pivot_root/pivot_root01.c</div>++=
+ b/testcases/kernel/syscalls/pivot_root/pivot_root01.c<br>@@ -107,7 +107,7=
 @@ static void run(unsigned int test_case)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* Create an initial root dir. pivot_root doesn&#39;t work if the init=
ial root<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* dir is a initramfs, so use =
chroot to create a safe environment<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/=
<br>- =C2=A0 =C2=A0 =C2=A0 SAFE_MOUNT(&quot;none&quot;, &quot;/&quot;, NULL=
, MS_REC|MS_PRIVATE, NULL);<br>+ =C2=A0 =C2=A0 =C2=A0 SAFE_MOUNT(&quot;none=
&quot;, &quot;/&quot;, &quot;none&quot;, MS_REC|MS_PRIVATE, NULL);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_MOUNT(&quot;none&quot;, CHROOT_DIR, &quot;tmp=
fs&quot;, 0, 0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_CHROOT(CHROOT_DIR);<br=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Fixes: ae52b6f41bf3 (&quot;lib: Fix safe_mount() when mounting NTFS on kern=
els with NTFS support&quot;)<br>
Reported-by: Rachel Sibley &lt;<a href=3D"mailto:rasibley@redhat.com" targe=
t=3D"_blank">rasibley@redhat.com</a>&gt;<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0lib/safe_macros.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/lib/safe_macros.c b/lib/safe_macros.c<br>
index c725c7d7763f..41fa4ca83004 100644<br>
--- a/lib/safe_macros.c<br>
+++ b/lib/safe_macros.c<br>
@@ -730,7 +730,7 @@ int safe_mount(const char *file, const int lineno, void=
 (*cleanup_fn)(void),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Don&#39;t try using the kernel&#39;s NT=
FS driver when mounting NTFS, since<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the kernel&#39;s NTFS driver doesn&#39;=
t have proper write support.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(filesystemtype, &quot;ntfs&quot;)) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!filesystemtype || strcmp(filesystemtype, &=
quot;ntfs&quot;)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rval =3D mount(sour=
ce, target, filesystemtype, mountflags, data);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rval)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
@@ -764,7 +764,7 @@ int safe_mount(const char *file, const int lineno, void=
 (*cleanup_fn)(void),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mountflags, data);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return rval;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
=C2=A0int safe_umount(const char *file, const int lineno, void (*cleanup_fn=
)(void),<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000ee893f0597c0ed60--


--===============0786131468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0786131468==--

