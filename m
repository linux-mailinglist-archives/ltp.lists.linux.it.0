Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7787FC30E
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Nov 2023 19:26:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5BB43CDAB7
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Nov 2023 19:26:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5AC43CC9C1
 for <ltp@lists.linux.it>; Tue, 28 Nov 2023 19:26:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3A9651400982
 for <ltp@lists.linux.it>; Tue, 28 Nov 2023 19:26:08 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24F6D219A8;
 Tue, 28 Nov 2023 18:26:08 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C299C133B5;
 Tue, 28 Nov 2023 18:26:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id xrKBK78wZmWneAAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Tue, 28 Nov 2023 18:26:07 +0000
Date: Tue, 28 Nov 2023 19:26:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>, ltp@lists.linux.it
Message-ID: <20231128182605.GA409981@pevik>
References: <20231030110107.4528-1-andrea.cervesato@suse.de>
 <20231030110107.4528-3-andrea.cervesato@suse.de>
 <20231113160200.GD2231337@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231113160200.GD2231337@pevik>
X-Spamd-Bar: ++++++++
X-Spam-Score: 8.14
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out1.suse.de; dkim=none;
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of pvorel@suse.cz)
 smtp.mailfrom=pvorel@suse.cz; dmarc=none
X-Rspamd-Queue-Id: 24F6D219A8
X-Spamd-Result: default: False [8.14 / 50.00];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; RCVD_VIA_SMTP_AUTH(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_NOT_FQDN(0.50)[]; ARC_NA(0.00)[];
 R_SPF_SOFTFAIL(4.60)[~all]; DMARC_NA(1.20)[suse.cz];
 NEURAL_HAM_LONG(-0.31)[-0.314]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.18)[-0.891];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.06)[61.49%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Remove fsx runtest suite
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Andrea, Cyril,

I merged the patchset with moving Makefile change to the second commit,
where it belongs.

Thanks!

> Hi Andrea,

> runltp also has fsx part, which needs to be deleted:

>     # The fsx-linux tests use the SCRATCHDEV environment variable as a location
>     # that can be reformatted and run on.  Set SCRATCHDEV if you want to run
>     # these tests.  As a safeguard, this is disabled.
>     unset SCRATCHDEV
>     [ -n "$SCRATCHDEV" ] && \
>     {
>          cat ${LTPROOT}/runtest/fsx >> ${TMP}/alltests ||
>          {
>              echo "FATAL: unable to create  fsx-linux tests command file"
>              exit 1
>          }
>     }

I merged this as a separate commit.

> With that removed, you can add:
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

> BTW I also wonder if we still need testscripts/ltp-aiodio.sh.

This is still open question.

Kind regards,
Petr

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
