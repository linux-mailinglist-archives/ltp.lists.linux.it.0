Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC6ACEAD0
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Jun 2025 09:24:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32DA83CA27A
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Jun 2025 09:23:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86BF23CA11B
 for <ltp@lists.linux.it>; Thu,  5 Jun 2025 09:23:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ED0C6200B86
 for <ltp@lists.linux.it>; Thu,  5 Jun 2025 09:23:45 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35FB720093;
 Thu,  5 Jun 2025 07:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749108224;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikD0epRpLsNCulaSIB5cKOYxYtyyzw8MtycHp+3zycY=;
 b=EnB+iUdAmKsUxfQCadhBPNLafBoHctAz4oSL+UuOlgMG1P3h9toAZy135D+9xFzCLynNNf
 KQ0PhlmnXtGIRjejyq8SkuO1jDkk52KBz58iLQjvk8f4VcBtoG+67KeaufFui9SjXdoHdk
 9SG7sXzhkpEQsVWeQLE3ZNs6UY7oAoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749108224;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikD0epRpLsNCulaSIB5cKOYxYtyyzw8MtycHp+3zycY=;
 b=JP+KrKRwDXNekNx6oXeYlHxPbQmDuYW3wk14EnsZO18gAt38aiejHs81uj+W2flooHqsk/
 4YrQgdXdg9UlGwCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=EnB+iUdA;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=JP+KrKRw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749108224;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikD0epRpLsNCulaSIB5cKOYxYtyyzw8MtycHp+3zycY=;
 b=EnB+iUdAmKsUxfQCadhBPNLafBoHctAz4oSL+UuOlgMG1P3h9toAZy135D+9xFzCLynNNf
 KQ0PhlmnXtGIRjejyq8SkuO1jDkk52KBz58iLQjvk8f4VcBtoG+67KeaufFui9SjXdoHdk
 9SG7sXzhkpEQsVWeQLE3ZNs6UY7oAoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749108224;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ikD0epRpLsNCulaSIB5cKOYxYtyyzw8MtycHp+3zycY=;
 b=JP+KrKRwDXNekNx6oXeYlHxPbQmDuYW3wk14EnsZO18gAt38aiejHs81uj+W2flooHqsk/
 4YrQgdXdg9UlGwCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 132031373E;
 Thu,  5 Jun 2025 07:23:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id I9gfAwBGQWhaKwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 05 Jun 2025 07:23:44 +0000
Date: Thu, 5 Jun 2025 09:23:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Ricardo =?utf-8?B?Qi4gTWFybGnDqHJl?= <rbm@suse.com>
Message-ID: <20250605072342.GA1190804@pevik>
References: <20250425-conversions-mknod-v4-0-222e0d2e7ef1@suse.com>
 <20250425-conversions-mknod-v4-8-222e0d2e7ef1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250425-conversions-mknod-v4-8-222e0d2e7ef1@suse.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 35FB720093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; REPLYTO_EQ_FROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:dkim,suse.cz:email];
 TO_DN_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 8/8] syscalls/mknod08: Convert to new API
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ricardo,

...
> -/*
> - * Test Name: mknod08
> - *
> - * Test Description:
> - *  Verify that mknod(2) succeeds when used to create a filesystem
> - *  node on a directory without set group-ID bit set. The node created
> - *  should not have set group-ID bit set and its gid should be equal to that
> - *  of its parent directory.
> - *
> - * Expected Result:
> - *  mknod() should return value 0 on success and node created should not
> - *  have set group-ID bit set.
> - *
> - * Algorithm:
> - *  Setup:
> - *   Setup signal handling.
> - *   Create temporary directory.
> - *   Pause for SIGUSR1 if option specified.
> - *
> - *  Test:
> - *   Loop if the proper options are given.
> - *   Execute system call
> - *   Check return code, if system call failed (return=-1)
> - *	Log the errno and Issue a FAIL message.
> - *   Otherwise,
> - *	Verify the Functionality of system call
> - *      if successful,
> - *		Issue Functionality-Pass message.
> - *      Otherwise,
> - *		Issue Functionality-Fail message.
...
> +/*\
> + * Verify that mknod(2) succeeds when used to create a filesystem node on a
> + * directory without set group-ID bit set. The node created should not have
> + * set group-ID bit set and its gid should be equal to that of its parent
> + * directory.
>   */

...
> -#define MODE_RWX	S_IFIFO | S_IRWXU | S_IRWXG | S_IRWXO
> +#define MODE_RWX 0777

I'm not sure if that's omitted by accident or intentional, but I don't think
it's ok to drop S_IFIFO:

man mknod(2):

       The file type must be one of S_IFREG, S_IFCHR, S_IFBLK, S_IFIFO,
       or S_IFSOCK to specify a regular file (which will be created
       empty), character special file, block special file, FIFO (named
       pipe), or UNIX domain socket, respectively.  (Zero file type is
       equivalent to type S_IFREG.)
=> we don't test on named pipe but on a regular file.

Could you please use the same approach as you use in mknod06.c?
#define MODE_FIFO_RWX (S_IFIFO | 0777)

...
> +uid_t nobody_uid;
> +gid_t nobody_gid, free_gid;

make check reports:

mknod08.c:24:7: warning: Symbol 'nobody_uid' has no prototype or library ('tst_') prefix. Should it be static?
mknod08.c:25:7: warning: Symbol 'nobody_gid' has no prototype or library ('tst_') prefix. Should it be static?
mknod08.c:25:19: warning: Symbol 'free_gid' has no prototype or library ('tst_') prefix. Should it be static?

With that fixed you can add:
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
