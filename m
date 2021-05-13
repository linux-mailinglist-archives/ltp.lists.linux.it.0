Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C26DD37FB27
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 18:00:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 913203C6421
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 18:00:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB4533C3359
 for <ltp@lists.linux.it>; Thu, 13 May 2021 18:00:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2294F201083
 for <ltp@lists.linux.it>; Thu, 13 May 2021 18:00:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E024AEFE
 for <ltp@lists.linux.it>; Thu, 13 May 2021 16:00:34 +0000 (UTC)
Date: Thu, 13 May 2021 18:00:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJ1NICB0Y9gdnpQw@pevik>
References: <20210513134941.27656-1-mdoucha@suse.cz>
 <YJ0uo6YRyTsaNj0f@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ0uo6YRyTsaNj0f@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Skip tmpfs in all-filesystem shell tests
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

Hi Martin, Cyril

> Hi!
> > All-filesystem shell tests like LVM currently don't support tmpfs. Remove it
> > from tst_supported_fs helper output for now.

> git grep shows that we use that in zram01.sh and *_lvm.sh scripts, in
> both cases tmpfs does not make any sense...

> Looks good for the release:

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Good point, thanks! I also think it's good for a release. But in the future I'd
like to take single NFS test and run it in all filesystems. Currently there is
ongoing work to fix tmpfs on NFS. So we might need to move this skip in the
future to respected tests (zram01.sh and *_lvm.sh). And for that we will have
to implement skip filesystem for shell (or just skip it "manually").

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
