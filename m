Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2168838E66D
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 14:16:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF9773C2D09
	for <lists+linux-ltp@lfdr.de>; Mon, 24 May 2021 14:16:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A8F03C1E14
 for <ltp@lists.linux.it>; Mon, 24 May 2021 14:16:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 878391400206
 for <ltp@lists.linux.it>; Mon, 24 May 2021 14:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621858600;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3veRsslO++h4RVariAPvi4ce1nqLIqu3qsvSwvgB1Q=;
 b=b2mKqLPWrLfg06LKA3gjskJAqGuVLn4FQjQAUgowfTBi0DfSQQK4nbSkkhHz8+tdF6pA8g
 2Xyp7k8Wk5rOo1TGJb8S4eRq7+6cGCKUBszax+/6epYmKaCiYWBK/N8VX5SY/S8GUJH0u9
 d+D+ROAJkcjc5aYhqk927/iky3WRxkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621858600;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3veRsslO++h4RVariAPvi4ce1nqLIqu3qsvSwvgB1Q=;
 b=3MjtWdurxLGg1POESQtW0+AAQE+007rLYo9A1Rb8NA/jy9JMbX/CK22FypyKB6NpoX3REb
 LDXYZNhnOu1g3JDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2BF4ADCA;
 Mon, 24 May 2021 12:16:40 +0000 (UTC)
Date: Mon, 24 May 2021 14:16:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YKuZJ3slYUKhcmYg@pevik>
References: <20210513062341.83852-1-xieziyao@huawei.com>
 <YJzT2n0T12bPRdEG@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJzT2n0T12bPRdEG@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2 v2] Add SPDX in Makefile and use tabs instead
 of spaces
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

Hi Ziyao,

> > v1->v2:
> > 1. Fix errors in patch application;
> > 2. Add unrelated changes in replacing spaces with tabs into a separate patch.

> > Xie Ziyao (2):
> >   Makefile: Use SPDX in Makefile
> >   open_posix_testsuite/Makefile: Use tabs instead of spaces
> FYI although safe to merge, we postpone merging after the release.
> Thanks!

Merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
