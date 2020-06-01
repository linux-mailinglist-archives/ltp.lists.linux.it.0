Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 497441EA254
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 12:59:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B77B93C30C4
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jun 2020 12:59:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 01EC53C3084
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 12:59:08 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 806E9600A07
 for <ltp@lists.linux.it>; Mon,  1 Jun 2020 12:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591009145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hr5evyqd26QsfJ7swtbJl2Y55xT5qmo3H7RE2lrWeGo=;
 b=bszm+svZWmxnXoxEsl7GbsTaD1xS8LtVLDWG8OQRik+DyVK00M1TsKCigXb8EHcVHYmHqm
 wl3j7pI+eGwL8WXsj1FXKz9FSkWfTlRb4h2Kynk8EklReqsgB/y48JifnuGsnzdBZI7Kpy
 PqGmoLIecMZwEYbHGBzw30hhLt4UwF0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-kVuXHTvzMG-OOjH8ySeT-w-1; Mon, 01 Jun 2020 06:59:02 -0400
X-MC-Unique: kVuXHTvzMG-OOjH8ySeT-w-1
Received: by mail-lj1-f198.google.com with SMTP id f9so1008923ljc.16
 for <ltp@lists.linux.it>; Mon, 01 Jun 2020 03:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Hr5evyqd26QsfJ7swtbJl2Y55xT5qmo3H7RE2lrWeGo=;
 b=DKVfqSbvYQQm95Mr8ku6Q8xunlSryt8jsCSZjO9fX2ubWtSmbrAUbFJ/I7JG4aAdJ9
 u/e1b487giD2/LLOylMox856B4TDdaaLqd2xp1IzCb/++cwPuSwiIpBmp28UjsbBsxt9
 pER62+nrAfwtNyJCXGswY70PpFdOog+w4QP2l0d3iAs/gLtm5qN/W2++tYPGWXQukuwi
 Pxc3TwQnHvK4tn2VWTZ8vfPV8o4KQkmWRzMvAQdGNHSyKOhuIG1mOsGGXEQ7oL1kaNoR
 oEl+bZ+GqVe5QiXKmWdqgfMKqAxCmMw+Pnod3A/Ut5z7i2738QXw2jgSUprjmufnvgP8
 Rvpg==
X-Gm-Message-State: AOAM531faSukbjolilfJAP4xt8+yb+64n/4RxXYMVlzRHjpVjfs9qgi9
 j8GPzsShR8H8VQbmFYUF5qz+h7GMDAAbUnBsk9nGLOPb4S+kvbfGYu0rrActsgA5mxGP3jLlpKs
 EBOrnHN+/1d8XjvWAGjbTqOh+4dI=
X-Received: by 2002:a2e:b0ce:: with SMTP id g14mr6304961ljl.49.1591009140128; 
 Mon, 01 Jun 2020 03:59:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpbJ2S19TxlRkq1FZjw8XB+K+hhDuUbKcm1ECUN/MFmLRH/UAR/VA0KiHvB0fn8eYxtvjn0GKkGGs+FByJv+s=
X-Received: by 2002:a2e:b0ce:: with SMTP id g14mr6304950ljl.49.1591009139873; 
 Mon, 01 Jun 2020 03:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200601100459.32511-1-liwang@redhat.com>
In-Reply-To: <20200601100459.32511-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 1 Jun 2020 18:58:47 +0800
Message-ID: <CAEemH2e_pzdJj5jDxCB_=SiTweP_RoWXitJdSiYa8-hAR9yjBQ@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============0201080159=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0201080159==
Content-Type: multipart/alternative; boundary="0000000000009df24105a703ae3a"

--0000000000009df24105a703ae3a
Content-Type: text/plain; charset="UTF-8"

Li Wang <liwang@redhat.com> wrote:

...
>
> +#define PATH_SYS_CGROUP                "/sys/fs/cgroup"
> +#define PATH_TMP_CG1_MEM       "/tmp/cg1_mem"
> +#define PATH_TMP_CG1_CST       "/tmp/cg1_cst"
> +#define PATH_TMP_CGROUP2       "/tmp/cgroup2" /* cgroup v2 has only
> single hierarchy */
> +
>

Seems there is no need to distinguish CG1 and CG2 mount directory
in tst_cgroup.h, because we have introduced the 'tst_cgroup_mnt_path'
to mount cgroup unified, it will choose cgroup versions automatically.

So maybe we can change these above definitions to:

-#define PATH_SYS_CGROUP                "/sys/fs/cgroup"
-#define PATH_TMP_CG1_MEM       "/tmp/cg1_mem"
-#define PATH_TMP_CG1_CST       "/tmp/cg1_cst"
-#define PATH_TMP_CGROUP2       "/tmp/cgroup2" /* cgroup v2 has only single
hierarchy */
+#define PATH_TMP_CGROUP_MEM    "/tmp/cgroup_mem"
+#define PATH_TMP_CGROUP_CST    "/tmp/cgroup_cst"

-- 
Regards,
Li Wang

--0000000000009df24105a703ae3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">li=
wang@redhat.com</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_att=
r"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail_default" style=3D"font-size:small">...</span><br><br>
+#define PATH_SYS_CGROUP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;/sys/fs/cgroup&quot;<br>
+#define PATH_TMP_CG1_MEM=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/tmp/cg1_mem&quot=
;<br>
+#define PATH_TMP_CG1_CST=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/tmp/cg1_cst&quot=
;<br>
+#define PATH_TMP_CGROUP2=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/tmp/cgroup2&quot=
; /* cgroup v2 has only single hierarchy */<br>
+<br></blockquote><div><br></div></div><div class=3D"gmail_default" style=
=3D"font-size:small">Seems there is no need to distinguish CG1 and CG2 moun=
t directory</div><div class=3D"gmail_default" style=3D"font-size:small">in =
tst_cgroup.h, because we have introduced the &#39;tst_cgroup_mnt_path&#39;<=
/div><div class=3D"gmail_default" style=3D"font-size:small">to mount cgroup=
 unified, it will choose cgroup versions automatically.</div><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">So maybe we can cha=
nge these above definitions to:</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div>-#define PATH_SYS_CGROUP =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;/sys/fs/cgroup&quot;<br>-#define PA=
TH_TMP_CG1_MEM =C2=A0 =C2=A0 =C2=A0 &quot;/tmp/cg1_mem&quot;<br>-#define PA=
TH_TMP_CG1_CST =C2=A0 =C2=A0 =C2=A0 &quot;/tmp/cg1_cst&quot;<br>-#define PA=
TH_TMP_CGROUP2 =C2=A0 =C2=A0 =C2=A0 &quot;/tmp/cgroup2&quot; /* cgroup v2 h=
as only single hierarchy */<br>+#define PATH_TMP_CGROUP_MEM =C2=A0 =C2=A0&q=
uot;/tmp/cgroup_mem&quot;<br>+#define PATH_TMP_CGROUP_CST =C2=A0 =C2=A0&quo=
t;/tmp/cgroup_cst&quot;<br><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--0000000000009df24105a703ae3a--


--===============0201080159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0201080159==--

