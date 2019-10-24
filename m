Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C4E3245
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 14:26:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8C503C236D
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 14:26:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 59DF83C235A
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 14:26:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BF97460218E
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 14:26:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E1B6B28F
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 12:26:11 +0000 (UTC)
Date: Thu, 24 Oct 2019 14:26:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191024122610.GA7865@dell5510>
References: <20191024090753.16789-1-pvorel@suse.cz>
 <20191024110502.GA27782@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024110502.GA27782@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] Delete New ext4 features tests and ffsb tool
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
> > The main reason is that these tests [1] (contributed in 2009)
> > are mostly outdated and irrelevant. According to Theodore Y. Tso [2]
> > and Jan Kara [3] the only partly valid tests are
> > ext4_nsec_timestamps_test.sh and ext4_subdir_limit_test.sh,
> > but even these would be better to migrate to xfstests,
> > which Yong Sun is planning to do.

> > Also, some of the tests weren't in any runtest file anyway
> > (ext4-alloc-test.sh, ext4_inode_version_test.sh,
> > ext4_journal_checksum.sh, ext4_online_defrag_test.sh)

> > ffsb tool was used only in these New ext4 features tests.

> > [1] http://ext4.wiki.kernel.org/index.php/New_ext4_features
> > [2] https://marc.info/?l=linux-fsdevel&m=157187153211649&w=2
> > [3] https://marc.info/?l=linux-ext4&m=157190318618555&w=2

> > Closes: #560

> Acked.

> The ffsb adds quite a bit of complexity to the LTP build with a very
> little added value. As far as the meaningful parts of the ext4 suite
> would be migrated to xfstests everyone should be happy about this.
Thanks for ack, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
