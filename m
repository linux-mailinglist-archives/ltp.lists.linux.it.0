Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7707E6F4625
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 16:37:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0BB73CB900
	for <lists+linux-ltp@lfdr.de>; Tue,  2 May 2023 16:37:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 80F013C288D
 for <ltp@lists.linux.it>; Tue,  2 May 2023 16:37:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A2E52002D2
 for <ltp@lists.linux.it>; Tue,  2 May 2023 16:36:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8D631FD63;
 Tue,  2 May 2023 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683038218;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/eqJnyIlI7P5CUtE30RtyzWEUtUkEAjQ7K6lq5U9pig=;
 b=rh8op1lJwIsvN36kMtpIEp/+Z4cF0Lvu2Nx2R6Yu3f7dHngtjswtKKVhUVsYCa+RmtD2D/
 nsDSYrX9SiO4z6UDs0aDtHcbq7P3sSUIAFVNnkIg6PpDH5FOp7UFhhuzL5IkYKIsNAdsDQ
 WVvq9/tM3nNerOakoG/fOBOOHGXtoNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683038218;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/eqJnyIlI7P5CUtE30RtyzWEUtUkEAjQ7K6lq5U9pig=;
 b=7+A9gibxWccRV6tx4oU+QHrA/XvGFmIFAKPJEL7g/l3EC4lW9BAkLRxf7hPhGd2PFWtN6c
 pOGRFQN97pNSkjBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D389139C3;
 Tue,  2 May 2023 14:36:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8nm5HwogUWRrBQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 02 May 2023 14:36:58 +0000
Date: Tue, 2 May 2023 16:37:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230502143711.GA3665733@pevik>
References: <ZEjsKC6ESB1+mM0H@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZEjsKC6ESB1+mM0H@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP release preparations
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

* IMHO Martin's KVM patchset should be merged
https://patchwork.ozlabs.org/project/ltp/list/?series=351921&state=*

* nfslock01.sh: Don't test on NFS v3 on TCP
https://patchwork.ozlabs.org/project/ltp/patch/20230502075921.3614794-1-pvorel@suse.cz/
=> IMHO should go in to increase NFS tests stability

* NFS: test on all filesystems
https://patchwork.ozlabs.org/project/ltp/list/?series=352840&state=*

Kind regards,
Petr

> Hi!
> I would like to start with LTP pre-release preparations a bit sooner
> than usuall, since quite a lot of things have accumulated in May, e.g.
> there is a SUSE Labs conference right in the middle of the month.

> I would like to start with reviewe of patches that should go in now,
> freeze the git somewhere at the end of the first week of May and aim for
> a release somewhere in the middle of the month. Does that sound Ok to
> everyone?

> Either way if you have patches that should land in the upcomming
> release, please point them out now, so that we have a chance to review
> them.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
