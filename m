Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F27D3B5C
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:40:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BA703C14BB
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:40:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 78D803C0794
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:40:01 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C990C602276
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:40:00 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4E25C9F66F;
 Fri, 11 Oct 2019 08:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570783199; bh=wHQxQk/KHkIHzChJ0qVx/yMWNDU2R2WzdtUw7fFSP+E=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=VWE8rrcQlBWaAB1TVH5yP06Q4Y5rjZYRIonGkjdEdOMBoe2c0EIZVs77RmRfLzFsz
 rXo4WpB+l3rNyMyF2ipMJKzLpF7I81cDSBEJ9Mol9yGKySuoOT7ea8IAyGyforz36H
 Sbef6V0V8YC6tWG7gAKUHY8mXN2a8cmuVxAfYQP8=
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-3-lkml@jv-coder.de> <20191009113919.GB7561@rei.lan>
 <64bb824c-d577-86e5-bfa5-17a8cfbf4174@jv-coder.de>
 <20191009114854.GC7561@rei.lan>
 <22bc4865-295c-3147-8e26-f258fac472f8@jv-coder.de>
 <20191009122802.GB7677@rei.lan> <20191011083612.GA1315@dell5510>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <378952ff-60a0-ebc4-da31-528d379a74b1@jv-coder.de>
Date: Fri, 11 Oct 2019 10:39:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191011083612.GA1315@dell5510>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Add public tst_test_root command
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


>> @Jan @Peter what do you think?
> We already did rename once (0567a8958 shell: Rename
> s/tst_check_cmds/tst_test_cmds/), but even if we didn't;
> I'm for renaming tst_test_* to tst_require_* - clear names are important
> (consistency with names as well).
That's two (and me) in favor of renaming tst_test_.
I will submit a patch for it.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
