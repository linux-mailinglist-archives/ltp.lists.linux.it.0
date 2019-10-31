Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1414EB22E
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 15:10:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A0573C233F
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 15:10:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 80C893C1815
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 15:10:36 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2AD1410011B3
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 15:10:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C3C8ABCD;
 Thu, 31 Oct 2019 14:10:35 +0000 (UTC)
Date: Thu, 31 Oct 2019 15:10:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Kara <jack@suse.cz>
Message-ID: <20191031141032.GB6011@dell5510>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1571821231-3846-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191024082525.GK31271@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024082525.GK31271@quack2.suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/6] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
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

Hi Jan,

> On Wed 23-10-19 17:00:28, Yang Xu wrote:
> > Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
> > same as Q_GETQUOTA, but it returns quota information for the next ID
> > greater than or equal to id that has a quota set.

> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

> I was thinking about how much these tests are actually needed. The thing is
> that fstests have also quota tests. And as part of these tests we do run
> e.g. repquota(8) and verify its output and that uses Q_GETNEXTQUOTA inside.
> So Q_GETNEXTQUOTA gets testing as part of fstests. On the other hand
> fstests are focused on testing the general quota functionality as user
> would use it so we don't really try to make sure all quotactl calls are
> covered. So there's still some value in low level testing of each
> quotactl like you do here.

Agree that testing quotactl as syscall in LTP makes sense (unlike testing
filesystem features or performance, that was the reason why we deleted "New
ext4 features" tests).

Thank you for the review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
