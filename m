Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F225F5293
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Oct 2022 12:29:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3847D3CAC01
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Oct 2022 12:29:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A4D53C93EE
 for <ltp@lists.linux.it>; Wed,  5 Oct 2022 12:29:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7B12E200966
 for <ltp@lists.linux.it>; Wed,  5 Oct 2022 12:29:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C375C1F894;
 Wed,  5 Oct 2022 10:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664965762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=498WRXC6md+TUXdByv0hOL2+z9PkBYXoO/N2kVVxAto=;
 b=r43Mxg6GolJr6GedVOQBv89A6ASzpZprtFz9LTkkk7yGnTeYylxjLeXTE8HUCaeGPW08JK
 tkXFBRO6oKH91MpAU5hOhrOS96Cy+NAvwflPzxl4BBYVIaEmXgUVC5WtGl0c9MHBavD7pA
 EzbEDw6oG/j5DM2mLtmsnmj8tPLh8CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664965762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=498WRXC6md+TUXdByv0hOL2+z9PkBYXoO/N2kVVxAto=;
 b=y1nqe50J9t6aj4idbup8OZJpoN++ClaTQbZCE0V5jgh7JHf31XIGd1fsRhwKD954nWP5v7
 r5wG6wWkEHSD+ICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B010B13ABD;
 Wed,  5 Oct 2022 10:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1QJlKoJcPWO7MgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 05 Oct 2022 10:29:22 +0000
Date: Wed, 5 Oct 2022 12:31:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Edward Liaw <edliaw@google.com>
Message-ID: <Yz1c8XAKPmNkaFYn@yuki>
References: <20221004182040.1859774-1-edliaw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004182040.1859774-1-edliaw@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/9] mmapstress01: refactor to ltp framework
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
The code is heading into the right direction but there are couple of
things to do (can be done in an incremental manner too):

* Most of the remaning tst_brk(TFAIL, "..") should actually be
  tst_brk(TBROK, "..") at least all the cases where we call
  a syscall and it fails. And we should include the TERRNO flag
  as well to get the actual error printed.

* The test should make use of runtime instead of the alarm()
  for test duration. That would mean getting rid of the -t option and
  using the -I option instead. Also the test should set up some
  .test_runtime for a default run duration in the tst_test structure.

* The top level comment has to be updated for the changes in the test
  since the options structure describes the command line parameters
  quite well I would just remove that part from the comment

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
