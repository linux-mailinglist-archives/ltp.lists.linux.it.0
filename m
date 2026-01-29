Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOgODpfve2keJgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 00:39:03 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB37B5BD1
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 00:39:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67AA23CBE28
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 00:39:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8AE663CB260
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 00:39:00 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 01B281000D86
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 00:38:59 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 690DE343BB;
 Thu, 29 Jan 2026 23:38:59 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1EE653EA61;
 Thu, 29 Jan 2026 23:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ddbyBJPve2mQRgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 29 Jan 2026 23:38:59 +0000
Date: Fri, 30 Jan 2026 00:38:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Piotr Kubaj <piotr.kubaj@intel.com>
Message-ID: <20260129233857.GB110393@pevik>
References: <20260129111556.501121-2-piotr.kubaj@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260129111556.501121-2-piotr.kubaj@intel.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5] thermal: add new test group
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
Cc: daniel.niestepski@intel.com, tomasz.ossowski@intel.com,
 helena.anna.dubel@intel.com, rafael.j.wysocki@intel.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	REPLYTO_EQ_FROM(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: CBB37B5BD1
X-Rspamd-Action: no action

Hi Piotr, all,

...
> +static void setup(void)
> +{
> +	char line[8192];
> +
> +	nproc = tst_ncpus();
> +	tst_res(TDEBUG, "Number of logical cores: %d", nproc);
> +	interrupt_init = calloc(nproc, sizeof(uint64_t));
> +	interrupt_later = calloc(nproc, sizeof(uint64_t));
> +
> +	DIR *dir = SAFE_OPENDIR("/sys/class/thermal/");
> +	struct dirent *entry;
> +
> +	tz_counter = 0;
> +
> +	while ((entry = SAFE_READDIR(dir))) {
> +		if ((strncmp(entry->d_name, "thermal_zone", sizeof("thermal_zone"))) > 0)
> +			tz_counter++;
> +	}
> +	SAFE_CLOSEDIR(dir);
> +	tst_res(TDEBUG, "Found %d thermal zone(s)", tz_counter);
> +
> +	interrupts(interrupt_init, nproc);
> +
> +	x86_pkg_temp_tz = calloc(tz_counter, sizeof(bool));
> +
> +	for (int i = 0; i < tz_counter; i++) {
> +		char path[NAME_MAX];
> +
> +		snprintf(path, NAME_MAX, "/sys/class/thermal/thermal_zone%d/type", i);
> +		tst_res(TDEBUG, "Checking whether %s is x86_pkg_temp", path);
> +
> +		SAFE_FILE_SCANF(path, "%s", line);
> +		if (strstr(line, "x86_pkg_temp")) {
> +			tst_res(TDEBUG, "Thermal zone %d uses x86_pkg_temp", i);
> +			x86_pkg_temp_tz[i] = 1;
> +			x86_pkg_temp_tz_found = 1;
> +		}
> +	}
> +
> +	if (!x86_pkg_temp_tz_found)
> +		tst_brk(TCONF, "No thermal zone uses x86_pkg_temp");
NOTE: any tst_brk() causes cleanup() being called before test exit.

> +}
> +
> +static void cleanup(void)
> +{
Therefore this must be guarded:
> +	SAFE_FILE_PRINTF(trip_path, "%d", trip);

if (x86_pkg_temp_tz_found)
	SAFE_FILE_PRINTF(trip_path, "%d", trip);

(Detectable on machine without x86_pkg_temp, e.g. VM).

Kind regards,
Petr

> +	free(interrupt_init);
> +	free(interrupt_later);
> +}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
