Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6382316221C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:16:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DB143C2559
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:16:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A85673C23A5
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:16:12 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D5DCA1401833
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:16:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582013770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GBgIJiR66+IccmJxboMPsRR2Dq6lvT+TCYHorBJzh2U=;
 b=RacwJcqgWgiOsfCDaK/SQd4hshOlNHD4PhHWNiuq2R+0bXCKTojkyOEz0O9FGQbkVfGD5Z
 oxyM9XziYDEeuQfi/+h6ZCXJF97j42rA0M6g1l0L1xEs2xcNjr2TwF1Dhw0kRg/uZ+nlhz
 ZAC0I5zyDvwZbgm4TCk4MLS/vUtI6gI=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-ivwWE0_1MOiIoCW8_wsyAQ-1; Tue, 18 Feb 2020 03:16:03 -0500
Received: by mail-ot1-f70.google.com with SMTP id e11so12031415otq.1
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 00:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=25MWyriEUpo2nc2w065wQsIKfuHW5gRtzi6tTuw9i9M=;
 b=Z8uJtHKrmiFOGTCgORBW4EYMLQ+tcHq5BrzkZDg2phqG7fj+NL2MvPTHCK5G5MtIuT
 ak9tATYW5Zk6cGTbImjfP7fjvJxsVYMmJfcldBcDz2++mi3K/v/GureDrMYBeuQLSmcc
 zGBJLP/+1gjecLpPZXfpg2fkrdd2rjKBRaCQlNePklQzLVC+os/nPbX8ITf6KtB7owd7
 nHiydGQqDaTUyazgRYwNWZT+mwJrp8QwiesOGjKKji+lYQ2Nr6+6Kt26QxZRaqejHJHy
 jEsT4aARB34ihvsml4CItsNWQT2o9QqHOY4rFaS7HJX9R8NsNvHHLcald+UngyaVNcvb
 JR9w==
X-Gm-Message-State: APjAAAXE+I+UCY40QFazNvHuDgwQMBqIGlH7NMW8dpaBP94a0PXLkzBS
 i6/FEaoE3MvRMPFxdeMF6g3Y+7r/foUmVieUhd7RiTVB83J6VuRyEXAO7HkcwI4MQHsJsPBoHnW
 6VNavdssUJqXlGNIocrzf8HgPQUE=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr14421650otl.118.1582013762356; 
 Tue, 18 Feb 2020 00:16:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCgYRRj0kGTUSaCvI/YYuESkexR9mo9Z3CwlvlGSQEdiXeESEriD5JFS5iG42iDvEnQQzpE4rMP6hN5v/izXw=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr14421638otl.118.1582013762036; 
 Tue, 18 Feb 2020 00:16:02 -0800 (PST)
MIME-Version: 1.0
References: <CAEemH2dEco268yqDyDjX25FPs3V7wTBija4HiMrf8nr0W7qVQQ@mail.gmail.com>
 <20200217141622.26912-1-mdoucha@suse.cz>
 <20200217141622.26912-2-mdoucha@suse.cz>
In-Reply-To: <20200217141622.26912-2-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Feb 2020 16:15:51 +0800
Message-ID: <CAEemH2fvquWe_+-Au-Z0wRaYt0V943A1zszJVPCXO6HrLWH9Yg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: ivwWE0_1MOiIoCW8_wsyAQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] Split off executable code from
 bpf/bpf_common.h
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
Content-Type: multipart/mixed; boundary="===============1153628214=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1153628214==
Content-Type: multipart/alternative; boundary="00000000000050feca059ed5480a"

--00000000000050feca059ed5480a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 10:16 PM Martin Doucha <mdoucha@suse.cz> wrote:

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>
> Changes since v1: This patch was split off from the v1 BPF fix. Code
> cleanup
> to prevent future bugs and make the common code more readable.
>
> Changes since v2: None.
>
>  testcases/kernel/syscalls/bpf/Makefile     |  3 ++
>  testcases/kernel/syscalls/bpf/bpf_common.c | 45 ++++++++++++++++++++++
>  testcases/kernel/syscalls/bpf/bpf_common.h | 39 ++-----------------
>  3 files changed, 51 insertions(+), 36 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/bpf/bpf_common.c
>
> diff --git a/testcases/kernel/syscalls/bpf/Makefile
> b/testcases/kernel/syscalls/bpf/Makefile
> index 990c8c83c..2241bce9b 100644
> --- a/testcases/kernel/syscalls/bpf/Makefile
> +++ b/testcases/kernel/syscalls/bpf/Makefile
> @@ -5,6 +5,9 @@ top_srcdir              ?=3D ../../../..
>
>  include $(top_srcdir)/include/mk/testcases.mk
>
> +FILTER_OUT_MAKE_TARGETS        :=3D bpf_common
>  CFLAGS                 +=3D -D_GNU_SOURCE
>
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +
> +$(MAKE_TARGETS): %: %.o bpf_common.o
>

May I ask why we need to reserve these *.o binary files in the compiling?

# ls
bpf_common.c  bpf_common.o  bpf_map01.c  bpf_prog01    bpf_prog01.o
 bpf_prog02.c  bpf_prog03    bpf_prog03.o
bpf_common.h  bpf_map01     bpf_map01.o  bpf_prog01.c  bpf_prog02
 bpf_prog02.o  bpf_prog03.c  Makefile


Otherwise, the patchset looks good.
    Acked-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--00000000000050feca059ed5480a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Feb 17, 2020 at 10:16 PM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Martin Dou=
cha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank">mdoucha@suse.c=
z</a>&gt;<br>
---<br>
<br>
Changes since v1: This patch was split off from the v1 BPF fix. Code cleanu=
p<br>
to prevent future bugs and make the common code more readable.<br>
<br>
Changes since v2: None.<br>
<br>
=C2=A0testcases/kernel/syscalls/bpf/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +=
+<br>
=C2=A0testcases/kernel/syscalls/bpf/bpf_common.c | 45 +++++++++++++++++++++=
+<br>
=C2=A0testcases/kernel/syscalls/bpf/bpf_common.h | 39 ++-----------------<b=
r>
=C2=A03 files changed, 51 insertions(+), 36 deletions(-)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/bpf/bpf_common.c<br>
<br>
diff --git a/testcases/kernel/syscalls/bpf/Makefile b/testcases/kernel/sysc=
alls/bpf/Makefile<br>
index 990c8c83c..2241bce9b 100644<br>
--- a/testcases/kernel/syscalls/bpf/Makefile<br>
+++ b/testcases/kernel/syscalls/bpf/Makefile<br>
@@ -5,6 +5,9 @@ top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
?=3D ../../../..<br>
<br>
=C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=
=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
<br>
+FILTER_OUT_MAKE_TARGETS=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D bpf_common<br>
=C2=A0CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D -D_GNU_SOURCE<br>
<br>
=C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_targe=
t.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
+<br>
+$(MAKE_TARGETS): %: %.o bpf_common.o<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">May I ask why we need=
 to reserve these *.o binary files in the compiling?</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small"># ls</div>bpf_common.c =C2=A0bpf_common.o =C2=
=A0bpf_map01.c =C2=A0bpf_prog01 =C2=A0 =C2=A0bpf_prog01.o =C2=A0bpf_prog02.=
c =C2=A0bpf_prog03 =C2=A0 =C2=A0bpf_prog03.o<br>bpf_common.h =C2=A0bpf_map0=
1 =C2=A0 =C2=A0 bpf_map01.o =C2=A0bpf_prog01.c =C2=A0bpf_prog02 =C2=A0 =C2=
=A0bpf_prog02.o =C2=A0bpf_prog03.c =C2=A0Makefile<br><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">Otherwise, the patchset looks good.</=
div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 Ac=
ked-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com<=
/a>&gt;</div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--00000000000050feca059ed5480a--


--===============1153628214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1153628214==--

