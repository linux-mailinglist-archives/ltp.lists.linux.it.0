Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4ED94B9B6
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2024 11:32:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 072263D205E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2024 11:32:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 245733D1FF6
 for <ltp@lists.linux.it>; Thu,  8 Aug 2024 11:32:30 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A90121400F2B
 for <ltp@lists.linux.it>; Thu,  8 Aug 2024 11:32:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B5DA21A89;
 Thu,  8 Aug 2024 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1723109548;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5KLwr0G7FYPd5OeLV4HhJgtaiIA0fH2S07EFw5p1Lk=;
 b=MCm2LqLuoTFxbb4tdCZJSkYxqbWlfmRXJ8aXGB9uXCSBuwc0DrmuCrJuTia7P2SP29DqJd
 t5OiS5aZ0343qwkIGvcN8E25wOXu5y2XA87+Pcm2ra/G5LpTJggLbK9hsttWUjNmesvcN1
 cVuWLBGI33FxHJTxcOi808lcXLNgQmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1723109548;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5KLwr0G7FYPd5OeLV4HhJgtaiIA0fH2S07EFw5p1Lk=;
 b=v35HydkaD6V62O79gVLpFFNdm85alnVYX4py5Mh/LhJcsCjyWWBtoYB5vA60SKpzrFGi14
 RuGxdw01uwqJxcDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=MCm2LqLu;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=v35Hydka
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1723109548;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5KLwr0G7FYPd5OeLV4HhJgtaiIA0fH2S07EFw5p1Lk=;
 b=MCm2LqLuoTFxbb4tdCZJSkYxqbWlfmRXJ8aXGB9uXCSBuwc0DrmuCrJuTia7P2SP29DqJd
 t5OiS5aZ0343qwkIGvcN8E25wOXu5y2XA87+Pcm2ra/G5LpTJggLbK9hsttWUjNmesvcN1
 cVuWLBGI33FxHJTxcOi808lcXLNgQmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1723109548;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5KLwr0G7FYPd5OeLV4HhJgtaiIA0fH2S07EFw5p1Lk=;
 b=v35HydkaD6V62O79gVLpFFNdm85alnVYX4py5Mh/LhJcsCjyWWBtoYB5vA60SKpzrFGi14
 RuGxdw01uwqJxcDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2DB813876;
 Thu,  8 Aug 2024 09:32:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0KxEIauQtGaMJQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 08 Aug 2024 09:32:27 +0000
Date: Thu, 8 Aug 2024 11:32:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ma Xinjian <maxj.fnst@fujitsu.com>
Message-ID: <20240808093225.GA325801@pevik>
References: <20240802082220.890830-1-maxj.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802082220.890830-1-maxj.fnst@fujitsu.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.71 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; REPLYTO_EQ_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:replyto,suse.cz:dkim];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.cz:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 0B5DA21A89
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -0.71
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] cgroup_fj_common.sh: Do not disable systemd
 related cgroup subsystems
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

Hi Ma,

> The cpu, io, memory, and pids subsystems under the root cgroup cannot be disabled
> because they are used for systemd. Currently, the test of cpu and memory subsystems
> in cgroup_fj_function.sh and cgroup_fj_stress.sh will report the error
> "echo: write error: device or resource busy".

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> -    [ "$cgroup_version" = "2" ] && ROD echo "-$subsystem" \> "/sys/fs/cgroup/cgroup.subtree_control"
> +    if [ "$cgroup_version" = "2" ] && [ "$subsystem" != "cpu" ] && [ "$subsystem" != "io" ] \
> +            && [ "$subsystem" != "memory" ] && [ "$subsystem" != "pids" ]; then
> +            ROD echo "-$subsystem" \> "/sys/fs/cgroup/cgroup.subtree_control"
> +    fi

I would personally wrote it as:

    if [ "$cgroup_version" = "2" ]; then
		case "$subsystem" in
			cpu|io|memory|pid)
				:;;
			*) ROD echo "-$subsystem" \> "/sys/fs/cgroup/cgroup.subtree_control";;
		esac
    fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
