Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC02B257D
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 21:28:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C9E73C657C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 21:28:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 571BD3C2EC2
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 21:28:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D81B014016BB
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 21:28:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15E75ABD9
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 20:28:30 +0000 (UTC)
Date: Fri, 13 Nov 2020 21:28:28 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201113202828.GA2229@pevik>
References: <20201113131428.13199-1-chrubis@suse.cz>
 <20201113131428.13199-2-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113131428.13199-2-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> In order to simplify common return value checks.

Great improvement, thanks!

The only concern I have is for tests which does not end 0
as it's not obvious from the output (without looking into the test source)
that everything it's working, but not a big deal.

FYI I plan to send a patchset which runs tests in lib/newlib_tests/.
First I thought simple check for 0 would be ok, but with non-zero results it
might be good to not only check expected return value but maybe for whole
output (the same approach we have unfinished in patchset from Christian Lanig).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
