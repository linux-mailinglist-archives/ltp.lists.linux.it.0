Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF138AAA6
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 13:16:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F3D93C873D
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 13:16:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1CDF33C1E1D
 for <ltp@lists.linux.it>; Thu, 20 May 2021 13:15:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 50D5960035B
 for <ltp@lists.linux.it>; Thu, 20 May 2021 13:15:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A6C1AC5B;
 Thu, 20 May 2021 11:15:57 +0000 (UTC)
Date: Thu, 20 May 2021 12:49:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YKY+y/KgdpeppaYx@yuki>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com>
 <YKTcWhMGotujEYLK@yuki>
 <e17ffbb2-2c2a-bd15-9e8c-cd2795e566cd@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e17ffbb2-2c2a-bd15-9e8c-cd2795e566cd@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile09 to the
 new API
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
> >> + * Testcase copied from sendfile02.c to test the basic functionality of
> >> + * the sendfile(2) system call on large file. There is a kernel bug which
> >> + * introduced by commit 8f9c0119d7ba and fixed by commit 5d73320a96fcc.
> >                              ^
> > 	Here as well the commit that introduced the bug should go to
> > 	.tags.

And I made a mistake here, we put the commit that fixes the bug into the
tags, so the second one should be in the metadata, but I can fix that
before the patches are applied. Sorry for the confusion.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
