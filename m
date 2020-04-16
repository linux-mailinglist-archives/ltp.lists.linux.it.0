Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A86231AC3AE
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 15:47:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 798C03C6475
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 15:47:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 967F23C2AF5
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 15:47:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 175C5600967
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 15:47:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A0F9EAC85
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 13:47:03 +0000 (UTC)
Date: Thu, 16 Apr 2020 15:47:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200416134722.GB15339@yuki.lan>
References: <20200416122023.20952-1-mdoucha@suse.cz>
 <20200416133020.GA15339@yuki.lan>
 <1ed0003e-126f-5c3d-0fdf-9e41ea9ff1eb@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ed0003e-126f-5c3d-0fdf-9e41ea9ff1eb@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for CVE 2018-9568
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Also looking at spdx.org GPL-2.0 is not valid and it should be
> > GPL-2.0-only.
> 
> I guess we should also ask Andrew Lutomirsky which licence to use in
> ptrace08 then.

Older documentation seems to refer to it as GPL-2.0, as well as '+' was
replaced with '-or-later' so I guess that they changed the identifier to
GPL-2.0-only. And we do have a few GPL-2.0 so these should be replaced
with GPL-2.0-only.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
