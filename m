Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67089DADC7
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 15:04:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91F073C235A
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 15:04:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 03E593C2305
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 15:04:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A103E1400265
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 15:04:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B0C2B671;
 Thu, 17 Oct 2019 13:04:05 +0000 (UTC)
Date: Thu, 17 Oct 2019 15:04:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191017130401.GA21484@dell5510>
References: <20191011132433.24197-1-pvorel@suse.cz>
 <f5b4a42f-fb20-e085-1250-c0e2b171c01f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5b4a42f-fb20-e085-1250-c0e2b171c01f@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/8] net/route: rewrite route-change-{dst, gw,
 if} into new API
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

Hi Alexey,

> On 11.10.2019 16:24, Petr Vorel wrote:
> > Hi,

> > changes v4->v5:
> > addressed these Alexey's requests:
> > * tst_ipadd_un() now handles both host_id and net_id, with
> > -h MIN,MAX, -n MIN,MAX
> > (instead of -b, -f, -n which handled only host_id)

> > * add -q to tst_add_ipaddr() (silence test output)

> > * introduce EXPECT_{FAIL,PASS}_BRK() to shell API and use it to stop
> > test on first error.

> The patches look great, thanks Petr!
Finally merged :).
Thanks a lot for many patient reviews and suggestions.
I'll send another version of C netlink based tests.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
