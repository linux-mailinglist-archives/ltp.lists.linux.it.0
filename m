Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8FC9E58A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:17:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64D983C1CE6
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:17:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 082AD3C1C75
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:17:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2126A1A00982
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:17:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30DB6AFB7;
 Tue, 27 Aug 2019 10:16:46 +0000 (UTC)
Date: Tue, 27 Aug 2019 12:16:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190827101644.GA30582@rei>
References: <20190802115046.GB27727@rei>
 <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190827092520.GA28859@dell5510> <20190827095858.GB28859@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827095858.GB28859@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/statx04: use stx_attributes_mask
 before test
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
> also Cyril noted on Github issue #557 [1]:
> "However I'm not sure that we should do this since kernel devs declared this to be bug after all."
> 
> So maybe we should wait before applying it.
> 
> @Cyril: can you please post link to discussion in LKML?

I've talked to Jan Kara in person while developing these tests, so there
is no track of this discussion.

I guess that the best we can do here is to:

* Apply this patch, since the test should generally check only for flags
  that are supported in the bitflag returned by the syscall

* Add another test that checks that these bitflags are enabled for new
  enough kernels for certain set of filesystems

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
