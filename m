Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC890BB821
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 17:39:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9EFC53C2015
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 17:39:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 82C703C1C7E
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 17:39:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7D78B6005E9
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 17:39:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66FE5AD72;
 Mon, 23 Sep 2019 15:39:11 +0000 (UTC)
Date: Mon, 23 Sep 2019 17:39:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20190923153908.GA379@dell5510>
References: <20190923003846.GB15734@shao2-debian>
 <871rw7l9dv.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871rw7l9dv.fsf@rpws.prws.suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 12abeb544d: ltp.read_all_dev.fail
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
Cc: Andy Lutomirski <luto@amacapital.net>, lkp@01.org,
 Andy Lutomirski <luto@kernel.org>, ltp@lists.linux.it,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > FYI, we noticed the following commit (built with gcc-7):

> > commit: 12abeb544d548f55f56323fc6e5e6c0fb74f58e1 ("horrible test hack")
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/luto/linux.git random/kill-it

...
> > tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
> > Test timeouted, sending SIGKILL!
> > tst_test.c:1148: INFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> > tst_test.c:1149: BROK: Test killed! (timeout?)

> So perhaps this is caused by reads of /dev/random hanging?

> At any rate,
> I suppose this is intended to deliberately break something, so we can
> ignore it.
Yep, I'd ignore it, [1] really looks like the commit description "horrible test hack" :)

Kind regards,
Petr

[1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/luto/linux.git/+/12abeb544d548f55f56323fc6e5e6c0fb74f58e1%5E%21/#F0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
