Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F94E1C3BC
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 09:16:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD47C294AC0
	for <lists+linux-ltp@lfdr.de>; Tue, 14 May 2019 09:16:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 877633EA17E
 for <ltp@lists.linux.it>; Tue, 14 May 2019 09:16:48 +0200 (CEST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5D7F41001447
 for <ltp@lists.linux.it>; Tue, 14 May 2019 09:16:44 +0200 (CEST)
Received: by mail-vs1-f43.google.com with SMTP id q64so9672524vsd.1
 for <ltp@lists.linux.it>; Tue, 14 May 2019 00:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NW5A3wHohaFHbEOO5V6IEhxi0HfGGG3GH7NeYXF+920=;
 b=B62k/aJibJNDNXcHydt/eQJF6fTWuLznEaUpcS5mJVu4JundREJlqZm/QkMqiwiEpC
 MGWknys5gMpQ2A94S3ayQUI9pY7UeBovL5VKxFULWTbFLBM8Xvcac4LI/hh3yuShWmx4
 mVvsgPXoNIo2YOr/kh36+mO5+tsRWwBENa+DA3QWNZsBoZz2fSyEk5B4O4wqDsJ+tDhL
 XqKjcYb854p4q+mtJWZ2Eo2BRp75WMJqUlNFUGmDcxFEdIlzNzyMDNlXJbbMfZ4kHAV0
 WoZ2otSUhfXh7JpyCCiRpwdbc9uAPFEG+vZKkAMB3kG5NoXcS6kE6hOhtosBM4hXoTvi
 TBQg==
X-Gm-Message-State: APjAAAUyYMocMopG9Cx4g3nApCtt3KYDj7QKPnoD+xZqjZ1MQKqqNPRO
 6jH8kS6I22YYch/INw5h9Pl+1BWRjS+9iWYcj7aG7w==
X-Google-Smtp-Source: APXvYqwRFlVkH7jaCv1iuIounnl/SkVAPuvdncPiKyIwC4OddLSELRs+GLI0O8OGahmOkM11TCZ6DDIkc5UKl/jW1ps=
X-Received: by 2002:a67:7241:: with SMTP id n62mr15333431vsc.217.1557818206109; 
 Tue, 14 May 2019 00:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190418111812.GB3073@rei.lan>
In-Reply-To: <20190418111812.GB3073@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 14 May 2019 15:16:34 +0800
Message-ID: <CAEemH2c-xuoLHMmp_-jOhsLa7PVxsxeKXq=wdJ5cVFROHv4yMQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] LTP Release
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1788419916=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1788419916==
Content-Type: multipart/alternative; boundary="000000000000cce8780588d3d074"

--000000000000cce8780588d3d074
Content-Type: text/plain; charset="UTF-8"

Hi Cyril,

I have completed the latest LTP testing on RHEL-7.6 and RHEL-8.0 across all
arches(x86_64, ppc64le, ppc64, s390x, aarch64), here I post the summary FYI:

RHEL7.6
------------
1. crypto/af_alg01/02 (all arches - fail)
af_alg01 failure is a kernel bug.
af_alg02 test broken as what Christian's described in the patch. It should
be fixed on the kernel without that commit ecaaab564978 too.

2. binfmt_misc01.sh  (x86_64, s390x - fail, ppc64le/ppc64 - panic)
It looks like a kernel bug.

RHEL8.0
-------------
1. NUMA issue (ppc64le)
Numa test failed on that machine with non-continuous NUMA nodes. Two
patches for the problem solving has been sent to LTP-ML.

2. HUGETLB issue (aarch64)
hugetlb tests sometimes failed to request sufficient huge pages, even we
try limiting to 80% of the max huge page count is still not being satisfied
on 512MB huge page size system sometimes.

Besides these above failures, the remaining test looks pretty good.

-- 
Regards,
Li Wang

--000000000000cce8780588d3d074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi Cyril,<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">I have completed the late=
st LTP testing on RHEL-7.6 and RHEL-8.0 across all arches(x86_64, ppc64le, =
ppc64, s390x, aarch64), here I post the summary FYI:</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">RHEL7.6</div>------------</div><div dir=3D"ltr"=
><div class=3D"gmail_default" style=3D"font-size:small"><span class=3D"gmai=
l_default">1.</span>=C2=A0<span class=3D"gmail_default"></span><span class=
=3D"gmail_default"></span><span class=3D"gmail_default"></span>crypto/af_al=
g0<span class=3D"gmail_default">1/02 (all arches - fail)</span><br></div></=
div><div dir=3D"ltr"><span class=3D"gmail_default" style=3D"font-size:small=
">af_alg0<span class=3D"gmail_default">1 failure is a kernel bug.</span><br=
></span></div><div dir=3D"ltr">af_alg02 test broken as what Christian&#39;s=
 described in <span class=3D"gmail_default" style=3D"font-size:small">the</=
span>=C2=A0patch<span class=3D"gmail_default" style=3D"font-size:small">. I=
t should be fixed on the kernel without that commit ecaaab564978=C2=A0too.<=
/span><span class=3D"gmail_default" style=3D"font-size:small"></span></div>=
<div dir=3D"ltr"><br><span class=3D"gmail_default" style=3D"font-size:small=
">2.</span>=C2=A0<span class=3D"gmail_default" style=3D"font-size:small"></=
span>binfmt_misc01.sh <span class=3D"gmail_default" style=3D"font-size:smal=
l">=C2=A0</span><span class=3D"gmail_default" style=3D"font-size:small">(x8=
6_64, s390x - fail, ppc64le/ppc64 - panic)</span><br><div class=3D"gmail_de=
fault" style=3D"font-size:small">It looks like a kernel bug.</div></div><di=
v dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">RHEL8.0</div><di=
v class=3D"gmail_default" style=3D"font-size:small">-------------</div><div=
 class=3D"gmail_default" style=3D"font-size:small">1. NUMA issue (ppc64le)<=
/div></div><div><div class=3D"gmail_default" style=3D"font-size:small">Numa=
 test failed on that machine with=C2=A0non-continuous NUMA nodes. Two patch=
es for the problem solving has been sent to LTP-ML.<br></div><div class=3D"=
gmail_default"><br></div><div class=3D"gmail_default">2. HUGETLB issue (aar=
ch64)</div><div class=3D"gmail_default">hugetlb tests sometimes failed to r=
equest=C2=A0sufficient huge pages,=C2=A0even we try limiting to 80% of the =
max huge page count is still not being satisfied on 512MB huge page size sy=
stem sometimes.</div></div><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">Besides these above failures, the remaining test=
 looks pretty good.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"m_6194588847074667131m_7331046995565508479m_-4286077584867337288gmail-m=
_-1598619038412516363m_-7071930205388083058gmail-m_-7758468632121109261gmai=
l-m_-3906677593407697335gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div></div></div></div>

--000000000000cce8780588d3d074--

--===============1788419916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1788419916==--
