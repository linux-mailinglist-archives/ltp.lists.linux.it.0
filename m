Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B72FD3E1
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 16:27:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C47553C6960
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 16:27:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 736C73C269C
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 16:27:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E0366600C2F
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 16:27:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE265AB7F;
 Wed, 20 Jan 2021 15:27:07 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:28:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YAhMCz4j9Q2ltGcJ@yuki.lan>
References: <20210119160316.4776-1-pvorel@suse.cz>
 <20210119160316.4776-2-pvorel@suse.cz> <YAg6wTVc6AB28smR@yuki.lan>
 <YAhKe84FcrNEYFcC@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAhKe84FcrNEYFcC@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> modules.dep has format:
> module:[dependency [another-dependency ...]]
> 
> e.g.:
> kernel/arch/x86/kernel/cpu/mce/mce-inject.ko.xz:
> kernel/arch/x86/crypto/twofish-x86_64.ko.xz: kernel/crypto/twofish_common.ko.xz
> kernel/arch/x86/crypto/aesni-intel.ko.xz: kernel/crypto/crypto_simd.ko.xz kernel/crypto/cryptd.ko.xz kernel/arch/x86/crypto/glue_helper.ko.xz
> 
> First reading "%s" reads only first module with ':' separator.
> Searching without it could find first module which is as dependency (e.g.
> "/twofish_common.ko.xz" instead of "/twofish-x86_64.ko.xz"). Although that
> shouldn't be a problem, because it's very unlikely that module dependency is
> missing. Do you want me to drop sscanf() or put some comment?

Well it would be probably cleaner to do something as:

	/* Cut dependencies after : */
	if ((sep = strchr(buf, ':')))
		*sep = 0;

No need to copy the string just because we neet to cut part of it.

> Also man modules.dep(5) warns about using text format as "their format is
> subject to change in the future". Hopefully we can depend on it. Or should we
> use binary format?

That depends on how complicated is to parse the binary format...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
