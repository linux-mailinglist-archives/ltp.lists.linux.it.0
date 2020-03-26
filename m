Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A89AF193B3C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 09:45:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6474A3C4AD6
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 09:45:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E87D63C3364
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 09:45:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4C2641401239
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 09:45:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F750B16D
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 08:45:05 +0000 (UTC)
Date: Thu, 26 Mar 2020 09:45:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jozef Pupava <jpupava@suse.cz>
Message-ID: <20200326084504.GB29830@dell5510>
References: <20200324143839.3647c485@daedruan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324143839.3647c485@daedruan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Avoid zero or negative int results in
 calculations
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

Hi Jozef,

> Define BUF_SIZE smaller than BLOCKSIZE for possitive offset result

Reviewed-by: Petr Vorel <pvorel@suse.cz>

BTW it significantly prolongs the run, but IMHO ok.

Thanks for your fix.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
