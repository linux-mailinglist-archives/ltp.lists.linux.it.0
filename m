Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F0373945
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 13:24:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E17003C5782
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 13:24:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 30FDB3C5707
 for <ltp@lists.linux.it>; Wed,  5 May 2021 13:24:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7C255600D31
 for <ltp@lists.linux.it>; Wed,  5 May 2021 13:24:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D57A6B265
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:24:50 +0000 (UTC)
Date: Wed, 5 May 2021 13:24:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YJKAgdpuAsRVmSse@pevik>
References: <20210505081845.7024-1-mdoucha@suse.cz>
 <20210505081845.7024-4-mdoucha@suse.cz> <YJJwr+RdyOvKhrxs@pevik>
 <aa553d92-661d-d792-2d10-c654a4edbc35@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa553d92-661d-d792-2d10-c654a4edbc35@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/6] Add rtnetlink helper library
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

> On 05. 05. 21 12:17, Petr Vorel wrote:
> > Hi Martin,

> > it'd be great if you (later) add docs from v1 cover letter [1] into
> > doc/test-writing-guidelines.txt.

> > [1] https://patchwork.ozlabs.org/project/ltp/cover/20210426111918.4304-1-mdoucha@suse.cz/

> I think we should discuss the documentation structure first.
> test-writing-guidelines.txt is already too long and unreadable.
Agree. I was thinking this week to at least split C and shell API, that would
help a bit.

> We should probably split it by topic and put the network management docs
> into a separate file from the outset since I'm planning to build an
> entire packetdrill-like userspace TCP stack on top of it in the future.
Thanks a lot!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
