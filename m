Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BA224EC5
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 04:52:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4B3F3C2A08
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 04:52:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A5BA23C13D8
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 04:52:18 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4A0471400E06
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 04:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595127135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mY7MqNdT6DFIjkq+8JZdYkSTqDwHaZlk7zFAeupzuXY=;
 b=Jx77PJi682ZZ4ykcphQjzkfBrs2a37kZA4yLibe6Y/ZSn5F2N8AA/zkmzH/TPS5CAX84Dx
 X7n9N+cm7vIVlA0b9idgkXqYFFvQz6hI6aUTw3mfhx4w1mJzMko6bGqRI+zZA7Bj1Y5it1
 L1yxxeYx1x3Kze5kyvVyXpaHLolXVMk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-jrKrjv5HNgiPzGtHNGtR4g-1; Sat, 18 Jul 2020 22:52:11 -0400
X-MC-Unique: jrKrjv5HNgiPzGtHNGtR4g-1
Received: by mail-lf1-f72.google.com with SMTP id o65so6559236lff.19
 for <ltp@lists.linux.it>; Sat, 18 Jul 2020 19:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mY7MqNdT6DFIjkq+8JZdYkSTqDwHaZlk7zFAeupzuXY=;
 b=FgmBhWgqvR2h0D3U5yVhEchbNnXvud/zdO28qCLranFhcFzdXSwsxKXQTeEQRpusF6
 gOJvcpHo7jGv+6MqzmMVRkFAfahUMMPqbETSMNhJ/2ME9MaVxeRrv5YPaJwaC8P5agnx
 p0ZHLT3J8BjE62SHvnuIOyrg0ngB+SmPHgu4ManPEAqfTkPos1NCfgq97S2Br8urjvpe
 GbvWEeWHTKb3nQPGSyt60XjaW7luseZ9fljiJMFLheE5IdDxTJQcMqeDQluaiDe7O99y
 19u+MWesBT7RYg+7lnuo5Nu4yMX+3VEm6MEl/VvHZ+WdC7m5Sn5lCsTYVqqLZsRQ6b6M
 U+hg==
X-Gm-Message-State: AOAM531iT7dRKCtmxqbYWk1NZ5crnF75q2Xmu4E0Fmvl6xr9AJ6YKXmh
 fb4+38DNmuBDfHGRXUMBGQssmoc72Y4004M+b+yCXXfYrrUkKUvSNzugiI4OCPAB45O/kcJp6KZ
 hDRIKrsiiKLf4FDWG1lNBtMx4DAg=
X-Received: by 2002:a05:6512:3047:: with SMTP id
 b7mr7843570lfb.110.1595127129154; 
 Sat, 18 Jul 2020 19:52:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxybQ5DqevRWNn9XFeBJG6yPs2JmlPXbNfv1ykbZc8VkaxgQRP8vyDeEY0lp1VpE62SEsCuA+evzTTRRwTBwek=
X-Received: by 2002:a05:6512:3047:: with SMTP id
 b7mr7843563lfb.110.1595127128905; 
 Sat, 18 Jul 2020 19:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-2-chrubis@suse.cz>
In-Reply-To: <20200717163453.9587-2-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sun, 19 Jul 2020 10:51:57 +0800
Message-ID: <CAEemH2fj27_UtgapsRTisv6CcNzChdNuUHFDuG_YE3Tm7tQv7Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/9] syscalls/ipc: shmctl02: Convert to the new
 library
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
Content-Type: multipart/mixed; boundary="===============0024210768=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0024210768==
Content-Type: multipart/alternative; boundary="000000000000e3f6b105aac279b2"

--000000000000e3f6b105aac279b2
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

This patch looks quite good except for some typos.
(Test get passed on both RHEL8(x86_64) and RHEL7(ppc64))

On Sat, Jul 18, 2020 at 12:34 AM Cyril Hrubis <chrubis@suse.cz> wrote:

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
>

Reviewed-by: Li Wang <liwang@redhat.com>


> ---
>  testcases/kernel/syscalls/ipc/shmctl/Makefile |   4 +-
>  .../kernel/syscalls/ipc/shmctl/shmctl02.c     | 263 ++++++------------
>  2 files changed, 89 insertions(+), 178 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile
> b/testcases/kernel/syscalls/ipc/shmctl/Makefile
> index 0172bb495..bc5bd7c2e 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
> +++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
> @@ -10,7 +10,7 @@ shmctl05: LDLIBS += -lrt
>
>  include $(top_srcdir)/include/mk/testcases.mk
>
> -shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LDLIBS += -lltpipc
> -shmctl06: LDLIBS += -lltpnewipc
> +shmctl01 shmctl03 shmctl04 shmctl05: LDLIBS += -lltpipc
> +shmctl02 shmctl06: LDLIBS += -lltpnewipc
>
> ...
> + * * EFAULT - IPC_SET & buf isn't valid
> + * * EFAULT - IPC_STAT & buf isn't valid
> + * * EINVAL - the command is not valid
> + * * EINVAL - the shmid is not valid
> + * * EINVAL - the shmid belongs to removed shm
>   *
> - * RESTRICTIONS
> - *     none
> + * * EPERM - attempt to stat root owned shm
>

^ EACCES

> + * * EPERM - attempt delete root owned shm
> + * * EPERM - attempt to change root owned shm
> + * * EPERM - attempt to lock root owned shm
> + * * EPERM - attempt to unlock root owned shm
>   */
>
> ...
>
> -       cleanup();
> +       if (TST_ERR == tc[i].error) {
> +               tst_res(TPASS | TTERRNO, "msgctl(%i, %i, %p)",
>

Here should be shmctl() but not msgctl().


> +                       *tc[i].shm_id, tc[i].cmd, tc[i].buf);
> +               return;
> +       }
>
> -       tst_exit();
> +       tst_res(TFAIL | TTERRNO, "msgctl(%i, %i, %p) expected %s",
>

msgctl -- > shmctl().

-- 
Regards,
Li Wang

--000000000000e3f6b105aac279b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Cyril,</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">T=
his patch looks quite good except for some typos.</div><div class=3D"gmail_=
default" style=3D"font-size:small">(Test get passed on both RHEL8(x86_64) a=
nd RHEL7(ppc64))</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Jul 18, 2020 at 12:34 AM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Cyril Hrubis =
&lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a=
>&gt;<br></blockquote><div>=C2=A0</div><div><span class=3D"gmail_default" s=
tyle=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@=
redhat.com">liwang@redhat.com</a>&gt;</span></div><div><span class=3D"gmail=
_default" style=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0testcases/kernel/syscalls/ipc/shmctl/Makefile |=C2=A0 =C2=A04 +-<br>
=C2=A0.../kernel/syscalls/ipc/shmctl/shmctl02.c=C2=A0 =C2=A0 =C2=A0| 263 ++=
++++------------<br>
=C2=A02 files changed, 89 insertions(+), 178 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kern=
el/syscalls/ipc/shmctl/Makefile<br>
index 0172bb495..bc5bd7c2e 100644<br>
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile<br>
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile<br>
@@ -10,7 +10,7 @@ shmctl05: LDLIBS +=3D -lrt<br>
<br>
=C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=
=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
<br>
-shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LDLIBS +=3D -lltpipc<br>
-shmctl06: LDLIBS +=3D -lltpnewipc<br>
+shmctl01 shmctl03 shmctl04 shmctl05: LDLIBS +=3D -lltpipc<br>
+shmctl02 shmctl06: LDLIBS +=3D -lltpnewipc<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+ * * EFAULT - IPC_SET &amp; buf isn&#39;t valid<br>
+ * * EFAULT - IPC_STAT &amp; buf isn&#39;t valid<br>
+ * * EINVAL - the command is not valid<br>
+ * * EINVAL - the shmid is not valid<br>
+ * * EINVAL - the shmid belongs to removed shm<br>
=C2=A0 *<br>
- * RESTRICTIONS<br>
- *=C2=A0 =C2=A0 =C2=A0none<br>
+ * * EPERM - attempt to stat root owned shm<br></blockquote><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">^=C2=A0<span class=
=3D"gmail_default"></span>EACCES</div><div class=3D"gmail_default" style=3D=
"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ * * EPERM - attempt delete root owned shm<br>
+ * * EPERM - attempt to change root owned shm<br>
+ * * EPERM - attempt to lock root owned shm<br>
+ * * EPERM - attempt to unlock root owned shm<br>
=C2=A0 */<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_ERR =3D=3D tc[i].error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS | TTE=
RRNO, &quot;msgctl(%i, %i, %p)&quot;,<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Here should be shmctl=
() but not msgctl().</div></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*tc[i].shm_id, tc[i].cmd, tc[i].buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_exit();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTERRNO, &quot;msgctl(%i, %i, %=
p) expected %s&quot;,<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">msgctl -- &gt; shmctl().</div></div><=
/div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div =
dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e3f6b105aac279b2--


--===============0024210768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0024210768==--

