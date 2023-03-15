Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF276BBCB8
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 19:52:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09DDE3CD4A9
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 19:52:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 686553CACDB
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 19:52:32 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D0099140110D
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 19:52:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFC681FD8B;
 Wed, 15 Mar 2023 18:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1678906350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilqBiDHeFhEjsqcvC6ZDu0CF0bnFmKKLapdvtSc74NE=;
 b=Sk0SXnyGSUXLdpnn2wTutf4gaIZU5ofMRZ0m3Uq0iil+XERlWG2AZfm2nX1Gwt4hDv3Dh7
 mW5cT4V0G3kaFYFPMfC4U/8ZGHPWCJ4n2PIlgHVbGw+iVs/gAu6fmCZEWlK2bXp5BVzc31
 95ASs4t4keRmOoi8uiJNwigqONAoqqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1678906350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilqBiDHeFhEjsqcvC6ZDu0CF0bnFmKKLapdvtSc74NE=;
 b=ffM7laV2a4GicGEnljyO1ha8cfJqij6egX70Bdu6mfFcQAitaHhNkeLOSbrWcw06CF+L8K
 BuTsDEmQSUKTHtAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 788B013A00;
 Wed, 15 Mar 2023 18:52:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0dfeN+wTEmSuUAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 15 Mar 2023 18:52:28 +0000
Date: Wed, 15 Mar 2023 19:52:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20230315185226.GA205543@pevik>
References: <20230306235715.29868-1-wegao@suse.com>
 <20230307085139.3574-1-wegao@suse.com> <87ttyo6g7o.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ttyo6g7o.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] kill01: New case cgroup kill
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
Cc: Li Wang <liwan@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> >  lib/tst_cgroup.c                             |   1 +
> >  runtest/controllers                          |   1 +
> >  testcases/kernel/controllers/kill/.gitignore |   1 +
> >  testcases/kernel/controllers/kill/Makefile   |   6 +
> >  testcases/kernel/controllers/kill/kill01.c   | 138 +++++++++++++++++++

> nit: kill is not a controller, it is a core function. This should go in
> controllers/cgroup.

Very good point!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
