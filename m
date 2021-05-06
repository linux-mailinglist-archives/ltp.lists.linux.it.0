Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44687375558
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 16:02:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C727E3C71EC
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 16:02:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C4CD3C3157
 for <ltp@lists.linux.it>; Thu,  6 May 2021 16:02:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E16D21400989
 for <ltp@lists.linux.it>; Thu,  6 May 2021 16:02:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 412DCB035;
 Thu,  6 May 2021 14:02:17 +0000 (UTC)
Date: Thu, 6 May 2021 15:35:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YJPwtLIVaudLO6vy@yuki>
References: <d133afe6b6be43b089a68e0a72b15960@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d133afe6b6be43b089a68e0a72b15960@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] [PATCH] syscalls: modify_ldt02: Fix failure
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
> I am sorry, It's my fault. It seems that restore to origin code is
> more better since it might create a core file.

No this is not solution either, since the original code was broken to
begin with.

We do have tst_no_corefile() in the test library, which should be called
by tests that cause SEGFAULT on purpose in order to avoid dumping a
core, but it looks like it's available only for new library tests. We
would have to convert the test to new library first if we wanted to
that.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
