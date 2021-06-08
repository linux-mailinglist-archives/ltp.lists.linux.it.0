Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB99439EEB2
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 08:28:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24E153C7AF5
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 08:28:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5796B3C0BB1
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 08:28:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BC09B600235
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 08:28:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623133704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LSZqE5v562wfbCEiOuYv7TzKc7BMcq/SnV/3Bv9pJFk=;
 b=VOUnA/+hg8Qua8VSChhp35DFF21xTrjZjq1wsa2Idq3ndcUxbF+JCRzvdPJgwvo8p4cJn3
 OK9M9sEfS/9CTV3qtBsbdiSicU0K19uuOmA4SVgyzx5qpSJwXCpAbmJrzc36Y0AapfInOx
 6awigaWNWeAttAEnR7rB/hhn4YofJU8=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-uqx1Lyb-O3aMZCfA1FoErQ-1; Tue, 08 Jun 2021 02:28:22 -0400
X-MC-Unique: uqx1Lyb-O3aMZCfA1FoErQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 88-20020a9d06e10000b029030513a66c79so13279465otx.0
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 23:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LSZqE5v562wfbCEiOuYv7TzKc7BMcq/SnV/3Bv9pJFk=;
 b=nPw5oYmuMOqoI1T/ltt+rExhew+ZTYvuPbx6OYBQXk3wDRDlqeDT59MEUv2R9+257a
 5vC8wQlMQ+Bh+uocK7umpFThVdjUq7qh8Vc5h7+4/ekm8i80OrR/jce5inzTT1k3lMIT
 sOSRC8GN3dNkQSwuLSoo1rKJfv2WsUyMIB1NVzTzxn5/DgiIVQs9hxqk8kKJV/va9Di7
 MCMGvHNd2pccN5HFmfQ7x38IE1ndUx5SxY8urNWLILeFkTU5TfVLBm2k3CjyVwGqMJHW
 qHLIZSeXHveEElqCjZerykJ4RfuT6QR3j/aE0JIx8TYn7GvdPb+HpqtLMnMX2pzobywS
 dSCA==
X-Gm-Message-State: AOAM530k3e47RV7+i8qBQe8W2BMnsTr3rMcVi8qjpJtzgSHf/wcT1fwM
 69lhd+S0IYiivlhcPNyR8CdvJaQlMLR52baE2IzEFZ/wto1L20Y1aYoWoI9WpleZMRC+8C1+lZr
 3WL0pOWbnNjLiuxHyXdgBRSQQbd0=
X-Received: by 2002:a4a:a283:: with SMTP id h3mr5434875ool.90.1623133701367;
 Mon, 07 Jun 2021 23:28:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW9zsXZb/zDYxnWf5FAirczfG/egsy/ze7tZ9XpzFjo3pf3EzENSjX2vqyHrwVwsMUDKrJ/dT3+8wuWQwxoxA=
X-Received: by 2002:a4a:a283:: with SMTP id h3mr5434859ool.90.1623133701121;
 Mon, 07 Jun 2021 23:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210607111016.20630-1-pvorel@suse.cz>
In-Reply-To: <20210607111016.20630-1-pvorel@suse.cz>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 8 Jun 2021 08:28:05 +0200
Message-ID: <CAASaF6x1+j+nF=-TpkfLwi9hYXWN5sDVff4oJAKX-eTyH11s8A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] Remove floppy and CDROM stress tests
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
Cc: Zeng Linggang <zenglg.jy@cn.fujitsu.com>,
 automated-testing <automated-testing@yoctoproject.org>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it,
 Yixin Zhang <yixin.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============0252359759=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0252359759==
Content-Type: multipart/alternative; boundary="000000000000adb92f05c43b4307"

--000000000000adb92f05c43b4307
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 1:10 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi,
>
> does anybody use these tests? Does anybody need to test froppy or CDROM
> (even on VM)?
>


I'm not, and I don't recall seeing this in any reports or issues, so I
think they wouldn't be missed.

Acked-by: Jan Stancek <jstancek@redhat.com>


>
> Kind regards,
> Petr
>
> Petr Vorel (2):
>   io: Remove stress_floppy
>   io: Remove stress_cd
>
>  runtest/io_cd                                 |     1 -
>  runtest/io_floppy                             |     1 -
>  testcases/kernel/io/stress_cd/.gitignore      |     1 -
>  testcases/kernel/io/stress_cd/Makefile        |    25 -
>  testcases/kernel/io/stress_cd/stress_cd.c     |   244 -
>  testcases/kernel/io/stress_floppy/.gitignore  |     4 -
>  testcases/kernel/io/stress_floppy/Makefile    |    25 -
>  .../io/stress_floppy/datafiles/Makefile       |    31 -
>  .../kernel/io/stress_floppy/datafiles/dd_file | 21441 ----------------
>  .../datafiles/dumpdir/.gitignore              |     1 -
>  .../stress_floppy/datafiles/dumpdir/1K_file   |    19 -
>  .../stress_floppy/datafiles/dumpdir/Makefile  |    40 -
>  .../datafiles/dumpdir/generate.sh             |    22 -
>  .../kernel/io/stress_floppy/stress_floppy     |   264 -
>  testscripts/diskio.sh                         |    37 -
>  15 files changed, 22156 deletions(-)
>  delete mode 100644 runtest/io_cd
>  delete mode 100644 runtest/io_floppy
>  delete mode 100644 testcases/kernel/io/stress_cd/.gitignore
>  delete mode 100644 testcases/kernel/io/stress_cd/Makefile
>  delete mode 100644 testcases/kernel/io/stress_cd/stress_cd.c
>  delete mode 100644 testcases/kernel/io/stress_floppy/.gitignore
>  delete mode 100644 testcases/kernel/io/stress_floppy/Makefile
>  delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/Makefile
>  delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dd_file
>  delete mode 100644
> testcases/kernel/io/stress_floppy/datafiles/dumpdir/.gitignore
>  delete mode 100644
> testcases/kernel/io/stress_floppy/datafiles/dumpdir/1K_file
>  delete mode 100644
> testcases/kernel/io/stress_floppy/datafiles/dumpdir/Makefile
>  delete mode 100755
> testcases/kernel/io/stress_floppy/datafiles/dumpdir/generate.sh
>  delete mode 100755 testcases/kernel/io/stress_floppy/stress_floppy
>  delete mode 100755 testscripts/diskio.sh
>
> --
> 2.31.1
>
>

--000000000000adb92f05c43b4307
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div =
style=3D"font-family:monospace"><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 7, 2021 at 1:10 PM Pe=
tr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@sus=
e.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hi,<br>
<br>
does anybody use these tests? Does anybody need to test froppy or CDROM<br>
(even on VM)?<br></blockquote><div><br></div><div><div style=3D"font-family=
:monospace" class=3D"gmail_default"><br></div><div style=3D"font-family:mon=
ospace" class=3D"gmail_default">I&#39;m not, and I don&#39;t recall seeing =
this in any reports or issues, so I think they wouldn&#39;t be missed.<br><=
/div></div><div><br></div><div>Acked-by: Jan Stancek &lt;<a href=3D"mailto:=
jstancek@redhat.com">jstancek@redhat.com</a>&gt;<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
Petr Vorel (2):<br>
=C2=A0 io: Remove stress_floppy<br>
=C2=A0 io: Remove stress_cd<br>
<br>
=C2=A0runtest/io_cd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A01 -<br>
=C2=A0runtest/io_floppy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 =
-<br>
=C2=A0testcases/kernel/io/stress_cd/.gitignore=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A01 -<br>
=C2=A0testcases/kernel/io/stress_cd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 25 -<br>
=C2=A0testcases/kernel/io/stress_cd/stress_cd.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0244 -<br>
=C2=A0testcases/kernel/io/stress_floppy/.gitignore=C2=A0 |=C2=A0 =C2=A0 =C2=
=A04 -<br>
=C2=A0testcases/kernel/io/stress_floppy/Makefile=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 25 -<br>
=C2=A0.../io/stress_floppy/datafiles/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 31 -<br>
=C2=A0.../kernel/io/stress_floppy/datafiles/dd_file | 21441 ---------------=
-<br>
=C2=A0.../datafiles/dumpdir/.gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A01 -<br>
=C2=A0.../stress_floppy/datafiles/dumpdir/1K_file=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 19 -<br>
=C2=A0.../stress_floppy/datafiles/dumpdir/Makefile=C2=A0 |=C2=A0 =C2=A0 40 =
-<br>
=C2=A0.../datafiles/dumpdir/generate.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 22 -<br>
=C2=A0.../kernel/io/stress_floppy/stress_floppy=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0264 -<br>
=C2=A0testscripts/diskio.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 37 -<br>
=C2=A015 files changed, 22156 deletions(-)<br>
=C2=A0delete mode 100644 runtest/io_cd<br>
=C2=A0delete mode 100644 runtest/io_floppy<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_cd/.gitignore<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_cd/Makefile<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_cd/stress_cd.c<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_floppy/.gitignore<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_floppy/Makefile<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/Makefi=
le<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dd_fil=
e<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dumpdi=
r/.gitignore<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dumpdi=
r/1K_file<br>
=C2=A0delete mode 100644 testcases/kernel/io/stress_floppy/datafiles/dumpdi=
r/Makefile<br>
=C2=A0delete mode 100755 testcases/kernel/io/stress_floppy/datafiles/dumpdi=
r/generate.sh<br>
=C2=A0delete mode 100755 testcases/kernel/io/stress_floppy/stress_floppy<br=
>
=C2=A0delete mode 100755 testscripts/diskio.sh<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>
</div>

--000000000000adb92f05c43b4307--


--===============0252359759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0252359759==--

