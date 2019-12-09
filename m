Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C71177F6
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 22:07:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6653C3C2349
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 22:07:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 17B7B3C2095
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 22:07:02 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CB5B51401B97
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 22:07:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16C08ABD0;
 Mon,  9 Dec 2019 21:07:01 +0000 (UTC)
Date: Mon, 9 Dec 2019 22:06:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191209210659.GA3820@dell5510>
References: <20191202101943.17335-1-ice_yangxiao@163.com>
 <7b7c1e8a-1db1-bf9f-96ff-01803416120e@suse.cz>
 <31fe4c0c-863e-4ba6-d8d7-1af909013fb7@163.com>
 <8f5e7d2a-34a8-5d2a-658c-a1f535fd1cc7@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f5e7d2a-34a8-5d2a-658c-a1f535fd1cc7@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuhotplug05.sh: Rewrite test case
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

Hi,

> On 12/9/19 4:13 AM, Xiao Yang wrote:
> >> Your new scenario has two problems:

> >> - You have to run at least two test loops to verify that reactivating a
> >> CPU doesn't break /proc/stat entries.

> > I think running cpuhotplug05.sh with -i 2 can verfiy this point.

> > Perhaps we can add -i option to runtest/cpuhotplug, or do you prefer to
> > keep the original scenario?

> I'd prefer keeping the original scenario (with your version of cleanup).
> Running extra iterations of the same test should not be required to get
> the full intended test coverage.
Agree with Martin. Yang, could you, please, send new version, where you keep it?


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
