Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B7265C89
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 11:33:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94A5C3C2C45
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 11:33:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 32A043C2BF1
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 11:33:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CC8E31000DF2
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 11:33:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99578B159;
 Fri, 11 Sep 2020 09:33:47 +0000 (UTC)
Date: Fri, 11 Sep 2020 11:33:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200911093329.GA7459@dell5510>
References: <20200911065124.18992-1-pvorel@suse.cz>
 <CAOQ4uxjUj35ePAzQuEO6BrTskrrp0TLX-tnV7L4Opcda0Mm8gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjUj35ePAzQuEO6BrTskrrp0TLX-tnV7L4Opcda0Mm8gg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] fanotify10: Skip non zero ignored_onchild
 tests for < v5.9
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

Hi Amir,

> On Fri, Sep 11, 2020 at 9:51 AM Petr Vorel <pvorel@suse.cz> wrote:

> > ignored mask in combination with flag FAN_EVENT_ON_CHILD has
> > undefined behavior on kernel < 5.9.

> > Also remove wrong kernel commit (left in e8189ff3c).

> > Acked-by: Jan Kara <jack@suse.cz>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Thanks!

...
> > - * Test cases #17-#23 are regression tests for commit:
> > + * Test cases #17-#23 are regression tests for commit (from v5.9, unlikely to be
> > + * backported thus not in .tags):

> If we are being accurate, it is only the 4 test cases with non zero
> ignored_onchild
> that are regression tests for this commit. The other 3 test cases are
> just completing
> the test matrix of possible combinations of marks.

> So you may rephrase above as "Test cases with 'ignored_onchild'..."
> or what not.
Good point, I'll fix it before merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
