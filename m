Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 685EB8C6FFE
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2024 03:22:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 261DE3CF997
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2024 03:22:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B26693CF095
 for <ltp@lists.linux.it>; Thu, 16 May 2024 03:22:43 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4042914001EB
 for <ltp@lists.linux.it>; Thu, 16 May 2024 03:22:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 694E63427F;
 Thu, 16 May 2024 01:22:41 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5023413A5D;
 Thu, 16 May 2024 01:22:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UkkuEuFfRWYxFwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 16 May 2024 01:22:41 +0000
Date: Thu, 16 May 2024 03:22:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20240516012239.GA260285@pevik>
References: <20240515093349.7347-1-andrea.cervesato@suse.de>
 <20240515093349.7347-3-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515093349.7347-3-andrea.cervesato@suse.de>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 694E63427F
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 02/10] Add listmount/statmount fallback
 declarations
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

Hi Andrea,

>  configure.ac                       |  5 +++
>  include/lapi/mount.h               | 67 ++++++++++++++++++++++++++++++
>  include/lapi/stat.h                | 10 ++++-
>  include/lapi/syscalls/aarch64.in   |  2 +
>  include/lapi/syscalls/arc.in       |  2 +
>  include/lapi/syscalls/arm.in       |  2 +
>  include/lapi/syscalls/hppa.in      |  2 +
>  include/lapi/syscalls/i386.in      |  2 +
>  include/lapi/syscalls/ia64.in      |  2 +
>  include/lapi/syscalls/loongarch.in |  2 +
>  include/lapi/syscalls/mips_n32.in  |  2 +
>  include/lapi/syscalls/mips_n64.in  |  2 +
>  include/lapi/syscalls/mips_o32.in  |  2 +
>  include/lapi/syscalls/powerpc.in   |  2 +
>  include/lapi/syscalls/powerpc64.in |  2 +
>  include/lapi/syscalls/s390.in      |  2 +
>  include/lapi/syscalls/s390x.in     |  2 +
>  include/lapi/syscalls/sh.in        |  2 +
>  include/lapi/syscalls/sparc.in     |  2 +
>  include/lapi/syscalls/sparc64.in   |  2 +
>  include/lapi/syscalls/x86_64.in    |  2 +

I would prefer to separate syscall numbers into it's own commit
(patchset is quite big, this would help to clearly see autoconf and lapi/*.h
changes which are quite small but covered by syscall numbers).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
