Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QImfKMi8eGn6sgEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 14:25:28 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A194E0D
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 14:25:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10F1A3CAF83
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 14:25:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 987433CAE83
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 14:25:18 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DB8DC600907
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 14:25:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7CB15BCE6;
 Tue, 27 Jan 2026 13:25:16 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45FA93EA61;
 Tue, 27 Jan 2026 13:25:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fWYnCry8eGlbCAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 27 Jan 2026 13:25:16 +0000
Date: Tue, 27 Jan 2026 14:25:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20260127132514.GB146899@pevik>
References: <aWjZX0fsrTJMqq49@yuki.lan>
 <aXi4P0YdKx5rFZ8C@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXi4P0YdKx5rFZ8C@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP release preprations
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_EQ_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-ltp];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:replyto]
X-Rspamd-Queue-Id: 545A194E0D
X-Rspamd-Action: no action

> Hi!
> Are there any other fixes that should be considered before the git is
> tagged?

* ioctl_pidfd02-06: Add CONFIG_USER_NS and CONFIG_PID_NS to needs_kconfigs
https://patchwork.ozlabs.org/project/ltp/patch/20251209211629.95436-1-terry.tritton@linaro.org/
(Or I can prepare an alternative fix to do a runtime check, I also plan to send
a patch with formalising the rules)

* tst_net.sh fixes would be nice to get merged:
https://patchwork.ozlabs.org/project/ltp/list/?series=489902&state=*
https://lore.kernel.org/ltp/20260127131427.146592-1-pvorel@suse.cz/
https://lore.kernel.org/ltp/20260127131427.146592-2-pvorel@suse.cz/

https://patchwork.ozlabs.org/project/ltp/list/?series=489469&state=*

It should be safe to merge these:

* v5 tst_filesystems01.c: Add test for .filesystems
https://patchwork.ozlabs.org/project/ltp/list/?series=489469&state=*

* checkpatch.pl enhancement to check for typos
https://patchwork.ozlabs.org/project/ltp/list/?series=487179&state=*
(I did not merged it as I hoped for a discussion what else to enable for
warnings, but that could be done as a separate effort after the release).

FYI I dared to merge IMA fix:
https://github.com/linux-test-project/ltp/commit/1ba58805ea5466df5202ff2e7b5b3d0cd5c81c37

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
