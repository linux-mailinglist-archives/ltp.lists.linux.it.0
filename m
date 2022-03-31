Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488C4ED3D6
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Mar 2022 08:21:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B243A3C9F37
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Mar 2022 08:21:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 29C3F3C9EB1
 for <ltp@lists.linux.it>; Thu, 31 Mar 2022 08:21:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2EBEC60081B
 for <ltp@lists.linux.it>; Thu, 31 Mar 2022 08:21:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05280218F0;
 Thu, 31 Mar 2022 06:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648707681;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/OKyz/RblzhEyVXTb2opK9Emedk3ShBgqMQsUkG+jF8=;
 b=juB/csVAjYPHNJIbWKlbsmivGp0Z6NDeaO6r2Wr/aHFvtiRW/0paOdFoA5G7rIKxYameyJ
 by3q1CkEzh6+yPwcJMkZ6WeygsBzjRqR8s99zu4StrKQKVStP2uFkHLRxRQ32XCXg6HUIM
 kU0LPmCWbZ6QmsHxWOwHdUmzjxX24Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648707681;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/OKyz/RblzhEyVXTb2opK9Emedk3ShBgqMQsUkG+jF8=;
 b=0uO1FfihZfIZP4r0cy3s8nScEyAx6JB6IbpvJTuGy9ZXSZCCvTpx4TJp1LFqyjsHE27Nav
 0+zDZ8qtDmSuDMDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7E5113B4C;
 Thu, 31 Mar 2022 06:21:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gnktL2BIRWIEQwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 31 Mar 2022 06:21:20 +0000
Date: Thu, 31 Mar 2022 08:21:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: pvorel <pvorel@suse.de>
Message-ID: <YkVIXjarbhum1eux@pevik>
References: <20220330090817.21950-1-andrea.cervesato@suse.de>
 <1faf27214b18ef9d3237734388342308@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1faf27214b18ef9d3237734388342308@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Fix wqueue09 according with 5.17 kernel updates
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

Hi all,

> Hi Andrea,

> On 2022-03-30 11:08, Andrea Cervesato wrote:

> > This patch fixes also the issue of loosing events on big number of
> > iterations
> > such as -i 1000.

> Unfortunately when testing on machine with older kernel (older Tumbleweed
> with
> 5.9.1-1-default) it still blocks and then timeout:

> wqueue09.c:52: TPASS: Meta loss notification received
> common.h:134: TINFO: Reading watch queue events

FYI on long enough -i (513 in my case)
buf_len = SAFE_READ(0, fd, buffer, sizeof(buffer));

This is regardless kernel version (tested on Tumbleweed 5.17.0-3.g6cba016-default
and SLES 5.14.21) => easily reproducible.

NOTE: keyctl() return value is always 0.

Also not sure why we are not revoking key any more (removed in this patchset).

Kind regards,
Petr

> NOTE: I haven't tested it on 5.17 yet.

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
