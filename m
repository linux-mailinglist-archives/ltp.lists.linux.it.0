Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E423E9B1
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 11:01:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0D1D3C31E6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 11:01:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CC20E3C1CB6
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 11:01:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A6F8E600F5B
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 11:01:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7FA2BAF06;
 Fri,  7 Aug 2020 09:02:07 +0000 (UTC)
Date: Fri, 7 Aug 2020 11:01:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200807090147.GB21400@dell5510>
References: <20200803184726.2416-1-t-josne@linux.microsoft.com>
 <20200803184726.2416-3-t-josne@linux.microsoft.com>
 <20200807071754.GA9748@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807071754.GA9748@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] IMA: Refactor datafiles directory
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
Cc: balajib@linux.microsoft.com, nramas@linux.microsoft.com,
 tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan,

> > The IMA datafiles directory is structured so that it cannot be directly
> > expanded to include datafiles for tests other than `ima_policy.sh`.

> > Move the contents of the IMA datafiles directory into an IMA
> > datafiles/policy directory.

> Why it's required? Can't you use glob for inclusion?

> *.policy for valid policies
> *.policy-invalid for invalid policies
> *.policy* for all policies

> BTW I plan to use policies for other tests than just ima_policy.sh

> I don't refuse this patch, I just simply don't understand why it's required.

OK, I got that. Looking into $TST_DATAROOT is self explanatory.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

And I plan to use IMA policy as well for more tests will require some trick,
but that's another story.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
