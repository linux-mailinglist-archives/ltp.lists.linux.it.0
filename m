Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851A24BAD4
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:19:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D147F3C2FA2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:19:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E8AEC3C0515
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 14:18:58 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 428C960086B
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 14:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597925936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ejVTAoyt0WIo/P269PvI57ikbHu3v9DLP/tOy0fPrbY=;
 b=ZInXU1Av7PCKiftO5ycxhi69wX2TlklaLwEuao3kdmHTqX/eAvpIDSXQUYBg1anQQ8nQ+5
 LOOJiAl1qxs/1jKL/lbw1i2x4/8s6DUMUU1CqjppskMRjqgFUkoS082QUep3ObIOSoq+u+
 2Rx/aiChdKC5guCx6tvgD/YLNxPl/bM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-pzAn647wMCW1QI8ARdyF_g-1; Thu, 20 Aug 2020 08:18:54 -0400
X-MC-Unique: pzAn647wMCW1QI8ARdyF_g-1
Received: by mail-yb1-f197.google.com with SMTP id a75so2051646ybg.15
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 05:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejVTAoyt0WIo/P269PvI57ikbHu3v9DLP/tOy0fPrbY=;
 b=MLTfXNHkIOCGCiNnhHomBPpXtqeRMagz3LdPw2A7SU1473f9oVyTUgAJP0zsr5qFIu
 V1pWdbBOdeZuT3kJ3aHx7/ATCG7nkxROsdPOmDX9lLxAZVfkXWPXScKyI5UtkgZBT/GW
 1Y+hf2wYZUi84kFioAzdc0Do3ncMRFsMxWx26Fc+8LQaRSo5dpeGPqTC3DmTD4rmLqhs
 y9BjH8OeniTbh4Rn5G3JmvkQPpSeGFEsapcBaHU+SMGwPqUU1laKWPES2WiIVFZA5Ymv
 zizvP0Y7jrZgl2nW4K4GAeUz73N+X/gWFSSMLeqv7i9BPtpoDPXcTVtq3v7jVKnAUvoE
 Q0ZQ==
X-Gm-Message-State: AOAM530Y0lXMXQHq1EURqlLkr8EISnrcpouKL+Kr8nukxYpFzTsA/x9t
 HZ7wcNuvZe3mZb54WPBYuiebxxqFKVVi+lOdXTY4UF3QMQPe/ZwVuoea2bdQCco97ltLcKOchc6
 SORjSMtazgZ0+/jSbLagGr0TS3jU=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr4537422ybg.252.1597925933891; 
 Thu, 20 Aug 2020 05:18:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkVJ+x0tnDswYG/XxORpoG5RPwEBvqIyrrBbrNS+Jt88OK+u/YyeUF4d5nYPVyhaKmEP9YFxYOZ5qg2zz9zOo=
X-Received: by 2002:a25:ca41:: with SMTP id a62mr4537401ybg.252.1597925933647; 
 Thu, 20 Aug 2020 05:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Aug 2020 20:18:42 +0800
Message-ID: <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/kill03,
 04: Cleanup && Convert to new library
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
Content-Type: multipart/mixed; boundary="===============0213611195=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0213611195==
Content-Type: multipart/alternative; boundary="000000000000a722db05ad4e1f02"

--000000000000a722db05ad4e1f02
Content-Type: text/plain; charset="UTF-8"

Feiyu Zhu <zhufy.jy@cn.fujitsu.com> wrote:

...
> +#include <unistd.h>
> +#include "tst_test.h"
> +
> +static pid_t real_pid, fake_pid, int_min_pid;
> +static void cleanup(void);
> +
> +static struct tcase {
> +       int test_sig;
> +       int exp_errno;
> +       int child_flag;
>

The child_flag field is not necessary, we could prepare a real child in
setup()
and reclaim it after testing via check the real_pid value, that will be
more easily.

-- 
Regards,
Li Wang

--000000000000a722db05ad4e1f02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Feiyu Zhu &lt;<a href=3D"mailto:zhufy.jy@cn.fujitsu.com=
">zhufy.jy@cn.fujitsu.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D=
"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><s=
pan class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+#include &lt;unistd.h&gt;<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+static pid_t real_pid, fake_pid, int_min_pid;<br>
+static void cleanup(void);<br>
+<br>
+static struct tcase {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int test_sig;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int exp_errno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int child_flag;<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">The child_flag =
field is not necessary, we could prepare a real child in setup()</div><div =
class=3D"gmail_default" style=3D"font-size:small">and=C2=A0reclaim it after=
 testing via check the real_pid value, that will be more easily.</div></div=
></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></di=
v>

--000000000000a722db05ad4e1f02--


--===============0213611195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0213611195==--

