Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E35E6043
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 12:58:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F9843CAD54
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 12:58:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A6CE3CAD04
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 12:57:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E4096600F7F
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 12:57:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57F3521A27;
 Thu, 22 Sep 2022 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663844278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uqb/H0O8QdjmRg4ilKL+F5cnV4l0jKxkhOHmwmo9V9k=;
 b=vNS38qQ5hZqrdtrFCG60+UBYP4j24B21kE5nycp9ezT6q6yMrrZEviZvwyLEyuZ5Rz4dOI
 0C5rcAOFeOgfLgqBen5THEggMLQGq8f5Ua7NY9mr6xsd4n+mn7dFYXik2JrL+Nv9Vrfnro
 kL11HaVuTwU0Xt5C4XadA3aNCphFxUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663844278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uqb/H0O8QdjmRg4ilKL+F5cnV4l0jKxkhOHmwmo9V9k=;
 b=Hq97+Sn3WEAbhQs6eohDh6PbO7YJYp3tBnE655EdrLrak3Q/4IeSs3qzLnr2QxzOyBDBja
 Jm8cg+VldqdAgSDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 375141346B;
 Thu, 22 Sep 2022 10:57:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aKReDLY/LGPsKwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 22 Sep 2022 10:57:58 +0000
Message-ID: <5541d648-f9ba-16c1-6767-4d8838863a25@suse.cz>
Date: Thu, 22 Sep 2022 12:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
References: <20220921155006.13360-1-mdoucha@suse.cz>
 <CAEemH2eoxjDha9Ldu9shqO6MUUFfvT3dkFExAHGyH-38E5drVg@mail.gmail.com>
 <YywknXj4nL48PaR6@pevik>
 <CAEemH2fy8zK1ABe5PrqFM=0J6s6oyPPva8pN9MF=2OrXEPcT2A@mail.gmail.com>
 <Yyw7osX47bnvNFr2@pevik> <Yyw/CYzZ2XjbQdxu@rei>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <Yyw/CYzZ2XjbQdxu@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_supported_fs: Implement checking paths
 against skiplist
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 22. 09. 22 12:55, Cyril Hrubis wrote:
> The real problem is that the line between ext2, ext3 and ext4 is really
> blurry to an extend where it's hard to say which filesystem are you
> working with. For example while ext2 kernel driver still exists and is
> in use on embedded hardware modern distributions use single ext driver
> to handle all three filesystems. Also I think that it was possible to
> mount ext3 with ext2 driver at some point which disabled the journaling.

Still, I'd argue that blindly assuming any FS with ext2/3/4 magic number 
is always mounted as ext4 is a better solution than returning a string 
that never matches skiplists.

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
