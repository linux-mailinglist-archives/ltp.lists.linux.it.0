Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AB375372
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:13:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1979C3C67D3
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:13:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0F0403C5688
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:13:34 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 766DA1A014BE
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:13:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7832AFE1;
 Thu,  6 May 2021 12:13:33 +0000 (UTC)
Date: Thu, 6 May 2021 13:47:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJPXOY8/Nl/XzPO/@yuki>
References: <20210429125255.31510-1-zhaogongyi@huawei.com>
 <YJPImeHT9rVsVtON@pevik> <YJPNgGwlZBLMaJOd@yuki>
 <YJPbxQikXPap5DHW@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJPbxQikXPap5DHW@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/modify_ldt: Replace TINFO with TPASS
 or TFAIL
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
> $ ./modify_ldt02
> modify_ldt02    1  TPASS  :  value read as expected
> modify_ldt02    0  TINFO  :  received signal: 11
> modify_ldt02    2  TFAIL  :  modify_ldt02.c:136: Did not generate SEGV
> 
> (I wrote my report below affected line)
> 
> 11 is SIGSEGV, thus there must be a bug in a test, which probably has been there
> before (test just didn't check). It's strange that WTERMSIG(status) returns 0
> instead of 11.

Looking at the code the bug is obvious, we setup a handler for SIGSEGV
that does exit(0). And since this is old API test we have to reset the
signal handler in the child as well. I will push a fix ASAP.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
