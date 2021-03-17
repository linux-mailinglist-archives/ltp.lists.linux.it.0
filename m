Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A259A33EEE9
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:56:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A0663C2D5F
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:56:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A34613C2D08
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:56:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4F0B41A01227
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:56:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94C9DAC1F;
 Wed, 17 Mar 2021 10:56:07 +0000 (UTC)
Date: Wed, 17 Mar 2021 11:56:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>, ltp@lists.linux.it
Message-ID: <YFHgRpFpN9V0Mpxf@pevik>
References: <20210317040323.26899-1-zhaogongyi@huawei.com>
 <YFHLCI7WPPQ/zW+X@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFHLCI7WPPQ/zW+X@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: Unify the annotation style and remove
 Redundant code
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Gongyi,

> > Change 'Description' to 'DESCRIPTION' and change 'Algorithm' to
> > 'ALGORITHM' and remove Redundant tst_reap_children since tst_reap_children
> > has been called in the test skeleton.

> Actually the preferred form is Description (only first letter capitalized),
> see f5a269142 ("docparse: Unify Description and Algorithm titles").
> (Better would be to also update it in tests, which I haven't done).

> Thus I'd be for merging only removing tst_reap_children() (good catch).

Merged just part removing tst_reap_children().
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
