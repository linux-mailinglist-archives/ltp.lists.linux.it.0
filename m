Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD97A478C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 12:49:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93E743CE4C3
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 12:49:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D12B3CA74F
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 12:49:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 13A03601BB1
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 12:49:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E6AB11FDE6;
 Mon, 18 Sep 2023 10:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695034153;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRTgAt0llmZ9u3VIYwET7L4JwH89NJCJiDsooK4bigc=;
 b=ap1vLOKFFRfPkS5ZkZdtZPttX4L7JYI9cbgstBiwNVqaE/9gnYdvRpFy4C9vfXZ6MU3GIS
 Zt8jPtaboczAR39vsDnnN35ouO3QDT9pwH4AJYapzaUMaJ6oM/iWXb0IFf8sJx9VbcOr96
 KKXBQtSpHc5/UUvBABHfIER5X2D3XiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695034153;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRTgAt0llmZ9u3VIYwET7L4JwH89NJCJiDsooK4bigc=;
 b=zwN0b8g8xTItJhRix5oZbUqTZnt6Z8l5PPUIYk4TahOVCM4p5GfvEFKTylODnSM+xUTts3
 sX277WaxPnxvy4DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABA351358A;
 Mon, 18 Sep 2023 10:49:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lap4JSkrCGURQwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 18 Sep 2023 10:49:13 +0000
Date: Mon, 18 Sep 2023 12:49:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20230918104912.GC12384@pevik>
References: <20230918092219.24151-1-andrea.cervesato@suse.de>
 <20230918092219.24151-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918092219.24151-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] Replace runltp-ng with kirk framework
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

Hi Andrea,

> Kirk application is the runltp-ng successor and it aims to merge
> multiple Linux testing frameworks in one tool, providing support
> for remote testing via Qemu, SSH, LTX, parallel execution and much
> more.

> This patch deprecates runltp-ng, which is not replaced by kirk. All
s/deprecates/removes/
s/not/now/

This could be done before merge, but kirk needs ln -sf instead of just ln -s:

https://github.com/linux-test-project/kirk/pull/2
Andrea just merged it.

=> That will need v5.

> runltp-ng features are present in kirk and even more.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
