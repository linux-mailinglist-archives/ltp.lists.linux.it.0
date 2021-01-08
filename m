Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CA2EED6A
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 07:23:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AE8C3C316F
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 07:23:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B1AAE3C2870
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 07:23:10 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 275621A00CC6
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 07:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610086988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cD47730zmhsJAVN93DL5ragndmxindtyTcU4wF2TQIc=;
 b=DxEfObhJnijQfKcgbrbIyhO08pY0W4MW01+fGGj9fzznhmfq/KaLJfpRw6sUlbs740QV6n
 6xCLTYDKv6fm65PFfH7jZPKuDSNfmss4bn8xeAgtI36zhM5x+3mv/Ji+kYEMQcU+ymL0ja
 ujcgPdtKp28VC4fF56behtquZUF3Gik=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-tjegLMPzNKe6fqD4tuh-Qg-1; Fri, 08 Jan 2021 01:23:06 -0500
X-MC-Unique: tjegLMPzNKe6fqD4tuh-Qg-1
Received: by mail-yb1-f198.google.com with SMTP id j1so14657468ybj.11
 for <ltp@lists.linux.it>; Thu, 07 Jan 2021 22:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cD47730zmhsJAVN93DL5ragndmxindtyTcU4wF2TQIc=;
 b=S8TnY43/o8xXVWTf9J6zuw/H+OyzS8YmZOQlICjDvYGYj59+UR6A6Ko/mNwBweBhC5
 9FfwVd5Ul2htPuBhBfFMLamfSKqhmgNlt8tP7mbLmfZHlZU+apUe+Va4bLYFAjggBzRj
 zY46q8kp8TSccpJVaCzQSmTgm/hrWYn78w8IvAwHHBmH2zosx/Kh29pVJZZ4XcTDUeCF
 dCFIGcCcVefl3wyahmiBEmIYGED6f4yPBMND19tZ1Z/t0Mm/tP8RrTMqxnqGdjXJpWA5
 6kg8um1D3JD5vLShtnzGWCuu+d9oxyX8Oy7o1V9PL/QcRHRmhUOvbhALhqoggW9Z35Pr
 ERdA==
X-Gm-Message-State: AOAM530a26EjoG/U5TxBB+VYCeLz3MCSUPq0EfMnEDMwJeCePYFOZH1z
 lp+jn6Rh0GSDDfrp0PQNnDdxzb2rJg6MYTzlQPFT114dRE6A9BFYkjKXu78XxIINSOxR4illOue
 CVqdODb0Y8c8iWYqWCmaZvZBGgVU=
X-Received: by 2002:a25:d288:: with SMTP id j130mr3640292ybg.286.1610086985747; 
 Thu, 07 Jan 2021 22:23:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt7LKkDkxfYK6CImAc+aBKiVRhPNP6z3GYgunWirOApDANVaRfvHHSm5IMDVfnN/9KkmqxYi8scML0SiaH+rs=
X-Received: by 2002:a25:d288:: with SMTP id j130mr3640270ybg.286.1610086985489; 
 Thu, 07 Jan 2021 22:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20210106181735.1588-1-pvorel@suse.cz>
In-Reply-To: <20210106181735.1588-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 8 Jan 2021 14:22:54 +0800
Message-ID: <CAEemH2dVgwHREFGrOe1tNUgZXZn5OAo5PJ-nne_yoj2nRHt=pw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2 1/1] syscalls/get_mempolicy01: Rewrite to new
 API
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
Content-Type: multipart/mixed; boundary="===============0596438937=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0596438937==
Content-Type: multipart/alternative; boundary="000000000000d3fb0005b85d965f"

--000000000000d3fb0005b85d965f
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

Petr Vorel <pvorel@suse.cz> wrote:

[...]
> +static void do_test(unsigned int i)
>  {
> -       /* check syscall availability */
> -       ltp_syscall(__NR_get_mempolicy, NULL, NULL, 0, NULL, 0);
> +       struct test_case *tc = &tcase[i];
> +       int policy;
> +
> +       tst_res(TINFO, "test #%d: %s", i+1, tc->desc);
>
> -       if (!is_numa(NULL, NH_MEMS, 1))
> -               tst_brkm(TCONF, NULL, "requires NUMA with at least 1
> node");
> +       TST_EXP_PASS(get_mempolicy(&policy, getnodemask->maskp,
> getnodemask->size,
> +                          tc->addr, tc->flags), "%s", tc->desc);
>
> -       TEST_PAUSE;
> -       tst_tmpdir();
> +               struct bitmask *exp_mask = *(tc->exp_nodemask);
> +
> +               if (!numa_bitmask_equal(exp_mask, getnodemask)) {
> +                       tst_res(TFAIL, "masks are not equal");
> +                       tst_res_hexd(TINFO, exp_mask->maskp,
> +                               exp_mask->size / 8, "expected:");
> +                       tst_res_hexd(TINFO, getnodemask->maskp,
> +                               getnodemask->size / 8, "returned:");
> +               }
>

These few lines have a code indent issue, otherwise looks good.

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000d3fb0005b85d965f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.=
cz">pvorel@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_=
attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cla=
ss=3D"gmail_default" style=3D"font-size:small">[...]</span><br>
+static void do_test(unsigned int i)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* check syscall availability */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ltp_syscall(__NR_get_mempolicy, NULL, NULL, 0, =
NULL, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_case *tc =3D &amp;tcase[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int policy;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;test #%d: %s&quot;, i+1, t=
c-&gt;desc);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!is_numa(NULL, NH_MEMS, 1))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TCONF, NUL=
L, &quot;requires NUMA with at least 1 node&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_EXP_PASS(get_mempolicy(&amp;policy, getnode=
mask-&gt;maskp, getnodemask-&gt;size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tc-&gt;addr, tc-&gt;flags), &quot;%s&quot;, tc-&gt;desc);=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST_PAUSE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_tmpdir();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bitmask *exp=
_mask =3D *(tc-&gt;exp_nodemask);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!numa_bitmask_e=
qual(exp_mask, getnodemask)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL, &quot;masks are not equal&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res_hexd(TINFO, exp_mask-&gt;maskp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exp_mask-&gt;size / 8, &quot;expected=
:&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res_hexd(TINFO, getnodemask-&gt;maskp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getnodemask-&gt;size / 8, &quot;retur=
ned:&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">T=
hese few=C2=A0lines have a code indent issue, otherwise looks good.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a hr=
ef=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div></div></div>=
<div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000d3fb0005b85d965f--


--===============0596438937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0596438937==--

