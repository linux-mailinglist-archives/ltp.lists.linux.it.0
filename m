Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D0EB108
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 14:18:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D77143C2348
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 14:18:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 055FE3C2297
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 14:18:08 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7E3CD14011AF
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 14:18:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF383B61F;
 Thu, 31 Oct 2019 13:18:06 +0000 (UTC)
Date: Thu, 31 Oct 2019 14:18:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>, Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191031131803.GB28424@dell5510>
References: <20191009062300.50219-1-lkml@jv-coder.de>
 <20191029143525.GA4187@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029143525.GA4187@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_net.sh: Allow execution if xfrm is disabled
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

Hi Joerg,

> > From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

> > If the kernel is configured without xfrm support, the setup of the
> > interfaces for communication between local and remote host fails,
> > because it tries to flush xfrm state and policy.
> > There is no need to flush, if the system doesn't even support xfrm.

> > Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
