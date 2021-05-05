Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721137391D
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 13:13:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17BA03C5783
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 13:13:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 270B63C5707
 for <ltp@lists.linux.it>; Wed,  5 May 2021 13:13:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A3FD71A01162
 for <ltp@lists.linux.it>; Wed,  5 May 2021 13:13:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1BD7B172
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:13:47 +0000 (UTC)
Date: Wed, 5 May 2021 13:13:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YJJ96mpakcatiQ4z@pevik>
References: <20210505081845.7024-1-mdoucha@suse.cz>
 <20210505081845.7024-6-mdoucha@suse.cz> <YJJtpXWM4BxH2ffu@pevik>
 <4ea9d02a-2867-1977-cfd3-bd591d211733@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ea9d02a-2867-1977-cfd3-bd591d211733@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 6/6] Add test for CVE 2020-25705
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Yes, I should fix this and the <time.h> issue. Please push everything up
> to patch 5 and then I'll resubmit v4 just for this patch.
NOTE: <time.h> must be included *before* <linux/errqueue.h>
(maybe bug in musl headers).
I suppose Cyril will merge these 4 patches soon.

> > FYI I tested the test on several VM. Very old kernel detects problem only on
> > more runs. But given it's 3.16 (and b38e7819cae9 is a fix for 4cdf507d5452 from
> > v3.18-rc1 we can ignore this).

> Pass is expected here. Vanilla v3.16 AFAIK does not have the global ICMP
> rate limiter which introduced the real vulnerability in the first place.
Sure. I was just surprised to get different result on -i1 and on -i >= 2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
