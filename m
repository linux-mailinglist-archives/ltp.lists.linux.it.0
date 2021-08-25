Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FD13F7159
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:01:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CFEA3C2FC8
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 11:01:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7FB413C307D
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:00:54 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F25C01000539
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:00:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4458A2207B;
 Wed, 25 Aug 2021 09:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629882052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZKDXJ6l4QBUXdyv9i9FARQ6rgJM9YbAnqQTDgtghd6E=;
 b=0+tYsk2KwNoP488RpInZnRN00pflD1YVAKYhc8WDNg5/r6E0eupsfZItfxlMNYp5ZK9ASh
 F+hP3Z/UZKrmr55OR3ZRfL+VQng8bP/M5wHloCXaYS9QAf2hA1BWunb/RB/nJDY99+aFw/
 kZdY5haEWVT7WAlPSJ0ZNf48LPzJ7L8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629882052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZKDXJ6l4QBUXdyv9i9FARQ6rgJM9YbAnqQTDgtghd6E=;
 b=uf7V5Co8n7NHyfVn/Cg7vY2oWE5N/jpuZL/CG24axiJkWZYDpKJlgqJ9UCqeQ0WvyuqQlG
 oIVbBc9/ST4btXBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C5A313B85;
 Wed, 25 Aug 2021 09:00:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XLS/CcQGJmFfFAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 25 Aug 2021 09:00:52 +0000
Date: Wed, 25 Aug 2021 11:00:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YSYGy3cewt9Sseb/@yuki>
References: <20210825080933.12949-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825080933.12949-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] New API: Rename LTP_IPC_PATH -> TST_IPC_PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Petr Vorel (3):
>   lib: Move IPC_ENV_VAR definition into header
>   C API: Rename LTP_IPC_PATH -> TST_IPC_PATH
>   shell API: Rename LTP_IPC_PATH -> TST_IPC_PATH

Is this really a good idea?

As it is it's pretty clear where the environment variable comes from, if
we rename it to TST_IPC_PATH it's not obvious that this has been
exported by LTP test.

Generally things that are visible on the running system tends to be
prefixed with LTP_ or ltp_ rather than TST_ or tst_...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
