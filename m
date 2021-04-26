Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB36A36B3CF
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 15:09:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B0263C66F9
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 15:09:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C8BA3C2197
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:09:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EF626600568
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:09:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2664AF8A;
 Mon, 26 Apr 2021 13:09:07 +0000 (UTC)
Date: Mon, 26 Apr 2021 14:50:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YIa3Dbsl7FY6IC8f@yuki>
References: <20210330104613.1059-1-zhanglianjie@uniontech.com>
 <YHRcJOUer87SUn6v@yuki>
 <cded02a5-6668-8524-d588-b965ed1a7086@uniontech.com>
 <YHgd/NDLJzz68uDl@yuki>
 <e3eabee4-6616-84dc-cc8d-bc4f23228637@uniontech.com>
 <YH1H4qZwqSNom4RO@yuki>
 <f73913c8-f6ca-d8ea-60c8-e4002ac16dba@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f73913c8-f6ca-d8ea-60c8-e4002ac16dba@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
> The test was passed before the cve patch was applied, and the test
> failed after the patch was applied, and the test results were the same
> on both the x86 and mips architectures.
>
> This cve patch changes mincore() to count "mapped" pages instead of 
> "cached" pages.

I've looked at at the mincore code and found what is your problem. The
initiall patch that fixed the CVE was wrong and later reverted and
replaced with a different fix:

commit 134fca9063ad4851de767d1768180e5dede9a881
Author: Jiri Kosina <jkosina@suse.cz>
Date:   Tue May 14 15:41:38 2019 -0700

    mm/mincore.c: make mincore() more conservative


So it's your kernel that is broken and the test is fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
