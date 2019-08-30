Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C865A3543
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 12:55:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 236683C201E
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 12:55:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8B12C3C2014
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 12:55:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D8D141A05C8E
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 12:55:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A144AB89;
 Fri, 30 Aug 2019 10:55:01 +0000 (UTC)
Date: Fri, 30 Aug 2019 12:54:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20190830105459.GB9330@dell5510>
References: <1566987255-3010-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1566987255-3010-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190829204149.GB5711@dell5510> <5D687F5A.80002@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D687F5A.80002@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] runtest/numa: add migrate_pages*
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

Hi Yang,

> On 2019/08/30 4:41, Petr Vorel wrote:
> > Hi Xu,

> > > Since migrate_pages must depend on numa, add it into
> > > runtest/numa.
> > > Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> > Thanks for the patch, merged.
> Hi Petr,

> Why don't sort numa tests alphabetically as my replied?
I'm sorry. I overlooked it as you put your commend to 1st commit
(this is a second commit). Feel free to fix it or I'll do it later today.

BTW I suggest also sort alphabetically Numa-testcases numa01.sh
and rename it to numa_testcases numa01.sh

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
