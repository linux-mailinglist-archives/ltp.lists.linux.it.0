Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 846A378B61
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:09:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 379613C1D21
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:09:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CCD0E3C185F
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:09:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 254251A006BE
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:09:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F085AE5C
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 12:09:32 +0000 (UTC)
Date: Mon, 29 Jul 2019 14:09:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190729120932.GA5872@dell5510>
References: <20190723070817.637-1-camann@suse.com>
 <20190723070817.637-3-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723070817.637-3-camann@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/3] timers/leapsec_timer: Ported to new library
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

> Ported the test to the new library

> Signed-off-by: Christian Amann <camann@suse.com>

> Notes:
>     The leapsec timer is still a mess, even after porting it.
>     Cleaning it up would probably be its own patch as the best
>     solution would be to rewrite it from scratch

Rebased and reposted
https://patchwork.ozlabs.org/patch/1138328/

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
