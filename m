Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC86C6EE22D
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Apr 2023 14:48:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACF503CBC74
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Apr 2023 14:48:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 91A2F3CBBC8
 for <ltp@lists.linux.it>; Tue, 25 Apr 2023 14:48:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B685860065A
 for <ltp@lists.linux.it>; Tue, 25 Apr 2023 14:48:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8DD2F1FDA7;
 Tue, 25 Apr 2023 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682426906;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0MmVkF/DC1dCp85naiPSQmtOANOYB2EVN7TImZlybF4=;
 b=1c0kQHPBR1EsqgJGq5ZLmQuQmJjl0eGJNVIQgIjbpAmkfTrkN9P9459Vsns0hGAIFkRc49
 5pkdrUYBjZFYkVWFJq3+dKPpvtCYfggReRpO8X6pGmTorTKaUToRldPDvyHKCKNcY9a18g
 fJkv8tuxui94BzjPRj6viOj/bRl+gzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682426906;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0MmVkF/DC1dCp85naiPSQmtOANOYB2EVN7TImZlybF4=;
 b=WtIxlGerl0BnqG7+RCxkdNKLPGlkpuD5dqCkDoYHS0G5JmFuNjd2GRNRaLbAlEgbyX9HvF
 7BUr09aHx5OElHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3FC9B138E3;
 Tue, 25 Apr 2023 12:48:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IgMrDRrMR2S0egAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 25 Apr 2023 12:48:26 +0000
Date: Tue, 25 Apr 2023 14:48:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20230425124834.GA2986922@pevik>
References: <20230421145746.5704-1-mdoucha@suse.cz>
 <20230421145746.5704-5-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421145746.5704-5-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] Add test for CVE 2021-3653
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
Cc: ltp@lists.linux.it, nstange@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> +/*\
> + * CVE 2021-3653
> + *
> + * Check that KVM either blocks enabling virtual interrupt controller (AVIC)
> + * in nested VMs or correctly sets up the required memory address translation.
> + * If AVIC is enabled without address translation in the host kernel,
> + * the nested VM will be able to read and write an arbitraty physical memory
> + * page specified by the parent VM. Unauthorized memory access fixed in:
> + *
> + *  commit 0f923e07124df069ba68d8bb12324398f4b6b709
> + *  Author: Maxim Levitsky <mlevitsk@redhat.com>
> + *  Date:   Thu Jul 15 01:56:24 2021 +0300
> + *
> + *  KVM: nSVM: avoid picking up unsupported bits from L2 in int_ctl (CVE-2021-3653)
very nit: I'd prefer just:
0f923e07124d ("KVM: nSVM: avoid picking up unsupported bits from L2 in int_ctl (CVE-2021-3653)")

which looks better in docparse generated output.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
