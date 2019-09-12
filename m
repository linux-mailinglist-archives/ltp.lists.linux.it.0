Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2FB0BB2
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:41:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08F1A3C2085
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:41:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1D0363C0733
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:41:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 803E7204934
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:41:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5666AF94;
 Thu, 12 Sep 2019 09:41:22 +0000 (UTC)
Date: Thu, 12 Sep 2019 11:41:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190912094121.GA7714@rei.lan>
References: <1568266635-17666-1-git-send-email-shuang.qiu@oracle.com>
 <CAEemH2dnWfhmTBHyKPJ9iAgEKPNcCBGwuUJ+zC8+UCFCvX5eSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dnWfhmTBHyKPJ9iAgEKPNcCBGwuUJ+zC8+UCFCvX5eSw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] madvise09:Update PAGES to a larger value
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

Hi!
> Thanks for the quick work on this.
> 
> There are two problems that you probably ignored.
> 
> 1. On ppc64 system, the page size is 64KB, and 970 * 64KB is almost 60MB
> which we do allocate. So we'd better raise
> the limit_in_bytes/memsw.limit_in_bytes a little in cgroup correspondingly.
> 
> 2. As Cascardo points out, madvise09 gets retries in an infinite loop when
> hitting OOM. That's because, in the run() function, it does not limit the
> retry times. We need to take care of this as well.

I guess that the debug printing would go out of hand as well, 970
characters printed into the console is no fun either. The test needs a
bit more than just bumping the number of pages. However as we are
getting really close to release I guess that the best course of action
would be workarounding the issue for now by bumping the number of pages
to something as 128 pages. Then we can rework the test once LTP has been
released.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
