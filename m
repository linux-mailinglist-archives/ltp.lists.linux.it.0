Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E7747053
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jul 2023 14:03:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C29553C99A1
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jul 2023 14:03:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9449D3C1B84
 for <ltp@lists.linux.it>; Tue,  4 Jul 2023 14:03:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C3BF3140013E
 for <ltp@lists.linux.it>; Tue,  4 Jul 2023 14:03:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A32222833;
 Tue,  4 Jul 2023 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1688472193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tz8NgPoFkr0SRL2qyM7pKBWdlVQi2DR5IkMC94UY964=;
 b=AhkN1NcmomRh9L7+uvn/QQy0swX426rXzRfkqMB2/0Tu4e3Lw/vqSrAclrRJLEcH4x9GTl
 SlovLdD6BSHRZkBPIqfLwGQ9jCU08Wsx7egdrmfrXph8WyRnnnfmGGF/muPbMrEyfrbOKO
 aadZlc7Lr/ic2/sTSfg3yLm1F+ynYnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1688472193;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tz8NgPoFkr0SRL2qyM7pKBWdlVQi2DR5IkMC94UY964=;
 b=VU7Zddo2P6BTbjxjlJBApKZDmRuh7P6ejuJ8ea0hL7MuCRHeGEmaOxMdDNtn4GAQhl3Ait
 U11jMAEDmhU36TCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAB201346D;
 Tue,  4 Jul 2023 12:03:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CyG7N4AKpGQJJgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 04 Jul 2023 12:03:12 +0000
Date: Tue, 4 Jul 2023 14:04:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZKQKwpA87GUaoSpX@yuki>
References: <20230704091933.496989-1-pvorel@suse.cz>
 <20230704091933.496989-3-pvorel@suse.cz> <ZKP1afDMgcKSIESE@yuki>
 <20230704115013.GD507064@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704115013.GD507064@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/3] lib/C-API: Add option -V to print LTP
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
> > Why don't we print that as a part of help? Do we really need to allocate
> > a flag for this?
> 
> Well, people expect -V or --verbose. But because I add printing also on running
> test, we could just move it to -h.

You mean --version right?

> BTW I was also thinking about using getopt_long(), at least to allow --help,
> I guess you don't think any value in it.

I do not think that it's importan enough to spend time on, but feel free
to send a patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
