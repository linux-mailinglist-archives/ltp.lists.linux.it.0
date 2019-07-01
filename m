Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E7C5B583
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:12:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2042D3C1DC0
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:12:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 22D763C1D7B
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:11:59 +0200 (CEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 47AA5200C23
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:11:58 +0200 (CEST)
Received: by mail-vs1-f48.google.com with SMTP id j26so8207746vsn.10
 for <ltp@lists.linux.it>; Mon, 01 Jul 2019 00:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tOEBvKts/rMnD8628yPVPgHKqevDJK03PR4fFqx8b3Y=;
 b=hjMADmp3ghVeDPkmu30e02HMSumDSzICrsP+Fdwb8RreZH7fGeRmWgPdaQc1IBRKwi
 SspPafqwXf5lpStZZkWIjSNP6NQwPS9QDskxTSiuCytVlwD/pnjCDL2SBxrl6llR5Wuv
 Aq3khyRrZUcom9zH05pJMDUAI5bs78RecYaxOAvHzSR/yxO4lJaAmlBPsUjSU6bukjee
 89Kmu+ip0VqEASEFzsM/7vXHS7neg8Ztum/H831tgFfgl0Lxno8RO65opktOcG/+6Woh
 E2dX2fA/yn3i9906yfvNiq4+tElPYjeMJ5pd8O8ijgiMo0nnDbXKNJpX5rl98beX9q/X
 5dhg==
X-Gm-Message-State: APjAAAUMYS5JwBipNha9Z7KmmY6u4Ji95Yq3derDeHcvjp+PkC7h2eeG
 f/AjmgYh3ucKHIUEzhQhcAO3m1DZrZqaU0I06SCY5w==
X-Google-Smtp-Source: APXvYqyMpaszh18Y5JDS/E8BvBgLSuZQ6klZCO27Ki896K3TpEofRYRz02nJN5JOUBoXq8wF9IxTVuOHQyOhpnceMzU=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr5576293vsp.130.1561965117101; 
 Mon, 01 Jul 2019 00:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071538.29486-1-liwang@redhat.com>
 <20190626071538.29486-2-liwang@redhat.com>
 <285629943.30156546.1561537194409.JavaMail.zimbra@redhat.com>
 <CAEemH2d_7fq2RxEwZEMSUgErM7XG26RTsV1ogLTiLvALc810Gw@mail.gmail.com>
 <1695359151.30173908.1561543177520.JavaMail.zimbra@redhat.com>
In-Reply-To: <1695359151.30173908.1561543177520.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 1 Jul 2019 15:11:45 +0800
Message-ID: <CAEemH2d-Hyhg5Xo+Q66C3MKvMv3pOnXDKtFYkuZpi6ZUEgC2DA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] pkey: add test for memory protection keys
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
Content-Type: multipart/mixed; boundary="===============0669713469=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0669713469==
Content-Type: multipart/alternative; boundary="000000000000f4fc01058c995786"

--000000000000f4fc01058c995786
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 26, 2019 at 5:59 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ...
> >
> > If a system(e.g PowerKVM guest) configured with NO huge page support,
> then
> > the file '/proc/sys/vm/nr_hugepages' exist but EOPNOTSUPP to read/write.
> In
> > this key01, perhaps I shouldn't use the "/proc/.../nr_hugepages" to
> detect
> > that at the beginning.
> >
> > Seems the correct way is to use "/sys/kernel/mm/hugepages/" for huge page
> > detecting and leave the SAFE_FILE_* still in setup(). Because we need to
> > catch the "/proc/.../nr_hugepages" open/close or read/write issue in
> > testing.
>
> That should work, I see we used that in some tests already.
>

Thanks, should I format new patch v5? or any more comments?

-- 
Regards,
Li Wang

--000000000000f4fc01058c995786
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 26, 2019 at 5:59 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; <br>
&gt; If a system(e.g PowerKVM guest) configured with NO huge page support, =
then<br>
&gt; the file &#39;/proc/sys/vm/nr_hugepages&#39; exist but EOPNOTSUPP to r=
ead/write. In<br>
&gt; this key01, perhaps I shouldn&#39;t use the &quot;/proc/.../nr_hugepag=
es&quot; to detect<br>
&gt; that at the beginning.<br>
&gt; <br>
&gt; Seems the correct way is to use &quot;/sys/kernel/mm/hugepages/&quot; =
for huge page<br>
&gt; detecting and leave the SAFE_FILE_* still in setup(). Because we need =
to<br>
&gt; catch the &quot;/proc/.../nr_hugepages&quot; open/close or read/write =
issue in<br>
&gt; testing.<br>
<br>
That should work, I see we used that in some tests already.<br></blockquote=
><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">Than=
ks, should I format new patch v5? or any more comments?</div></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000f4fc01058c995786--

--===============0669713469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0669713469==--
