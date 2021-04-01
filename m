Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86A351002
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 09:22:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 091873C22CF
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 09:22:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1D2F93C2233
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 09:22:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5CD6C200DC8
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 09:22:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AFDDB0B7;
 Thu,  1 Apr 2021 07:22:27 +0000 (UTC)
Date: Thu, 1 Apr 2021 09:22:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YGV0sj+X+3AICZiY@pevik>
References: <20210315130349.1155389-1-lkml@jv-coder.de>
 <YGIiE5/DnjXrcHzK@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGIiE5/DnjXrcHzK@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto_user02: Find a valid template
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
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg, Eric,

Implemented all Eric's suggestions and merged.
Thank you both!

> > +	if (!template) {
> > +		tst_brk(TCONF, "No viable template found");
> > +	}

> Single-line statements shouldn't have braces like this.
Oops, left this one, fixed in separated commit :(.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
