Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910835F508
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 15:41:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07AA73C70E6
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 15:41:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9857F3C70DB
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 15:41:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CC9BA600491
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 15:41:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEA39AFC1;
 Wed, 14 Apr 2021 13:41:23 +0000 (UTC)
Date: Wed, 14 Apr 2021 15:32:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YHbu2LpnYB2J2Ey7@yuki>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B5467@dggeml531-mbx.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B5467@dggeml531-mbx.china.huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
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
> BTW I find that the testcase run passed on my local system, it seems
> that tst_* will not trig memory allocation:

This is not, by any means, a proof that the test is correct.

"Passed on my machine" is nothing but poor excuse.

I can easily write utterly broken code that will work fine on a single
machine and fail on anything else. Correctly written test depends on
valid assumptions we can make about the operation system the test is
supposed to run on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
