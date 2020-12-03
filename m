Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F22932CD57E
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 13:29:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7D433C4CAB
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 13:29:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D609F3C4C1F
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 13:29:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 38DD1601477
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 13:29:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89A74AC2E
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 12:29:47 +0000 (UTC)
Date: Thu, 3 Dec 2020 13:30:41 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201203123041.GB5809@yuki.lan>
References: <20201113131428.13199-1-chrubis@suse.cz>
 <20201113131428.13199-2-chrubis@suse.cz>
 <0c6f7b59-c1ec-5ff9-d261-7b4772ed9b1a@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c6f7b59-c1ec-5ff9-d261-7b4772ed9b1a@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 01/10] lib: Introduce more TEST_* macros
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
> I'd recommend adding TEST_*_IMPL() variant with extra arguments that'll
> allow special handling of ENOSYS, ENOTSUP and possibly also a
> zero-terminated array of allowed errnos. TEST_FD() etc. would then call
> the respective IMPL macro with default arguments:
> 
> #define TEST_FD_IMPL(SCALL, NOSYS_RES, NOTSUP_RES, ERRNO_LIST, ...) \
>     ...
> 
> #define TEST_FD(SCALL, ...) \
>     TEST_FD_IMPL((SCALL), TFAIL, TFAIL, NULL, ##__VA_ARGS__)

I do plan adding something like this later on once I run out of the
simple cases to convert, then I would like to review what is left there
and how to make best interface for the rest of the testcases.

So for now I would like to proceed with the patchset as it is in order
not to make it overly complicated.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
