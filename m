Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 511FE3FE186
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 19:54:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00E103C6449
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 19:54:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C50D3C2B78
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 19:54:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A5C96002B4
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 19:54:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 479E82259D;
 Wed,  1 Sep 2021 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630518891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w/s5W3shdQ2GgUMBi9VKxFdESo+UsQ/AC2dKtNSXeWI=;
 b=RQVKyzsm0xhrTZhvBj7iGM/BxnQRbuckmlObJaGYZObFYtkLwrU3lFO+WyMTltF+prXjYP
 aOqbfxAPSCVvka/rul39Qkr2/tl/1bDFKoJwfe4s+TSie3cN26SK+T/OpzfLrEjTb5vF7+
 ppp+QA2syOm4bujZ8Urqu0SwDWOuRzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630518891;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w/s5W3shdQ2GgUMBi9VKxFdESo+UsQ/AC2dKtNSXeWI=;
 b=fTgBDRMu92sQ99a5PE+0PeOeQMswrtuBEzyBq+IlQFsM+iaskmXfyJAkraggZcv4dX0+SD
 /XeIZLrrATpYtTBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C62513B03;
 Wed,  1 Sep 2021 17:54:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V79mCmu+L2FkXQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 01 Sep 2021 17:54:51 +0000
Date: Wed, 1 Sep 2021 19:55:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YS++dM4sC2Do8rDM@yuki>
References: <20210827092007.20889-1-krzysztof.kozlowski@canonical.com>
 <YS99h3rPMLeSEFv5@yuki>
 <440b0bcf-63b5-bb78-6a0b-565a5266d9da@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <440b0bcf-63b5-bb78-6a0b-565a5266d9da@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] controllers/cpuacct: skip cpuacct_100_100
 on small memory systems
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
> I'll move this piece, as you suggested. The free memory limits is okay
> to stay here?

There is no such API in the C library yet, so unless you want to add it
it can stay where it is.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
