Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C98112F3CC1
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 01:40:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EBC43C54C4
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 01:40:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B3C433C5451
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 01:40:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F8C81A006E1
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 01:40:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D371AB9F;
 Wed, 13 Jan 2021 00:40:56 +0000 (UTC)
Date: Wed, 13 Jan 2021 01:40:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <X/5BlpO5QU7mhyEP@pevik>
References: <20201125053459.3314021-1-lkml@jv-coder.de>
 <20201125053459.3314021-3-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125053459.3314021-3-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] network/stress/route-change: Convert to
 new API
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> +++ b/testcases/network/stress/route/route-redirect.sh
...
> +do_cleanup()
> +{
> +	# Kill the redirector utility
> +	tst_rhost_run -c "killall -SIGHUP ns-icmp_redirector"
FYI: route_cleanup is required (from route-lib.sh) otherwise next test in the
runtest file (route6-change-dst) is broken:
route-change-dst 1 TFAIL: ping6 -c1 -I fd00:1:1:1::2 fd00:23:1::1 >/dev/null failed unexpectedly

But anyway, I've fixed everything and tested:
https://github.com/pevik/ltp/commits/joerg/multicast.v3.fixes

It might be merged before the release, or immediately after the release.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
