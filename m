Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB398DC27
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Oct 2024 16:38:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F7D33C5A45
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Oct 2024 16:38:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A2153C1C6D
 for <ltp@lists.linux.it>; Wed,  2 Oct 2024 16:38:43 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 10F6020D19D
 for <ltp@lists.linux.it>; Wed,  2 Oct 2024 16:38:42 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0AD9B21C67;
 Wed,  2 Oct 2024 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1727879922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/ET2rCWVvrzSjVDC/i3JNdNRjYfp34NY/ZrfgxULXc=;
 b=Zn9AiwjEqXxxacBJaNJNGVUqTEmNRHHG2O+OGs/fILZL/9Qxmpqj+63YQB/xFZfLoEL7kF
 8018VaG98sE8FysQbm8yH2LaFb1A38AXNCtj0U7+7D6/OespcP1QxXNwOdejwq6r3zKat3
 TNRZkKJasA8Vxuq5UifUV2E1SGsHa1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1727879922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/ET2rCWVvrzSjVDC/i3JNdNRjYfp34NY/ZrfgxULXc=;
 b=1LCMgItVc2+0ffvoLy4dKU0r83vF52WKIQTGWg8xgKvMB/TMgVFHK2dr2Xjl4pGpPQf/5A
 XePIa7CKqXDCtTBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Zn9AiwjE;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=1LCMgItV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1727879922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/ET2rCWVvrzSjVDC/i3JNdNRjYfp34NY/ZrfgxULXc=;
 b=Zn9AiwjEqXxxacBJaNJNGVUqTEmNRHHG2O+OGs/fILZL/9Qxmpqj+63YQB/xFZfLoEL7kF
 8018VaG98sE8FysQbm8yH2LaFb1A38AXNCtj0U7+7D6/OespcP1QxXNwOdejwq6r3zKat3
 TNRZkKJasA8Vxuq5UifUV2E1SGsHa1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1727879922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/ET2rCWVvrzSjVDC/i3JNdNRjYfp34NY/ZrfgxULXc=;
 b=1LCMgItVc2+0ffvoLy4dKU0r83vF52WKIQTGWg8xgKvMB/TMgVFHK2dr2Xjl4pGpPQf/5A
 XePIa7CKqXDCtTBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C226A13A6E;
 Wed,  2 Oct 2024 14:38:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gsQ5LfFa/WYxNQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 02 Oct 2024 14:38:41 +0000
Date: Wed, 2 Oct 2024 16:37:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <Zv1as5QQ6WUgRkJT@yuki.lan>
References: <20240909-listmount_statmount-v4-0-39558204ddf0@suse.com>
 <20240909-listmount_statmount-v4-5-39558204ddf0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240909-listmount_statmount-v4-5-39558204ddf0@suse.com>
X-Rspamd-Queue-Id: 0AD9B21C67
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[yuki.lan:mid,suse.cz:dkim,suse.cz:email];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 05/13] Add listmount02 test
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
> +static void run(void)
> +{
> +	ssize_t ret;
> +	size_t id, tot_ids, count = 0;
> +	uint64_t mount_ids[LISTSIZE];
> +	uint64_t list[LISTSIZE];
> +
> +	for (int i = 0; i < BIND_MOUNTS; i++)
> +		SAFE_MOUNT("/", "/", NULL, MS_BIND, NULL);
> +
> +	tst_res(TINFO, "Reading all %d mount IDs in once", LISTSIZE);
> +
> +	TST_EXP_POSITIVE(listmount(LSMT_ROOT, 0, mount_ids, LISTSIZE, 0));
> +	if (TST_RET == -1)
> +		goto end;

Again this should be if (!TST_PASS)


Otherwise:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
