Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2139A06D
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:57:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE59F3C5419
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:57:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EB4E3C183E
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 13:57:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6695914010EF
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 13:57:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BFBF91FD4D;
 Thu,  3 Jun 2021 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622721439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5DFbgbCSfuRr/J2vnxll5XSDjwPR9ER/J8GQdZyLojY=;
 b=e6lp7DnmHzNjV1SeT3+l2XLjlZoprU8IBoT/4t6zovPknENsSFFkEBTkDSL2lBddHrLnFx
 LTjuTU+LQq4c8FepZiPHhQotZDUvPFILIQUTGLBWmKl9lkmS+dnc6DGAh8unwkJo5bATru
 RE1jjN+HIF2+MjAt5LOrTLm6rPUUnfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622721439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5DFbgbCSfuRr/J2vnxll5XSDjwPR9ER/J8GQdZyLojY=;
 b=BtV5qjHhMquB71wMwmgRodP0idnVNDnBJyNelsMEI0/ZHLMXTMz+5TWvMDEdlopQl3G2DZ
 JMRACg2M1s6UDUCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7B770118DD;
 Thu,  3 Jun 2021 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622721439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5DFbgbCSfuRr/J2vnxll5XSDjwPR9ER/J8GQdZyLojY=;
 b=e6lp7DnmHzNjV1SeT3+l2XLjlZoprU8IBoT/4t6zovPknENsSFFkEBTkDSL2lBddHrLnFx
 LTjuTU+LQq4c8FepZiPHhQotZDUvPFILIQUTGLBWmKl9lkmS+dnc6DGAh8unwkJo5bATru
 RE1jjN+HIF2+MjAt5LOrTLm6rPUUnfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622721439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5DFbgbCSfuRr/J2vnxll5XSDjwPR9ER/J8GQdZyLojY=;
 b=BtV5qjHhMquB71wMwmgRodP0idnVNDnBJyNelsMEI0/ZHLMXTMz+5TWvMDEdlopQl3G2DZ
 JMRACg2M1s6UDUCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id BdKRHJ/DuGBGCAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 03 Jun 2021 11:57:19 +0000
Date: Thu, 3 Jun 2021 13:57:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLjDnXeWib2KSILF@pevik>
References: <YLeA8KOphpVg3IDP@pevik>
 <YLi3XqA3hLh7HWqn@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLi3XqA3hLh7HWqn@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Reduce LICENCE/COPYING files
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > I suppose it's safe to keep only single licence in testcases/open_posix_testsuite/,
> > but could we keep only COPYING in the root directory and delete the rest?
> > Or keep COPYING and testcases/open_posix_testsuite/COPYING only?

> Do we even need these files? Isn't SPDX identifier enough these days?
It be nice we don't need it, but not sure. Looking into kernel tree, there is
LICENSES folder [1] and they describe how they use SPDX [2]:

Valid-License-Identifier: GPL-2.0
Valid-License-Identifier: GPL-2.0-only
Valid-License-Identifier: GPL-2.0+
Valid-License-Identifier: GPL-2.0-or-later
SPDX-URL: https://spdx.org/licenses/GPL-2.0.html
Usage-Guide:
  To use this license in source code, put one of the following SPDX
  tag/value pairs into a comment according to the placement
  guidelines in the licensing rules documentation.
  For 'GNU General Public License (GPL) version 2 only' use:
    SPDX-License-Identifier: GPL-2.0
  or
    SPDX-License-Identifier: GPL-2.0-only
  For 'GNU General Public License (GPL) version 2 or any later version' use:
    SPDX-License-Identifier: GPL-2.0+
  or
    SPDX-License-Identifier: GPL-2.0-or-later
License-Text:

		    GNU GENERAL PUBLIC LICENSE
		       Version 2, June 1991
...

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred/GPL-2.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
