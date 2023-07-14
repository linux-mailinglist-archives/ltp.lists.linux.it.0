Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116C753231
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jul 2023 08:45:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5741B3CB5DF
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jul 2023 08:45:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A5A1B3C0313
 for <ltp@lists.linux.it>; Fri, 14 Jul 2023 08:45:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DF10D200BC7
 for <ltp@lists.linux.it>; Fri, 14 Jul 2023 08:45:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3627F1F8A8;
 Fri, 14 Jul 2023 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689317132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5fKW4WvaP4Pgthp/YaxpPZbg533sfXnejHSEi0ton8I=;
 b=qKjk0FiIrfI7IdsrwwhXUNFZZ3JrGq5FXuXsQNpjF7Vy/c4RJid8Yw5ZhaJnYzlZQmzRep
 wSsQkPsqqAm2iH5xA/YKMyCpq7Q3Nd6THy1mN6TonL227KSyZas+ImOf1/0idXxL97N+y7
 2x1huQoST4ZI27L46LdmMw4wgwZnM+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689317132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5fKW4WvaP4Pgthp/YaxpPZbg533sfXnejHSEi0ton8I=;
 b=IWLyuDcJRCX/v7/hTCbuMwEK4s616uKioD/vMF+3RzsphMnEmm0GSgMKseuY99adKKeA8X
 nSjT+05aIia6ykDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23ABD138F8;
 Fri, 14 Jul 2023 06:45:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zIqQBwzvsGSPIgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 14 Jul 2023 06:45:32 +0000
Date: Fri, 14 Jul 2023 08:46:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <ZLDvTYhGI6_Q5vDE@yuki>
References: <20230704091933.496989-1-pvorel@suse.cz>
 <20230704091933.496989-2-pvorel@suse.cz>
 <20230704092536.GA497945@pevik> <ZK_m_8OuewzitKmH@yuki>
 <CAEemH2eE8PUY_at7C-aUX+75ALdM-jjm71L=M-ETYc94RKJFcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eE8PUY_at7C-aUX+75ALdM-jjm71L=M-ETYc94RKJFcg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/3] Makefile: Add C header with generated LTP
 version
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
> So why not use the script to append that one line in tst_test.h directly?

That wouldn't play nice with development, you would have to make sure
not to accidentally commit the line, which would happen way to often.

> The ltp-version.h looks quite redundant and we could even put this script
> into build.sh together, IMHO.

The end goal here is to have the LTP version in the test output
regardless where it came from (tarball, git) and how it was compiled
(build.sh, cd testcases/kernel/ && make, ...). The only way how to do
this is to refresh the version on each make and build it from inside the
library.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
