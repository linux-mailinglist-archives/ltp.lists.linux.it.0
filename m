Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFB7FD91
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:31:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD27F3C2070
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 17:31:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 69B573C1E1F
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:31:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6DC0760675D
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 17:31:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A5404AFDB;
 Fri,  2 Aug 2019 15:31:15 +0000 (UTC)
Date: Fri, 2 Aug 2019 17:31:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190802153113.GA4609@dell5510>
References: <20190802150445.10984-1-pvorel@suse.cz>
 <20190802150445.10984-3-pvorel@suse.cz>
 <20190802151401.GA24157@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802151401.GA24157@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] utils/ffsb: Add missing fhstat() signature
 + includes
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

> Hi!
> > To be hones I'd rather delete this The Flexible Filesystem Benchmark
> > (FFSB) (in utils/ffsb-6.0-rc2). Does anyone uses it?
> > If kept, I'd prefer to have it as a separate project in [1]

> It's a dependency because the ext4-new-features tests use it.

> But these tests already check for ffsb so we may as well remove it from
> LTP and either maintain it in a separate repo or point out our users to
> the fork.
OK, I overlooked it's really installed. In that case I'd postpone the solution
(hosting at separate project looks cleaner to me, but then we'd need to setup
git subproject) and merge this unchanged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
