Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A707B49DFE3
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jan 2022 11:57:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28DB33C9724
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jan 2022 11:57:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6562F3C2A5C
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 11:57:03 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D484720004F
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 11:57:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3C6B1F37E
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643281022;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oNSeZY241coe/z6wT8z63pyT613P+x0hpb3QpLvA4Ig=;
 b=doRmYVVA42cCSFB0Ul7yKn1jKRrEAcZVlak6UCaumGpVQDYsy8tlplk/DtvCplNVUrcUMr
 tcMzyjIYZ1NAXDUDqz1wU7Fc+pZr1l2NE/JiKI8/mi6n3RG42WgF+k3paXmZUo44kNxmPZ
 15yp3eQ6TPrLKSX7NYMx/C+xqK2xuNE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643281022;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oNSeZY241coe/z6wT8z63pyT613P+x0hpb3QpLvA4Ig=;
 b=IZyZHYoqR64hlkkUt9gVXf0DRIw+tegRhkkEcE4yiI+dWPpxD+edfGJcwGE7LeMjCZoYhH
 Dg6r+sY08s6wCfDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D83C213CFB
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 10:57:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wmNWM3168mElUAAAMHmgww
 (envelope-from <pvorel@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 10:57:01 +0000
Date: Thu, 27 Jan 2022 11:57:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YfJ6fIbFvN7rD0SR@pevik>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC] HOST_{CFLAGS,LDFLAGS} definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

not sure what I do wrong, but due evaluation in include/mk/config.mk.in:

ifeq ($(strip $(HOST_CFLAGS)),)
HOST_CFLAGS := $(CFLAGS)
endif

ifeq ($(strip $(HOST_LDFLAGS)),)
HOST_LDFLAGS := $(LDFLAGS)
endif

HOST_CFLAGS and HOST_LDFLAGS must be defined for make (not for configure).
Of course exporting variables works.

Also whole point of previous code was to have a default, but that's wrong.
On some embedded platforms it fails as without properly defined HOST_CFLAGS it
can inherit flags which aren't usable for host (e.g. -mlongcalls
-mauto-litpools) and whole compilation fails.

IMHO we should change it to (i.e. not inherit anything):

HOST_CFLAGS := $(HOST_CFLAGS)
HOST_LDFLAGS := $(HOST_LDFLAGS)

HOST_CFLAGS += $(WLDFLAGS)
HOST_LDFLAGS += $(DEBUG_CFLAGS) $(OPT_CFLAGS) $(WCFLAGS)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
