Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E037F63A
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 13:02:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EC4A3C6428
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 13:02:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2034A3C0052
 for <ltp@lists.linux.it>; Thu, 13 May 2021 13:02:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A03C8140123B
 for <ltp@lists.linux.it>; Thu, 13 May 2021 13:02:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F01A7AF3B;
 Thu, 13 May 2021 11:02:20 +0000 (UTC)
Date: Thu, 13 May 2021 13:02:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJ0HO1xaM2x+o9cW@pevik>
References: <YJOYgZNL7/qp5YCN@yuki> <YJpq26w8NBvBzUSc@yuki>
 <YJz4A3mR3jHciihe@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJz4A3mR3jHciihe@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] LTP pre-release git freeze and call
 for testing
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> As previously planned LTP git is now frozen for anything but imporatnt
> fixes and the (ideally) week of pre-release testing starts now.
As release fixes, I'd like to merge these netlink detection support fixes for
old kernels and fix and tonight send also add lapi/if_addr.h with IFA_FLAGS
(to fix compilation on some old kernels).

Last thing which I'd like is to state which version we support in this release
(as document to doc/ and wiki). After release we can discuss which support we
can drop.

Kind regards,
Petr

> If you haven't tested latest LTP git please do so now.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
