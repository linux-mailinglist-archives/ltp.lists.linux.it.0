Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLcgL1e2nWlyRQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 15:31:51 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A2418861A
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 15:31:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0009A3D0F9E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 15:31:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C00F3C7C41
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 15:31:49 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1DC0D2009E8
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 15:31:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 85EEE5BD15;
 Tue, 24 Feb 2026 14:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771943508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KzIJKm98S/MW5YwsRX3bFrbf0XnR5iFJdUywQzhXKTs=;
 b=fJ2hK6kpswzLR9tuPWydZbKozTsydtq4EVmCINQbkMhGg9X1ou7GM2k8vn6TTqwn6EcSO8
 99/wx2YTwlWQE1Fk99HTQhxoGyZiVhvxx9PTtmKJGmpy2XYuMYVEXNuTlPTZgpA7GstX95
 ebUGdn/7nvtJ2iSAsH5AgPY+DQHi5VQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771943508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KzIJKm98S/MW5YwsRX3bFrbf0XnR5iFJdUywQzhXKTs=;
 b=pqA2QjEFIVvwU/erDzrigYlbvPMm/4oLOPEGi9Qj+jPkdDK7wWpaDtkWBI8zfklAp73v2+
 dPqLM7Z4LVhtZOAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771943508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KzIJKm98S/MW5YwsRX3bFrbf0XnR5iFJdUywQzhXKTs=;
 b=fJ2hK6kpswzLR9tuPWydZbKozTsydtq4EVmCINQbkMhGg9X1ou7GM2k8vn6TTqwn6EcSO8
 99/wx2YTwlWQE1Fk99HTQhxoGyZiVhvxx9PTtmKJGmpy2XYuMYVEXNuTlPTZgpA7GstX95
 ebUGdn/7nvtJ2iSAsH5AgPY+DQHi5VQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771943508;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KzIJKm98S/MW5YwsRX3bFrbf0XnR5iFJdUywQzhXKTs=;
 b=pqA2QjEFIVvwU/erDzrigYlbvPMm/4oLOPEGi9Qj+jPkdDK7wWpaDtkWBI8zfklAp73v2+
 dPqLM7Z4LVhtZOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F49F3EA68;
 Tue, 24 Feb 2026 14:31:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 54WSEVS2nWmZTgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 24 Feb 2026 14:31:48 +0000
Date: Tue, 24 Feb 2026 15:31:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20260224143142.GA64233@pevik>
References: <20260220154742.54150-1-mdoucha@suse.cz>
 <20260220154742.54150-3-mdoucha@suse.cz>
 <20260224134023.GB59724@pevik>
 <784652f2-788f-4108-a6da-18f4f1b613e5@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <784652f2-788f-4108-a6da-18f4f1b613e5@suse.cz>
X-Spam-Score: -7.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] Add test for fanotify monitoring of tracing
 filesystem
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
Cc: ppavlu@suse.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 55A2418861A
X-Rspamd-Action: no action

> Hi!

> On 2/24/26 14:40, Petr Vorel wrote:
> > > +static void setup(void)
> > > +{
> > > +	if (tst_fs_type(MNTPOINT) != TST_TRACEFS_MAGIC) {
> > > +		SAFE_MOUNT("tracefs", MNTPOINT, "tracefs",
> > > +			MS_NODEV | MS_NOEXEC | MS_NOSUID, NULL);

> > I see possible mounting is the reason...

> > > +		unmount_needed = 1;
> > > +	}
> > > +
> > > +	if (access(EVENTS_SYSFILE, F_OK))
> > > +		tst_brk(TCONF, "Kprobe events not supported by kernel");

> > ... why we cannot check /sys/kernel/tracing/kprobe_events presence via
> > .save_restore.

> Well, yes, tracefs may need to be mounted during test setup. But
> .save_restore also assumes that sysfiles contain only one line while
> kprobe_events may hold arbitrarily long kprobe list. Also note that the
> restore function opens the sysfile with O_TRUNC, which might wipe all
> existing kprobes before creating them again. Therefore I've decided to check
> the file availability in setup() and send a targeted kprobe delete command
> instead of saving and restoring the whole sysfile.

Makes sense. Thanks for info.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
