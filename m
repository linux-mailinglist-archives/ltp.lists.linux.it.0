Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F212F2A19
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 09:34:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 134533C32DA
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 09:34:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 717123C26A5
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 09:34:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E7A7F600F02
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 09:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610440479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BOgVCegaugHsKwSEVVyT7DgIWoYgzoWPUcGixHNLHVw=;
 b=iABiNcHqE1kQ9YdH9kv9h2Qal3wCQz4vaFAY2pItnz5UXN/4IH+SDw/wY9GwUEP5OEw75O
 BGTvjod5dVMxSpxiVXDlf09WjNI4R6kuDXk3k/unQyMyytMo86kWtePspW7J6LaTHHLZq4
 v4MHsBIPqtTNOsC/3kAWkbLnsGmKUnQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-XC_pQIT3OISW-bk3nRC-5w-1; Tue, 12 Jan 2021 03:34:37 -0500
X-MC-Unique: XC_pQIT3OISW-bk3nRC-5w-1
Received: by mail-yb1-f197.google.com with SMTP id w8so1723533ybj.14
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 00:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BOgVCegaugHsKwSEVVyT7DgIWoYgzoWPUcGixHNLHVw=;
 b=Of5JiFCypyvLWbscK7wjO/5c2Bnyz78CBZOW7tYmt/1ehVXNnLFnIo7q+qLedAfW/G
 N8PP+HTVYhcVxAzT7+IZm0n3vxHlBhUS7T2P3Z9PfjnwE/iaGjc/WVTfPybVdTwK4HYg
 vrU02Bns+j3i7fTGdpAnbd1GOscTcHI/+AftxjBLLzGmrPfYu/53CWeAGeAThsFU4T4m
 iM9S6pFfYnhZtjJ3gc5NicdYXpEfyJ4j99AsjaviUxMV4GfW1E5iJ0Sr863DHTpePtw8
 NYy78WtWF3imz0hEYbDNXCAagpc3eJBryN8hai1JKnaqQKTCZBMk+79srFJkDdobJocY
 6dGQ==
X-Gm-Message-State: AOAM533/bFTjtemRZ3rshTyKGloq07de8iRJ1KvSRBOeVMpSd5hac9vw
 ZACngkXJF5QLU0X+yShb1i6+6iGerZkHGpHCmYgMwmwv0YLTWi5mZ8OOCB3iuimHyqoX7o7ybZg
 OAPVHaZT0LjH8PL/BLtQ4M8bIOQw=
X-Received: by 2002:a25:23d7:: with SMTP id j206mr5264311ybj.243.1610440476666; 
 Tue, 12 Jan 2021 00:34:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgyq7b75ShIqjAbDED1TCub7xoux9s/lB/I/Hjy8ScG13niGnh+Zf16c/Rts8QapMJtop7JfA3NOMbpjzPA38=
X-Received: by 2002:a25:23d7:: with SMTP id j206mr5264295ybj.243.1610440476417; 
 Tue, 12 Jan 2021 00:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20210111161103.22433-1-mdoucha@suse.cz>
 <20210111161103.22433-2-mdoucha@suse.cz>
In-Reply-To: <20210111161103.22433-2-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 12 Jan 2021 16:34:24 +0800
Message-ID: <CAEemH2e_5gCmtieHVDiXRv27=hPA+ZOyH+vRSjkhnRO5e=ZcxA@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] Add tst_secureboot_enabled() helper
 function
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
Content-Type: multipart/mixed; boundary="===============0690278210=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0690278210==
Content-Type: multipart/alternative; boundary="00000000000087803005b8afe4b6"

--00000000000087803005b8afe4b6
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 12, 2021 at 12:11 AM Martin Doucha <mdoucha@suse.cz> wrote:

> Also check for SecureBoot status in tst_lockdown_enabled() if the lockdown
> sysfile is not available/readable and the kernel is configured to enable
> lockdown automatically under SecureBoot.
>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>
> Changes since v1:
> - check whether machine is in EFI mode first
>
> Changes since v2:
> - move tst_secureboot_enabled() code to a separate header file
> - move EFIVAR_CFLAGS and EFIVAR_LIBS out of global CFLAGS and LDLIBS
>
> Changes since v3:
> - rewritten using direct read from /sys/ (without libefivar)
>
>  include/tst_lockdown.h |  1 +
>  lib/tst_lockdown.c     | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
> index 78eaeccea..172a7daf5 100644
> --- a/include/tst_lockdown.h
> +++ b/include/tst_lockdown.h
> @@ -5,6 +5,7 @@
>
>  #define PATH_LOCKDOWN  "/sys/kernel/security/lockdown"
>
> +int tst_secureboot_enabled(void);
>  int tst_lockdown_enabled(void);
>
>  #endif /* TST_LOCKDOWN_H */
> diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
> index e7c19813c..a753ca752 100644
> --- a/lib/tst_lockdown.c
> +++ b/lib/tst_lockdown.c
> @@ -9,14 +9,52 @@
>  #include "tst_test.h"
>  #include "tst_safe_macros.h"
>  #include "tst_safe_stdio.h"
> +#include "tst_kconfig.h"
>  #include "tst_lockdown.h"
>

We have to include the "tst_private.h" header file otherwise compiler
failed to build it.

For the series:
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000087803005b8afe4b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jan 12, 2021 at 12:11 AM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.cz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Also ch=
eck for SecureBoot status in tst_lockdown_enabled() if the lockdown<br>
sysfile is not available/readable and the kernel is configured to enable<br=
>
lockdown automatically under SecureBoot.<br>
<br>
Signed-off-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=
=3D"_blank">mdoucha@suse.cz</a>&gt;<br>
---<br>
<br>
Changes since v1:<br>
- check whether machine is in EFI mode first<br>
<br>
Changes since v2:<br>
- move tst_secureboot_enabled() code to a separate header file<br>
- move EFIVAR_CFLAGS and EFIVAR_LIBS out of global CFLAGS and LDLIBS<br>
<br>
Changes since v3:<br>
- rewritten using direct read from /sys/ (without libefivar)<br>
<br>
=C2=A0include/tst_lockdown.h |=C2=A0 1 +<br>
=C2=A0lib/tst_lockdown.c=C2=A0 =C2=A0 =C2=A0| 38 ++++++++++++++++++++++++++=
++++++++++++<br>
=C2=A02 files changed, 39 insertions(+)<br>
<br>
diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h<br>
index 78eaeccea..172a7daf5 100644<br>
--- a/include/tst_lockdown.h<br>
+++ b/include/tst_lockdown.h<br>
@@ -5,6 +5,7 @@<br>
<br>
=C2=A0#define PATH_LOCKDOWN=C2=A0 &quot;/sys/kernel/security/lockdown&quot;=
<br>
<br>
+int tst_secureboot_enabled(void);<br>
=C2=A0int tst_lockdown_enabled(void);<br>
<br>
=C2=A0#endif /* TST_LOCKDOWN_H */<br>
diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c<br>
index e7c19813c..a753ca752 100644<br>
--- a/lib/tst_lockdown.c<br>
+++ b/lib/tst_lockdown.c<br>
@@ -9,14 +9,52 @@<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_safe_macros.h&quot;<br>
=C2=A0#include &quot;tst_safe_stdio.h&quot;<br>
+#include &quot;tst_kconfig.h&quot;<br>
=C2=A0#include &quot;tst_lockdown.h&quot;<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">We have to includ=
e=C2=A0the &quot;tst_private.h&quot; header file otherwise compiler failed =
to build it.</div></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">For th=
e series:</div><div class=3D"gmail_default" style=3D"font-size:small">Revie=
wed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">=
liwang@redhat.com</a>&gt;<br></div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--00000000000087803005b8afe4b6--


--===============0690278210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0690278210==--

