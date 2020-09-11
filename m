Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52C265BC1
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 10:37:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A87C03C2BFA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 10:37:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C2B973C2BE5
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 10:37:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 66F921A01155
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 10:37:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39E39AE78;
 Fri, 11 Sep 2020 08:37:20 +0000 (UTC)
Date: Fri, 11 Sep 2020 10:37:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Chen Hanxiao <chen_han_xiao@126.com>
Message-ID: <20200911083703.GA697@dell5510>
References: <1599746191-2012-1-git-send-email-chen_han_xiao@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599746191-2012-1-git-send-email-chen_han_xiao@126.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ns-tools/set_ipv4addr: Use ip command as default
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

Hi Chen,

> Set iproute as the default as ifconfig
> has been deprecated on some of the distributions.

>  testcases/network/stress/ns-tools/set_ipv4addr | 40 +++++++++++++++++++++-----

Thanks for your patch. While I appreciate you work on LTP networking tests, I'm
against this change for a simple reason: everything which uses ns-tools needs to
be rewritten to use new LTP network shell API (tst_net.sh). Only very simple
fixes for really broken things like 4cf2f2bfd should be accepted.

Thus, please put your effort into rewriting these tests.
FYI Although it's a low priority for me I plan to work on these (I have wip at
least for rmmod). Feel free to join this effort.
See https://github.com/linux-test-project/ltp/issues/310

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
