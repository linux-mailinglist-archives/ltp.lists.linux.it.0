Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC1E2B92FE
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 14:01:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4A753C5F72
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 14:01:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8AD363C2F12
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 14:01:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 20812600478
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 14:01:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 710A9ACBA;
 Thu, 19 Nov 2020 13:01:32 +0000 (UTC)
Date: Thu, 19 Nov 2020 14:02:21 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20201119130221.GB12628@yuki.lan>
References: <20201119100617.70968-1-po-hsu.lin@canonical.com>
 <20201119103825.GG2785@yuki.lan>
 <CAMy_GT_vgtbEuT=zxs+0CxT0FGzQ-ZRkBEVVeZQmt87k=+s+EA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMy_GT_vgtbEuT=zxs+0CxT0FGzQ-ZRkBEVVeZQmt87k=+s+EA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: make explicit kernel config requirement
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
> from the help text it says:
> "If you say Y here, the process accounting information is written in a
> new file format that also logs the process IDs of each process and its
> parent. Note that this file format is incompatible with previous
> v0/v1/v2 file formats, so you will need updated tools for processing
> it."
> 
> I am not sure if this test can work with a kernel that just has
> CONFIG_BSD_PROCESS_ACCT_V3 enabled.

Ah, that's right, the CONFIG_BSD_PROCESS_ACCT has to be on and the *_V3
is enabled if the format is V3.

So everything is fine and sorry for breaking the test with buggy
validation code.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
