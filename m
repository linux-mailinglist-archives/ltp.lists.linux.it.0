Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B9A3BF9FF
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 14:24:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D94E43C792F
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 14:24:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D66253C1D05
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 14:24:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4D244600796
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 14:24:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 682B622334;
 Thu,  8 Jul 2021 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625747052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/83jZ4NwXIRx3QPwTwzPhQBgJUR/v4nMV1uMUc/5mo=;
 b=KAhFEWeEa1yew59CJ3ZN5/SvuUYBwyEgFdBeui6iYvXPwTJTF2WD2jG2bbViDQcg/yvLlZ
 M7pGgrKp4Ut9W7818o9fAQbnCxzsH/kAec1EPArc4qIUknM6RXL1IipbhAGCuY5FSR+ZFZ
 JIlkDdNBOkV81wLnBiMk9SXP91PFONE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625747052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/83jZ4NwXIRx3QPwTwzPhQBgJUR/v4nMV1uMUc/5mo=;
 b=F+c3GftPQuZBR0FVXNWT5EIB++GS04ASrxfh2A7MadUsOeyITvnEEjZwsVKi7JY6ENGFfE
 Bi1Jwf+r/fv30QDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B5CD13BDF;
 Thu,  8 Jul 2021 12:24:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id heJrEGzu5mAkVwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 08 Jul 2021 12:24:12 +0000
Date: Thu, 8 Jul 2021 13:58:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YOboa9GY1eL+HR99@yuki>
References: <20210708080720.18997-1-xieziyao@huawei.com>
 <CAEemH2cTBd45n9F5Db+Xc3ZE0R8GyLVa1AVsgbEPYFB+2hVV5Q@mail.gmail.com>
 <16e18b1d-93c7-9885-9485-c2d08c17c02d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16e18b1d-93c7-9885-9485-c2d08c17c02d@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] gethostid: Rewrite with newlib and use/test
 sethostid
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I made some refine and pushed, thanks!
> Thanks for your review. Besides, I noticed the CI fails to be compiled 
> on Apine. The difference appears to be caused by the underlying libc 
> implementation: glibc and Alpine's musl-libc.
> 
> Is there anything that needs to be modified for this patch? Or simply 
> ignore it in the CI script.

This has to be fixed, the whole point of the CI is to catch build
failures on different libc/compiler combinations.

Looking at musl the sethostid() is not implemented at all, so I guess
that the correct solution here would be adding a configure check for
sethostid() and skip the whole test if it's not available.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
