Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27737A869
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 16:05:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01E523C8BFF
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 16:05:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EE3A3C1A7D
 for <ltp@lists.linux.it>; Tue, 11 May 2021 16:05:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 25A05140110D
 for <ltp@lists.linux.it>; Tue, 11 May 2021 16:05:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8000BB1BE
 for <ltp@lists.linux.it>; Tue, 11 May 2021 14:05:03 +0000 (UTC)
Date: Tue, 11 May 2021 16:05:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJqPDb5WGhNTtLfB@pevik>
References: <20210511125606.20425-1-pvorel@suse.cz>
 <YJp9/JHow8g5Xt/K@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJp9/JHow8g5Xt/K@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/1] netns_netlink: Rewrite into new API
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

Hi Cyril,

> Hi!
> Looks good: Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Thanks!

> Also this is a bugfix for new iproute, right? If so this should get in
> before the release.
Yes, thus pushed.

> And we should probably make use of the netlink library from Martin later
> on, but that can wait after the release.
+1, put into my TODO list.

Also how about keeping libmnl vs. using Martin's library for
route-change-netlink.c? Which one is better to use?
(already asked in [1]: it'd be nice to get rid of libmnl dependency,
but on the other hand using it means also testing it).

Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2021-May/022529.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
