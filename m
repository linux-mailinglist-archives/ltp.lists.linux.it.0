Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCDD2E7DD1
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 04:01:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66DD33C559B
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 04:01:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DEC273C2612
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 04:01:46 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4E040140052C
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 04:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609383703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DP1bt3ZslfmACYe+VDuZf7JCe26FEYo7mdp/MPrte0=;
 b=TDGLLvtsxxsR/VUpH4iS4GSIEUcYuxA1PxeTZibUX0csXIA8S3878B90qxvDQPfMJ2ixa1
 QNlqlvP5r9++bFJ3PRW7FnO8c/etlhq61u0E0ZdaVOq1FAS9dEdn+1Ln0t/mSsTZPSHLRI
 yp9k4Eo5ml5IZNtwEFPcVCYzXpI43JI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-0bkAaCADNLCOFDrQ44Fmdw-1; Wed, 30 Dec 2020 22:01:39 -0500
X-MC-Unique: 0bkAaCADNLCOFDrQ44Fmdw-1
Received: by mail-yb1-f200.google.com with SMTP id b123so31796476ybh.17
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 19:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DP1bt3ZslfmACYe+VDuZf7JCe26FEYo7mdp/MPrte0=;
 b=IW+YRhOT1w8ONpjAqYROb/MbzGezG+3wC0rDIaBlqRiaQE3uCfa0Kk8Qs65ewa0rC6
 Qec3sMPJNdRU+Gi+0MsTRADi/q6t5Zl1LzmJ8E/ladeJFpEygmfBdjLT8Gy06hnIUNIM
 rmwYwuwdWiyLhQuAstChpr+960VTHpHn79oOWI0+E5qut8hibo+tT+1l91Ut8pUxO72X
 0hQmRtcoX3hY6MrMI2cuw220T6XvKY72Tg8t4KpPtSIXAeowIGRb1EHjZpzG055aqyCL
 /Scyuoa+9mKjRubBwBG01gd+WxHSKjQNS0EnyobkQKqNpuiRpRYtVsGuB4iSqj8LaYSG
 Hrqw==
X-Gm-Message-State: AOAM533Y8gb2tBWARC7RuXCC4Um4XSouVGikFzEPWtOzDMag9g+XiC8q
 AVCWL8Dw1ONFXAVHqiXQFQcoMPc1tohc402bZ0MQNMaJPGZBGPq4/WOZySi0cHDGZQgaOREOnQ/
 RMZDH163K2MK/jmouueZ93Q6LseE=
X-Received: by 2002:a25:cc92:: with SMTP id
 l140mr84794423ybf.252.1609383698887; 
 Wed, 30 Dec 2020 19:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVmaTXmFQa154uiUe+IP+8AITjosxzEH4S+etW8IbNwRj/sE4jxBRO6UAEKl/K3ZkmZJHu/YBacM8WlcjhUI0=
X-Received: by 2002:a25:cc92:: with SMTP id
 l140mr84794409ybf.252.1609383698649; 
 Wed, 30 Dec 2020 19:01:38 -0800 (PST)
MIME-Version: 1.0
References: <20201230154856.26252-1-bogdan.lezhepekov@suse.com>
In-Reply-To: <20201230154856.26252-1-bogdan.lezhepekov@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Dec 2020 11:01:27 +0800
Message-ID: <CAEemH2d88KVzzidLyEmCPm+LrXiE0zG7YvXG=r=AgEy+2jKU-A@mail.gmail.com>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] include/tst_cgroup.h: Replace hardcoded cgroup
 paths
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0514933193=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0514933193==
Content-Type: multipart/alternative; boundary="000000000000aa69e905b7b9d79a"

--000000000000aa69e905b7b9d79a
Content-Type: text/plain; charset="UTF-8"

Hi Bogdan,

On Wed, Dec 30, 2020 at 11:49 PM Bogdan Lezhepekov via ltp <
ltp@lists.linux.it> wrote:

> Macros PATH_TMP_CG_CST and PATH_TMP_CG_MEM defined cgroup
> temporary directory paths to be in /tmp that can be a mount point.
>
> Enable an option to set PATH_TMP_CG_CST and PATH_TMP_CG_MEM
> through TMPDIR environment variable keeping old paths as default ones.
>
> Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
> ---
>  include/tst_cgroup.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
> index bfd848260..0f7db5487 100644
> --- a/include/tst_cgroup.h
> +++ b/include/tst_cgroup.h
> @@ -7,8 +7,9 @@
>  #ifndef TST_CGROUP_H
>  #define TST_CGROUP_H
>
> -#define PATH_TMP_CG_MEM        "/tmp/cgroup_mem"
> -#define PATH_TMP_CG_CST        "/tmp/cgroup_cst"
> +#define PATH_BASE (getenv("TMPDIR") ? getenv("TMPDIR") : "/tmp")
> +#define PATH_TMP_CG_CST (strcat(PATH_BASE, "/cgroup_cst"))
> +#define PATH_TMP_CG_MEM (strcat(PATH_BASE, "/cgroup_mem"))
>

As described on strcat() manual page, the potential risk is that buffer
overruns might cause an unpredictable problem.

I won't like to merge this patch because, Richard raised a new method to
refactor the whole CGroup API. And the patchset is pending on reviewing.

http://lists.linux.it/pipermail/ltp/2020-December/020274.html

-- 
Regards,
Li Wang

--000000000000aa69e905b7b9d79a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Bogdan,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 30, 2020 at 11:49 PM Bogdan Lezhe=
pekov via ltp &lt;<a href=3D"mailto:ltp@lists.linux.it" target=3D"_blank">l=
tp@lists.linux.it</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Macros PATH_TMP_CG_CST and PATH_TMP_CG_MEM defined cgroup<=
br>
temporary directory paths to be in /tmp that can be a mount point.<br>
<br>
Enable an option to set PATH_TMP_CG_CST and PATH_TMP_CG_MEM<br>
through TMPDIR environment variable keeping old paths as default ones.<br>
<br>
Signed-off-by: Bogdan Lezhepekov &lt;<a href=3D"mailto:bogdan.lezhepekov@su=
se.com" target=3D"_blank">bogdan.lezhepekov@suse.com</a>&gt;<br>
---<br>
=C2=A0include/tst_cgroup.h | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h<br>
index bfd848260..0f7db5487 100644<br>
--- a/include/tst_cgroup.h<br>
+++ b/include/tst_cgroup.h<br>
@@ -7,8 +7,9 @@<br>
=C2=A0#ifndef TST_CGROUP_H<br>
=C2=A0#define TST_CGROUP_H<br>
<br>
-#define PATH_TMP_CG_MEM=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/tmp/cgroup_mem&q=
uot;<br>
-#define PATH_TMP_CG_CST=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/tmp/cgroup_cst&q=
uot;<br>
+#define PATH_BASE (getenv(&quot;TMPDIR&quot;) ? getenv(&quot;TMPDIR&quot;)=
 : &quot;/tmp&quot;)<br>
+#define PATH_TMP_CG_CST (strcat(PATH_BASE, &quot;/cgroup_cst&quot;))<br>
+#define PATH_TMP_CG_MEM (strcat(PATH_BASE, &quot;/cgroup_mem&quot;))<br></=
blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-s=
ize:small">As described=C2=A0on strcat() manual page, the potential risk is=
 that buffer overruns might cause an unpredictable problem.</div></div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">I won&#39;t like to merge this pat=
ch because, Richard raised a new method to refactor the whole CGroup API. A=
nd the patchset is pending on reviewing.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><a href=3D"http://lists.linux.it/pipermail/ltp/2020-Decembe=
r/020274.html">http://lists.linux.it/pipermail/ltp/2020-December/020274.htm=
l</a><br></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr=
"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000aa69e905b7b9d79a--


--===============0514933193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0514933193==--

