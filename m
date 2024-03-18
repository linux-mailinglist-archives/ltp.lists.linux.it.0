Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2004387E52A
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Mar 2024 09:48:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E40F63CE6B1
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Mar 2024 09:48:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 418773CC8BF
 for <ltp@lists.linux.it>; Mon, 18 Mar 2024 09:47:57 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=brauner@kernel.org;
 receiver=lists.linux.it)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9F283600D43
 for <ltp@lists.linux.it>; Mon, 18 Mar 2024 09:47:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 13425CE09CB;
 Mon, 18 Mar 2024 08:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5EFC43390;
 Mon, 18 Mar 2024 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710751670;
 bh=Ew2uVxn7vsJK/JFcU9zZaMqRiK9DDlzk08Afo0ps6tI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EzivUTTJsOVwzxrrjAi8avkIKYnbjeM4XRGeAWhECQodhvZC8kmFJWqaTzdz0pxWC
 P+u23knAXSnKZzwSijQvwcTp1Y6yj9Th6qF11ie0hubBxxB/lbWkBb8wG8INhF5gNt
 SD/6DmhfAK68FbBlHwoFcGYdsPbAjZTJXaQyWLRyUrU+DDiNfEIrK2L+dTACporQO1
 s0fBVumxqULEsAVUSP5Pg1kqLtxW7KR2VmNF4ZEemUk1fWUFSssa5XNq/GleRsKDdw
 aKUJD8WTFNE0x9UTeLrBts8E4bqGm+jegR21ZVPowPivX1mVBWpcVQmkp0orvcL5Oa
 eTYI7PqVNFLMw==
Date: Mon, 18 Mar 2024 09:47:45 +0100
From: Christian Brauner <brauner@kernel.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20240318-fegen-bezaubern-57b0a9c6f78b@brauner>
References: <202403151507.5540b773-oliver.sang@intel.com>
 <20240315-neufahrzeuge-kennt-317f2a903605@brauner>
 <ZfRf36u7CH7bIEZ7@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZfRf36u7CH7bIEZ7@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [linus:master] [pidfd]  cb12fd8e0d: ltp.readahead01.fail
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Mar 15, 2024 at 03:49:03PM +0100, Cyril Hrubis wrote:
> Hi!
> > So I'd just remove that test. It's meaningless for pseudo fses.
> 
> Wouldn't it make more sense to actually return EINVAL instead of
> ignoring the request if readahead() is not implemented?

It would change the return value for a whole bunch of stuff. I'm not
sure that wouldn't cause regressions but is in any case a question for
the readahead maintainers. For now I'd just remove that test for pidfds
imho.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
