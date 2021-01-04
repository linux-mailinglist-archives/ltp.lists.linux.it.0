Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3222E92CA
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 10:47:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0BE73C3203
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 10:47:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A15513C2DBC
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 10:47:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 696C41400B81
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 10:47:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99077ACBA;
 Mon,  4 Jan 2021 09:47:45 +0000 (UTC)
Date: Mon, 4 Jan 2021 10:47:44 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <X/LkQDXDehooa9wu@pevik>
References: <20201211172047.26640-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211172047.26640-1-kory.maincent@bootlin.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory,

> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  .../kernel/containers/netns/netns_breakns.sh  |  60 ++++-----
>  .../kernel/containers/netns/netns_comm.sh     |  95 ++++++--------
>  .../kernel/containers/netns/netns_helper.sh   |  69 +++++-----
>  .../kernel/containers/netns/netns_sysfs.sh    | 118 +++++++-----------
>  4 files changed, 140 insertions(+), 202 deletions(-)

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Generally looks good to me.

Before merge I'll drop bogus '# TEST CASE #N' and add few TINFO messages, e.g.:
tst_res TINFO "controlling device over netlink"

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
