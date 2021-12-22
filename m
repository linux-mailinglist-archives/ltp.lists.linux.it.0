Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F206147D449
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 16:34:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A139D3C9264
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 16:34:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 223DD3C2BA4
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 16:33:59 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BD1D560063D
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 16:33:58 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93FF9B81D16;
 Wed, 22 Dec 2021 15:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6333C36AE8;
 Wed, 22 Dec 2021 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640187236;
 bh=PmIDdS4IybuygmCjt0en1LveCUWmmqBJ/vB3gTgpAB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gho7k+2tkTwtD4p/dGCpsSYKTTCRBF7WwqWi5PmmzPDyjR5/xLe83w4EuvC/n9dYt
 JdmQhGfR4042vEQcowtO8OedVZCsqaN1K0g5nXTzJ9flj2f2DymSIbOY3kLF7GDYoJ
 +YlnwWpvjfIP1Xgn1hL9oXd9H/zats9nDU8V1cJpukXEBHKBBd8UlKKKE49EPtx7V8
 XdnemwNqvU5rFCHepLUOJGU7HPUD7+eMQMBLjC0zv6sYBh1YqKuA0JCWW0HhHwxLnZ
 G67VPfDROMZJzIAXDsRleI9IWuQQbHdXXYbD+3JDa2MmNZkJ+KXSEszK/unpBlNx+T
 Ty5XUnpwZzmGQ==
Date: Wed, 22 Dec 2021 09:33:53 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Yael Tiomkin <yaelt@google.com>
Message-ID: <YcNFYd78LfV2FcSW@quark>
References: <20211221023721.129689-1-yaelt@google.com> <YcNA4w6mof+zKIak@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcNA4w6mof+zKIak@quark>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/keyctl09: test encrypted keys.
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
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Dec 22, 2021 at 09:14:43AM -0600, Eric Biggers wrote:
> On Mon, Dec 20, 2021 at 09:37:21PM -0500, Yael Tiomkin wrote:
> > diff --git a/testcases/kernel/syscalls/keyctl/keyctl09.c b/testcases/kernel/syscalls/keyctl/keyctl09.c
> > new file mode 100644
> > index 000000000..507cd5628
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/keyctl/keyctl09.c
> > @@ -0,0 +1,58 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2021 Google, Inc.
> > + */
> > +
> > +/*\
> > + * [Description]
> > + * Test that encrypted keys can be instantiated using user-provided decrypted
> > + * data (plaintext), and separately, using kernel-generated key material.
> > + */
> > +
> 
> This test doesn't seem to work as intended.
> 
> First, it fails if CONFIG_ENCRYPTED_KEYS is unset (it should be skipped):
> 
> 	keyctl09.c:33: TFAIL: Failed to instantiate encrypted key using payload decrypted data
> 
> Second, I don't have your patch "Instantiate key with user-provided decrypted
> data" (https://lore.kernel.org/r/20211213192030.125091-1-yaelt@google.com) in my
> kernel, so instantiating a key using "user-provided decrypted data" is not
> implemented by the kernel.  However, the test still passes regardless:
> 
> 	keyctl09.c:49: TPASS: Encrypted keys were successfully instantiated and read    
> 
> The test should detect when "user-provided decrypted data" is not supported by
> the kernel, and report that the test of that is being skipped in that case.
> 

And of course, if "user-provided decrypted data" *is* supported by the kernel,
the test should actually test it.

- Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
