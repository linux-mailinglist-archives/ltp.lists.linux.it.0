Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4ACB91BA6
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Sep 2025 16:31:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0F463CDE52
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Sep 2025 16:31:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E57A83C0372
 for <ltp@lists.linux.it>; Mon, 22 Sep 2025 16:31:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4B940600FC0
 for <ltp@lists.linux.it>; Mon, 22 Sep 2025 16:31:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C071B337EB;
 Mon, 22 Sep 2025 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758551497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXCyeJaAALGNtkSmAiCc2QK/+oTcl7jCaY/8sPGhS5Q=;
 b=w+PpiCbvaHiVgeFzVcHf502/mgEysJqLaFaAsJst6zPHVhoFyR3t+RV5DP4QQEKgiL9Den
 CSFXbvu9aa2rfcSkgoMqjShxbUeZBNacnTTEjX2tXoOiDHbiidBMIfWFxnDEgRNWIA+vbY
 t/+H6/mjfs+b91yS4z3Mhf+JcBK4h4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758551497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXCyeJaAALGNtkSmAiCc2QK/+oTcl7jCaY/8sPGhS5Q=;
 b=zTIazS+FabtM0lTMBk+yP2cATK/4Hds7gztZi417j+WEsUDWZgB9iTsE/qKNT6WKYq15j0
 Db4KcixbWDJdvVAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758551497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXCyeJaAALGNtkSmAiCc2QK/+oTcl7jCaY/8sPGhS5Q=;
 b=w+PpiCbvaHiVgeFzVcHf502/mgEysJqLaFaAsJst6zPHVhoFyR3t+RV5DP4QQEKgiL9Den
 CSFXbvu9aa2rfcSkgoMqjShxbUeZBNacnTTEjX2tXoOiDHbiidBMIfWFxnDEgRNWIA+vbY
 t/+H6/mjfs+b91yS4z3Mhf+JcBK4h4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758551497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXCyeJaAALGNtkSmAiCc2QK/+oTcl7jCaY/8sPGhS5Q=;
 b=zTIazS+FabtM0lTMBk+yP2cATK/4Hds7gztZi417j+WEsUDWZgB9iTsE/qKNT6WKYq15j0
 Db4KcixbWDJdvVAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD50913A63;
 Mon, 22 Sep 2025 14:31:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cSBqKcld0WhhEQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 22 Sep 2025 14:31:37 +0000
Date: Mon, 22 Sep 2025 16:32:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <aNFd7UYkgVk3xgU_@yuki.lan>
References: <20250922-cve-2025-21756-v1-1-074da211288a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250922-cve-2025-21756-v1-1-074da211288a@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] cve: add test reproducer for cve-2025-21756
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
> +/*\
> + * Test for CVE-2025-21756 fixed in kernel v6.14:
> + * fcdd2242c023 vsock: Keep the binding until socket destruction
> + *
> + * Reproducer based on:
> + * https://lore.kernel.org/all/20250128-vsock-transport-vs-autobind-v3-5-1cf57065b770@rbox.co/
> + *
> + * Beware, this test will crash the system.
> + */
> +
> +#include "tst_test.h"
> +
> +#if HAVE_LINUX_VM_SOCKETS_H
> +
> +#include "lapi/vm_sockets.h"

Do we need the #if HAVE_LINUX_VM_SOCKETS_H if we include lapi/ fallback?

> +#define MAX_PORT_RETRIES	24
> +#define VMADDR_CID_NONEXISTING	42
> +
> +static int vsock_bind(unsigned int cid, unsigned int port, int type)
> +{
> +	int sock;
> +
> +	struct sockaddr_vm sa = {
> +		.svm_family = AF_VSOCK,
> +		.svm_cid = cid,
> +		.svm_port = port,
> +	};
> +
> +	sock = SAFE_SOCKET(AF_VSOCK, type, 0);
> +	SAFE_BIND(sock, (struct sockaddr *)&sa, sizeof(sa));

I guess that with the lapi fallback we should TCONF here on ENOSYS
instead and drop the #if at the top.

Other than that the rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
