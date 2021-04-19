Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED970363E65
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 11:18:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE2C93C6D75
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 11:18:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA50F3C1D68
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 11:18:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2F922600A2E
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 11:18:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 953DAAF27;
 Mon, 19 Apr 2021 09:18:42 +0000 (UTC)
Date: Mon, 19 Apr 2021 11:05:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YH1H4qZwqSNom4RO@yuki>
References: <20210330104613.1059-1-zhanglianjie@uniontech.com>
 <YHRcJOUer87SUn6v@yuki>
 <cded02a5-6668-8524-d588-b965ed1a7086@uniontech.com>
 <YHgd/NDLJzz68uDl@yuki>
 <e3eabee4-6616-84dc-cc8d-bc4f23228637@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3eabee4-6616-84dc-cc8d-bc4f23228637@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Modify the test logic of mincore.
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
> >> Using the CVE patch on mips, the test will fail because the child
> >> process mlocks all pages, but the parent process cannot obtain these
> >> pages through mincore and is locked.
> > 
> > Sounds like a kernel bug.
> > 
> CVE list has provided repair patches, The patch I submitted this time is 
> to modify the logic of the test results, do you plan to incorporate it?

Let me try to explain it once again.

As far as I can tell the CVE kernel patch you pointed out has NO effect
on the testcase and there is NO need to modify the test at all. The test
works fine both before and after the kernel patch.

If the test fails for you YOUR kernel is broken.

That is unless you prove that the test is actually wrong, which you
haven't and I do not think that you actually can.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
