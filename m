Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9531356B4
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:19:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E56BE3C24D5
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:19:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C5D6F3C23C8
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:19:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E37C3600085
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:19:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A614E69D70
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:19:10 +0000 (UTC)
Date: Thu, 9 Jan 2020 11:19:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200109101909.GD23230@dell5510>
References: <20191213125435.GB20795@rei.lan> <20200106150329.GC26880@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106150329.GC26880@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP Release plans
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

Hi Cyril,

> Anything else I should look at?
I'd like to have TI-RPC related patch-set

* RFC,1/1] rpc-tirpc: Remove authdes related tests
https://patchwork.ozlabs.org/patch/1216506/
Acked by Li, waiting for Steve (libtirpc maintainer) to be acked.

And if you have time then this one (not that important, fixing
https://github.com/linux-test-project/ltp/pull/628
and adding libntirpc support):
* TI-RPC: enhancements (pkg-config, libntirpc, travis)
https://patchwork.ozlabs.org/project/ltp/list/?series=151849
(first 2 commits are relevant, the others are travis)

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
