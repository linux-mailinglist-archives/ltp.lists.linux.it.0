Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DBFB1BA6
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 12:41:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A8A43C207B
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 12:41:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0F0FE3C1C9A
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 12:41:46 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0DA761401159
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 12:41:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1EBEFAFCD;
 Fri, 13 Sep 2019 10:41:44 +0000 (UTC)
Date: Fri, 13 Sep 2019 12:41:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20190913104142.GA598@dell5510>
References: <20190912201318.30931-1-pvorel@suse.cz>
 <20190912201318.30931-4-pvorel@suse.cz>
 <1568368812.3306.7.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568368812.3306.7.camel@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] net/if-mtu-change.sh: set LTP_TIMEOUT
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

Hi Clements,

> > +LTP_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))

>    ^
>    TST_TIMEOUT

> At least I would go with TST_ instead of LTP_ as the prefix TST_ means
> for me Libray and LTP_ user. This apply to some other places of this
> patchset.
Good point. Metan, do we want TST_TIMEOUT for library and LTP_TIMEOUT_MUL for
user? That's a bit strange, but I'd be for it.
LTP_* is for user to define (that's actually not true for tst_net.sh)
and TST_* for test definitions in script.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
