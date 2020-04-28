Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F05901BB66F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 08:22:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C1FC3C5F4A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 08:22:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4DD5C3C2832
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 08:22:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B43B8600717
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 08:22:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A65BAAC12;
 Tue, 28 Apr 2020 06:22:44 +0000 (UTC)
Date: Tue, 28 Apr 2020 08:22:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200428062243.GA2879@dell5510>
References: <20200427145212.GA5678@dell5510>
 <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] common_timers: staticize all definitions
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> Staticize all variable and function definitions to avoid build failures
> in the future if this gets included by multiple files.

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks for a quick fix.

BTW for library files we prefer to have in header include/tst_foo.h just
function signatures and the implementations have in lib/tst_foo.c. Because also
having implementations in include files sometimes bring problems. But for lapi
files (which are included only for some tests) it's perfectly ok.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
