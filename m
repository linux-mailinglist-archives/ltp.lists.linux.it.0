Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1017352E872
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 11:13:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 382363CAAEE
	for <lists+linux-ltp@lfdr.de>; Fri, 20 May 2022 11:13:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 63F513C4DB3
 for <ltp@lists.linux.it>; Fri, 20 May 2022 11:13:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F02941400F35
 for <ltp@lists.linux.it>; Fri, 20 May 2022 11:13:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 32BA821C79;
 Fri, 20 May 2022 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1653037992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GNekGwGEILNj5SufWHx36EF7Osqg2HcHU59szUZ+2xM=;
 b=wKkctb7czmKT7mMcJoO+ICt2pQtOOBa+9F9KknriKLBWGO0TmDT6qCTdLJkp09wSYLQgsg
 64Qpsbq2zMHYmorTytJ0wBAaksm0WtF2Otp3ljpKXCkP1GNclyrmlLSn6LHnHKL9ejx5aK
 gUco2F/yRDCNmmCkY+O6wgOPg3VGNrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1653037992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GNekGwGEILNj5SufWHx36EF7Osqg2HcHU59szUZ+2xM=;
 b=UvVLus4KoZXqD+4TMmksrP8WkNfJMb35XVM2z9cQb5Hs3PxXbN428W51Y0YX/xLjzJPUdQ
 hV7cZepKtjL6nNBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1362713A5F;
 Fri, 20 May 2022 09:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MZkwA6hbh2KlZwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 20 May 2022 09:13:12 +0000
Date: Fri, 20 May 2022 11:13:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YodbppwrK3MfbyFX@pevik>
References: <20220519121056.1181-1-mdoucha@suse.cz>
 <20220519121056.1181-2-mdoucha@suse.cz> <YodY7QOisdpaI3KK@pevik>
 <10ee5852-9302-22d7-832c-f581ef94c336@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10ee5852-9302-22d7-832c-f581ef94c336@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] pty04: Fix cleanup
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

> On 20. 05. 22 11:01, Petr Vorel wrote:
> > BTW C API would deserve (after the release) TBROK on -i0, which is already
> > implemented in shell API:
> > df01 1 TBROK: Number of iterations (-i) must be > 0

> I don't see why. Running pty07 with -i0 was actually quite helpful in
> debugging this issue. If a test fails when executed with -i0, it needs
> to be fixed.
Do you mean that -i0 is useful to test only setup and cleanup in C API?
If we agree we want this (not against it if it's useful), shell API should
be unified with it (my concern was that both APIs should behave the same on
the same getopt option).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
