Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE674187AB0
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:55:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33DC33C55CD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:55:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9FE8F3C0E5E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:55:24 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id F03651A013D8
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584431721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DUWkdG1Uj1cFF36SSkUFvMEeoGLXmiNuq3CbYMAFmZs=;
 b=b3tqr3FcMKGY1amptGlewjTYmdK6j3J0hs2qqNWtxzeMpN435AOzDRClJV5Ty01ycpoj3E
 tj2OOlM3JnHyEfcnAXm2bfLMdqvYEee2j1tm1SCY4FRWkHlpoJKMmHiRwNdachJdkX7ZH+
 TWSs9myobzI/Ao2s74ocTaB8ZheQEqg=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-UcG-n_oLMh6WS8WlWY4tpQ-1; Tue, 17 Mar 2020 03:55:16 -0400
X-MC-Unique: UcG-n_oLMh6WS8WlWY4tpQ-1
Received: by mail-oi1-f200.google.com with SMTP id c123so12656183oig.19
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 00:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GBC4vFoNNWxP0U524YniK25/fLGDqxFhkqkronlWHQg=;
 b=V0rYFxXWpQIJ1vHHL2INgeP/n/bcUXdAgKVfZ9WynY6ZBQg1z/LNPDTVl6ENE0udbA
 DnN7CYtynbV85rgG+NBa7qJrFlqpQKs62ga+13kNwKQtpOgvV/n/6p7hCTPVlWxY8uBY
 sEMVQAXkjcFyo1kM65ARAN1IyInV7cMiBZPOXLBGGKvgQv8lQ+nyWwGNtqfNNYxQAPXC
 5xFMNQP7o132PbzdG86mMbcMPuYr4/4VIi1rOoWd+yQ96RA3iuHU1oyFEASI/ts4u5MX
 F06EUSxItFmhewuBKBaiNbquPA+/WzXf7gE+q+acs5AU5m43xBYjB7aDWvvAE3eSlOT1
 1Axg==
X-Gm-Message-State: ANhLgQ1Rn5gjeufxB1NiZ7vpZTOSwOoqvFzmGlvFAzx+Vpvnwxrovs00
 k9lAiNF3ujjtDFiKyPl722z6e19BMgNrrdHKLijXbo7sA5Qc8dlWASdaLK8epF6cwvSRpgwdQjM
 tzTdhgJ2V6WCBRf0RKOqV2pekYVI=
X-Received: by 2002:aca:484c:: with SMTP id v73mr2374877oia.138.1584431715590; 
 Tue, 17 Mar 2020 00:55:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vurbFggiba+ywVHvs/p7eGlhWDpjy3hHdka8Axd5ZH9vP3lgTHHXr58MIXyKMP9Axmbo+UYBWIMNvu8PMjsoKE=
X-Received: by 2002:aca:484c:: with SMTP id v73mr2374865oia.138.1584431715165; 
 Tue, 17 Mar 2020 00:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <1584430400-47359-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1584430400-47359-1-git-send-email-zou_wei@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 17 Mar 2020 15:55:03 +0800
Message-ID: <CAEemH2f5sMfOX5XjEOr8cmLRwu+YzMziEwRFPAegG+FAURi90A@mail.gmail.com>
To: Zou Wei <zou_wei@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Enable the testsuite
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
Content-Type: multipart/mixed; boundary="===============2037038368=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2037038368==
Content-Type: multipart/alternative; boundary="0000000000008dc33a05a1084146"

--0000000000008dc33a05a1084146
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zou & Xiao,

Do we really need to enable the open_posix_testsuite explicitly? By
default, LTP uses "--with-open-posix-testsuite" as the configure parameter
to enabling it, is that work for you?

i.e you can include the open_posix_testsuite build by perform `./build.sh`

On Tue, Mar 17, 2020 at 3:27 PM Zou Wei <zou_wei@huawei.com> wrote:

> Enable open posix testsuite compilation by default
>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  testcases/Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/testcases/Makefile b/testcases/Makefile
> index b04e630..ae1cafc 100644
> --- a/testcases/Makefile
> +++ b/testcases/Makefile
> @@ -30,10 +30,6 @@ include $(top_srcdir)/include/mk/env_pre.mk
>  #    run).
>  FILTER_OUT_DIRS                :=3D kdump
>
> -ifneq ($(WITH_OPEN_POSIX_TESTSUITE),yes)
> -FILTER_OUT_DIRS                +=3D open_posix_testsuite
> -endif
> -
>  ifneq ($(WITH_REALTIME_TESTSUITE),yes)
>  FILTER_OUT_DIRS                +=3D realtime
>  endif
> --
> 2.6.2
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--0000000000008dc33a05a1084146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Zou &amp; Xiao,</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Do we really need to enable the open_posix_testsuite explicitl=
y? By default, LTP uses &quot;--with-open-posix-testsuite&quot; as the conf=
igure parameter to enabling it, is that work for you?</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">i.e you can include the open_posix_testsuite b=
uild by perform=C2=A0`./build.sh`</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 17, 2020 at 3:27 PM Zou =
Wei &lt;<a href=3D"mailto:zou_wei@huawei.com">zou_wei@huawei.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Enable open=
 posix testsuite compilation by default<br>
<br>
Signed-off-by: Zou Wei &lt;<a href=3D"mailto:zou_wei@huawei.com" target=3D"=
_blank">zou_wei@huawei.com</a>&gt;<br>
---<br>
=C2=A0testcases/Makefile | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/testcases/Makefile b/testcases/Makefile<br>
index b04e630..ae1cafc 100644<br>
--- a/testcases/Makefile<br>
+++ b/testcases/Makefile<br>
@@ -30,10 +30,6 @@ include $(top_srcdir)/include/mk/<a href=3D"http://env_p=
re.mk" rel=3D"noreferrer" target=3D"_blank">env_pre.mk</a><br>
=C2=A0#=C2=A0 =C2=A0 run).<br>
=C2=A0FILTER_OUT_DIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 :=3D kdump<br>
<br>
-ifneq ($(WITH_OPEN_POSIX_TESTSUITE),yes)<br>
-FILTER_OUT_DIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=3D open_posix_testsuite<br>
-endif<br>
-<br>
=C2=A0ifneq ($(WITH_REALTIME_TESTSUITE),yes)<br>
=C2=A0FILTER_OUT_DIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D realtime<br>
=C2=A0endif<br>
--<br>
2.6.2<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000008dc33a05a1084146--


--===============2037038368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2037038368==--

