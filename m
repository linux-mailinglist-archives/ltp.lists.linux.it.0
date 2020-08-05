Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2967B23CBB3
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 17:22:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E21F73C325C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 17:22:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DC0973C0EAD
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 17:22:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 82F4E1A01A02
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 17:22:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80B57AFB0;
 Wed,  5 Aug 2020 15:22:41 +0000 (UTC)
Date: Wed, 5 Aug 2020 17:22:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Filip Bozuta <Filip.Bozuta@syrmia.com>
Message-ID: <20200805152244.GC631@yuki.lan>
References: <20200804144045.18875-1-Filip.Bozuta@syrmia.com>
 <20200804144045.18875-2-Filip.Bozuta@syrmia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804144045.18875-2-Filip.Bozuta@syrmia.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscalls/mq_timed{send|receive}: Add test
 cases for bad address
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
> This patch introduces test cases for already existing
> tests for syscalls 'mq_timedsend()' and 'mq_timedreceive()'
> (mq_timedsend01, mq_timedreceive01). These test cases are for
> situations when bad addresses are passed for arguments 'msg_ptr'
> and 'abs_timeout' in which case errno 'EFAULT' is expected to be set.
> Value '(void *)1' is used as a bad address for these arguments.
> 
> Implementation notes:
> 
>    Structure 'struct test_case' from file 'mq_timed.h' was modified
>    with addition of two fields (bad_msg_addr and bad_ts_addr) which
>    represent indicators for the implemented testcases. They are set
>    to 1 for the new added test cases. These fileds are checked before
>    running the test to see if bad address value '(void *)1' should be
>    passed for the above mentioned arguments.

This is pretty clear from the patch itself. I'm not sure if there is
any added value in writing paragraphs that describe the obvious like
this one.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
