Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4873193
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 16:25:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 434ED3C1D15
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 16:25:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 206ED3C13D8
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 16:25:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 029901401871
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 16:25:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F8D8AEEE;
 Wed, 24 Jul 2019 14:25:48 +0000 (UTC)
Date: Wed, 24 Jul 2019 16:25:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "piotr.krzysztof.gawel" <piotr.krzysztof.gawel@gmail.com>
Message-ID: <20190724142520.GA21787@rei.lan>
References: <5d383661.1c69fb81.3d170.b9f8@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d383661.1c69fb81.3d170.b9f8@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Patch for LTP
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> When I run LTP tests with musl libc, I discovered few issues in tst_timer_test.c:
> 
> The array with run times was not sorted. As Rich Felker pointed out, cmp() function breaks the contract for qsort() ??? I fixed it.Because array was not sorted, some tests were dumping cores. Plotting function strongly relies on having array sorted. I fixed that in #1 but still prefer defensive
>  programming here ??? protect against buffer overflow i.e. when input data is incorrect.Calculation if average run time is greater than desired time + threshold was incorrect. Each expected run should be in range t < s[i] < t + threshold, so for max.
>  edge: sum(s[i] + threshold) < sum(t + threshold). For i belonging to [d,n] => sum(s[i]) < (n-d)*(t + threshold) and not (n-d)*t + threshold.
> Please add this patch to main line of LTP if you don???t see issues here. Feel free to modify the change if needed.Thanks in advance!

Good catch, also thanks for the patch.

Can you please split the patch into separate patches?

You are doing unrelated changes each should be in a separate patch.

Also the comment in the compare function should rather be in the patch
description than in the code itself.

Lastly but not least if you could send the patches with git-send-email
or at least inline so that I can comment on the changes in the reply.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
