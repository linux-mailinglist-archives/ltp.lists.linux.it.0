Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D84396B0
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 14:51:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A2233C6529
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 14:51:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B8623C1AEB
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 14:51:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 33EF120098F
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 14:51:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E6EF2171F;
 Mon, 25 Oct 2021 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635166308; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjFOmJ8ON/U6jGzfgny4ogXYeQOtQefJk5Y5KFTGbpU=;
 b=a5Ks0Cvzuo7nV7aUUjZ9vb0D6agpD351n44PGNMq5si5ohBJ7DamB48tgDoiWg3u/U+/zw
 n3shYQRgW4yBeW4vqH2SBecb4/NiXFqlXT56f+T7tKED4q00Qfks2rkTqpnNwCyfXsOdyT
 pZHsOLh1Ak0dv2hHw1zHHzzYyPM0kIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635166308;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjFOmJ8ON/U6jGzfgny4ogXYeQOtQefJk5Y5KFTGbpU=;
 b=8Nt1SWGRvCCQ8k5xzN3H5ROqm+s+Y3Pnmzxx0RlCebHDChYaG/iwdSArQsFqwdxdIENgMo
 AU4zs+q+HBLhzEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4944E13BA4;
 Mon, 25 Oct 2021 12:51:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vEh8EWSodmH4RwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 25 Oct 2021 12:51:48 +0000
Date: Mon, 25 Oct 2021 14:51:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YXaoYlybezAlTIdP@rei>
References: <20211018154800.11013-1-chrubis@suse.cz>
 <20211018154800.11013-3-chrubis@suse.cz> <YXKjeNPKKpv8ybh0@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXKjeNPKKpv8ybh0@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] docparse: Add tests
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
> It'd be nice, if this was run by make test.
> 
> Also I'm quite surprised by this behavior:
> 
> $ cd docparse/tests/ && make test
> cat test.sh >test 
> chmod a+x test
>
> When this was added?

There is no Makefile in that directory, this does not even make any
sense. I guess that this is GNU Make pulling default rules out of thin
air...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
