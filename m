Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB862369407
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 15:48:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD5143C6A0C
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 15:48:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4BA63C69F7
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 15:48:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A08AB201135
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 15:48:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16275ADD7;
 Fri, 23 Apr 2021 13:48:36 +0000 (UTC)
Date: Fri, 23 Apr 2021 15:32:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: xieziyao <xieziyao@huawei.com>
Message-ID: <YILMXkSAGkWvgocy@yuki>
References: <20210420133839.145408-1-xieziyao@huawei.com>
 <YIAcC1DaWciwSypB@yuki>
 <6ff9d783d70a4c4f91fe3dca0a948833@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ff9d783d70a4c4f91fe3dca0a948833@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PDS_TONAME_EQ_TOLOCAL_SHORT, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/sendfile: Delete unnecessary loop logic
 in do_child()
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> And I think the other testcases of the sendfile testsuite have the
> same problem. Can we please modify other testcases in the same way?

Yes please, at least sendfile03, sendfile07 should be cleand up the same
way as the sendfile04 and sendfile05 were.

The rest of the tests seems to actually transfer data, but the code is
really messy so they should be cleaned up and converted to new library
as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
