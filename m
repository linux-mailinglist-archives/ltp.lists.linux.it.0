Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5B37670B
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:31:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BC963C565F
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:31:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D55063C1C5B
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:31:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 290E310013B3
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:31:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 669ACB1B1;
 Fri,  7 May 2021 14:31:29 +0000 (UTC)
Date: Fri, 7 May 2021 16:31:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <YJVPP64LuDK7O564@pevik>
References: <YJOYgZNL7/qp5YCN@yuki>
 <YJPo4L0QnXHU7xks@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJPo4L0QnXHU7xks@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi Cyril,

> also solving Shell API timeout sleep orphan processes would be good [1]
> There is already C patch [2] + Li suggested to fix the shell implementation
> using trap in subshell [3].
OK there is shell implementation to fix orphan processes [4] from Joerg, which
would be worth do fix it, Li already did a review, I'll look into it today.

I'd like to rebase and send to ML IMA dm-crypt test for testing. If Mimi, Tushar
or Lakshmi find time to test it, I'd like to have it in the release.

I try to have a look on few cleanup patches today from Martin [6], Xie and Zhao.

Kind regards,
Petr

> Kind regards,
> Petr

> [1] https://lists.linux.it/pipermail/ltp/2021-May/022350.html
> [2] https://patchwork.ozlabs.org/project/ltp/list/?series=242439
> [3] https://lists.linux.it/pipermail/ltp/2021-May/022453.html
[4] https://patchwork.ozlabs.org/project/ltp/list/?series=242665
[5] https://patchwork.ozlabs.org/project/ltp/list/?series=230766
[6] https://patchwork.ozlabs.org/project/ltp/patch/20210505153847.6106-2-mdoucha@suse.cz/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
