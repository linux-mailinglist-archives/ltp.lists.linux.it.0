Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 039F68FC56F
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2024 10:10:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD3703D0989
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2024 10:10:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8661D3CFFBF
 for <ltp@lists.linux.it>; Wed,  5 Jun 2024 10:09:58 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C43181A0100F
 for <ltp@lists.linux.it>; Wed,  5 Jun 2024 10:09:57 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AAA991F7BE;
 Wed,  5 Jun 2024 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1717574996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7cVKXEtQ9DWjmW+4Juv62HQCHrDFJRwlmsaly/k2RyY=;
 b=JvM+B9iHwuuFs+uKO+V7gfo06LfkVxKi0Ty1snBmKp47dgA9hbUbbDQKn/uFINNofExnQ7
 HYrwpYc61PuStvd4gFtf2j74nm7d+Mi/heop9CBR8X5j7jMb0IQuMCadi7ErKEZwD8SD/k
 +qBjT3bMpQRX+xvxuhRUkaWVbJG9ZdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1717574996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7cVKXEtQ9DWjmW+4Juv62HQCHrDFJRwlmsaly/k2RyY=;
 b=Ypf2ypChzWi76IQSmhWM+DxAg9PXk74d1CCDBcxpb817Nk+7D0rl9a/jmDGvBX3lCEMmwW
 Y0o/RJahTQtYDmAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1717574996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7cVKXEtQ9DWjmW+4Juv62HQCHrDFJRwlmsaly/k2RyY=;
 b=JvM+B9iHwuuFs+uKO+V7gfo06LfkVxKi0Ty1snBmKp47dgA9hbUbbDQKn/uFINNofExnQ7
 HYrwpYc61PuStvd4gFtf2j74nm7d+Mi/heop9CBR8X5j7jMb0IQuMCadi7ErKEZwD8SD/k
 +qBjT3bMpQRX+xvxuhRUkaWVbJG9ZdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1717574996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7cVKXEtQ9DWjmW+4Juv62HQCHrDFJRwlmsaly/k2RyY=;
 b=Ypf2ypChzWi76IQSmhWM+DxAg9PXk74d1CCDBcxpb817Nk+7D0rl9a/jmDGvBX3lCEMmwW
 Y0o/RJahTQtYDmAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9907F13A24;
 Wed,  5 Jun 2024 08:09:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LcpIJFQdYGblMAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 05 Jun 2024 08:09:56 +0000
Date: Wed, 5 Jun 2024 10:11:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZmAdqhv-VCWqJ3yf@rei>
References: <20240604-unlink09-v1-1-dfd8e3e1cb2b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240604-unlink09-v1-1-dfd8e3e1cb2b@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-7.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.997];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -7.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] Fix unlink09 test
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
> +	fd_immutable = SAFE_CREAT(TEST_EPERM_IMMUTABLE, 0600);
> +	TEST(ioctl(fd_immutable, FS_IOC_GETFLAGS, &attr));
> +
> +	if (TST_RET == -1 && TST_ERR == ENOTTY) {
> +		SAFE_CLOSE(fd_immutable);
> +		tst_brk(TCONF | TTERRNO, "Inode attributes not supported");
> +	}

I see one problem with this approach. If kernel accidentally removes a
support for immutable files for a certain filesystem this test will be
green. And the filesystems that miss this support are very unlikely to
gain it, e.g. will vfat get support for immutable files? That would be
an argument for explicit skiplist in the form of
tst_test->skip_filesystems.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
