Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C23880580E
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Dec 2023 15:58:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 018713CC812
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Dec 2023 15:58:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78E793CC152
 for <ltp@lists.linux.it>; Tue,  5 Dec 2023 15:58:40 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8ABEF1007C8B
 for <ltp@lists.linux.it>; Tue,  5 Dec 2023 15:58:39 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7AE9022067;
 Tue,  5 Dec 2023 14:58:38 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A0D0138FF;
 Tue,  5 Dec 2023 14:58:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id /ytAC506b2UEEgAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Tue, 05 Dec 2023 14:58:37 +0000
Date: Tue, 5 Dec 2023 15:58:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20231205145834.GA96988@pevik>
References: <20231204184817.3570465-1-shr@devkernel.io>
 <20231204184817.3570465-3-shr@devkernel.io> <ZW8DVo6UfSofc9WP@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZW8DVo6UfSofc9WP@yuki>
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Level: 
X-Spam-Score: -4.00
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Queue-Id: 7AE9022067
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] add ksm test for smart-scan feature
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
Cc: david@redhat.com, Stefan Roesch <shr@devkernel.io>, linux-mm@kvack.org,
 oliver.sang@intel.com, kernel-team@fb.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > +
> > +	while (waitpid(-1, &status, 0) > 0)
> > +		if (WEXITSTATUS(status) != 0)
> > +			tst_res(TFAIL, "child exit status is %d",
> > +					WEXITSTATUS(status));

> Does the test fork a child? I do not see any place in the code that
> would do so, did I miss something?

Ah, I also pointed out this is useless, but forget to point out that
.forks_child = 1 should be also removed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
