Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595035F106
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:47:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A90063C70D5
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 11:47:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1D3B3C1B0E
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:47:42 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 72DC0200AE3
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 11:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618393660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6lfLCxrefvLRa7w2htsdF5HfhFjMfAEycbsNAGuS1Sg=;
 b=BDhtZK3oplgR3Cou4njnoCEPJruFjxEPmEfjD+BFSTjQcgLjrtGWFkICAEwHaU7AuXo9v5
 ql+yCxhuHUYtZoe8NGO9WPWAXkU/r4y0SnR4/WyCZM/KmQ63lJPeTQNBFv/qBw40NELs+v
 r5XujePMRx1+8GCf5Ds3rjQSseXXsWg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-E00nP5cGOEOlFT5qhASB4Q-1; Wed, 14 Apr 2021 05:47:36 -0400
X-MC-Unique: E00nP5cGOEOlFT5qhASB4Q-1
Received: by mail-yb1-f198.google.com with SMTP id h69so14830670ybg.10
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 02:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6lfLCxrefvLRa7w2htsdF5HfhFjMfAEycbsNAGuS1Sg=;
 b=H7FBfYh/SEUdb2hsCb5a2Hdtq0X50iiAz/l9u9G15CS0mkrUEucPSeqyqe5EJv08Up
 rATSVLGrnOtO3pG6ILWCNRGaScsFSgpF7bMluvmV1lvGYvnKx0lxfLo1jBHqPT43YZKr
 I4V5YBdBE9WdEQuNZV0v68Ss4n1Ry661fdPjtrfN6ZHGojb7DHltAD28/fFG/1xeQlop
 gBxlVmPjhrivf6AUdEXRNqJxmvOFr7TO4F2oM5iYuP0QVpmgSA3ExhuayB2s9+5Uszs+
 5eqE1F9XT45ftH23ajPCD6MzDer50ax7u26piO0NDTrlXVLvnkwmafpfuBmdUtkV2dHd
 8mzA==
X-Gm-Message-State: AOAM531nxWYX41R4HTVJwj1o0JKy9PMX35ftjuVucecRoQhqeixa7zTH
 c0FzE8ZmGggv3g5KEddebrEva7EQX69186EuF5P37n0a60N8AwBPSuCUgTqUcXeq6RnsAopMSuV
 JuVQ/MUtRan5lG5yatWGq/YGNbcg=
X-Received: by 2002:a5b:787:: with SMTP id b7mr51918543ybq.243.1618393655869; 
 Wed, 14 Apr 2021 02:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvA4NzE0mWXni3pcTILITGkbMHTFQ4crO1+6PYQQAwZ7Tl9yHjBkvDEdIZhp/B241VrT9XARP5jYhibYPRIvc=
X-Received: by 2002:a5b:787:: with SMTP id b7mr51918517ybq.243.1618393655597; 
 Wed, 14 Apr 2021 02:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <1617765607-78263-1-git-send-email-wangxin410@huawei.com>
 <CAEemH2ctSMR5OF=0TQX1eNmTE7PcdEdMbjoYXc3RxiBsyfzcuw@mail.gmail.com>
 <91a235700b494bdf9a9a7dd1901aa947@huawei.com>
 <CAEemH2dU2r8gFS5r3os7UwXFUEmmPqR9CnAizXbP_FHP+Evd+A@mail.gmail.com>
 <1e332d4428ea42aeb59e1173b654ce30@huawei.com>
In-Reply-To: <1e332d4428ea42aeb59e1173b654ce30@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 14 Apr 2021 17:47:24 +0800
Message-ID: <CAEemH2ePd0td_fiK9MF66Mu9_XOzi7pa2pZLQj2t1qGwu0LxcQ@mail.gmail.com>
To: "wangxin (CQ)" <wangxin410@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] openposix/conformance/interfaces: Correct typos
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
Content-Type: multipart/mixed; boundary="===============1671113206=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1671113206==
Content-Type: multipart/alternative; boundary="000000000000f2f4da05bfeba2c1"

--000000000000f2f4da05bfeba2c1
Content-Type: text/plain; charset="UTF-8"

Hi Xin,

I'm sorry I don't know how did you do make a new patch, I still can NOT
merge it to my local branch.

Btw, the one(about cpuset) I also solved the conflict by manual and
then applied, I guess you proably need to check your git, or did you
really make a patch via `git format-patch`?

After checking with scripts/checkpatch.pl, it repor errors like:

$ ./scripts/checkpatch.pl
~/v2-openposix-conformance-interfaces-Correct-typos.patch
WARNING: Possible unwrapped commit description (prefer a maximum 75 chars
per line)
#73:
Types in the name of the temporary files: For example, in aio_cancel/8-1.c
file,

ERROR: patch seems to be corrupt (line wrapped?)
#109: FILE:
testcases/open_posix_testsuite/conformance/interfaces/aio_read/9-1.c:55:
index 5b980be..e1ae59e 100644

total: 1 errors, 1 warnings, 113 lines checked


-- 
Regards,
Li Wang

--000000000000f2f4da05bfeba2c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><span class=3D"gmail_defau=
lt" style=3D"font-size:small">Hi Xin,</span></div><div><span class=3D"gmail=
_default" style=3D"font-size:small"><br></span></div><div><span class=3D"gm=
ail_default" style=3D"font-size:small">I&#39;m sorry I don&#39;t know how d=
id you do make=C2=A0a new patch, I still can NOT</span></div><div><span cla=
ss=3D"gmail_default" style=3D"font-size:small">merge it to my local branch.=
=C2=A0</span></div><div><span class=3D"gmail_default" style=3D"font-size:sm=
all"><br></span></div><div><span class=3D"gmail_default" style=3D"font-size=
:small">Btw, the one(about cpuset) I also solved the conflict=C2=A0by manua=
l and</span></div><div><span class=3D"gmail_default" style=3D"font-size:sma=
ll">then applied,=C2=A0</span>I guess you proably=C2=A0need to check your g=
it<span class=3D"gmail_default" style=3D"font-size:small">,</span> or did y=
ou</div><div><span class=3D"gmail_default" style=3D"font-size:small">really=
 </span>make a patch via `git format-patch`?</div><div><span class=3D"gmail=
_default" style=3D"font-size:small"><br></span></div><div><span class=3D"gm=
ail_default" style=3D"font-size:small">After checking with scripts/<a href=
=3D"http://checkpatch.pl">checkpatch.pl</a>, it repor errors like:</span></=
div><div><span class=3D"gmail_default" style=3D"font-size:small"><br></span=
></div>$ ./scripts/<a href=3D"http://checkpatch.pl">checkpatch.pl</a> ~/v2-=
openposix-conformance-interfaces-Correct-typos.patch <br>WARNING: Possible =
unwrapped commit description (prefer a maximum 75 chars per line)<br>#73: <=
br>Types in the name of the temporary files: For example, in aio_cancel/8-1=
.c file,<br><br>ERROR: patch seems to be corrupt (line wrapped?)<br>#109: F=
ILE: testcases/open_posix_testsuite/conformance/interfaces/aio_read/9-1.c:5=
5:<br>index 5b980be..e1ae59e 100644<br><br>total: 1 errors, 1 warnings, 113=
 lines checked<br><div><span class=3D"gmail_default" style=3D"font-size:sma=
ll"></span><br></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--000000000000f2f4da05bfeba2c1--


--===============1671113206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1671113206==--

