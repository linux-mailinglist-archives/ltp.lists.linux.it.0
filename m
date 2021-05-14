Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D43807FC
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 13:03:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A51CF3C63D7
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 13:03:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 463E43C28FB
 for <ltp@lists.linux.it>; Fri, 14 May 2021 13:03:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A30FC1A00695
 for <ltp@lists.linux.it>; Fri, 14 May 2021 13:03:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5696AF11
 for <ltp@lists.linux.it>; Fri, 14 May 2021 11:03:00 +0000 (UTC)
Date: Fri, 14 May 2021 13:02:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <YJ5Y4x4muY18L6QO@pevik>
References: <20210512165702.22883-1-pvorel@suse.cz> <YJ4p7636z0iYSsy0@yuki>
 <YJ4/d4pTsWNRYX02@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ4/d4pTsWNRYX02@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] build.sh: Support passing configure options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > Hi!
> > Looks good, but is it even used for the second patch? We just pass extra
> > options there, right?
> Yes, CONFIGURE_OPT_EXTRA. I added also CONFIGURE_OPT to allow local build.sh
> without realtime and openposix: 
> $ CONFIGURE_OPT= ./build.sh

> I document it in the commit.

Whole patchset merged.
In the end I really added only CONFIGURE_OPT_EXTRA.

to allow CONFIGURE_OPT be empty it would have to be added as:
CONFIGURE_OPTS_OUT_TREE=${CONFIGURE_OPT: --with-realtime-testsuite ...}"
i.e. remove -, but that would again require to always define CONFIGURE_OPT.
=> postpone it for now.

Kind regards,
Petr

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
