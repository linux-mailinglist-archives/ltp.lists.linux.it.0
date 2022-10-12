Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B38145FC671
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 15:30:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 401453CAECF
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 15:30:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B3B0F3C9590
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 15:30:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 278F520035B
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 15:30:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BEA121C46;
 Wed, 12 Oct 2022 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665581404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojwlmLzaUpGFh1qCAq4pNXzzA+dWd9DnnCDd2j3ajKo=;
 b=haZBLSVEHQC0nkg5K/mVp+8vmqsD8BhxPjBBdPh2zYUys+aC5VHwJ4sWumykJtHtofHjtI
 zXrXVdHKql0RuKUi+eDzuQKs7bXqojSHHgzWqGiJO0qD59V4jB26cRqgAhJtDQYNqDM5bo
 KnI3005WAuzoodUPKC2HD9jU1nD3fZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665581404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojwlmLzaUpGFh1qCAq4pNXzzA+dWd9DnnCDd2j3ajKo=;
 b=I/+EpQgjlHgdAzF1PM6mKr2YlHjXDjvqNlw+xhxVzcnYqUpd9t9xkOoC16w2+Dv8AkWlu1
 70EJi0zerEhlM+Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4ED5013ACD;
 Wed, 12 Oct 2022 13:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eJ82E1zBRmM4fQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 12 Oct 2022 13:30:04 +0000
Date: Wed, 12 Oct 2022 15:31:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <Y0bBxv0569P/a3kW@yuki>
References: <20221006081709.92303897@mail.steuer-voss.de>
 <dc5e3e41cf1465ddc70cbac0d77c4f2deff0213f.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc5e3e41cf1465ddc70cbac0d77c4f2deff0213f.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/keyctl/keyctl09.c: fix test encrypted key
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Yael Tzur <yaelt@google.com>,
 ltp@lists.linux.it, Nikolaus Voss <nv@vosn.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This commit fixes the test for adding encrypted keys with unencrypted data.
> > Unencryted data must be provided hex-ascii encoding. Due to a kernel
> > bug, the unencypted data was not decoded to binary thus the length of
> > the key was only half the specified key size. This patch doubles the key
> > size and adds a test with a wrong key size to trigger a corresponding
> > error.
> > 
> > This patch must be used with the kernel fix
> > https://lore.kernel.org/lkml/20220919072317.E41421357@mail.steuer-voss.de
> 
> Petr, please correct me if I'm wrong.  Changing an existing LTP test so
> that it only works on kernels with the kernel patch applied, doesn't
> sound right.  The test should emit a warning if the original "valid
> payload" successfully loads.

We also have a policy not to work around any kernel bugs. So if this
really fixes a kernel bug it's okay that the test will fail on older
kernels without this fix and the patch that fixes kernel should be added
as a tag to the test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
