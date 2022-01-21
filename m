Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B299495E90
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 12:48:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF4C33C96E8
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 12:48:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C2F3C3C268E
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 12:48:31 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 353F6200D5D
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 12:48:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 557ED1F888;
 Fri, 21 Jan 2022 11:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642765710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dN6BylKSCKxBPc6nGIkJje1Xy7hRfO4sO0N/E1ZQmY=;
 b=Qe7AGZKn+AeKwDK+IG/QKteoAojaOqTfX4l/73UhPHoQlpUb6bLWUafk0i6fQizCcA67Xo
 aegwBPtPdyk3F8CWhdNnD72pFrBsmo7Jsu1ORSLIPeLxYn9JljpxXCectp3i5DhJRTEoo1
 naIel7dJpSY24jTxORX7q59HyxrWDC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642765710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dN6BylKSCKxBPc6nGIkJje1Xy7hRfO4sO0N/E1ZQmY=;
 b=kg/KMOf+XdFWeESnhzNeeOEfzrJpztadjmbkrwW+ERGdFeWn5HHDkg86r5g4DCOgos8vcD
 MCw8I7Zy59HPKhAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B25F13B9C;
 Fri, 21 Jan 2022 11:48:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zRU2CY6d6mHKGAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 21 Jan 2022 11:48:30 +0000
Message-ID: <205bdbc1-6216-8364-697d-36f7c98b3cb2@suse.cz>
Date: Fri, 21 Jan 2022 12:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20220121100604.1072-1-pvorel@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20220121100604.1072-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] aiodio: Skip tests on tmpfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
one tiny nit below, otherwise:

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 21. 01. 22 11:06, Petr Vorel wrote:
> tmpfs does not support it.

What's "it"? ^

> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/io/ltp-aiodio/aiodio_append.c | 10 ++++++++--
>  testcases/kernel/io/ltp-aiodio/dio_append.c    |  4 ++++
>  testcases/kernel/io/ltp-aiodio/dio_read.c      |  4 ++++
>  testcases/kernel/io/ltp-aiodio/dio_sparse.c    | 10 ++++++++--
>  testcases/kernel/io/ltp-aiodio/dio_truncate.c  | 10 ++++++++--
>  5 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_append.c b/testcases/kernel/io/ltp-aiodio/aiodio_append.c


-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
