Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD6OBENJoGkuhwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 14:23:15 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A18CF1A662B
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 14:23:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E03B3CBFBB
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 14:23:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5973C3C536F
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 14:23:04 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2D3D5600946
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 14:23:03 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D2D31FA54;
 Thu, 26 Feb 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AB563EA62;
 Thu, 26 Feb 2026 13:23:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LAOkEzdJoGn3UgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 26 Feb 2026 13:23:03 +0000
Date: Thu, 26 Feb 2026 14:23:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "Kubaj, Piotr" <piotr.kubaj@intel.com>
Message-ID: <aaBJP7DwAg10MOeT@yuki.lan>
References: <20260223100015.14834-2-piotr.kubaj@intel.com>
 <aZ72j9KvkhsDF7Yf@yuki.lan>
 <bb8f4252ef9830b359951cada2327e9eff3a956e.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb8f4252ef9830b359951cada2327e9eff3a956e.camel@intel.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v8] thermal: add new test group
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
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Ossowski,
 Tomasz" <tomasz.ossowski@intel.com>, "Dubel,
 Helena Anna" <helena.anna.dubel@intel.com>, "Niestepski,
 Daniel" <daniel.niestepski@intel.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,yuki.lan:mid]
X-Rspamd-Queue-Id: A18CF1A662B
X-Rspamd-Action: no action

Hi!
> > > +	int sleep_time = SLEEP;
> > > +	double run_time = RUNTIME;
> > > +
> > > +	snprintf(path, NAME_MAX,
> > > "/sys/class/thermal/thermal_zone%d/", i);
> > > +	strncpy(temp_path, path, NAME_MAX);
> > > +	strncat(temp_path, "temp", 4);
> > 
> > Why just not use a single snprintf()?
> That has already been asked before. path variable is also used later on
> in the test.

Doing strncpy() and strncat() is slower than having single snprintf()
per path and the code is also longer. We do not save anythign with
constructing the path prefix beforehand.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
