Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D00631EF45D
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:37:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76A283C2F8D
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:37:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F36853C1D55
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:37:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1706D6170B4
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:37:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DCD00AD4A;
 Fri,  5 Jun 2020 09:37:51 +0000 (UTC)
Date: Fri, 5 Jun 2020 11:37:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200605093746.GA23001@dell5510>
References: <20200528111504.12638-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528111504.12638-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_taint.h Add taint for randstruct
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

Hi,

> +++ b/include/tst_taint.h
> @@ -60,7 +60,8 @@
#define TST_TAINT_G     (1 <<  0) /* a module with non-GPL license loaded */

one more note. I'd rename TST_TAINT_G to TST_TAINT_P, it's misleading, we use it
to use it for 'P' (proprietary module loaded).

Also we use taint_flag.c_true, not taint_flag.c_false:
[ TAINT_PROPRIETARY_MODULE ]    = { 'P', 'G', true },

But this flag hasn't been used, it might be always as placeholder (never
actually needed).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
