Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B967673C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 15:22:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FD173C1D15
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 15:22:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 27A9B3C0300
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 15:22:08 +0200 (CEST)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7F82C100174F
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 15:22:02 +0200 (CEST)
Received: by mail-vs1-f67.google.com with SMTP id m23so36089888vso.1
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 06:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MeRMYmFISTdzqKtApkfNHIhuiZ3e9e572t7DPVz9ll0=;
 b=CmBjV8ngyIRZTnNIe3oz1nneArHDPY3kQAqjgQkK1CKBnxTINw/Kjk0v+rlFHlEiKy
 Had6bLdXNBb8FZMhi9fzO33xwgaG17j/pxN0DhkVsoPZIdP5dXlsKmFVXmFoLhBSs+kn
 rjtprTyvWvdLDS1AcY8har0cor0ZGXILSPWWyRWS+YEH3Z06NTDw7n/cnMXQtXyJzLYI
 yaUNesmJdmLqPujNdyaRYg/Y7AUAzPg+M4e3zWAxei4FRT4VRyWXssYc6d4/l706ldOI
 U4KkW4bKX09aDdaA/1lgy0bIX/ADr6IA8KbBTtcEx0TXBuSh0+6agrF21ORbn8rIdVXY
 ynEQ==
X-Gm-Message-State: APjAAAVDalT6Lrbw8FmYgoK0zGeksWcY6HXgGFS0pLoLl/1ioMIJqMst
 xUICPVVnlqNPk+9g5vwYcSYY3lqif8BB7qmVxf2DsglG9hw=
X-Google-Smtp-Source: APXvYqyN2esK/32aEEzFPLh7yFFSAn37kgoEZHll7U++X6ikAd9kGPHKqYYQ/cyvlLyRvI39Ctu3PYMavkfEfZ4lxjY=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr59608979vsq.179.1564147326684; 
 Fri, 26 Jul 2019 06:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190725033713.8551-1-liwang@redhat.com>
 <20190726121255.GA28028@rei.lan>
In-Reply-To: <20190726121255.GA28028@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 26 Jul 2019 21:21:55 +0800
Message-ID: <CAEemH2c96sB1ZA_vnTxSaBy-v=G_WnR58LX+Wt=Q8=UxO0dNtQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Why so complicated?
> What about just doing usleep() and continue in case of the failure?

Seems I was falling too deep in this bug itself:).

I thought there are two situations we might hit ENOMEM:
1. In the first loop(i == 0), this should be a different issue and
better to break the test.
2. the test hit EBUSY and race condition results in ENOMEM in a
general loop(i >= 1), here we should retry to do mmap(). Even the
retries get arrive LOOPS the test should goto exit and report PASS
with print run times.

To be honest, your simple way also works for those two situations, we
just need to add one more sentence to judge if 'i == 0' before the
break.

So, I agree with you suggest here.


New found by this test:
===================

----------Patch V1---------
I run the patch v1(with EBUSY ignored and no mmap() retry on ENOMEM)
and always get PASS.

# ./move_pages12
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
move_pages12.c:251: INFO: Free RAM 189624232 kB
move_pages12.c:269: INFO: Increasing 2048kB hugepages pool on node 0 to 6
move_pages12.c:279: INFO: Increasing 2048kB hugepages pool on node 1 to 4
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:185: PASS: Bug not reproduced
i = 4
move_pages12.c:185: PASS: Bug not reproduced

Summary:
passed   2
failed   0
skipped  0
warnings 0

----------Patch V2---------------
But patch v2(no matter go with my complicated retries or you simple
method), It always gets killed by SIGBUS in the retrys mmap() on
ENOMEM, I guess it is a new kernel problem (not same as the first
SIGBUS without commit 6bc9b56433b).

# ./move_pages12
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
move_pages12.c:251: INFO: Free RAM 194212832 kB
move_pages12.c:269: INFO: Increasing 2048kB hugepages pool on node 0 to 4
move_pages12.c:279: INFO: Increasing 2048kB hugepages pool on node 1 to 6
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 0
move_pages12.c:195: INFO: Allocating and freeing 4 hugepages on node 1
move_pages12.c:185: PASS: Bug not reproduced
i = 4
i = 6
i = 8
...
i = 136
i = 138
i = 140
tst_test.c:1145: BROK: Test killed by SIGBUS!

Summary:
passed   1
failed   0
skipped  0
warnings 0
move_pages12.c:114: FAIL: move_pages failed: ESRCH


-----system env-----
# uname -r
5.3.0-rc1+

# numactl -H
available: 4 nodes (0-3)
node 0 cpus: 0 1 2 3 16 17 18 19
node 0 size: 32171 MB
node 0 free: 25358 MB
node 1 cpus: 4 5 6 7 20 21 22 23
node 1 size: 16125 MB
node 1 free: 5565 MB
node 2 cpus: 8 9 10 11 24 25 26 27
node 2 size: 96765 MB
node 2 free: 90646 MB
node 3 cpus: 12 13 14 15 28 29 30 31
node 3 size: 64482 MB
node 3 free: 60820 MB
node distances:
node   0   1   2   3
  0:  10  11  11  11
  1:  11  10  11  11
  2:  11  11  10  11
  3:  11  11  11  10

So, maybe we have to re-evaluate this patch V2 and to figure out why
the retry mmap() hitting SIGBUS fails.

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
