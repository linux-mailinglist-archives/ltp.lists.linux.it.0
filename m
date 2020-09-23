Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702C27540F
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:10:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 237D03C4D47
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 11:10:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E85263C29CE
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:10:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 808821000C1B
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 11:10:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA355AF33;
 Wed, 23 Sep 2020 09:10:45 +0000 (UTC)
Date: Wed, 23 Sep 2020 11:10:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200923091007.GA12109@dell5510>
References: <20200922144237.9865-1-pvorel@suse.cz>
 <CAEemH2coWxUma1Pm7E-MEz6xHx0V9NFyNcTEU57F3e_7gMBynA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2coWxUma1Pm7E-MEz6xHx0V9NFyNcTEU57F3e_7gMBynA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_test.sh: More readable syntax
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> On Tue, Sep 22, 2020 at 10:42 PM Petr Vorel <pvorel@suse.cz> wrote:

> > "for cmd; do" works the same way as "for cmd in $*; do", but the latter
> > is more readable. Also sync the code with tst_require_cmds().

> > Fixes: dba1d50cb ("tst_test.sh: Add test cmd helper tst_check_cmds()")

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>


> Reviewed-by: Li Wang <liwang@redhat.com>
Thanks for a review, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
