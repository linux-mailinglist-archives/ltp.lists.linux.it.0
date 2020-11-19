Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2692B9BBC
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 20:56:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 584763C6429
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 20:56:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 420AF3C4EE6
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 20:56:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CB4811A0044E
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 20:56:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFD71AC24;
 Thu, 19 Nov 2020 19:56:19 +0000 (UTC)
Date: Thu, 19 Nov 2020 20:56:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201119195618.GA3181@pevik>
References: <20201112173609.4123-1-petr.vorel@suse.com>
 <20201119152300.05ef03b0@kmaincent-XPS-13-7390>
 <20201119154132.GA16438@pevik>
 <cf76949d-32a7-7b2d-4d5b-6117676ecea6@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf76949d-32a7-7b2d-4d5b-6117676ecea6@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/traceroute01: Check also -T flag
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
Cc: ltp@lists.linux.it, Petr Vorel <petr.vorel@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> On 19.11.2020 18:41, Petr Vorel wrote:
> > Hi Kory, Alexey,

> >> Hello Petr,

> >> Just find out you didn't merge your patch which makes the code cleaner. :)
> > Waiting for Alexey's review.
> > Also hesitate about tracepath6 symlink to traceroute being always installed
I meant here traceroute6 symlink to traceroute.
> > on all distros (hopefully yes).

> Hi Petr,

> From the subject it seems you are adding a new check for -T flag
> but it is actually for -I option?
Good catch, thanks!

> I think it's ok using symlink or -4/-6,
If nobody complains I'd keep symlink version as it can check
traceroute from iputils. -4/-6 is more portable. If anybody complains and we
revert it back, I'd also put back iputils related warning.

> it is also adding an extra
> check for ipv6 that $(tst_ipaddr rhost) is indeed ipv6.
Sorry, I didn't get this.

BTW ack this change?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
