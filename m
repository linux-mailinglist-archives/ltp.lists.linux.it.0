Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 603FB3E7BF4
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 17:17:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3A473C70B5
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 17:17:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 62E3D3C0CFD
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 17:17:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 06AF41400E1E
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 17:17:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52A62200CB;
 Tue, 10 Aug 2021 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628608637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uE6sKlG4TsI4iQgoLwHtFMD9U/MZMTVYw6Ju/Kk3FHg=;
 b=VkBd0CL1x7Re3IRpcmbfDjsh4JHF932GBHDNRUrwytFtqAZaekKQgQ2IyEwLXcO4KqJTwE
 w6bWmR4sWZHQBAwMBRHf0BWIxle+8F3cdV9TVWpX6fxRTAidcsY24c9pe2QnrMeUNUX9/x
 PAesz2yXxP/Npd9zIwaMj8mKY+10uzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628608637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uE6sKlG4TsI4iQgoLwHtFMD9U/MZMTVYw6Ju/Kk3FHg=;
 b=UzAgc/uUx3vXbSYR5YhCGJt39KfMfR/amc3W5vwvtYsmjKSrtfbDyVuueSxdb9vqPHDbxy
 RYX6p8fd5wF2cWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3535F13B3D;
 Tue, 10 Aug 2021 15:17:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NcsqDH2YEmFlDQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Aug 2021 15:17:17 +0000
Date: Tue, 10 Aug 2021 17:17:28 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YRKYiANdBikjLn6o@yuki>
References: <20210621113804.26179-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621113804.26179-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] scripts/coccinelle: Add headers to lib checks
 and fix macro fix
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
Pushed the first two patches, thanks.

I guess that we no longer need the third since we do have 'make check'
now.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
