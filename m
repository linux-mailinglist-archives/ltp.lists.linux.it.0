Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104E2E940D
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 12:24:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E3FE3C54C0
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 12:24:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0FE2D3C0788
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 12:24:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A430F1000740
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 12:24:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7A74B74F;
 Mon,  4 Jan 2021 11:24:19 +0000 (UTC)
Date: Mon, 4 Jan 2021 12:24:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 ltp@lists.linux.it
Message-ID: <X/L64TayQE8B+SZ+@pevik>
References: <20201211172047.26640-1-kory.maincent@bootlin.com>
 <X/LkQDXDehooa9wu@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/LkQDXDehooa9wu@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] containers/netns: update netns shell test to new
 API
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

Hi Kory,

> Before merge I'll drop bogus '# TEST CASE #N' and add few TINFO messages, e.g.:
> tst_res TINFO "controlling device over netlink"
Thanks for your work, merged.
In the end without tst_res TINFO messages and added one cleanup commit.

I'm going to send a patch to ML which fixes tst_check_iproute check for recent
iproute2, which uses since v5.8.0 (actually since v5.7.0-77-gb687d1067169)
kernel version.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
