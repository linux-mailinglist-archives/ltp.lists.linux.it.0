Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73846371463
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 13:36:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23F623C7A6B
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 13:36:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E4DD3C1B4D
 for <ltp@lists.linux.it>; Mon,  3 May 2021 13:36:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 028F960070C
 for <ltp@lists.linux.it>; Mon,  3 May 2021 13:36:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28DA3AE86;
 Mon,  3 May 2021 11:36:36 +0000 (UTC)
Date: Mon, 3 May 2021 13:36:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ankit Jain <ankitja@vmware.com>
Message-ID: <YI/gQjOJK3dtjiPr@pevik>
References: <1620029239-31643-1-git-send-email-ankitja@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620029239-31643-1-git-send-email-ankitja@vmware.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] realtime/func/pi-tests: testpi-2 parser
 indentation fix
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
Cc: sturlapati@vmware.com, ltp@lists.linux.it, bordoloih@vmware.com,
 bvikas@vmware.com, srivatsa@csail.mit.edu, srivatsab@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ankit,

> There is an indentation issue in parser for testpi-2
> which causes incorect parsing of the logs.

Thanks for your fix, merged!

FYI the patch didn't apply, not sure why, I had to use patch to apply it
(instead of git am). I guess it was wrongly generated, please make sure
you use git format-patch properly.

If pi-tests are really working and worth to keep (one of my colleagues
realtime expert in the past didn't see much value in them), it'd be good
to rewrite these parsers to shell (to avoid unnecessary python3 dependency).

https://github.com/linux-test-project/ltp/issues/547

Also script assign True to flag variable but never uses it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
